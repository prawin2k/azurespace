resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'azbicep-dev-eus-asp1'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource azbicepasp2 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'azbicep-dev-eus-linux-asp1'
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}
