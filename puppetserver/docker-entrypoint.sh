#!/bin/bash

DIR=/usr/local/bin/docker-entrypoint.d

if [[ -f /etc/redhat-release ]]
then
    if [[ -d "$DIR" ]]
    then
        /usr/bin/run-parts "$DIR"
    fi
else
    if [[ -d "$DIR" ]]
    then
        /bin/run-parts --verbose --regex '\.(sh|rb)$' "$DIR"
    fi
fi
exec "$@"
