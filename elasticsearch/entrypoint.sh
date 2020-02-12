#!/bin/bash

: "${ES_SSL_CA:?Set ES_SSL_CA using --env}"
: "${ES_SSL_KEY:?Set ES_SSL_KEY using --env}"
: "${ES_SSL_CERT:?Set ES_SSL_CERT using --env}"
: "${SAML_KEY:?Set SAML_KEY using --env}"
: "${SAML_CERT:?Set SAML_CERT using --env}"

printf "%s" "$ES_SSL_CA"     > /usr/share/elasticsearch/config/ca.crt
printf "%s" "$ES_SSL_KEY"    > /usr/share/elasticsearch/config/node.key
printf "%s" "$ES_SSL_CERT"   > /usr/share/elasticsearch/config/node.crt
printf "%s" "$SAML_KEY"      > /usr/share/elasticsearch/config/saml/saml.key
printf "%s" "$SAML_CERT"     > /usr/share/elasticsearch/config/saml/saml.crt

exec /usr/local/bin/docker-entrypoint.sh
