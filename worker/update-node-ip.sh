#!/bin/bash

public_ip=$(curl -4 -s http://icanhazip.com)

script_dir=$(dirname "$(readlink -f "$0")")
compose_file="$script_dir/prod-docker-compose.yaml"
sed -i.bak -E "s/--dialback-address=[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/--dialback-address=${public_ip}/" "$compose_file"

config_file="$script_dir/config.yaml"
sed -i.bak -E "s/node_ip: [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/node_ip: ${public_ip}/" "$config_file"