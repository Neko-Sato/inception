#!/bin/bash
set -e

PORT=6379
ss -tuln sport = :$PORT | grep -q 'LISTEN' || exit 1
