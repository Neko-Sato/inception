#!/bin/bash
set -e

if ! id $FTP_USER &>/dev/null; then
    useradd $FTP_USER -d /
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

exec "$@"
