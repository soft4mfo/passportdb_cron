FROM alpine:latest

#LABEL org.opencontainers.image.source="https://github.com/soft4mfo/passportdb_cron"

RUN apk update && apk add postgresql && apk add bash && apk add curl && apk add wget && apk add bzip2 && apk add coreutils

RUN rm -rf /var/cache/apk/*

COPY passport /etc/periodic/hourly

CMD crond -l 2 -f
