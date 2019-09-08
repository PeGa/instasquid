FROM alpine:latest
MAINTAINER PeGa! dev@pega.sh
RUN apk add squid
CMD sleep 1; squid --foreground
