import click


option_storage_account: click.Option = click.option(
    "-sa", "--storage-account",
    is_flag=False,
    type=str,
    required=True,
    help="The name of your Storage Account in Azure."
)


option_storage_container: click.Option = click.option(
    "-sc", "--storage-container",
    is_flag=False,
    type=str,
    required=True,
    help="The name of your Storage Container in Azure."
)