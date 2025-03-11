For those who prefer to deploy parts individually, please refer to the [individual deployments guide](./IndividualDeployments.md).

### Deploy All Resources except the VNET Gateway and Azure Firewall
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2Fmain.json">
  <img src="https://aka.ms/deploytoazurebutton" alt="Deploy to Azure" />
</a>

### Deploy the VNET Gateway
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FHubVNETGateway%2FVNETGateway.json">
  <img src="https://aka.ms/deploytoazurebutton" alt="Deploy to Azure" />
</a>

### Deploy the Azure Firewall
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoftAzureAaron%2FNET_TrainingLabs%2Fmain%2FHubAzureFirewall%2FHubAZFW.json">
  <img src="https://aka.ms/deploytoazurebutton" alt="Deploy to Azure" />
</a>

### Fixes

To make predeterminined changes to the Route Tables, Network Security Groups, and the VNET Peerings, please refer to the [Fixes](./Fixes.md).

### Simulate Network Problems

To intentionally break the network and observe changes in connection behavior, please refer to the [Problems](./Problems.md) page.