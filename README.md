# EOSIO BOOT SEQUENCE

## Usage

### 0. Set up config & genesis file
```text
nodeos-data-volume/nodeos-data/config/config.ini
nodeos-data-volume/nodeos-data/config/genesis.json
```

### 1. Turn on EOSIO node from docker
```sh
./run.sh -i
```

### 2. Turn on keosd wallet
```sh
./start_wallet.sh
```

### 3. Create cleos wallet
```sh
./cleos.sh wallet create --to-console
```

### 4. Import Keys in cleos wallet
```sh
./cleos.sh wallet import
```

### 5. Run boot sequence #1 to #8
```sh
cd boot
./1_FEATURE_ACTIVATED.sh
...
...
./8_RESIGN.sh
```

## DONE