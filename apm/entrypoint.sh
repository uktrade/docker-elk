#!/bin/bash

: "${APM_SSL_CA:?Set APM_SSL_CA using --env}"
: "${APM_SSL_KEY:?Set APM_SSL_KEY using --env}"
: "${APM_SSL_CERT:?Set APM_SSL_CERT using --env}"

printf "%s" "$APM_SSL_CA"     > /usr/share/apm-server/config/ca.crt
printf "%s" "$APM_SSL_KEY"    > /usr/share/apm-server/config/node.key
printf "%s" "$APM_SSL_CERT"   > /usr/share/apm-server/config/node.crt

exec apm-server -e
