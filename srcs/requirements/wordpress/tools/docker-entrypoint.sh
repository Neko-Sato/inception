#!/bin/bash
set -e

php /init.php > /dev/null

exec "$@"
