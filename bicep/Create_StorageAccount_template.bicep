param param_storageAccounts_name string

resource param_storageAccounts_name_resource 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: param_storageAccounts_name
  location: 'japaneast'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource param_storageAccounts_name_default 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: param_storageAccounts_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_param_storageAccounts_name_default 'Microsoft.Storage/storageAccounts/fileServices@2023-01-01' = {
  parent: param_storageAccounts_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_param_storageAccounts_name_default 'Microsoft.Storage/storageAccounts/queueServices@2023-01-01' = {
  parent: param_storageAccounts_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_param_storageAccounts_name_default 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  parent: param_storageAccounts_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}
