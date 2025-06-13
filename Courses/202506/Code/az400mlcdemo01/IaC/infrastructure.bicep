param appName string
param env string
param location string = resourceGroup().location


resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2024-01-01' = {
  name: 'sbns-${appName}-${env}'
  location: location
  sku: {
    name: 'Standard'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'st${appName}${env}'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
}
