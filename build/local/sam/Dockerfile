FROM python:3.8-alpine

RUN apk add --no-cache --virtual build-deps build-base gcc && \
  pip install awscli aws-sam-cli && \
  apk del build-deps

WORKDIR /var/opt
