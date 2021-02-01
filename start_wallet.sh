#!/bin/bash

WALLETDIR="~/node-wallet"

WALLET_HOST="127.0.0.1"
WALLET_PORT="7777"

CONTAINER_NAME=$(echo $(awk -F "=" '/agent-name/ {print $2}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ')

docker exec ${CONTAINER_NAME} keosd --http-server-address $WALLET_HOST:$WALLET_PORT $@ &
echo $! >$WALLETDIR/wallet.pid
sleep 1s
