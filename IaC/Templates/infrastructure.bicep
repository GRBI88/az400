targetScope = 'resourceGroup'

param appName string
param env string
param location string = resourceGroup().location

//Log Analytic Workspace
var logAnalyticName = '${appName}-${env}-log'
module workspace 'logAnalytics.bicep' = {
  name: 'workspace'
  params: {
    location: location
    logAnalyticsName:  logAnalyticName
  }
}

//App insight
var appInsightName = '${appName}-${env}-appi'
module appInsight 'appInsight.bicep' = {
  name: 'appInsight'
  params: {
    appInsightName: appInsightName
    location: location
    workspaceid: workspace.outputs.id
  }
}

//Storage Account
var storageAccountName = toLower('${appName}${env}st')
module storageAccount 'storageAccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    storageAccountName: storageAccountName 
  }
}

//Plan
var planName = '${appName}-${env}-plan'
module plan 'appServicePlan.bicep' = {
  name: 'plan'
  params: {
    appName: appName
    env: env
    location: location 
  }
}

//Function App
module functionApp 'functionApp.bicep' = {
  name: 'functionApp'
  params: {
    appName: appName
    env: env
    farmId: plan.outputs.id
    instrumentationKey: appInsight.outputs.instrumentationKey
    location: location
    storageAccountConnectionString: storageAccount.outputs.connectionString 
    storageAccountName: storageAccount.outputs.name
  }
}

//Setup three Role Assignments on the Storage Account for 
//the function app's Managed identity

module raStorageAccountContri 'rbac.bicep' = {
  name: 'raStorageAccountContri'
  params: {
    identityId: functionApp.outputs.systemPrincipalId
    roleNameGuid: '17d1049b-9a84-46fb-8f53-869881c3d3ab'
  }
}

module raStorageBlobOwner 'rbac.bicep' = {
  name: 'raStorageBlobOwner'
  params: {
    identityId: functionApp.outputs.systemPrincipalId
    roleNameGuid: 'b7e6dc6d-f1e8-4753-8033-0f276bb0955b'
  }
}

module raStorageQueueDataCon 'rbac.bicep' = {
  name: 'raStorageQueueDataCon'
  params: {
    identityId: functionApp.outputs.systemPrincipalId
    roleNameGuid: '974c5e8b-45b9-4653-ba55-5f855dd0fb88'
  }
}
