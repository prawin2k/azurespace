using './0.Main.bicep'
param Env = 'Production'

var prefixes = loadJsonContent('sharedvariables.json')

param pAppServicePlan = '${prefixes.projectnameprefix}-prd-eus-${prefixes.appserviceplanprefix}1'
param pAppService = '${prefixes.projectnameprefix}-prd-eus-${prefixes.appserviceprefix}3'
param pAppInsights = '${prefixes.projectnameprefix}-prd-eus-wapp1-${prefixes.appinsightsprefix}'
