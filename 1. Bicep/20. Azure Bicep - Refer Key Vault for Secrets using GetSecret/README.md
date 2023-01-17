# Azure Space - 20. Azure Bicep - Refer Key Vault for Secrets using GetSecret

## Integrate Key Vault in Bicep?
Bicep code can refer secrets stored in a KeyVault resource in the following two methods.

* Refer the secret stored in a KeyVault using the ResourceId of the KeyVault resource in the Parameter file.
* Using the Bicep API - GetSecret Function while invoking the Module.

In this video, we will learn the Option2

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
