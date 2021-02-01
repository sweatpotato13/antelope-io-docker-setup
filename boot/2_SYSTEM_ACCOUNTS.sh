#!/bin/bash

SYSTEM_ACCOUNTS=(eosio.saving eosio.cpay eosio.vpay eosio.bpay eosio.stake eosio.rexpay eosio.ramfee eosio.token eosio.ram eosio.forum eosio.wrap eosio.bios eosio.msig eosio.rex)

# creatin eosio.msig, eosio.token, etc
for sa in "${SYSTEM_ACCOUNTS[@]}"; do
    ../cleos.sh create account eosio $sa $1 -p eosio
done