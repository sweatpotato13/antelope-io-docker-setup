#!/bin/bash

curl -X POST http://127.0.0.1:13915/v1/producer/schedule_protocol_feature_activations -d '{"protocol_features_to_activate": ["0ec7e080177b2c02b278d5088611686b49d739925a92d9bfcacd7fc6b74053bd"]}' | jq
curl -X POST http://127.0.0.1:13915/v1/chain/get_activated_protocol_features -d '{}' | jq