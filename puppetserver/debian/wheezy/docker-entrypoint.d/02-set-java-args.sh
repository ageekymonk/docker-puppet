#!/bin/bash
if ![ -z ${JAVA_ARGS} ];
then
    sed -i "s/^JAVA_ARGS.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/default/puppetserver
fi
