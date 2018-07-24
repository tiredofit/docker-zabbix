FROM tiredofit/alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV ENABLE_SMTP=false

### Add Build Dependencies
RUN set -x && \
    apk update && \
    apk add iputils \
            jwhois \
            nmap \
            openssl \
            postgresql-client \
            python3 \
            py3-openssl \
            py3-pip \
            py3-requests \
            zabbix-pgsql \
            && \
    mkdir -p /var/lib/zabbix && \
    chown -R zabbix:zabbix /var/lib/zabbix && \

    rm -rf /var/cache/apk/*

ADD install /
