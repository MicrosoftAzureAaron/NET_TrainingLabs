# Fixes

## Enable Gateway Transit for VNET to Hub Peering Fix

If you need to enable Gateway transit for the peering from VNET1 to Hub and from VNET2 to Hub, you can deploy the fix using the button below.

This requires that the VPN GW has been deployed. 

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FFixes%2FUpdateVNETPeerings4VNG.json)

## NSG Rules for Public IP access over CorpNet and CorpSAW Fix

If you want to directly access the VMs this will allow traffic inbound on port 22 from CorpNet

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FFixes%2FNSGsForPublicAccess.json)

## Enable Private Endpoint policies for Route Tables, create routes for the VMs

This will override the system created /32 route and send private endpoint traffic through the Azure Firewall

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FFixes%2FRoutePETrafficThroughFirewall.json)

## Fix the Azure Load Balancer Health Probes

This will change the VNET1 VM load balancer to probe on port 22. 

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FFixes%2FHealthProbes.json)

## Reset to Default Configuration
Description: This template resets the network configuration to a standard starting point.

This removes all NSG rules, restores routes for transitive routing on the VM subnet route tables, and disables the VNET1 - VNET2 peering. 

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FFixes%2FFullReset.json)
