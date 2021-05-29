FROM ruby:2.6.1 as builder

RUN gem install bundler:2.2.14

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLE_JOBS=4
RUN bundle install

FROM ruby:2.6.1

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install nodejs
RUN apt-get install -y musl-dev mysql-client

WORKDIR /app
COPY --from=builder /usr/local/bundle /usr/local/bundle

COPY . /app

RUN chmod +x scripts/launch-app.sh

RUN yarn install --check-files
RUN bin/rake webpacker:install
RUN bin/rake webpacker:compile

COPY scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh
