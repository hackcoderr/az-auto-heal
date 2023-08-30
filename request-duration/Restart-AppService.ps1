# Restart the Azure App Service
$resourceGroupName = "azure-cli-webapp"
$appServiceName = "azure-cli-webapp-test01"
$slotName = "production"  # Change to the appropriate slot if needed

# Stop the app service
Stop-AzWebApp -ResourceGroupName $resourceGroupName -Name $appServiceName -Slot $slotName

# Start the app service
Start-AzWebApp -ResourceGroupName $resourceGroupName -Name $appServiceName -Slot $slotName
