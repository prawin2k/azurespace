param pAppService string = 'az-bicep-eus-wapp2'
param pAppServicePlan string = 'az-bicep-eus-asp1'
param pSKUCapacity int = 1
param pSKUName string = 'B1'


module appservice_module 'br:azbicepmodulesacr1.azurecr.io/bicep/appserviceplan:v1' = {
  name: 'appservice_module'
  params: {
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan
    pSKUCapacity: pSKUCapacity
    pSKUName: pSKUName
  }
}
