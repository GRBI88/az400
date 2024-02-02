

### Requests

```

AppRequests
| order by TimeGenerated desc


```

### Traces

```
AppTraces
| where OperationId == '...'

```

### Exceptions

```
AppExceptions
| where OperationId == '...'

```


### Piechart success/failed

```
AppRequests 
| summarize count() by tostring(Success) 
| render piechart


```


### barchart timeperiod

```
AppRequests 
| summarize count() by bin(TimeGenerated,1m), tostring(Success) 
| render barchart

```


### Extend custom log column

```

AppTraces
| extend prop__thenumber_ = tostring(Properties.prop__thenumber)
| where prop__thenumber_ != ''
| summarize count() by prop__thenumber_
| render  piechart 


```


az400mlc-log



