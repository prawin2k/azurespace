param location string = resourceGroup().location
param vnetName string 
param subnets array

module vnet_module 'modules/vnet.bicep' = {
  name: 'vnet_module'
  params: {
    location: location
    vnetName: vnetName
    subnets: subnets
  }
}
