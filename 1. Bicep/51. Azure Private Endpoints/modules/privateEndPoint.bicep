param location string
param vnetId string
param subnetId string
param resourceId string
param groupId string
param privateEndpointName string
param dnsZoneId string

resource pe 'Microsoft.Network/privateEndpoints@2024-05-01' = {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
       id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'pls-${uniqueString(resourceId)}'
        properties: {
          groupIds: [
            groupId
          ]
          privateLinkServiceId: resourceId
        }
      }
    ]
  }
}
 resource dnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2024-05-01' = {
  name: 'default'
  parent: pe
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'default'
        properties: {
          privateDnsZoneId: dnsZoneId
        }
      }
    ]
  }
 }
