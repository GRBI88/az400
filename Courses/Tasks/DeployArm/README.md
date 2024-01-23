


### Deploy both test and production
#### Remember to change your storage account name


```powershell

### Create Resource Group Remember own initals

$rgName = "az400-mlc-arm-demo01"

az group create --location westeurope --name $rgName


### Deploy to env

$env = "Test";

az deployment group create --resource-group $rgName --template-file .\Templates\storageaccount.json --parameters .\Parameters\$env\storageaccount.json
;


```