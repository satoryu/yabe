#!/bin/sh

apk update
apk add --no-cache libxml2-dev curl-dev make gcc libc-dev g++
apk add --no-cache git vim less
