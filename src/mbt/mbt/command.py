import os
import sys
from typing import Optional
from enum import Enum
import pkg_resources
import click

from azure.identity import ClientSecretCredential
from azure.storage.blob import BlobServiceClient
from azure.core.paging import ItemPaged
# Mind OAuth-based operations supported for Azure Blobs.
# Details at: https://learn.microsoft.com/en-us/rest/api/storageservices/authorize-with-azure-active-directory#permissions-for-blob-service-operations

from .options import (
    option_storage_account,
    option_storage_container,
)
from mbt import terminal


instructions = (
    "This CLI needs to be registered within you Azure tenant under "
    "App Registrations, which should give you an application (client) id."
    "After that, access the 'Certificates & Secrets' menu in Azure Portal "
    "and generate a client secret.\n\n"

    "Then grant the 'Storage Blob Data Reader' role to your newly created "
    "app in the IAM section of your StorageAccount in Azure. This ensures "
    "we can read associated blobs.\n\n"

    "Finally, configure the folliwng as environment variables:\n"
    "ARM_TENANT_ID: this should contain your Azure account tenant ID.\n"
    "MBTCLI_CLIENT_ID: the app id you got on the first step.\n"
    "MBTCLI_CLIENT_SECRET: the client secret you generated above.\n"
)


class ExitCodes(Enum):
    """Exit codes for our CLI
    """
    SUCCESS = 0
    FAILURE = 1
    INVALID_INPUT = 2


class SetupAccess():

    def __init__(self) -> None:
        tenant = os.environ.get("ARM_TENANT_ID", None)
        client_id = os.environ.get("MBTCLI_CLIENT_ID", None)
        client_secret = os.environ.get("MBTCLI_CLIENT_SECRET", None)
        if tenant is None or client_id is None or client_secret is None:
            click.echo(instructions)
            click.echo(terminal.error("Missing environment variables."))
            sys.exit(ExitCodes.INVALID_INPUT.value)
        self.tenant = tenant
        self.credential = ClientSecretCredential(
        tenant, client_id, client_secret)


@click.group
def cli():
    """A constructor that puts ours commands together"""
    pass


@cli.command()
@option_storage_account
def info(storage_account: str):
    """Displays available containers in account"""
    access = SetupAccess()
    client: BlobServiceClient = BlobServiceClient(
        account_url=f"https://{storage_account}.blob.core.windows.net",
        credential=access.credential
    )
    try:
        containers = client.list_containers()
        click.echo(terminal.info(
            "You have the following containers in this storage account:"))
        for item in containers:
            click.echo(f"- {item['name']}")
    except Exception as e:
        click.echo(terminal.error("Unable to talk to Azure."))
        sys.exit(ExitCodes.FAILURE.value)
    sys.exit(ExitCodes.SUCCESS.value)


@cli.command()
@option_storage_account
@option_storage_container
@click.option(
    "-d", "--download",
    is_flag=False,
    flag_value=".",
    type=str,
    required=False,
    default=None,
    show_default="current directory if used as a flag.",
    help="(Optional): Downloads blobs to the local file system "
        "on the provided path."
)
def list_blobs(storage_account: str, storage_container: str, download: Optional[str]= None):
    """Lists blobs for a storage container"""
    access = SetupAccess()
    client: BlobServiceClient = BlobServiceClient(
        account_url=f"https://{storage_account}.blob.core.windows.net",
        credential=access.credential
    )
    ctnr = client.get_container_client(storage_container)
    blobs: ItemPaged = ctnr.list_blob_names()
    click.echo(terminal.info("Blobs found:"))
    for item in blobs:
        click.echo(item)

    if download is not None:
        folder_info = "current directory" if download == "." else download
        click.echo(terminal.info(f"blobs will be saved to '{folder_info}'"))
        if not os.path.exists(download):
            os.mkdir(download)
            click.echo(terminal.info(
                "download path did not exist so it was created."))
        blobs: ItemPaged = ctnr.list_blobs()
        for blob in blobs:
            click.echo(
                terminal.info(f"downloading blob (etag '{blob.etag}')..."))
            downloader = ctnr.download_blob(blob, encoding="utf-8")
            blob_elements = blob.name.split("/")
            azure_resource_group = blob_elements[4]
            vm_name = blob_elements[8]
            save_file = (
                f"{azure_resource_group}-{vm_name}-{blob.last_modified.year}-"
                f"{blob.last_modified.month}-{blob.last_modified.day}-"
                f"{blob.last_modified.hour}-{blob.etag}.json"
            )
            content = downloader.content_as_text()
            with open(os.path.join(download, save_file),
                      'w',
                      encoding='utf-8') as file:
                file.write(content)
        click.echo(terminal.info(f"Downloads completed."))
    sys.exit(ExitCodes.SUCCESS.value
)


@cli.command()
def version():
    """Outputs version info for our CLI"""
    ver = pkg_resources.get_distribution("mbt").version
    click.echo(f"mbt (my blob tool) version: {ver}")


def main():
    """puts our commands together
    """
    click.CommandCollection(sources=[cli])()