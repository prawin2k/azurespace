param pAppServicePlan string 
param pAppService string 
param pAppInsights string

resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: pAppServicePlan
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource azbicepas 'Microsoft.Web/sites@2022-03-01' = {
  name: pAppService
  location:  resourceGroup().location
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
        value: azbicepappinsights.properties.InstrumentationKey
       }
       {
        name: 'key2'
        value: 'value2'
       }
    ]
  }
}

resource azbicepappinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
