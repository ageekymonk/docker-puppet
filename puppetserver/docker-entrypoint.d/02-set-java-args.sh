#!/bin/bash

if ! [ -z "${JAVA_ARGS}" ];
then
    if [[ -f /etc/redhat-release ]]
    then
        sed -i "s/^JAVA_ARGS.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/sysconfig/puppetserver

    else
        sed -i "s/^JAVA_ARGS.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/default/puppetserver
    fi
fi
