WALLETHOST="127.0.0.1"
WALLETPORT="7777"

CONTAINER_NAME="eosio"

docker exec -it ${CONTAINER_NAME} cleos -u http://localhost:8888 --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
