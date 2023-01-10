resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: 'azbicep-dev-eus-sqlserver'
  location: resourceGroup().location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'Test@1234567'
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
