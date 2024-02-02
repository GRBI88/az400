targetScope = 'resourceGroup'

param logAnalyticsName string
param location string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  location: location
}

output id string = workspace.id
