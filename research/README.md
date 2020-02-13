# CryptoNote Integration Research

This directory contains various scripts and hard-coded wallets to simplify
bootstrapping.

## Wallets credentials

| Name | Filename | Password | Derived address |
| --- | --- | --- | --- |
| Miner | `wallets/miner.bin.wallet` | `pass` | `c426vpdP8GqWqR1MUmSYn8MJdpZWjPaqZXDko3AhcEtbTzsRnEVWFWLejjA4iftYMWB3hhLnWhAt28BspvraZiz65Qv6ed2hnh` |
| Shipper | `wallets/shipper.bin.wallet` | `pass` | `c426qm7bg8GENrkcbPie2qFZMASUqzriJ4apQnpa9YGcJS1RAWY2KUYGVryVcPrpcZAoz3prWHCxyWPgDAi82mj22nakVhCfAN` |
| Broker | `wallets/broker.bin.wallet` | `pass` | `c426cMgNocz31cujJmCc3m7whrGVcfbZx8WLMjKmntXwhLkcsSgU53S1eZNg3Fx1DdcjzWws3xvXUCDbh5hbvBjn7rXjhTxJen` |

## Scenario

1. `cryptonoted` daemon starts.
1. Miner, Shipper and Broker connect to the daemon.
1. Miner mines ~ 12 blocks and sends coins to Shipper and Broker.
