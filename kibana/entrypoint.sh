#!/bin/bash

: "${SSL_CERTIFICATE:?Set SSL_CERTIFICATE using --env}"
: "${SSL_KEY:?Set SSL_KEY using --env}"

echo -e "$SSL_CERTIFICATE"     > /usr/share/kibana/config/node.crt
echo -e "$SSL_KEY"    > /usr/share/kibana/config/node.key

exec /usr/local/bin/kibana-docker
