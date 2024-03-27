#!/bin/bash

rg_name="m2-sakai-rg"

# 1. ストレージアカウントをデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_StorageAccount_template.bicep --parameters Create_StotageAccount_parameter.bicepparam

# 2. App Service Plan をデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_AppServicePlan_template.bicep --parameters Create_AppServicePlan_parameter.bicepparam

# 3. Functionsをデプロイ
az deployment group create --resource-group ${rg_name} --template-file Create_Functions_template.bicep --parameters Create_Functions_parameter.bicepparam
