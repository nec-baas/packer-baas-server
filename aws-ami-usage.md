# AWS AMI 使い方

## AWS EC2 作成

- AWS デベロッパコンソール上で、 necbaas の公開 AMI を指定し、 EC2 を作成します。 
  - EC2 の作成方法について、 [AWS ドキュメント](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/launching-instance.html)を参照してください。
  - necbaas の公開 AMI は、[こちら](https://nec-baas.github.io/downloads.html)を参照してください。
- なお、 BaaS Server、 SSEPush Server をインターネットに公開する場合は、 セキュリティグループのインバウンドに 8080/tcp を許可します。

## コンソールサーバに接続
  
EC2 起動後、 ブラウザを起動して http://[public_ip]:8080/console にアクセスします。

> - public_ip: EC2 の IPv4 パブリック IP
> - コンソールサーバ 初期アカウント(ID:admin@example.com, password: admin) 

## ライセンスキー投入

ライセンスキー投入手順は下記の通りです。

- コンソールの「管理」 → 「ライセンスキー」をクリックし、「編集」をクリックして編集画面に遷移します。
- 「ライセンスキー」に配布されたライセンスキーの内容をコピー＆ペーストして「更新」します。
- 無償版ライセンスキーを利用する場合は、[こちら](https://nec-baas.github.io/downloads.html)から入手します。

## REST API 利用

- http://[public_ip]:8080/api がベース URI になります。 
- 利用方法について [REST API ガイド](https://nec-baas.github.io/baas-manual/latest/developer/ja/rest/index.html)を参照してください。

## その他のサーバ利用

[マニュアル](https://nec-baas.github.io/documents.html)を参照してください。