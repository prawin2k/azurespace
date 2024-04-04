param Env string 
param pAppServicePlan string 
param pAppService string 
param pAppInsights string
param pLocation string = resourceGroup().location
// param pSKUName string = (Env == 'dev')? 'F1' : 'S1'
// param pSKUCapacity int = (Env == 'dev')? 1 : 2

var vConfigurations = {
  Production: {
    AppServicePlan: {
      SKUName: 'P2V2'
      SKUCapacity: 5
    }
  }
  Development: {
    AppServicePlan: {
      SKUName: 'B1'
      SKUCapacity: 1
    }
  }
}


module AppServicePlan '2.AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    pLocation: pLocation
    pSKUName: vConfigurations[Env].AppServicePlan.SKUName
    pSKUCapacity: vConfigurations[Env].AppServicePlan.SKUCapacity
  }
}

module AppInsights '4.AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    pAppInsights:  pAppInsights  
    pLocation: pLocation
  }
}
