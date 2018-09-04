#!/bin/bash

: "${ES_SSL_CA:?Set ES_SSL_CA using --env}"
: "${ES_SSL_KEY:?Set ES_SSL_KEY using --env}"
: "${ES_SSL_CERT:?Set ES_SSL_CERT using --env}"

printf "%s" "$ES_SSL_CA"     > /usr/share/elasticsearch/config/ca.crt
printf "%s" "$ES_SSL_KEY"    > /usr/share/elasticsearch/config/node.key
printf "%s" "$ES_SSL_CERT"   > /usr/share/elasticsearch/config/node.crt

/bin/bash bin/es-docker
