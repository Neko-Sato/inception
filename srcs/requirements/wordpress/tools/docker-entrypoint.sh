#!/bin/bash
set -e

wp_setup.php
exec "$@" -F
