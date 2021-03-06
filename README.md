# AWS X-Ray Daemon

[![Build Status](https://travis-ci.org/Ibotta/docker-aws-xray-daemon.svg?branch=master)](https://travis-ci.org/Ibotta/docker-aws-xray-daemon "Travis CI Status") [![](https://images.microbadger.com/badges/version/ibotta/aws-xray.svg)](https://microbadger.com/images/ibotta/aws-xray "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/ibotta/aws-xray.svg)](https://microbadger.com/images/ibotta/aws-xray "Get your own image badge on microbadger.com")

This is a docker image which runs [AWS X-Ray daemon](https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon.html) (2.x latest) on its own.

## Requirement

The container needs to run with credentials given to it (instance profile or creds) with the appropriate rights. [See the AWS Page for details](https://docs.aws.amazon.com/xray/latest/devguide/xray-permissions.html).

## Running in ec2 environment with iam instance role

```sh
docker run -d -p 2000:2000/udp --name aws-xray ibotta/aws-xray:latest
```

## Running in non-ec2 environment or ec2 environment without iam instance role

```sh
docker run -d -p 2000:2000/udp \
-e AWS_ACCESS_KEY_ID=aws_access_key \
-e AWS_SECRET_ACCESS_KEY=aws_secret_key \
-e AWS_REGION=aws_region \
--name aws-xray ibotta/aws-xray --local-mode
```
