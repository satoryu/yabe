#!/bin/sh

rails db:prepare

exec "$@"
