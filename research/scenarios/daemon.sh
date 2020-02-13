#!/usr/bin/env sh

set -e

DAEMON_HOST=0.0.0.0
DAEMON_PORT=18236

/app/build/release/src/cryptonoted \
  --testnet \
  --rpc-bind-ip="$DAEMON_HOST" \
  --rpc-bind-port="$DAEMON_PORT"
