#!/bin/bash
set -ex

useradd $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec "$@"
