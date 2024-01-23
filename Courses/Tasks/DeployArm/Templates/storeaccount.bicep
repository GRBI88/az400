targetScope = 'resourceGroup'

param storageAccountName string
param location string = resourceGroup().location
param sku string = 'Standard_LRS'

var kind = 'StorageV2'


resource account 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: sku
  }
  kind: kind
}
