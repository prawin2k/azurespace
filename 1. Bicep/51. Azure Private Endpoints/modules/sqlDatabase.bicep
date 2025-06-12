param location string
param sqlServerName string
param sqlDbName string
resource db 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: '${sqlServerName}/${sqlDbName}'
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

output connectionString string = 'Server=tcp:${sqlServerName}.database.windows.net,1433;Initial Catalog=myDatabase;Persist Security Info=False;User ID=...;Password=...;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'
