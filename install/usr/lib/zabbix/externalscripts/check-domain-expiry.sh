#!/bin/bash
## Get Days left of Domain Name registration
## Author: Dave Conroy <dave at tiredofit dot ca>

domain=$1

if [ -z $1 ];then
	echo "Usage : $0 <domain name>"
	exit 1;
fi

expiration=$(whois ${domain} | egrep -i 'Expiry Date' | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}|[0-9]{4}\/[0-9]{2}\/[0-9]{2}')
expirationseconds=$(date --date="${expiration//\//\-}" +%s)
today=$(date +"%s")
diff=$(($expirationseconds-$today))
daysleft=$(($diff/86400))
echo $daysleft
