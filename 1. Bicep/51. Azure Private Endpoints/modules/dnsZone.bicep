
param pDNSZoneName string
param pVNETName string
param pVNEtId string
resource dnsZone 'Microsoft.Network/privateDnsZones@2018-05-01' existing = {
  name: pDNSZoneName
 
}

resource vnetLinks 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  name: 'link-to-vnet-${pVNETName}'
  parent: dnsZone
  location: 'global'
  properties: {
    virtualNetwork: {
      id: pVNEtId
    }
    registrationEnabled: false
  }
}

output dnsZoneId string = dnsZone.id
