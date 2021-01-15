#!/bin/bash

COMMAND=${COMMAND:-'echo "Hello world"'}

INTERVAL=${INTERVAL:'*/5 * * * *'}

echo "$INTERVAL root $COMMAND" > /proc/1/fd/1 2>/proc/1/fd/2

cron -f
