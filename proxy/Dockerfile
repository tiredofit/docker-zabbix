FROM tiredofit/alpine:3.14
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV CONTAINER_ENABLE_MESSAGING=FALSE

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add iputils \
            net-snmp-libs \
            nmap \
            openssl \
            python3 \
            py3-openssl \
            py3-pip \
            py3-requests \
            whois \
            zabbix-sqlite \
            zabbix-utils \
            && \
    mkdir -p /var/lib/zabbix && \
    chown -R zabbix:zabbix /var/lib/zabbix && \
    \
    rm -rf /var/cache/apk/*

ADD install /
