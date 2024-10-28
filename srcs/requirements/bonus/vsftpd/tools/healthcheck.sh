#!/bin/bash
set -e

PORT=21
ss -tuln sport = :$PORT | grep -q 'LISTEN' || exit 1
