param pAppServicePlan string 
param pAppService string 
param pAppInsights string

param pSQLServer string = 'azbicep-dev-eus-sqlserver'
param pAdministratorLogin string
@secure()
param pAdministratorLoginPassword string

module AppServicePlan '2.AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    
  }
}
module SqlDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
    pAdministratorLogin: pAdministratorLogin
    pAdministratorLoginPassword: pAdministratorLoginPassword
  }
}

module AppInsights '4.AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    pAppInsights:  pAppInsights  
  }
}
