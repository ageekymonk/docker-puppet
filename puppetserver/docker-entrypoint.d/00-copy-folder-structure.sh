#!/bin/bash

[ "$(ls -A /etc/puppetlabs)" ] && echo "Not Empty" || cp -Rf /etc/puppetlabs-template/* /etc/puppetlabs/.
