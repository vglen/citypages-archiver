FROM alpine:3.12.1

LABEL Ivan Stegic code@ivanstegic.com

COPY conf/ /opt/docker

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    httrack~=3.49.2-r3 &&\
    find /var/lib/apk/ -mindepth 1 -delete
RUN addgroup -g 1000 archiver && adduser -S -G archiver archiver && mkdir -p /app && chown -R archiver:archiver /app
USER archiver 
WORKDIR /app

ENTRYPOINT ["/usr/bin/httrack"]
CMD ["--help"]