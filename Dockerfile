FROM ruby:2.7.2-buster

WORKDIR /app

## Install depenency packages
RUN apt update && \
    apt install -y build-essential tzdata libxml2-dev curl libpq-dev nodejs && \
    gem install bundler -v 2.1.2

## Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install yarn

COPY Gemfile Gemfile.lock package.json yarn.lock /app/

RUN gem install bundler -v 2.1.2 && \
    bundle install && \
    yarn install && \
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/*

COPY . /app/

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 3000

CMD ["rails", "server"]
