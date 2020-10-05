#!/bin/bash

echo $GSUITE_KEY_FILE | base64 --decode > /usr/share/filebeat/data/credentials_file.json

exec /usr/local/bin/docker-entrypoint filebeat -e -c /usr/share/filebeat/filebeat.yml
