param Location string
param AppInsightsName string
resource azbicepappinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: AppInsightsName
  location: Location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
output InstrumentationKey string = azbicepappinsights.properties.InstrumentationKey
