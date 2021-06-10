FROM alpine:3.13

LABEL org.opencontainers.image.source="https://github.com/soft4mfo/passportdb_cron"

RUN apk update && apk add postgresql && apk add bash && apk add curl && apk add wget && apk add bzip2 && apk add coreutils

COPY passport /etc/periodic/hourly

CMD crond -l 2 -f
