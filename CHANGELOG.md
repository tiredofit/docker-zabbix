## 3.0.6 2021-12-07 <dave at tiredofit dot ca>

   ### Changed
      - Don't Auto register Nginx or PHP templates if Server or Proxy


## 3.0.5 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix autoregistration support for templates


## 3.0.4 2021-12-01 <dave at tiredofit dot ca>

   ### Added
      - Add SSO_SETTINGS variable


## 3.0.3 2021-11-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.8


## 3.0.2 2021-10-28 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.7


## 3.0.1 2021-10-17 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 5.4.5


## 3.0.0 2021-07-25 <dave at tiredofit dot ca>

   ### Added
      - Omni Image - Contains Agent, Proxy, Server, and Web Interface all in one selectable by ZABBIX_MODE environment variable
      - More options for Zabbix Proxy
      - More options for Zabbix Agent
      - PHP 8.0 For Web Interface
      - Postgresql for Server required, SQLITE3 for Proxy

## 2.8.0 2021-07-21 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 base


## 2.7.1 2020-11-14 <dave at tiredofit dot ca>

   ### Added
      - Switch to Whois instead of Jwhois


## 2.7 2018-11-11 <dave at tiredofit dot ca>

* Revert back to Alpine 3.8 due to poor 4.0.1 upgrades

## 2.6 2018-10-21 <dave at tiredofit dot ca>

* Fixup of Startup script to set proper permissions

## 2.5 2018-02-02 <dave at tiredofit dot ca>

* Fix SSL Cert Script

## 2.4 2018-02-01 <dave at tiredofit dot ca>

* Add jwhois

## 2.3 2018-01-29 <dave at tiredofit dot ca>

* Use /assets/externalscripts + /assets/alertscripts for injections
* Add Check SSL Certificate + Check Domain Name Expiry scripts

## 2.2 2018-01-29 <dave at tiredofit dot ca>

* Add Nmap
* Add iputils
* Add Python3

## 2.1 2018-01-27 <dave at tiredofit dot ca>

* Add Python2, and openssl for extscripts

## 2.0 2018-01-27 <dave at tiredofit dot ca>

* Full rewrite - integrate Zabbix Agent inside

## 1.2 2018-01-27 <dave at tiredofit dot ca>

* Version Bump

## 1.1 2017-08-17 <dave at tiredofit dot ca>

* Version Bump

## 1.0 2017-08-17 <dave at tiredofit dot ca>

* Initial Release - Based off Official zabbix/zabbix-proxy-sqlite3:alpine-latest
* Python pyopenssl Added

