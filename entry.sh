#!/bin/bash

if [ -d /host_keys ]; then
    find /host_keys -name 'id_*' -or -name 'authorized_keys'  | xargs -I {} cp -f {} /remote/.ssh
fi

/usr/sbin/sshd -D
