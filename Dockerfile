FROM ubuntu:20.04

ARG VERSION=master

WORKDIR /app

RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//mirror:\/\/mirrors\.ubuntu\.com\/mirrors\.txt/' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
        curl \
        unzip \
        moreutils \
    && curl -LO https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/archive/${VERSION}.zip \
    && unzip ${VERSION}.zip \
    && rm ${VERSION}.zip \
    && rm -rf /var/lib/apt/lists/*
