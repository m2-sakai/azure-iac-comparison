import * as pulumi from '@pulumi/pulumi';
import * as azure from '@pulumi/azure';
import { WindowsFunctionApp } from '@pulumi/azure/appservice';

export const createFunctions = async (
  resourceGroupName: string = 'm2-sakai-rg',
  functionsName: string = 'm2-sakai-functionapp',
  appServicePlanId: pulumi.Output<string>,
  storageAccountName: pulumi.Output<string>,
  storageAccountPrimaryAccessKey: pulumi.Output<string>
): Promise<WindowsFunctionApp> => {
  const config = new pulumi.Config();
  const location = config.get('location') || 'Japan East';

  const functionapp = new azure.appservice.WindowsFunctionApp(functionsName, {
    name: functionsName,
    resourceGroupName: resourceGroupName,
    location: location,
    storageAccountName: storageAccountName,
    storageAccountAccessKey: storageAccountPrimaryAccessKey,
    servicePlanId: appServicePlanId,
    siteConfig: {},
  });

  return functionapp;
};
