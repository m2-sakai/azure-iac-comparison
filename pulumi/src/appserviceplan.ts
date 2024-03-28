import * as pulumi from '@pulumi/pulumi';
import * as azure_native from '@pulumi/azure-native';

export const createAppServicePlan = async (
  resourceGroupName: string = 'm2-sakai-rg',
  appServicePlanName: string = 'm2-sakai-aspaa'
) => {
  const config = new pulumi.Config();

  const location = config.get('location') || 'Japan East';

  const appServicePlan = new azure_native.web.AppServicePlan(
    appServicePlanName,
    {
      elasticScaleEnabled: false,
      hyperV: false,
      isSpot: false,
      isXenon: false,
      kind: 'app',
      location: location,
      name: appServicePlanName,
      maximumElasticWorkerCount: 1,
      perSiteScaling: false,
      reserved: false,
      resourceGroupName: resourceGroupName,
      sku: {
        capacity: 1,
        family: 'B',
        name: 'B1',
        size: 'B1',
        tier: 'Basic',
      },
      targetWorkerCount: 0,
      targetWorkerSizeId: 0,
      zoneRedundant: false,
    }
  );
};
