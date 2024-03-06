# AzureのIaCの比較

本リポジトリは Azure にリソースをデプロイする際に用いられる IaC (Infrastructure as Code) の比較を行うためのリポジトリである。

# 比較対象

本リポジトリで比較する IaC ツールは以下の通り。

|  |ツール| 概要|特徴|
|--|-|-|-|
| 1 | ARM Template | Azure Resource Manager テンプレートは、 Azure のネイティブ IaC ツールで、Azure リソースのプロビジョニングを一元的に行うための宣言型のコード構文を提供します。 | <ul><li>JSON フォーマットで記述します。</li><li>Azure の各種リソースに対応しています。</li><li>Azure のポータル、PowerShell、CLI から実行可能です。</li></ul> |
| 2 | Bicep     | Bicep は、ARM テンプレートをより簡易に書けるように設計された、Azure の新しい DSL (ドメイン特化言語) です。 | <ul><li>JSONよりもシンプルな表記法でIaCを実現します。</li><li>ARM テンプレートを自動的に Bicep に変換するツールも提供されています。</li><li>VS Code では Bicep のための専用の拡張機能が提供されています。</li></ul> |
| 3 | Terraform | HashiCorp 社が開発したオープンソースの IaC ツールで、マルチクラウドに対応しており、Azureもサポートしています。 | <ul><li>HCL (HashiCorp Configuration Language) という独自の言語でリソースを記述します。</li><li>リソースのプロビジョニング状態を tfstate ファイルとして状態管理します。</li><li>プロバイダープラグインを使用して、異なるクラウドプロバイダのリソースを管理します。</li></ul> |
| 4 | Pulumi | プログラミングの普通の言語（Python、JavaScript/TypeScript、C# など）を使用して IaC を記述することが可能なため、従来の開発ワークフローとの親和性が高い IaC ツールです。 | <ul><li>フル機能のプログラミング言語を使用できるため、通常のコードと同じようにテストやロジックの導入が可能です。</li><li>マルチクラウドに対応しています。</li><li>状態は pulumi.com の SaaS ベースのサービスに保存されますが、自己管理も可能です。</li></ul>|

