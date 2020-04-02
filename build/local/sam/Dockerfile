FROM python:3.8-alpine

RUN apk add --no-cache --virtual build-deps build-base gcc && \
  pip install awscli aws-sam-cli && \
  apk del build-deps

COPY ./build/local/sam/requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /var/opt
