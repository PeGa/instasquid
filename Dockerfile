FROM alpine:latest
MAINTAINER PeGa! dev@pega.sh
RUN apk update && \
	apk upgrade && \
	apk add squid && \
	rm -rf /var/cache/apk/*
CMD sleep 1; squid --foreground
