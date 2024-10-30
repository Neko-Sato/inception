#!/bin/bash
set -e

useradd $FTP_USER -d /
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec "$@"
