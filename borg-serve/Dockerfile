FROM derkades/borg

RUN apk add --no-cache openssh-server

RUN sed -i \
        -e 's/^#PasswordAuthentication yes$/PasswordAuthentication no/g' \
        -e 's/^#HostKey \/etc\/ssh\/ssh_host_ed25519_key$/HostKey \/keys\/ed25519/g' \
        -e 's/^#HostKey \/etc\/ssh\/ssh_host_ecdsa_key$/HostKey \/keys\/ecdsa/g' \
        -e 's/^#HostKey \/etc\/ssh\/ssh_host_rsa_key$/HostKey \/keys\/rsa/g' \
        /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh /var/run/sshd && \
    passwd -u root

COPY entrypoint.sh /

ENV STORAGE_QUOTA=250G BANDWIDTH_LIMIT=5000 APPEND_ONLY=false

ENTRYPOINT [ "/bin/sh" ]

CMD [ "/entrypoint.sh" ]

EXPOSE 22
