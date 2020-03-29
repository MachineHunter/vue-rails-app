FROM ruby:2.5.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev


# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && apt-get install nodejs

# npmインストール
RUN apt-get install -y npm
RUN npm install n -g && \
    n stable && \
	 apt-get purge -y nodejs npm



# 作業ディレクトリの作成、設定
RUN mkdir /vue-rails-app
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /vue-rails-app
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT
