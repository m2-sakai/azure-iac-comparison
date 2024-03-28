import * as pulumi from '@pulumi/pulumi';
import { createStorageAccount } from './storageaccount';

const config = new pulumi.Config();

const storageAccount = createStorageAccount(
  config.get('rgName'),
  config.get('storageAccountName')
);
