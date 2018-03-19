#!/bin/bash

docker -d run --attach STDOUT -p 2000:2000/udp -e AWS_REGION=us-east-1 xray -o -l debug
nc -w 1 -r -v -u 127.0.0.1 2000 < segment.txt
sleep 1
docker logs xray > /tmp/result.txt
docker stop xray

if grep -q 'Successfully sent batch of' /tmp/result.txt; then
  echo "Tests Pass"
else
  echo "Did not find text in result"
  cat /tmp/result.txt
  exit 1
fi
