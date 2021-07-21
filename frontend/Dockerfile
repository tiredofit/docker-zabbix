FROM tiredofit/nginx-php-fpm:8.0
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV ZABBIX_VERSION=5.4.3 \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_SOCKETS=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    NGINX_WEBROOT=/www/zabbix \
    CONTAINER_ENABLE_MESSAGING=FALSE

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    mkdir -p /usr/src/zabbix && \
    mkdir -p ${NGINX_WEBROOT} && \
    curl -sSL https://github.com/zabbix/zabbix/archive/refs/tags/${ZABBIX_VERSION}.tar.gz | tar xfz - --strip 1 -C /usr/src/zabbix && \
    mv /usr/src/zabbix/ui/* ${NGINX_WEBROOT} && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} ${NGINX_WEBROOT} && \
    rm -rf /usr/src/* && \
    rm -rf /var/cache/apk/*

ADD install /
