#!/bin/bash

set -euo pipefail

# Validate environment variables
: "${USERNAME:?Set USERNAME using --env}"
: "${PASSWORD:?Set PASSWORD using --env}"
: "${PASSWORD:?Set PASSWORD using --env}"

keytool -genkey -keyalg RSA -alias selfsigned -keystore /usr/share/logstash/config/keystore.jks -validity 360 -keysize 2048 -noprompt -dname "CN=logstash.uktrade.io, OU=ID, O=DIT, L=London, S=London, C=GB" -storepass password -keypass password

exec /usr/local/bin/docker-entrypoint
