import * as pulumi from '@pulumi/pulumi';
import * as azure_native from '@pulumi/azure-native';

export const createStorageAccount = async (
  resourceGroupName: string = 'm2-sakai-rg',
  storageAccountName: string = 'm2sakaistorageaccount'
) => {
  const config = new pulumi.Config();

  const currentResourceGroup = azure_native.resources.getResourceGroupOutput({
    resourceGroupName: resourceGroupName,
  });

  const storageAccountType = config.get('storageAccountType') || 'Standard_LRS';

  const location =
    config.get('location') ||
    currentResourceGroup.apply(
      (currentResourceGroup) => currentResourceGroup.location
    );

  const storageAccount = new azure_native.storage.StorageAccount(
    'storageAccount',
    {
      accountName: storageAccountName,
      kind: 'StorageV2',
      location: location,
      resourceGroupName: currentResourceGroup.apply(
        (currentResourceGroup) => currentResourceGroup.name
      ),
      sku: {
        name: storageAccountType,
      },
    }
  );
  return {
    storageAccountName: storageAccount.name,
  };
};
