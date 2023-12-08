#!/bin/env bash

set -e -o pipefail

CONTAINER_NAME=${CONTAINER_NAME:-${PWD##*/}}

trap 'docker rm -f $CONTAINER' EXIT

CONTAINER=$(docker run \
    -d \
    --name "$CONTAINER_NAME" \
    -p 8080:8080 \
    "$CONTAINER_NAME"
)

## Check if the application is up
check() {
    curl -sS http://localhost:8080/status | grep -oEq '"rc":"ok"' && echo " SUCCESS!"
}

## Wait for the application to be up
sleep 10
TIMEOUT=${TIMEOUT:-30}
while ! check; do
    TIMEOUT=$((TIMEOUT - 1))
    if [[ $TIMEOUT -eq 0 ]]; then
        echo " Timeout waiting for application to start, test failed"
        exit 1
    fi
    printf '.'
    sleep 1
done
