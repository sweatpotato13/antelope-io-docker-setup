#!/bin/bash
../cleos.sh push action eosio.token create '[ "eosio", "10000000000.0000 SYS" ]' -p eosio.token@active
../cleos.sh push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "memo" ]' -p eosio@active