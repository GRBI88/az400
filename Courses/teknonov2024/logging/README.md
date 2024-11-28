AppRequests
| project TimeGenerated, Success,DurationMs,ClientCity,OperationId
| order by TimeGenerated desc



AppRequests
| where TimeGenerated > ago(1h)
| summarize count() by tostring(Success)
| render piechart 

AppRequests
| where TimeGenerated > ago(1h)
| summarize count() by bin(TimeGenerated,2m), tostring(Success)
| render barchart 

AppTraces
| extend prop__number_ = tostring(Properties.prop__number)
| where prop__number_ != ''
| summarize count() by prop__number_
| render piechart 


### Setting up alerts (alerts, Action Groups)
AppRequests
| where TimeGenerated > ago(15m)
| where Success == false