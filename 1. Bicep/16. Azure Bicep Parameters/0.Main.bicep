param pAppServicePlan string = 'azbicep-dev-eus-asp1'
param pAppService string = 'azbicep-dev-eus-wapp1'
param pAppInsights string = 'azbicep-dev-eus-wapp1-ai'

param pSQLServer string = 'azbicep-dev-eus-sqlserver'


module AppServicePlan '2.AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppInsights: pAppInsights
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan 
  }
}
module SqlDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
  }
}
