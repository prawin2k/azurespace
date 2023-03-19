param pAppInsights string 
param pLocation string = resourceGroup().location

resource azbicepappinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: pLocation
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output oInstrumentationKey string = azbicepappinsights.properties.InstrumentationKey 
output oAppInsightsid string = azbicepappinsights.id
