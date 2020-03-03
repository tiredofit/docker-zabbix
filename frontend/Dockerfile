FROM tiredofit/nginx-php-fpm:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_SOCKETS=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    NGINX_WEBROOT=/usr/share/webapps/zabbix/ \
    ENABLE_SMTP=false

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add zabbix-webif \
    && \
    \
    rm -rf /var/cache/apk/*

ADD install /
