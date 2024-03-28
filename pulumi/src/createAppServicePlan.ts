import * as pulumi from '@pulumi/pulumi';
import * as azure from '@pulumi/azure';
import { ServicePlan } from '@pulumi/azure/appservice/servicePlan';

export const createAppServicePlan = async (
  resourceGroupName: string = 'm2-sakai-rg',
  appServicePlanName: string = 'm2-sakai-asp'
): Promise<ServicePlan> => {
  const config = new pulumi.Config();
  const location = config.get('location') || 'Japan East';

  const appServicePlan = new azure.appservice.ServicePlan(appServicePlanName, {
    osType: 'Windows',
    resourceGroupName: resourceGroupName,
    skuName: 'B1',
    location: location,
    name: appServicePlanName,
    perSiteScalingEnabled: false,
    zoneBalancingEnabled: false,
  });

  return appServicePlan;
};
