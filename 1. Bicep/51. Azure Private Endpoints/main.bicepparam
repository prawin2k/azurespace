using './main.bicep'

param vnetName = 'az-pep-dev-cus-vnet01-bicep'
param subnets = [
  {
    Name: 'snet-sql'
    addressPrefix: '10.0.1.0/24'
  }
  {
    Name: 'snet-web'
    addressPrefix: '10.0.2.0/24'
  }
]

param sqlServerName = 'az-pep-dev-cus-sqlserver-bicep'
param sqlAdminUsername = 'sqladmin'
param sqlAdminPassword = 'Admin@123456'
param sqlDbName = 'Database1'
param pDNSZoneName = 'privatelink.database.windows.net'
param pDNSZoneResourceGroupNAme = 'az-dns'
param privateEndpointName = 'pe-${sqlServerName}'

param appServicePlanName = 'az-pep-dev-cus-asp01-bicep'
param appServiceName = 'az-pep-dev-cus-appsvc01-bicep'
param pAppDNSZoneName = 'privatelink.azurewebsites.net'
param pWebAppPrivateEndpointName = 'pe-${appServiceName}'
