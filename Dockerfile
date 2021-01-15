FROM ubuntu:focal

ARG VERSION=master

WORKDIR /app

COPY entrypoint.sh entrypoint.sh

RUN apt-get update && apt-get install -y \
        curl \
        unzip \
        moreutils \
        cron \
        smartmontools \
    && curl -LO https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/archive/${VERSION}.zip \
    && unzip ${VERSION}.zip \
    && rm ${VERSION}.zip \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "./entrypoint.sh" ]
