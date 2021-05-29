# Web Game Paradise

Unity や Unreal Engine などで作成された Web ゲームを投稿、閲覧できるサービスです。

## 基本仕様

Ruby on Rails Ver 6.0.3.6
Ruby 2.6.1
MySQL 5.6.47

## ローカル環境でアプリを起動する

```bash
# 1. アプリを起動するために必要なライブラリをインストールする
bundle install
yarn install --check-files

# 2. クレデンシャル情報を登録する (現状は AWS SES の送信権限を持つ IAM)
bin/rails credentials:edit

# 3. 自身の AWS アカウント上で ap-northeast-1 リージョンでメール送信用の IAM を登録しておく
# FYI: https://www.karakaram.com/sending-email-using-amazon-ses-smtp-interface/
# aws:
#   ses:
#     access_key_id: XXXXXXXXXXXXXXX
#     secret_access_key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# 4. データベースの作成及びマイグレーションを行い、初期データを投入する
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed

# 5. 4. までの手順が正常に完了していればアプリを起動して、
# http://localhost:3000 にブラウザからアクセスしてページが表示されることを確認する
bin/rails s
```

### データベースの接続情報

MySQL の接続情報は環境変数 `DB_HOST`, `DB_USER`, `DB_PASS` で設定可能となっている。  
開発環境に応じて適宜設定を行い、自身が開発で利用する MySQL に接続できるようにしておく必要がある。
_デフォルト設定では `DB_USER` に root、`DB_HOST` には 127.0.0.1、`DB_PASS` には空が設定されている_

## Docker 上でアプリを起動する

[Docker Compose](https://docs.docker.jp/compose/toc.html) を利用して、  
Rails アプリケーション及び接続のための MySQL の動作環境を用意します。

```bash
# 下記コマンドで Docker イメージの作成が成功したら、Docker Compose で各種コンテナを起動する
# 正常に起動できたか確認するために http://localhost:3000 にブラウザからアクセスしてページが表示されることを確認する
docker-compose build && docker-compose up
```
