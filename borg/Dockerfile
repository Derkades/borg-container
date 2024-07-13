FROM alpine:3.20

RUN apk add --no-cache borgbackup --repository=http://dl-cdn.alpinelinux.org/alpine/v3.20/community

# Self-test
RUN borg
ENV BORG_SELFTEST=disabled

ENTRYPOINT ["borg"]
