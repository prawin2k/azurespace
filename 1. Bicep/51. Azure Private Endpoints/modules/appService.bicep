param location string
param appServicePlanId string
param sqlConnectionString string
param appServiceName string
resource app 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      appSettings: [
       
        { name: 'ConnectionStrings__DefaultConnection'
         value: sqlConnectionString }
      ]
    }
  }
}

output appServiceId string = app.id
