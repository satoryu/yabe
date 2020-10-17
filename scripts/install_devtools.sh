#!/bin/sh

apk update

# Installs packages to comlile ext gems
apk add --no-cache libxml2-dev curl-dev make gcc libc-dev g++

# Installs dev tools
apk add --no-cache git vim less

# Installs Docker CLI
apk add --no-cache docker-cli
