import * as pulumi from '@pulumi/pulumi';
import { createStorageAccount } from './storageaccount';
import { createAppServicePlan } from './appserviceplan';

const config = new pulumi.Config();

// 1. Create Storage Account
createStorageAccount(config.get('rgName'), config.get('storageAccountName'));

// 2. Create App Service Plan
createAppServicePlan(config.get('rgName'), config.get('aspName'));
