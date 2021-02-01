#!/bin/bash
../cleos.sh create account eosio wispgenesis1 $1 -p eosio
../cleos.sh push action eosio setprods '{"schedule":[{"producer_name":"wispgenesis1","authority":["block_signing_authority_v0",{"threshold":1,"keys":[{"key":'"$1"',"weight":1}]}]}]}' -p eosio
../cleos.sh push action eosio.token create '[ "eosio", "10000000000.0000 SYS" ]' -p eosio.token@active
../cleos.sh push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "memo" ]' -p eosio@active