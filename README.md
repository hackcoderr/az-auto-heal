# az-auto-heal

### Auto Healing for App Service.

This code is a PowerShell script that configures auto-healing rules for an Azure Web App. Auto-healing rules define conditions and actions to automatically respond to issues and failures within your web application.

```
$subscriptionId = "Your_Subscription_Id"    # Your App's SubscriptionId
$webapp = "App Name"                        # Your App's Name
$rg = "Resource Group"                      # Your App's Resource Group

Select-AzureRmSubscription -SubscriptionId $subscriptionId

$autohealRules = @{
    triggers = @{
        privateBytesInKB = 777777;
        requests = @{
            count = 1000;
            timeInterval = "00:02:39";
        };
        requestDuration = @{
            count = 5;  # Adjust this value as needed
            timeInterval = "00:00:30";  # Adjust this value as needed
        };
        statusCodes = @(
            @{
                status = "5XX";  # Specify the HTTP status code range you want to trigger on
                count = 5;       # Adjust this value as needed
                timeInterval = "00:01:00";  # Adjust this value as needed
            }
        );
       slowRequests = @{	
            timeTaken = "00:01:00";	
            path = $null;	
            count = 5;	
            timeInterval = "00:05:00";	
        };
    };
    actions = @{
        actionType = "Recycle";
        minProcessExecutionTime = "00:01:39";
    };
}

$PropertiesObject = @{
    autoHealEnabled = $true;
    autoHealRules = $autohealRules;
}

Set-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName $rg -ResourceType Microsoft.Web/sites/config -ResourceName "$webapp/web" -ApiVersion 2018-02-01 -Force
```

### Explaination:
Let's break down the code step by step:

Certainly! Here's the explanation of the code in Markdown syntax:

```markdown
## Azure Web App Auto-Healing Configuration

This code is a PowerShell script that configures auto-healing rules for an Azure Web App. Auto-healing rules define conditions and actions to automatically respond to issues and failures within your web application.

### Setting Variables

```powershell
$subscriptionId = "Your_Subscription_Id"    # Your App's SubscriptionId
$webapp = "App Name"                        # Your App's Name
$rg = "Resource Group"                      # Your App's Resource Group
```

- `$subscriptionId`: This variable stores the Azure subscription ID where the web app is hosted.
- `$webapp`: This variable stores the name of your Azure App Service (Web App).
- `$rg`: This variable stores the name of the Azure resource group containing the web app.

### Select Azure Subscription

```powershell
Select-AzureRmSubscription -SubscriptionId $subscriptionId
```

This line sets the active Azure subscription to the one specified by `$subscriptionId`.

### Define Auto-Healing Rules

```powershell
$autohealRules = @{
    triggers = @{
        privateBytesInKB = 777777;
        requests = @{
            count = 1000;
            timeInterval = "00:02:39";
        };
        requestDuration = @{
            count = 5;  # Adjust this value as needed
            timeInterval = "00:00:30";  # Adjust this value as needed
        };
        statusCodes = @(
            @{
                status = "5XX";  # Specify the HTTP status code range you want to trigger on
                count = 5;       # Adjust this value as needed
                timeInterval = "00:01:00";  # Adjust this value as needed
            }
        );
        slowRequests = @{	
            timeTaken = "00:01:00";	
            path = $null;	
            count = 5;	
            timeInterval = "00:05:00";	
        };
    };
    actions = @{
        actionType = "Recycle";
        minProcessExecutionTime = "00:01:39";
    };
}
```

- `$autohealRules`: This variable stores a hashtable (dictionary) that defines the auto-healing rules for the web app.

  - `triggers`: Specifies various conditions that trigger auto-healing actions.
    - `privateBytesInKB`: This condition triggers auto-healing when the private memory usage of the app exceeds 777,777 kilobytes.
    - `requests`: This condition triggers auto-healing when the app receives 1,000 requests within a time interval of 2 minutes and 39 seconds.
    - `requestDuration`: This condition triggers auto-healing when there are 5 requests taking longer than 30 seconds each within a time interval of 30 seconds.
    - `statusCodes`: This condition triggers auto-healing when there are 5 HTTP status codes in the 5xx range (server errors) within a time interval of 1 minute.
    - `slowRequests`: This condition triggers auto-healing when there are 5 slow requests taking more than 1 minute each within a time interval of 5 minutes.

  - `actions`: Specifies the action to be taken when any of the above conditions are met.
    - `actionType`: This specifies the action type, which is "Recycle" in this case. It means that the application will be recycled (restarted) when any of the trigger conditions are met.
    - `minProcessExecutionTime`: This specifies the minimum process execution time before the auto-healing action is taken, which is 1 minute and 39 seconds in this case.

### Define Properties Object

```powershell
$PropertiesObject = @{
    autoHealEnabled = $true;
    autoHealRules = $autohealRules;
}
```

- `$PropertiesObject`: This variable stores a hashtable that combines the auto-healing configuration.
  - `autoHealEnabled`: This is set to `$true`, enabling auto-healing for the web app.
  - `autoHealRules`: This contains the auto-healing rules defined in the `$autohealRules` variable.

### Apply Configuration

```powershell
Set-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName $rg -ResourceType Microsoft.Web/sites/config -ResourceName "$webapp/web" -ApiVersion 2018-02-01 -Force
```

This cmdlet is used to set the auto-healing configuration for the Azure Web App.

- `-PropertyObject $PropertiesObject`: Specifies the properties object containing the auto-healing configuration.
- `-ResourceGroupName $rg`: Specifies the resource group where the web app is located.
- `-ResourceType Microsoft.Web/sites/config`: Specifies the resource type (App Service configuration).
- `-ResourceName "$webapp/web"`: Specifies the name of the web app and its configuration.
- `-ApiVersion 2018-02-01`: Specifies the Azure API version to use for this operation.
- `-Force`: Forces the operation without prompting for confirmation.


In summary, this script sets up auto-healing rules for an Azure Web App, defining conditions and actions to automatically respond to various performance and availability issues by recycling the application when necessary.


## Prerequisite:

Sure, here is the step which you have to follow before running the above powershell script.

```markdown
## Install Azure PowerShell Module:

Ensure that you have the Azure PowerShell module installed. If you haven't installed it yet, you can do so using the following command in an elevated (run as administrator) PowerShell session:

```powershell
Install-Module -Name Az -AllowClobber -Scope CurrentUser
```

This command installs the "Az" module, which is the successor to the older "AzureRm" module. It's recommended to use the "Az" module for Azure-related tasks.

### Import Azure Module:

After installation, import the module using the following command:

```powershell
Import-Module Az
```

Make sure you use the "Az" module in your scripts instead of "AzureRm."

## How to run 

1. Open PowerShell: Press Win + X and select "Windows PowerShell" or "Windows PowerShell (Admin)" if you need elevated privileges.

2. Copy the Script: Copy the entire PowerShell script you provided.

3. Paste and Run: Paste the script into the PowerShell window and press Enter to run it. If you're running the script with elevated privileges, make sure you've opened PowerShell as an administrator.



