#!/bin/bash

SYSTEM_ACCOUNTS=(eosio.saving eosio.cpay eosio.vpay eosio.bpay eosio.stake eosio.rexpay eosio.ramfee eosio.token eosio.ram eosio.forum eosio.wrap eosio.bios eosio.msig eosio.rex)

account="eosio"
controller="eosio.prods"

../cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
../cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active


for sa in "${SYSTEM_ACCOUNTS[@]}"
do
    account="$sa"
    controller="eosio"
    ../cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
    ../cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active
done
