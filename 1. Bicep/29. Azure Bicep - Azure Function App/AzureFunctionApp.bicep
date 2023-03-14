param pLocation string 
param pServerFarmId string
param pFunctionAppName string
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
          value: 'DefaultEndpointsProtocol=https;AccountName=azbicepdeveusstrg1;AccountKey=8LUD5SOKAJZaERPUzLVxzMEqvLVQHOm3W0VGAIgeqNenCMHllyBUL2QQMxrZacLJqukOGSASv464+AStJdqAxA==;EndpointSuffix=core.windows.net'
          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName1;AccountKey=${listKeys('storageAccountID1', '2019-06-01').key1}'
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=azbicepdeveusstrg1;AccountKey=8LUD5SOKAJZaERPUzLVxzMEqvLVQHOm3W0VGAIgeqNenCMHllyBUL2QQMxrZacLJqukOGSASv464+AStJdqAxA==;EndpointSuffix=core.windows.net'

          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName2;AccountKey=${listKeys('storageAccountID2', '2019-06-01').key1}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=azbicepdeveusstrg1;AccountKey=8LUD5SOKAJZaERPUzLVxzMEqvLVQHOm3W0VGAIgeqNenCMHllyBUL2QQMxrZacLJqukOGSASv464+AStJdqAxA==;EndpointSuffix=core.windows.net'

          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName3;AccountKey=${listKeys('storageAccountID3', '2019-06-01').key1}'
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
