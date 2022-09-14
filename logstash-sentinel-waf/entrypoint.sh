#!/bin/bash

set +o history
export LOGSTASH_KEYSTORE_PASS=mypassword
set -o history
bin/logstash-keystore create

exec /usr/local/bin/docker-entrypoint