#!/bin/bash

sed -i "s/^JAVA_ARGS.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/default/puppetserver
