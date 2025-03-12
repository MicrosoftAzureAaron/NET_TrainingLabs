@description('Name of the storage account')
var storageAccountName = uniqueString(resourceGroup().id, 'storageAccount')

@description('Name of the private DNS zone')
var privateDnsZoneName = 'privatelink.blob.${environment().suffixes.storage}'

module PrivateDNSZoneArecord '../Modules/PrivateDNSZoneArecord.bicep' = {
  name: 'PrivateDNSZoneArecord'
  params: {
    PrivateDNSZone_Name: privateDnsZoneName
    ARecord_name: storageAccountName
    ipv4Address: '0.0.0.0'
    ttlInSeconds: 3600
  }
}

module PrivateEndpointDNSzone '../Modules/PrivateDNSZone.bicep' = {
  name: 'PrivateEndpointDNSzone'
  params: {
    virtualNetworkIDs : [
      resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks', 'hubVNET')
      resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks', 'vnet1')
    ]
    privateDNSZone_Name: privateDnsZoneName
  }
}
