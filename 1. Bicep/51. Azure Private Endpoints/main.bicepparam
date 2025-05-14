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

