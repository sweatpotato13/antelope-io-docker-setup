#!/bin/bash

../cleos.sh set contract eosio /contracts/eosio.system -p eosio
../cleos.sh push action eosio setpriv '["eosio.msig", 1]' -p eosio
../cleos.sh push action eosio init '["0", "4,SYS"]' -p eosio
../cleos.sh set contract eosio.wrap /contracts/eosio.wrap -p eosio.wrap