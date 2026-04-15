ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.7
FROM $BUILD_FROM
ENV ES_VERSION 8.12.2
RUN apk add --no-cache openjdk17-jre-headless
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}-linux-x86_64.tar.gz && \
    tar -xzf elasticsearch-${ES_VERSION}-linux-x86_64.tar.gz && \
    mv elasticsearch-${ES_VERSION} /elasticsearch
EXPOSE 9200 9300
ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
