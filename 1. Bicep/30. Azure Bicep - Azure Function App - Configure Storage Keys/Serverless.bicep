param pStorageAccountName string
param pLocation string = resourceGroup().location

param pAppServicePlanName string 
param pSKUCapacity int
param pSKUName string
param pFunctionAppName string


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

module FunctionApp 'AzureFunctionApp.bicep' = {
  name: 'FunctionApp'
  params: {
    pFunctionAppName: pFunctionAppName
    pLocation: pLocation
    pServerFarmId: AppServicePlan_Linux.outputs.AppServicePlanId
    pStorageAccountId: StorageAccount_Module.outputs.StorageAccountId
    pStorageAccountName: pStorageAccountName
  }
}
