param AppServicePlan string
param Location string
resource azbicepasp1 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: AppServicePlan
  location: Location
  sku: {
    name: 'WS1'
    capacity: 1
  }
}
output AppServicePlanId string = azbicepasp1.id
