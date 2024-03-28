import * as pulumi from '@pulumi/pulumi';
import * as azure_native from '@pulumi/azure-native';

export const createStorageAccount = async (
  resourceGroupName: string = 'm2-sakai-rg',
  storageAccountName: string = 'm2sakaistorageaccount'
) => {
  const config = new pulumi.Config();

  const storageAccountType = config.get('storageAccountType') || 'Standard_LRS';

  const location = config.get('location') || 'Japan East';

  const storageAccount = new azure_native.storage.StorageAccount(
    storageAccountName,
    {
      accountName: storageAccountName,
      kind: 'StorageV2',
      location: location,
      resourceGroupName: resourceGroupName,
      sku: {
        name: storageAccountType,
      },
    }
  );
};
