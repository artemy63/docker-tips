#!/bin/sh

echo 'adding maven2 hosted repository started\n'

#todo more smart way, long polling etc.
sleep 3m

curl -X 'POST' \
  'http://nexus:8081/service/rest/v1/repositories/maven/hosted' \
  -H 'Authorization: Basic YWRtaW46RmlyZUZveDQyIw==' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "jmix",
  "online": true,
  "storage": {
    "blobStoreName": "default",
    "strictContentTypeValidation": true,
    "writePolicy": "allow_once"
  },
  "component": {
    "proprietaryComponents": true
  },
  "maven": {
    "versionPolicy": "MIXED",
    "layoutPolicy": "STRICT",
    "contentDisposition": "ATTACHMENT"
  }
}'

curl -X 'GET' \
  'http://localhost:28081/service/rest/v1/repositories/maven/hosted/jmix' \
  -H 'Authorization: Basic YWRtaW46RmlyZUZveDQyIw==' \
  -H 'accept: application/json'

echo 'adding maven2 hosted repository finished\n'