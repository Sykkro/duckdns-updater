#!/bin/sh

: ${DUCK_ENV_DOMAINS?"Need to set DUCK_ENV_DOMAINS"}
: ${DUCK_ENV_TOKEN?"Need to set DUCK_ENV_TOKEN"}

DUCK_ENV_INTERVAL=${DUCK_ENV_INTERVAL:-"300s"}

log() {
    echo "[`date -u`] $@"
}

current=""
while true; do
	latest=`(curl -s http://whatismyip.akamai.com/ || dig @resolver1.opendns.com ANY myip.opendns.com +short -4) 2>/dev/null`
	log "public-ipv4=$latest"
	if [ "$current" == "$latest" ]
	then
		log "ip not changed"
	else
		log "ip has changed - updating"
		current=$latest
		curl "https://www.duckdns.org/update?domains=$DUCK_ENV_DOMAINS&token=$DUCK_ENV_TOKEN&ip="
	fi
	sleep $DUCK_ENV_INTERVAL
done
