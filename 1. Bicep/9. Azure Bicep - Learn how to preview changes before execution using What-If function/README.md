# Azure Space - 9. Azure Bicep - Learn how to preview changes before execution using What-If function

## What if?

| Change Types  | Description   |
|---|---|
| Create   |  Creates the resources that are defined in the Bicep File  |
| Modify   |   Modifies the resource properties that are defined in the Bicep File|
| NoChange   |   No Changes to the resources as there is no change in the Bicep File|
| Ignore   |   Ignores the resources which are created by other means.  |



## Execute & Deploy resources to Azure Resource Group using the below command.

```
az deployment group create -g azbicep-dev-eus-rg1 -f 2.AppServicePlan.bicep --confirm-with-what-if
```


## You can learn more aboue Azure using below resources

* Youtube Channel - [Azure Space](https://www.youtube.com/channel/UCAyKimu-hwmy0kpYprjSPBg?sub_confirmation=1)
* Website: <https://praveenkumarsreeram.com>
