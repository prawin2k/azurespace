# Azure Space - 18. Azure Bicep - Run Bicep script in Multiple Environments using Parameters

## What is a Bicep Module?
Modules are helpful for organizing the Bicep code into reusable components.

## Convert Bicep into ARM Template
Use the below command to convert Bicep template into an ARM Template
```
bicep build 0.Main.bicep
```
## Execute & Deploy resources to Azure Resource Group using the below command.

```
az deployment group create -g azbicep-dev-eus-rg1 -f 0.Main.bicep -p 0.Main.dev.parameters.json
az deployment group create -g azbicep-stg-eus-rg1 -f 0.Main.bicep -p 0.Main.stg.parameters.json
az deployment group create -g azbicep-prd-eus-rg1 -f 0.Main.bicep -p 0.Main.prd.parameters.json

```

## You can learn more aboue Azure using below resources

* Youtube Channel - [Azure Space](https://www.youtube.com/channel/UCAyKimu-hwmy0kpYprjSPBg?sub_confirmation=1)
* Website: <https://praveenkumarsreeram.com>
