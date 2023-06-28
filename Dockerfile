ARG PHP_BASE=8.2
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG ZABBIX_VERSION

ENV ZABBIX_VERSION=${ZABBIX_VERSION:-"6.4.4"} \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_SOCKETS=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    NGINX_SITE_ENABLED=zabbix \
    NGINX_WEBROOT=/www/zabbix \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/zabbix" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-zabbix/"

### Add Build Dependencies
RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    package install .zabbix-build-deps \
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
    package install .zabbix-run-deps \
                chromium \
                fping \
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
    mkdir -p \
            /etc/zabbix \
            /usr/lib/zabbix/alertscripts \
            /usr/lib/zabbix/externalscripts \
            /usr/share/doc/zabbix-server/sql/postgresql \
            /var/lib/zabbix \
            /var/lib/zabbix/enc \
            /var/lib/zabbix/export \
            /var/lib/zabbix/mibs \
            /var/lib/zabbix/modules \
            /var/lib/zabbix/snmptraps \
            /var/lib/zabbix/ssh_keys \
            /var/lib/zabbix/ssl \
            /var/lib/zabbix/ssl/certs \
            /var/lib/zabbix/ssl/keys \
            /var/lib/zabbix/ssl/ssl_ca \
            && \
    \
    clone_git_repo https://github.com/zabbix/zabbix ${ZABBIX_VERSION} && \
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
    rm -rf /usr/src/* \
           /tmp/* && \
    chown --quiet -R zabbix:root \
                       /etc/zabbix/ \
                       /var/lib/zabbix/ && \
    chgrp -R 0 \
              /etc/zabbix/ \
              /var/lib/zabbix/ && \
    chmod -R g=u \
              /etc/zabbix/ \
              /var/lib/zabbix/ && \
    package remove .zabbix-build-deps && \
    package cleanup

COPY install /
