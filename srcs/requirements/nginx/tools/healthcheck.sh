#!/bin/bash
set -e

PORT=443
ss -tuln sport = :$PORT | grep -q 'LISTEN'