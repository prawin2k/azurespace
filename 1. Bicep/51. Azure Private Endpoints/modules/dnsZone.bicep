param pDNSZoneResourceGroupNAme string
param pDNSZoneName string
param pVNETName string
param pVNEtId string
resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: pDNSZoneName
  scope: resourceGroup(pDNSZoneResourceGroupNAme)
}

resource vnetLinks 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  name: '${dnsZone.name}/link-to-vnet-${pVNETName}'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: pVNEtId
    }
    registrationEnabled: false
  }
}

output dnsZoneId string = dnsZone.id
