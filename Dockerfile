FROM ruby:2.7.0-alpine3.11

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .
COPY yarn.lock .

RUN apk update && \
    apk add --no-cache yarn tzdata postgresql-dev imagemagick6-dev && \
    apk add --virtual build-packages --no-cache libxml2-dev curl-dev make gcc libc-dev g++ && \
    gem install bundler -v 2.1.2

RUN bundle install && \
    yarn install && \
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* && \
    apk del build-packages

COPY . /app/

RUN rails assets:precompile

ENTRYPOINT [ "./entrypoint.sh" ]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
