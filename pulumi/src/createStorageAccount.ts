import * as pulumi from '@pulumi/pulumi';
import * as azure from '@pulumi/azure';
import { Account } from '@pulumi/azure/storage';

export const createStorageAccount = async (
  resourceGroupName: string = 'm2-sakai-rg',
  storageAccountName: string = 'm2sakaistorageaccount'
): Promise<Account> => {
  const config = new pulumi.Config();
  const location = config.get('location') || 'Japan East';

  const storageAccount = new azure.storage.Account(storageAccountName, {
    name: storageAccountName,
    resourceGroupName: resourceGroupName,
    location: location,
    accountTier: 'Standard',
    accountReplicationType: 'LRS',
  });

  return storageAccount;
};
