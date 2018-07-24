FROM tiredofit/nginx-php-fpm:edge-latest
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV ENABLE_SMTP=false

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk add zabbix-webif \
    && \
    \
    rm -rf /var/cache/apk/*

ADD install /
