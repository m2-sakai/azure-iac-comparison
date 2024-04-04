# Azure の IaC の比較

本リポジトリは Azure にリソースをデプロイする際に用いられる IaC (Infrastructure as Code) の比較を行うためのリポジトリです。

# 比較対象

本リポジトリで比較する IaC ツールは以下の通りです。

|     | ツール       | 概要                                                                                                                                                                   | 特徴                                                                                                                                                                                                                                                                         |
| --- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | ARM Template | Azure Resource Manager テンプレートは、 Azure のネイティブ IaC ツールで、Azure リソースのプロビジョニングを一元的に行うための宣言型のコード構文を提供します。          | <ul><li>JSON フォーマットで記述します。</li><li>Azure の各種リソースに対応しています。</li><li>Azure のポータル、PowerShell、CLI から実行可能です。</li></ul>                                                                                                                |
| 2   | Bicep        | Bicep は、ARM テンプレートをより簡易に書けるように設計された、Azure の新しい DSL (ドメイン特化言語) です。                                                             | <ul><li>JSON よりもシンプルな表記法で IaC を実現します。</li><li>ARM テンプレートを自動的に Bicep に変換するツールも提供されています。</li><li>VS Code では Bicep のための専用の拡張機能が提供されています。</li></ul>                                                       |
| 3   | Terraform    | HashiCorp 社が開発したオープンソースの IaC ツールで、マルチクラウドに対応しており、Azure もサポートしています。                                                        | <ul><li>HCL (HashiCorp Configuration Language) という独自の言語でリソースを記述します。</li><li>リソースのプロビジョニング状態を tfstate ファイルとして状態管理します。</li><li>プロバイダープラグインを使用して、異なるクラウドプロバイダのリソースを管理します。</li></ul> |
| 4   | Pulumi       | プログラミングの普通の言語（Python、JavaScript/TypeScript、C# など）を使用して IaC を記述することが可能なため、従来の開発ワークフローとの親和性が高い IaC ツールです。 | <ul><li>フル機能のプログラミング言語を使用できるため、通常のコードと同じようにテストやロジックの導入が可能です。</li><li>マルチクラウドに対応しています。</li><li>状態は pulumi.com の SaaS ベースのサービスに保存されますが、自己管理も可能です。</li></ul>                 |

# 作成するリソース一覧

本リポジトリでは以下のリソースを作成します。リージョンは全て `Japan East` です。

|     | リソース             | 名前                  | 詳細                                                                                                                      |
| --- | -------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| 1   | ストレージアカウント | m2sakaistorageaccount | <ul><li>パフォーマンス：Standard</li><li>レプリケーション：LRS</li><li>アカウントの種類：StorageV2（汎用 v2）</li></ul> |
| 2   | App Service Plan     | m2-sakai-asp          | <ul><li>SKU：B1</li><li>OS：Windows</li></ul>                                                                             |
| 3   | Function App         | m2-sakai-functionapp  |                                                                                                                           |

# リソース作成方法

## 環境

本リポジトリでは以下の環境としております。
|ツール|バージョン|確認方法|備考|
|-|-|-|-|
|Azure CLI|2.58.0|`az version`||
|bicep CLI|0.26.54|`az bicep version`||
|terraform|v1.7.5|`terraform version`||
|pulumi|v3.111.1|`pulumi version`||
|node|v20.9.0|`node -v`|Pulumi を Typescript で扱うため|

## ARM Template によるデプロイ

1. `arm_template`フォルダに移動します。
   ```bash
   cd arm_template
   ```
2. Azure CLI にログインします。
   ```bash
   az login
   ```
3. 各 ARM Template を以下のコマンドでデプロイします。全てのリソースを一括でデプロイする場合は `run_deploy_arm.sh` を実行します。パラメータは適宜適切なものに変える必要があります。
   ```bash
   az deployment group create --resource-group <リソースグループ名> --template-file <ARM Template> --parameters <パラメータファイル>
   ```

## Bicep によるデプロイ

1. `bicep`フォルダに移動します。
   ```bash
   cd bicep
   ```
2. Azure CLI にログインします。
   ```bash
   az login
   ```
3. 各 Bicep を以下のコマンドでデプロイします。全てのリソースを一括でデプロイする場合は `run_deploy_bicep.sh` を実行します。パラメータは適宜適切なものに変える必要があります。
   ```bash
   az deployment group create --resource-group <リソースグループ名> --template-file <Bicep ファイル> --parameters <パラメータファイル>
   ```

## Terraform によるデプロイ

1. `terraform`フォルダに移動します。
   ```bash
   cd terraform
   ```
2. Azure CLI にログインします。
   ```bash
   az login
   ```
3. `run_deploy_terraform.sh` を実行します。パラメータは適宜適切なものに変える必要があります。
   ```bash
   sh run_deploy_terraform.sh
   ```

## Pulumi によるデプロイ

1. `pulumi`フォルダに移動します。
   ```bash
   cd pulumi
   ```
2. Azure CLI にログインします。
   ```bash
   az login
   ```
3. `npm install` を実行して依存ライブラリを取得します。
   ```bash
   npm install
   ```
4. `pulumi up` を実行します。パラメータは適宜適切なものに変える必要があります。
   ```bash
   pulumi up
   ```
