FROM alpine as download

ARG VCS_REF

LABEL maintainer="Ibotta" \
			org.label-schema.vcs-ref=$VCS_REF \
			org.label-schema.vcs-url="https://github.com/ibotta/docker-aws-xray-daemon"

ADD https://s3.dualstack.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/aws-xray-daemon-linux-2.x.zip /tmp
RUN cd /tmp/ && apk add --update libc6-compat unzip ca-certificates && \
		unzip aws-xray-daemon-linux-2.x.zip && mv /tmp/xray /usr/bin/ && \
		rm /tmp/* && \
		rm -rf /var/cache/apk/*

ENV AWS_ACCESS_KEY_ID=
ENV AWS_SECRET_ACCESS_KEY=
ENV AWS_REGION=

EXPOSE 2000/udp

ENTRYPOINT ["/usr/bin/xray", "--bind", "0.0.0.0:2000"]
CMD [""]
