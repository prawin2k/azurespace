param pStorageAccountName string
param pLocation string
param pFileShareName string
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: pStorageAccountName
  location: pLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource fileshare 'Microsoft.Storage/storageAccounts/fileServices/shares@2023-01-01' = {
  name: '${pStorageAccountName}/default/${pFileShareName}'
  dependsOn: [
    storageaccount
  ]
}
output StorageAccountId string = storageaccount.id
