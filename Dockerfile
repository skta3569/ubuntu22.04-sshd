FROM ubuntu:22.04

EXPOSE 22/tcp

RUN set -xe \
    \
    && apt update && apt install -y \
    openssh-server \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /run/sshd

RUN set -xe \
    \
    && useradd -m -s /bin/bash dev \
    && echo "dev:dev" | chpasswd

CMD [ "/usr/sbin/sshd", "-D" ]
