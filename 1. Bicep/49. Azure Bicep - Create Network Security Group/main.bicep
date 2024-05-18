param NSGName string 
param Location string = resourceGroup().location
param Environment string 
var nsg_rules = [
  {
    name: 'Allow-8080'
    properties:  {
      description: 'Allows Inbound 8080 traffic'
      sourceAddressPrefix: 'Internet'
      sourcePortRange: '8080'
      destinationAddressPrefix: '*'
      destinationPortRange: '8080'
      protocol: 'Tcp'
      access: 'Allow'
      direction: 'Inbound'
      priority: 100
    }
  }
]
resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: NSGName
  location: Location
  properties: {
    securityRules: nsg_rules
  }
}
