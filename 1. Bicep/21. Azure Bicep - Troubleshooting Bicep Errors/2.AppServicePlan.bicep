param pAppServicePlan string 
param pAppService string 
param pInstrumentationKey string
param pLocation string = resourceGroup().location
resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: pAppServicePlan
  location: pLocation
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource azbicepas 'Microsoft.Web/sites@2022-03-01' = {
  name: pAppService
  location:  pLocation
  properties: {
    serverFarmId: resourceId('Microsofot.Web/serverfarms',pAppServicePlan)
  }
  dependsOn: [
    azbicepasp1
  ]
}

resource azbicepwebapp1appsetting 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'web'
  parent: azbicepas
  properties: {
    appSettings: [
       {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: pInstrumentationKey
       }
       {
        name: 'key2'
        value: 'value2'
       }
    ]
  }
}


