#!/usr/bin/env bash

set -e

ipfs daemon --init --offline & > /tmp/ipfs_daemon.log

while [ ! -e ${HOME}/.ipfs/api ]
do
    echo "Waiting for IPFS daemon to start";
    sleep 1;
done

echo "IPFS daemon started."

# Show what we're adding
ipfs add --recursive --only-hash --progress=false ./packages

# Generate parsable output
ipfs add --recursive --only-hash --quieter ./packages > ipfs_root
