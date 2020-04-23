# コマンド投稿ゲームサイト

[![Build Status](https://travis-ci.org/KazuMatsuHack9981/vue-rails-app.svg?branch=master)](https://travis-ci.org/KazuMatsuHack9981/vue-rails-app)


## 環境

webコンテナとdbコンテナの２つをdocker-composeで管理。  
webの中にvueが入っていて、webpackerを通じてRailsと連携。


<br/>


## 環境開発手順
無駄が多い気もするけど、私の環境ではうまく行った！  
前提：Dockerとdocker-composeがローカルに入れてある  

1: このアプリ用のディレクトリを作成  
2: 上記ディレクトリ下にDockerfile, docker-compose.ymlをここからダウンロードする  
3: 上と同じディレクトリ下に中身が空のGemfile.lockというファイルを作成  
4: 上と同じディレクトリ下にGemfileというファイルを作成して、中身は下の二行を書く  
5: `docker-compose run web rails new . --force --database=mysql --skip-bundle --webpack=vue` を実行する(最後mysqlが...みたいなエラーで終わるはず)  
6: config/database.ymlのファイルの中身の[ここの部分](https://github.com/KazuMatsuHack9981/vue-rails-app/blob/master/config/database.yml#L17-L18)をリンクのように変更   
7: `docker-compose build`を実行(これは最後successのはず)  
8: `docker-compose run web rails webpacker:install`  
9: `docker-compose run web rails webpacker:install:vue`  

```
# Gemfile
source 'https://rubygems.org'
gem 'rails', '5.2.2'
```

<br/>
<br/>


## 主なDockerコマンド


### コンテナの状態確認
```
docker ps -a
```
`Up`なら起動中、`Exited`なら停止中。


### コンテナの起動
```
docker-compose up -d
```
立ち上げてもすぐに`Exited`になるならどこかでエラーが起きてるため、  
`-d`をつけないで実行すると、ログが出力されてどこでエラーが起きてるかわかる。  
よくあるのが`server.pid`ってファイルが存在してるからエラーが起きてて、その場合はこのファイル  
をそのまま消しちゃえばOK.


### コンテナの停止
```
docker-compose stop
```


### Dockerイメージの確認
```
docker images
```
不要なイメージ(<none>みたいなやつは消していい)は`docker rmi [image id]`で消せる。


### コンテナ削除
```
docker rm [container id または container name]
```
`name`とかは`docker ps`とかで確認できる。
