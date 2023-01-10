# Azure Space - 12. Azure Bicep - Integrate Application Insights with App Service using Instrumentation Key

## What is Instrumentation Key?

The instrumentation key identifies the resource that you want to associate your telemetry data with. You will need to copy the instrumentation key and add it to your application's code by creating an App Setting named **APPINSIGHTS_INSTRUMENTATIONKEY**

## Execute & Deploy resources to Azure Resource Group using the below command.

```
az deployment group create -g azbicep-dev-eus-rg1 -f 2.AppServicePlan.bicep
```


## You can learn more aboue Azure using below resources

* Youtube Channel - [Azure Space](https://www.youtube.com/channel/UCAyKimu-hwmy0kpYprjSPBg?sub_confirmation=1)
* Website: <https://praveenkumarsreeram.com>
