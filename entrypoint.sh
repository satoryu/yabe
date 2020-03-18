#!/bin/sh

rails db:prepare

if [ $RAILS_ENV = "production" ]; then
  echo "======="
  rails assets:precompile
fi

exec "$@"
