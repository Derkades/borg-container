# Tags: https://hub.docker.com/_/alpine?tab=tags&page=1&ordering=last_updated
FROM alpine:3.15

RUN apk add --no-cache borgbackup --repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/community

# Self-test
RUN borg
ENV BORG_SELFTEST disabled

ENTRYPOINT ["borg"]
