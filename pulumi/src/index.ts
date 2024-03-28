import * as pulumi from '@pulumi/pulumi';
import { createStorageAccount } from './createStorageAccount';
import { createAppServicePlan } from './createAppServicePlan';
import { createFunctions } from './createFunctions';

export const main = async () => {
  const config = new pulumi.Config();

  // 1. Create Storage Account
  const storageAccount = await createStorageAccount(
    config.get('rgName'),
    config.get('storageAccountName')
  );

  // 2. Create App Service Plan
  const appServicePlan = await createAppServicePlan(
    config.get('rgName'),
    config.get('aspName')
  );

  // 3. Create Functions
  const functions = await createFunctions(
    config.get('rgName'),
    config.get('functionsName'),
    appServicePlan.id,
    storageAccount.name,
    storageAccount.primaryAccessKey
  );
};

main();
