FROM alpine:3.13

LABEL org.opencontainers.image.source="https://github.com/soft4mfo/passportdb_cron"

RUN apk update && apk add postgresql bash curl wget bzip2 coreutils

RUN rm -rf /var/cache/apk/*

COPY passport /etc/periodic/hourly

RUN mkdir /app

COPY entrypoint.sh /app

ENTRYPOINT ["/app/entrypoint.sh"]

