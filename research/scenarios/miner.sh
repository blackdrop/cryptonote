#!/usr/bin/env sh

set -e

DAEMON_SOCKETNAME="${DAEMON_SOCKETNAME:-http://localhost:18236}"
SIMPLEWALLET_HOST=0.0.0.0
SIMPLEWALLET_PORT=19236
SIMPLEWALLET_SOCKETNAME="http://$SIMPLEWALLET_HOST:$SIMPLEWALLET_PORT"

echo "=== [CONTROL] Opening wallet..."
/app/build/release/src/simplewallet \
  --testnet \
  --daemon-address="$DAEMON_SOCKETNAME" \
  --wallet-file=/app/research/wallets/miner.bin.wallet \
  --password=pass \
  --rpc-bind-ip="$SIMPLEWALLET_HOST" \
  --rpc-bind-port="$SIMPLEWALLET_PORT" &

echo "=== [CONTROL] Waiting 5s for daemon to start..."
sleep 5s

echo "=== [CONTROL] Starting mining..."
curl \
  -X POST \
  "$DAEMON_SOCKETNAME/start_mining" \
  -H "Content-Type: application/json" \
  -d '{
    "miner_address": "c426vpdP8GqWqR1MUmSYn8MJdpZWjPaqZXDko3AhcEtbTzsRnEVWFWLejjA4iftYMWB3hhLnWhAt28BspvraZiz65Qv6ed2hnh",
    "threads_count": 1
  }'; echo

echo "=== [CONTROL] Waiting 60s for blocks to be mined and rewards to be unlocked..."
sleep 60s

echo "=== [CONTROL] Sending mined funds to other network participants..."
curl \
  -X POST \
  "$SIMPLEWALLET_SOCKETNAME/jsonrpc" \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "method": "transfer",
    "params": {
      "destinations": [
        {
          "amount": 100000000,
          "address": "c426qm7bg8GENrkcbPie2qFZMASUqzriJ4apQnpa9YGcJS1RAWY2KUYGVryVcPrpcZAoz3prWHCxyWPgDAi82mj22nakVhCfAN"
        },
        {
          "amount": 100000000,
          "address": "c426cMgNocz31cujJmCc3m7whrGVcfbZx8WLMjKmntXwhLkcsSgU53S1eZNg3Fx1DdcjzWws3xvXUCDbh5hbvBjn7rXjhTxJen"
        }
      ],
      "fee": 10,
      "mixin": 0,
      "unlock_time": 0
    }
  }'; echo

echo "[CONTROL] Done"

while true; do
  sleep 120s
done
