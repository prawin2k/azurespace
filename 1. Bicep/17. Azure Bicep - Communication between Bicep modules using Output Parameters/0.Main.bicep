param pAppServicePlan string = 'azbicep-dev-eus-asp1'
param pAppService string = 'azbicep-dev-eus-wapp1'
param pAppInsights string = 'azbicep-dev-eus-wapp1-ai'

param pSQLServer string = 'azbicep-dev-eus-sqlserver'

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
  }
}

module AppInsights '4.AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    pAppInsights:  pAppInsights  
  }
}
