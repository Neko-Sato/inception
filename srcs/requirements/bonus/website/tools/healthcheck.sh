#!/bin/bash
set -e

PORT=80
ss -tuln sport = :$PORT | grep -q 'LISTEN' || exit 1
