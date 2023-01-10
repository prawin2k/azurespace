resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'azbicep-dev-eus-asp1'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource azbicepas 'Microsoft.Web/sites@2022-03-01' = {
  name: 'azbicep-dev-eus-wapp1'
  location:  resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsofot.Web/serverfarms','azbicep-dev-eus-asp1')
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
  name: 'azbicep-dev-eus-wapp1-ai'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
