#!/bin/bash

rg_name="m2-sakai-rg"

# 1. ストレージアカウントをデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_StorageAccount_template.json --parameters Create_StorageAccount_parameter.json

# 2. App Service Plan をデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_AppServicePlan_template.json --parameters Create_AppServicePlan_parameter.json

# 3. Functionsをデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_Functions_template.json --parameters Create_Functions_parameter.json
