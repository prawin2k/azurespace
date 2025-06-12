param location string = resourceGroup().location
param vnetName string 
param subnets array

param sqlServerName string
param sqlAdminUsername string
@secure()
param sqlAdminPassword string

param sqlDbName string
param pDNSZoneName string
param pDNSZoneResourceGroupNAme string
param privateEndpointName string

param appServicePlanName string
param appServiceName string
param pAppDNSZoneName string
param pWebAppPrivateEndpointName string

module vnet_module 'modules/vnet.bicep' = {
  name: 'vnet_module'
  params: {
    location: location
    vnetName: vnetName
    subnets: subnets
  }
}

module sqlServer 'modules/sqlServer.bicep' = {
  name: 'sqlserver'
  params: {
    location: location
    adminUsername: sqlAdminUsername
    adminPassword: sqlAdminPassword
    sqlServerName: sqlServerName
  }
}

module sqlDatabase 'modules/sqlDatabase.bicep' = {
  name: 'sqldb'
  params: {
    location: location
    sqlServerName: sqlServer.outputs.sqlServerName
    sqlDbName: sqlDbName
  }
}

module appServicePlan 'modules/appServicePlan.bicep' = {
  name: 'asp'
  params: {
    location: location
    appServicePlanName: appServicePlanName
  }
}

module appService 'modules/appService.bicep' = {
  name: 'appsvc'
  params: {
    location: location
    appServicePlanId: appServicePlan.outputs.planId
    sqlConnectionString: sqlDatabase.outputs.connectionString
    appServiceName: appServiceName
  }
}

// Create Private DNS Zone - DNS Resolution

module dns_sql 'modules/dnsZone.bicep' = {
  scope: resourceGroup(pDNSZoneResourceGroupNAme)
  params: {
    pDNSZoneName: pDNSZoneName
    pVNETName: vnetName
    pVNEtId: vnet_module.outputs.vNetId
  }
}

// Create Private End Points

module pe_sql 'modules/privateEndPoint.bicep' = {
  params: {
    location: location
    dnsZoneId: dns_sql.outputs.dnsZoneId
    groupId: 'sqlServer'
    privateEndpointName: privateEndpointName
    resourceId: sqlServer.outputs.sqlServerId
    subnetId: vnet_module.outputs.sqlSubnetId
    vnetId: vnet_module.outputs.vNetId
  }
}

// Create Private DNS Zone - DNS Resolution
// Create Private End Points

module dns_app 'modules/dnsZone.bicep' = {
  scope: resourceGroup(pDNSZoneResourceGroupNAme)
  params: {
    pDNSZoneName: pAppDNSZoneName
    pVNETName: vnetName
    pVNEtId: vnet_module.outputs.vNetId
  }
}

module pe_app 'modules/privateEndPoint.bicep' = {
  params: {
    location: location
    dnsZoneId: dns_app.outputs.dnsZoneId
    groupId: 'sites'
    privateEndpointName: pWebAppPrivateEndpointName
    resourceId: appService.outputs.appServiceId
    subnetId: vnet_module.outputs.appSubnetId
    vnetId: vnet_module.outputs.vNetId
  }
}
