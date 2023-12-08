FROM alpine:3.19

RUN apk add --no-cache borgbackup --repository=http://dl-cdn.alpinelinux.org/alpine/v3.19/community

# Self-test
RUN borg
ENV BORG_SELFTEST disabled

ENTRYPOINT ["borg"]
