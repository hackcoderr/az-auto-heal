create alert action group
```
az monitor action-group create --name <name> --resource-group <resourse-name>  --action email my-action-name adminaddress@host.org
```
create metrics alert
```
az monitor metrics alert create --name "iManageMetrics" --resource-group "Convergint-iManage-Prod" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group>/providers/Microsoft.Sql/servers/<sql_server>/databases/<db_name>" --condition "max storage_percent >= 80" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_id>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "DB Running Out of Space"
```
delete the metrics
```
az monitor metrics alert delete --name "<metric_name>" --resource-group "<resource_name>"   
```



