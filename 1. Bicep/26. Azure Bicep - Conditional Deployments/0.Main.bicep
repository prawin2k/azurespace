param Env string = 'prd'
param pAppServicePlan string 
param pAppService string 
param pAppInsights string

param pSQLServer string = 'azbicep-dev-eus-sqlserver'
param pAdministratorLogin string
param pLocation string = resourceGroup().location
param pSKUName string = (Env == 'dev')? 'S1' : 'S2'
param pSKUCapacity int = (Env == 'dev')? 1 : 2
resource KeyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: 'azbicep-dev-eus-kv1'
}

module AppServicePlan '2.AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    pLocation: pLocation
    pSKUName: pSKUName
    pSKUCapacity: pSKUCapacity
    pEnv: Env
  }
}
module SqlDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
    pAdministratorLogin: pAdministratorLogin
    pAdministratorLoginPassword: KeyVault.getSecret('sqladminpassword')
    pLocation: pLocation
  }
}

module AppInsights '4.AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    pAppInsights:  pAppInsights  
    pLocation: pLocation
  }
}
