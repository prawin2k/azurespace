param pSQLServer string 
param pAdministratorLogin string
@secure()
param pAdministratorLoginPassword string
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: pSQLServer
  location: resourceGroup().location
  properties: {
    administratorLogin: pAdministratorLogin
    administratorLoginPassword: pAdministratorLoginPassword
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: 'database1'
  location: resourceGroup().location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '34359738368'
    requestedServiceObjectiveName: 'Basic'
  }
}

resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'Praveen IP Address'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}
