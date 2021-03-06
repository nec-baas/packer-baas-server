# NEC モバイルバックエンド基盤 Amazon 仮想マシンイメージ作成用テンプレート

NEC モバイルバックエンド基盤 サーバ一式をプリインストールする Amazon 仮想マシンイメージ （AMI） の作成用定義ファイルです。

## 概要

- AMI の作成に [Packer](https://www.packer.io/) を利用します。 
- サーバソフトのインストールに [NEC モバイルバックエンド基盤 Ansible Playbook](https://github.com/nec-baas/ansible-playbook-necbaas-server)　を利用します。

## 利用準備

### Packer インストール

    $ wget https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip
    $ unzip packer_1.3.3_linux_amd64.zip
    $ sudo mv ./packer /usr/local/bin/

### AWS 認証キーの取得
AWS デベロッパコンソールより取得します。

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

## 使い方

### Playbook ダウンロード

    $ ./get-playbook.sh

playbook 一式は playbook ディレクトリにダウンロードされます。

### Playbook インベントリファイルの設定

- イベントリファイル（playbook/localhost） を修正し、デプロイ対象を設定します。 
- デフォルトでは BaaS Server、 SSEPush Server と Cloud Functions Server の All-In-One 環境になります。

### AMI パラメータの設定

variables.sample.json を variables.json にコピーし、 作成する AMI に合わせて variables.json にパラメータを設定します。

- aws_access_key_id: AWS 認証アクセスキーID (必須。 default: "")
- aws_secret_access_key: AWS 認証セキュリティアクセスキー (必須。 default: "")
- name: AMI名 （default: "All-In-One-Servers"）
- version: サーバソフトのバージョン (default: "7.5.0")
- region: リージョン名 (必須。 default: "ap-northeast-1")
- source_ami: Base AMI ID (必須。 default: "ami-25bd2743")
  - [Centos7 オフィシャル AMI](https://wiki.centos.org/Cloud/AWS): ami-25bd2743
  - [Amazon Linux 2 オフィシャル AMI](https://aws.amazon.com/jp/amazon-linux-2/release-notes/): ami-00f9d04b3b3092052
- ssh_username: SSH ユーザ名 （必須。 default: "centos")
  - Centos7 オフィシャル AMI: centos
  - Amazon Linux 2 オフィシャル AMI: ec2-user 
- instance_type: 仮想マシンのインスタンスタイプ (必須。 default: "t2.large")

### AMI 作成

    $ ./build_ami.sh

正常に作成できた場合は、コンソールログからイメージの格納リージョンと AMI ID が出力されます。

### AMI 使い方

[こちら](./aws-ami-usage.md)を参照してください。

## AMI 公開
- AWS の[ユーザガイド](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/sharingamis-intro.html)を参照してください。
- source_ami に設定した AMI は AWS Marketplace にある AMI の場合は、アカウント指定による限定公開できますが、一般公開はできません。
  - Amazon Linux 2 オフィシャル AMI の一般公開ができますが、　Centos7 オフィシャル AMI の一般公開ができません。

