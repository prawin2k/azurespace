param pLogicAppName string = 'az-bicep-dev-eus-lapp001'
param pLocation string = resourceGroup().location
param pAppServicePlanName string = 'az-bicep-dev-eus-asp1'

param pAppInsightsName string = 'az-bicep-dev-eus-lapp001-ai'
param pStorageAccountName string = 'azbicepdeveuslappstrg'
param pFileShare string = 'lappfileshare'
resource LogicApp_Standard 'Microsoft.Web/sites@2023-01-01' = {
  name: pLogicAppName
  location: pLocation
  kind: 'functionapp,workflowapp'
  properties: {
    serverFarmId: asp.outputs.AppServicePlanId
    siteConfig: {
      netFrameworkVersion: 'v4.0'
      functionsRuntimeScaleMonitoringEnabled: false
    }
  }
  dependsOn: [
    appinsights_module
    storage_module
  ]
}
module asp 'AppServicePlan.bicep' = {
  name: 'asp_module'
  params: {
    AppServicePlan:  pAppServicePlanName
    Location: pLocation
  }
}
module appinsights_module 'AppInsights.bicep' = {
  name: 'appinsights_module'
  params: {
    AppInsightsName: pAppInsightsName
    Location: pLocation
  }
}
module storage_module 'StorageAccount.bicep' = {
  name: 'storage_module'
  params: {
    pLocation: pLocation
    pStorageAccountName: pStorageAccountName
    pFileShareName: pFileShare
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: pStorageAccountName
}

resource appsettings 'Microsoft.Web/sites/config@2023-01-01' = {
  name: 'appsettings'
  parent: LogicApp_Standard
  properties: {
    App_Kind : 'workflowapp'
    APPINSIGHTS_INSTRUMENTATIONKEY: appinsights_module.outputs.InstrumentationKey
    FUNCTIONS_EXTENSION_VERSION : '~4'
    FUNCTIONS_WORKER_RUNTIME: 'node'
    AzureWebJobsStorage :'DefaultEndpointsProtocol=https;AccountName=${pStorageAccountName};AccountKey=${storage.listKeys().keys[0].value};EndpointSuffix=core.windows.net'
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING:'DefaultEndpointsProtocol=https;AccountName=${pStorageAccountName};AccountKey=${storage.listKeys().keys[0].value};EndpointSuffix=core.windows.net'
    WEBSITE_CONTENTSHARE: pFileShare
    AzureWebJobsSecretStorageType: 'Files'
  }
}
