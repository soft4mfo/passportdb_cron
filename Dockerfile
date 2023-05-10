FROM alpine:3.13

LABEL org.opencontainers.image.source="https://github.com/soft4mfo/passportdb_cron"

RUN apk update && apk add postgresql bash curl wget bzip2 coreutils

RUN rm -rf /var/cache/apk/*

RUN mkdir /etc/periodic/2hours

RUN echo "0 */2 * * * run-parts /etc/periodic/2hours" >> /etc/crontabs/root

COPY passport /etc/periodic/2hours

RUN mkdir /app

COPY entrypoint.sh /app

ENTRYPOINT ["/app/entrypoint.sh"]

