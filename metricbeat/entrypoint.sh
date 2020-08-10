#!/bin/bash

: "${METRICBEAT_SSL_CA:?Set METRICBEAT_SSL_CA using --env}"
: "${METRICBEAT_SSL_KEY:?Set METRICBEAT_SSL_KEY using --env}"
: "${METRICBEAT_SSL_CERT:?Set METRICBEAT_SSL_CERT using --env}"

printf "%s" "$METRICBEAT_SSL_CA"     > /usr/share/metricbeat/config/ca.crt
printf "%s" "$METRICBEAT_SSL_KEY"    > /usr/share/metricbeat/config/node.key
printf "%s" "$METRICBEAT_SSL_CERT"   > /usr/share/metricbeat/config/node.crt

exec metricbeat -e