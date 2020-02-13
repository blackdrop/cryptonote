#!/usr/bin/env sh

set -e

DAEMON_SOCKETNAME="${DAEMON_SOCKETNAME:-http://localhost:18236}"
SIMPLEWALLET_HOST=0.0.0.0
SIMPLEWALLET_PORT=19236

/app/build/release/src/simplewallet \
  --testnet \
  --daemon-address="$DAEMON_SOCKETNAME" \
  --wallet-file=/app/research/wallets/shipper.bin.wallet \
  --password=pass \
  --rpc-bind-ip="$SIMPLEWALLET_HOST" \
  --rpc-bind-port="$SIMPLEWALLET_PORT"
