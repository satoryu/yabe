#!/bin/sh

./bin/rails db:prepare

if [${RAILS_ENV} = "production"]; then
  ./bin/rails assets:precompile
fi

exec "$@"
