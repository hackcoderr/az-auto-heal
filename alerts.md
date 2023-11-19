create alert action group
```
az monitor action-group create --name <name> --resource-group <resourse-group-name>  --action email my-action-name adminaddress@host.org
```
update the action group
```
 az monitor action-group update --name <name> --resource-group <resource_group_name> --add-action email example1 example1@gmail.com example2 example2@gmail.com
```

create metrics alert
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Sql/servers/<sql_server>/databases/<db_name>" --aggregation Average --condition "max storage_percent >= 80" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "DB Running Out of Space"
```
delete the metrics
```
az monitor metrics alert delete --name "<metric_name>" --resource-group "<resource_name>"   
```

# New Alerts


## App Services and Functions App Alerts

create metrics alert for Http server https
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Web/sites/<app-service-name>" --condition "count Http5xx > 10" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "Http Server Errors"
```
create metrics alert for response time
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Web/sites/<app-service-name>" --condition "max HttpResponseTime > 60" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "Response time"
```

## App Service plans Alerts

create metrics alert for http queue length 
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Web/serverfarms/<app-service-plan>" --condition "avg HttpQueueLength > 100" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "http queue length"
```

create metrics alert for cpu percentage
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Web/serverfarms/<app-service-plan>" --condition "avg CpuPercentage > 85" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "cpu percentage"
```
create metrics alert for memory percentage
```
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Web/serverfarms/<app-service-plan>" --condition "avg MemoryPercentage > 80" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "memory percentage"
```





