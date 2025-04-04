@description('Name of the storage account')
param storageAccountName string = uniqueString(resourceGroup().id, 'storageAccount')

@description('Name of the resource group containing the virtual networks')
param vnetResourceGroupName string = resourceGroup().name

@description('Name of the private DNS zone')
param privateDnsZoneName string = 'privatelink.blob.${environment().suffixes.storage}'

// Module to create the storage account
module storageAccountModule '../Modules/StorageAccount.bicep' = {
  name: 'storageAccountModule'
  params: {
    location: resourceGroup().location
    storageAccount_Name: storageAccountName
  }
}

// Module to create the private endpoint
module privateEndpointModule '../Modules/PrivateEndpoint.bicep' = {
  name: 'StorageAccountPrivateEndpoint'
  params: {
    privateEndpoint_Name: storageAccountName
    virtualNetwork_IDs : [
      resourceId(vnetResourceGroupName, 'Microsoft.Network/virtualNetworks', 'hubVNET')
      resourceId(vnetResourceGroupName, 'Microsoft.Network/virtualNetworks', 'vnet1')
      resourceId(vnetResourceGroupName, 'Microsoft.Network/virtualNetworks', 'vnet2')
    ]
    groupID: 'blob'
    privateDNSZone_Name: privateDnsZoneName
    location: resourceGroup().location
    privateEndpoint_SubnetID: resourceId(vnetResourceGroupName, 'Microsoft.Network/virtualNetworks/subnets', 'hubVNET', 'PrivateEndpointSubnet')
    privateLinkServiceId: storageAccountModule.outputs.storageAccount_ID
  }
}

module PrivateDNSZoneArecord '../Modules/PrivateDNSZoneArecord.bicep' = {
  name: 'PrivateDNSZoneArecord'
  params: {
    PrivateDNSZone_Name: privateDnsZoneName
    ARecord_name: storageAccountName
    ipv4Address: privateEndpointModule.outputs.privateEndpointPrivateIPAddress
    ttlInSeconds: 3600
  }
}
