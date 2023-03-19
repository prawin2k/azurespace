param pStorageAccountName string
param pLocation string = resourceGroup().location

param pAppServicePlanName string 
param pSKUCapacity int
param pSKUName string
param pFunctionAppName string

param pStartIndex int = 1
param pCount int = 5
module StorageAccount_Module  '5.StorageAccount.bicep' = {
  name: 'StorageAccount_Module'
  params: {
    pLocation: pLocation
    pStorageAccountName: pStorageAccountName
  }
}

module AppServicePlan_Linux 'AppServicePlan-Linux.bicep' = {
  name: 'AppServicePlan_Linux'
  params: {
    pAppServicePlanName: pAppServicePlanName
    pLocation: pLocation
    pSKUCapacity: pSKUCapacity
    pSKUName: pSKUName
  }
}

// module AppInsights '4.AppInsights.bicep' = {
//   name: 'AppInsights_Module'
//   params: {
//     pAppInsights: '${pFunctionAppName}-ai'
//     pLocation: pLocation
//   }
// }
module FunctionApp 'AzureFunctionApp.bicep' = [ for Index in range(pStartIndex,pCount) : {
  name: 'FunctionApp-${Index}'
  params: {
    pFunctionAppName: '${pFunctionAppName}-${Index}'
    pLocation: pLocation
    pServerFarmId: AppServicePlan_Linux.outputs.AppServicePlanId
    pStorageAccountId: StorageAccount_Module.outputs.StorageAccountId
    pStorageAccountName: pStorageAccountName
    pAppInsights: '${pFunctionAppName}-${Index}-ai'
  }
}]
