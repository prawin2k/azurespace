param pEnv string
param pAppServicePlan string 
param pAppService string 
param pInstrumentationKey string
param pLocation string = resourceGroup().location
@description('''
Please provide a valid SKU Name. The allowed values are
- F1
- B1
- B2
- B3
- S1
- S2
- S3
''')
@allowed(['F1','B1','B2','B3','S1', 'S2', 'S3'])
param pSKUName string

@minValue(1)
@maxValue(30)
param pSKUCapacity int
resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: pAppServicePlan
  location: pLocation
  sku: {
    name: pSKUName
    capacity: pSKUCapacity
  }
}

// resource WebAppSlot 'Microsoft.Web/sites/slots@2022-03-01' = if(pEnv=='dev') {
//   name: 'staging'
//   location: pLocation
//   parent: azbicepas
//   properties: {
//     serverFarmId: azbicepasp1.id
//   }
// }

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


