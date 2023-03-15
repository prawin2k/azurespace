param pLocation string 
param pServerFarmId string
param pFunctionAppName string
param pStorageAccountName string
param pStorageAccountId string
resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: pFunctionAppName
  location: pLocation
  kind: 'functionapp'
  properties: {
    serverFarmId: pServerFarmId

    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsDashboard'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pStorageAccountName};AccountKey=${listKeys(pStorageAccountId, '2021-09-01').keys[0].value}'
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pStorageAccountName};AccountKey=${listKeys(pStorageAccountId, '2021-09-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pStorageAccountName};AccountKey=${listKeys(pStorageAccountId, '2021-09-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(pFunctionAppName)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: '88e5a6d5-7ab4-4551-9818-d0a214b112fc'
          // value: reference('insightsComponents.id', '2015-05-01').InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
      ]
    }
  }
}
