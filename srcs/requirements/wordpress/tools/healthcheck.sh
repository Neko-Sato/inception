#!/bin/bash
set -e

PORT=9000
ss -tuln sport = :$PORT | grep -q 'LISTEN' || exit 1
