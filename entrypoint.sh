#!/bin/sh

set -e

if [ -z "$KEY" ]
then
    echo "KEY is not set. Set the environment variable KEY to a public key"
    exit 1
fi

COMMAND="borg serve --restrict-to-repository /data --upload-ratelimit $BANDWIDTH_LIMIT --storage-quota $STORAGE_QUOTA"

if [ "$APPEND_ONLY" = "true" ]
then
    COMMAND="$COMMAND --append-only"
fi

echo "Restricting SSH server to command: $COMMAND"

# https://borgbackup.readthedocs.io/en/stable/usage/serve.html#examples
echo "command=\"$COMMAND\",restrict $KEY" > /root/.ssh/authorized_keys

if [ -f "/keys/ed25519" ]
then
    echo "Host keys found"
else
    echo "No host key found in /keys, generating new keys.."
    echo "Make sure to to mount /keys as a volume to persist host keys."
    echo "If you don't do this you will get authenticity warnings on the client."
    ssh-keygen -t ed25519 -f /keys/ed25519 -N ""
    ssh-keygen -t ecdsa -f /keys/ecdsa -N ""
    ssh-keygen -t rsa -f /keys/rsa -N ""
fi

echo "Starting SSH server"

exec /usr/sbin/sshd -D
