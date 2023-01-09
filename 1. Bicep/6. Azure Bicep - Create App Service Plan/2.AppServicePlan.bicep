resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'azbicep-dev-eus-asp1'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}
