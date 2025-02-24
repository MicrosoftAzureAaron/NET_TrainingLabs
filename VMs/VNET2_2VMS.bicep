param vnetName string = 'VNET2'
param vmSubnetName string = 'VMSubnet'
param adminUsername string ='bob'
@secure()
param adminPassword string
param vmSize string
param osImage object

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: vnetName
}

resource vmSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  name: vmSubnetName
  parent: vnet
}

resource nic1 'Microsoft.Network/networkInterfaces@2023-09-01' = {
  name: 'vm1NIC'
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vmSubnet.id
          }
        }
      }
    ]
  }
}

resource nic2 'Microsoft.Network/networkInterfaces@2023-09-01' = {
  name: 'vm2NIC'
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vmSubnet.id
          }
        }
      }
    ]
  }
}

resource vm1 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: 'vm1'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'vm1'
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: osImage.publisher == 'Canonical' ? {
        disablePasswordAuthentication: false
      } : null
      windowsConfiguration: osImage.publisher == 'MicrosoftWindowsServer' ? {
        enableAutomaticUpdates: true
      } : null
    }
    storageProfile: {
      imageReference: osImage
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic1.id
        }
      ]
    }
  }
}

resource vm2 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: 'vm2'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'vm1'
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: osImage.publisher == 'Canonical' ? {
        disablePasswordAuthentication: false
      } : null
      windowsConfiguration: osImage.publisher == 'MicrosoftWindowsServer' ? {
        enableAutomaticUpdates: true
      } : null
    }
    storageProfile: {
      imageReference: osImage
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic2.id
        }
      ]
    }
  }
}
