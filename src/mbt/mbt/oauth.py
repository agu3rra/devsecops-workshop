# NOT WORKING CODE; Just for reference
# https://github.com/Azure/azure-sdk-for-python/blob/azure-storage-blob_12.19.0/sdk/storage/azure-storage-blob/samples/blob_samples_authentication.py
# Get a token credential for authentication
from azure.identity import ClientSecretCredential
token_credential = ClientSecretCredential(
    self.active_directory_tenant_id,
    self.active_directory_application_id,
    self.active_directory_application_secret
)

# Instantiate a BlobServiceClient using a token credential
from azure.storage.blob import BlobServiceClient
blob_service_client = BlobServiceClient(account_url=self.oauth_url, credential=token_credential)
# [END create_blob_service_client_oauth]

# Get account information for the Blob Service
account_info = blob_service_client.get_service_properties()