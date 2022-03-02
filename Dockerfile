FROM docker.io/tiredofit/nginx-php-fpm:8.0
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV ZABBIX_VERSION=6.0.1 \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_SOCKETS=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    NGINX_WEBROOT=/www/zabbix \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/zabbix" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-zabbix/"

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .zabbix-build-deps \
                alpine-sdk \
                autoconf \
                automake \
                coreutils \
                curl-dev \
                g++ \
                git \
                go \
                libevent-dev \
                libssh-dev \
                libxml2-dev \
                make \
                net-snmp-dev \
                openipmi-dev \
                openldap-dev \
                pcre-dev \
                postgresql-dev \
                sqlite-dev \
                unixodbc-dev \
                && \
    apk add -t .zabbix-run-deps \
                chromium \
                fping \
                iputils \
                iputils \
                libcurl \
                libevent \
                libldap \
                libssh \
                libxml2 \
                net-snmp-agent-libs \
                nmap \
                openipmi-libs \
                openssl \
                pcre \
                postgresql-client \
                postgresql-libs \
                py3-openssl \
                py3-pip \
                py3-requests \
                python3 \
                sqlite-libs \
                unixodbc \
                whois \
                && \
    \
    mkdir -p /etc/zabbix && \
    mkdir -p /var/lib/zabbix && \
    mkdir -p /var/lib/zabbix/enc && \
    mkdir -p /var/lib/zabbix/export && \
    mkdir -p /var/lib/zabbix/mibs && \
    mkdir -p /var/lib/zabbix/modules && \
    mkdir -p /var/lib/zabbix/snmptraps && \
    mkdir -p /var/lib/zabbix/ssh_keys && \
    mkdir -p /var/lib/zabbix/ssl && \
    mkdir -p /var/lib/zabbix/ssl/certs && \
    mkdir -p /var/lib/zabbix/ssl/keys && \
    mkdir -p /var/lib/zabbix/ssl/ssl_ca && \
    mkdir -p /usr/lib/zabbix/alertscripts && \
    mkdir -p /usr/lib/zabbix/externalscripts && \
    mkdir -p /usr/share/doc/zabbix-server/sql/postgresql && \
    \
    git clone https://github.com/zabbix/zabbix /usr/src/zabbix && \
    cd /usr/src/zabbix && \
    git checkout ${ZABBIX_VERSION} && \
    sed -i "s|{ZABBIX_REVISION}|$(git log | head -n 1 | awk '{print $2}')|g" include/version.h  && \
    ./bootstrap.sh && \
    export CFLAGS="-fPIC -pie -Wl,-z,relro -Wl,-z,now" && \
    ./configure \
            --datadir=/usr/lib \
            --libdir=/usr/lib/zabbix \
            --prefix=/usr \
            --sysconfdir=/etc/zabbix \
            --enable-agent \
            --enable-server \
            --enable-webservice \
            --with-postgresql \
            --with-ldap \
            --with-libcurl \
            --with-libxml2 \
            --with-net-snmp \
            --with-openipmi \
            --with-openssl \
            --with-ssh \
            --with-unixodbc \
            --enable-ipv6 \
            --silent && \
    make -j"$(nproc)" -s dbschema && \
    make -j"$(nproc)" -s && \
        ./configure \
            --datadir=/usr/lib \
            --libdir=/usr/lib/zabbix \
            --prefix=/usr \
            --sysconfdir=/etc/zabbix \
            --enable-proxy \
            --with-sqlite3 \
            --with-ldap \
            --with-libcurl \
            --with-libxml2 \
            --with-net-snmp \
            --with-openipmi \
            --with-openssl \
            --with-ssh \
            --with-unixodbc \
            --enable-ipv6 \
            --silent && \
    make -j"$(nproc)" -s dbschema && \
    make -j"$(nproc)" -s && \
    cp src/zabbix_proxy/zabbix_proxy /usr/sbin/zabbix_proxy && \
    cp src/zabbix_get/zabbix_get /usr/bin/zabbix_get && \
    cp src/zabbix_sender/zabbix_sender /usr/bin/zabbix_sender && \
    cp src/zabbix_server/zabbix_server /usr/sbin/zabbix_server && \
    cp -R /usr/src/zabbix/src/go/bin/zabbix_web_service /usr/sbin/zabbix_web_service && \
    cp -R database/postgresql /usr/share/doc/zabbix-server/sql && \
    mv ui ${NGINX_WEBROOT} && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} ${NGINX_WEBROOT} && \
    rm -rf /usr/src/zabbix /tmp/* && \
    chown --quiet -R zabbix:root /etc/zabbix/ /var/lib/zabbix/ && \
    chgrp -R 0 /etc/zabbix/ /var/lib/zabbix/ && \
    chmod -R g=u /etc/zabbix/ /var/lib/zabbix/ && \
    apk del .zabbix-build-deps && \
    rm -rf /var/cache/apk/*

ADD install /
