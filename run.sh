#!/bin/bash

function usage() {
    printf "Usage: $0 OPTION...
    -i          start nodeos with initialize 
    -r          restart nodeos with current blocks
    -s NAME     replay nodeos with snapshot
    \\n" "$0" 1>&2
    exit 1
}

[ $# -eq 0 ] && usage

export NODE_NAME=$(echo $(awk -F "=" '/agent-name/ {print $2}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ')
export P2P_PORT=$(echo $(awk -F "=" '/p2p-listen-endpoint/ {print $2}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ' | cut -d ':' -f2)
export HTTP_PORT=$(echo $(awk -F "=" '/http-server-address/ {print $2}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ' | cut -d ':' -f2)
export STATE_PORT=$(echo $(awk -F "=" '/state-history-endpoint/ {print $2}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ' | cut -d ':' -f2)

STATE_ON=$(echo $(awk -F "=" '/state-history-endpoint/ {print $1}' ./nodeos-data-volume/nodeos-data/config/config.ini) | tr -d ' ')

SUB_COMMAND=""

echo $NODE_NAME

if [ "${STATE_ON}" != "#state-history-endpoint" ]; then
    SUB_COMMAND+=" --disable-replay-opts"
fi

while getopts "irs:t:h" opt; do
    case $opt in
    i)
        SUB_COMMAND+=" --genesis-json=/etc/nodeos/genesis.json --delete-all-blocks"
        ;;
    r)
        SUB_COMMAND+=" --hard-replay-blockchain --blocks-dir /data/blocks"
        ;;
    s)
        CUR=$(pwd)
        if [ ! -f "$CUR/nodeos-data-volume/nodeos-data/data/snapshots/$OPTARG" ]; then
            echo "$OPTARG does not exist"
            exit 1
        fi
        SUB_COMMAND+=" --snapshot /data/snapshots/${OPTARG} --blocks-dir /data/blocks"
        ;;
    h)
        usage
        ;;
    ?)
        echo "Invalid Option!" 1>&2
        usage
        ;;
    :)
        echo "Invalid Option: -${OPTARG} requires an argument." 1>&2
        usage
        ;;
    *)
        usage
        ;;
    esac
done
export USER_ID=$(id -u)
export SUB_COMMAND
echo $SUB_COMMAND

docker-compose -f docker-compose-nodeos.yaml up --build -d
