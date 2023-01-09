targetScope = 'subscription'
resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
 name: 'azbicep-dev-eus-rg1'
 location: 'eastus'
}
