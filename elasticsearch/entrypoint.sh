#!/bin/bash

set -eu -o pipefail

: "${ES_SSL_CA:?Set ES_SSL_CA using --env}"
: "${ES_SSL_KEY:?Set ES_SSL_KEY using --env}"
: "${ES_SSL_CERT:?Set ES_SSL_CERT using --env}"
: "${SAML_KEY:?Set SAML_KEY using --env}"
: "${SAML_CERT:?Set SAML_CERT using --env}"
: "${SYSTEM_KEY}:?Set SYSTEM_KEY using --env}"

echo -e "$ES_SSL_CA"     > /usr/share/elasticsearch/config/ca.crt
echo -e "$ES_SSL_KEY"    > /usr/share/elasticsearch/config/node.key
echo -e "$ES_SSL_CERT"   > /usr/share/elasticsearch/config/node.crt
echo -e "$SAML_KEY"      > /usr/share/elasticsearch/config/saml/saml.key
echo -e "$SAML_CERT"     > /usr/share/elasticsearch/config/saml/saml.crt
echo "$SYSTEM_KEY" | base64 -d > /usr/share/elasticsearch/config/system_key
chmod 600 /usr/share/elasticsearch/config/system_key

export EC2_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/hostname)

exec /usr/local/bin/docker-entrypoint.sh
