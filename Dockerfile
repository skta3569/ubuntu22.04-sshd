FROM ubuntu:22.04

EXPOSE 22/tcp
VOLUME [ "/remote" ]

RUN set -xe \
    \
    && apt update && apt install -y \
    git \
    openssh-server \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /run/sshd

RUN set -xe \
    \
    && useradd -d /remote -p 'do not use password!!' -m -s /bin/bash remote \
    # どうしてもパスワード認証が必要な時は↓の行を使う
    # && echo "remote:remote" | chpasswd \ 
    && su - remote -c 'mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys'

ADD entry.sh /entry.sh

RUN set -xe \
    && chmod 700 /entry.sh

ENTRYPOINT [ "/entry.sh" ]
