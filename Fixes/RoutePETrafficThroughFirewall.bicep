param location string = resourceGroup().location
param hubVnetName string = 'hubvnet'
param peSubnetName string = 'PrivateEndpointSubnet'

resource hubVnet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: hubVnetName
}

resource peSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  parent: hubVnet
  name: peSubnetName
}

resource peSubnetPolicy 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  parent: hubVnet
  name: peSubnetName
  properties: {
    privateEndpointNetworkPolicies: 'Enabled'
  }
}
