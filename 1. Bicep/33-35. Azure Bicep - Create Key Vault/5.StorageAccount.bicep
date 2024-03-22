param pStorageAccountName string
param pLocation string
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: pStorageAccountName
  location: pLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
output StorageAccountId string = storageaccount.id
