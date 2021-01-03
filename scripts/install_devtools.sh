#!/bin/sh

apt update

# Installs packages to comlile ext gems
apt install -y libxml2-dev curl-dev make gcc libc-dev g++

# Installs dev tools
apt install -y git-core vim less

# Installs Docker CLI
apt install -y docker.io
