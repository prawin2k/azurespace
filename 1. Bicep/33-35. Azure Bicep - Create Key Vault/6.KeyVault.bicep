param KeyVaultName string = 'az-bicep-keyvault-01'
param Location string = resourceGroup().location
param pAccessPolicies array = [
  {
    objectId: 'a096952c-3a56-46fd-a76f-a8e94cc1fa64'
  }
  {
    objectId: 'cdeaa9c4-4e48-4bd1-9d9e-655843ddf530'
  }
]

resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: KeyVaultName
  location: Location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: subscription().tenantId
    accessPolicies: []
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
}
resource AccessPolicies 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  name: 'add'
  parent: keyVault
  properties: {
    accessPolicies: [
      for accesspolicy in pAccessPolicies: {
        objectId: accesspolicy.objectid
        permissions: {
          secrets: [
            'get'
            'list'
            'set'
          ]
        }
        tenantId: subscription().tenantId
      }
    ]
  }
}
resource Key 'Microsoft.KeyVault/vaults/keys@2023-07-01' = {
  name: 'key1'
  parent: keyVault
  properties: {
    keySize: 2048
    curveName: 'P-256'
    kty: 'RSA'
  }
}

resource Secret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
  name: 'secret1'
  parent: keyVault
  properties: {
    value: 'Admin@123456'
  }
}
