#!/bin/sh

#todo more smart way, long polling etc.
#needed to ensure that nexus ready and can handle requests
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

echo "a new maven2 hosted repository 'jmix' registered\n"