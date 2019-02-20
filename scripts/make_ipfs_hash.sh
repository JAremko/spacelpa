#!/usr/bin/env bash

set -e

ipfs daemon --init --offline & > /tmp/ipfs_daemon.log

while [ ! -e ${HOME}/.ipfs/api ]
do
    echo "Waiting for IPFS daemon to start";
    sleep 1;
done

echo "IPFS daemon started."

ipfs add --recursive --quiet --only-hash ./packages \
    | tail -1 \
    | tr -d '\n' \
    > ipfs-root
