FROM alpine:3.3
MAINTAINER Stephen Packer <steve@stevepacker.com>

WORKDIR /app
VOLUME ["/app"]

RUN apk -U add nodejs openssl \
    && rm -rf /var/cache/apk/* \
    && npm install -g supervisor nodemon \
    && adduser -D -u 1000 node \
    && chown -Rf node /app

COPY run.sh /run

USER node

CMD ["/run"]

