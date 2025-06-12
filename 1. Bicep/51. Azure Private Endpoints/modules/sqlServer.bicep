param location string
param adminUsername string
@secure()
param adminPassword string
param sqlServerName string
resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminUsername
    administratorLoginPassword: adminPassword
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
  }
}

output sqlServerName string = sqlServer.name
output sqlServerId string = sqlServer.id
