#!/bin/bash

: "${METRICBEAT_SSL_CA:?Set METRICBEAT_SSL_CA using --env}"
: "${METRICBEAT_SSL_KEY:?Set METRICBEAT_SSL_KEY using --env}"
: "${METRICBEAT_SSL_CERT:?Set METRICBEAT_SSL_CERT using --env}"

echo "$METRICBEAT_SSL_CA"     > /usr/share/metricbeat/config/ca.crt
echo "$METRICBEAT_SSL_KEY"    > /usr/share/metricbeat/config/node.key
echo "$METRICBEAT_SSL_CERT"   > /usr/share/metricbeat/config/node.crt

exec metricbeat -e