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
az monitor metrics alert create --name "<name>" --resource-group "<resource_group_name" --scopes "/subscriptions/<subscription-id>/resourceGroups/<resource_group_name>/providers/Microsoft.Sql/servers/<sql_server>/databases/<db_name>" --condition "max storage_percent >= 80" --window-size 5m --evaluation-frequency 1m --action "/subscriptions/<subscription_id>/resourceGroups/<resource_group_name>/providers/microsoft.insights/actionGroups/<action_group_name>" --description "DB Running Out of Space"
```
delete the metrics
```
az monitor metrics alert delete --name "<metric_name>" --resource-group "<resource_name>"   
```



