targetScope = 'resourceGroup'

param appName string
param location string
param env string
param storageAccountName string
param storageAccountConnectionString string //TODO: remove when possible
param instrumentationKey string
param farmId string






//Runtime

param netFrameworkVersion string = 'v8.0'
param use32BitWorkerProcess bool = false

param relayHeaderPrefix string = 'oip'

param postFix string = 'dada'
param alwaysOn bool = true

var version = '~4'
var runtime  = 'dotnet-isolated'

 

resource functionApp 'Microsoft.Web/sites@2021-02-01' = {
  name: '${appName}-${env}-func'
  location: location
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: farmId
    siteConfig: {
      alwaysOn: alwaysOn
      appSettings: [
        {
          name: 'AzureWebJobsStorage__accountName'
          value: storageAccountName
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: storageAccountConnectionString
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: instrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: runtime
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: version
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: '${appName}${postFix}'
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
        {
          name: 'RelayFunctionConfiguration:RelayHeaderPrefix'
          value: relayHeaderPrefix
        }
      ]
    }
  }
}


resource netconfig 'Microsoft.Web/sites/config@2022-09-01' = {
  parent: functionApp
  name: 'web'
  properties: {
    vnetRouteAllEnabled: true
    netFrameworkVersion: netFrameworkVersion
    use32BitWorkerProcess: use32BitWorkerProcess
  }
}

output systemPrincipalId string = functionApp.identity.principalId
