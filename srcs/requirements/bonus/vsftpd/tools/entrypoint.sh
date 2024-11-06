#!/bin/bash
set -e

test -n "$FTP_USER"
test -n "$FTP_PASSWORD"

if ! id $FTP_USER &>/dev/null; then
    useradd $FTP_USER -d /
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

exec "$@"
