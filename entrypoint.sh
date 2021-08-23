#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z $POSTGRES_HOST 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

/etc/periodic/hourly/start

crond -f -L 2
