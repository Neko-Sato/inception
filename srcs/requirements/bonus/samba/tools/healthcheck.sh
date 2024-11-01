#!/bin/bash
set -e

PORT=445
ss -tuln sport = :$PORT | grep -q 'LISTEN' || exit 1
