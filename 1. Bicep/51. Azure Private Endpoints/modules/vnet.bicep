param location string 
param vnetName string 

param subnets array 

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      for subnet in subnets: {
        name: subnet.Name
        properties: {
          addressPrefix: subnet.addressPrefix
        }
      }
    ]
  }
}
output vNetId string = virtualNetwork.id
output sqlSubnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets',vnetName,'snet-sql')
output appSubnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets',vnetName,'snet-web')

