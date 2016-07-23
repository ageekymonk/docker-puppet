#!/bin/bash

[ "$(ls -A /etc/puppetlabs)" ] && echo "Not Empty" || cp -Rf /etc/puppetlabs-data/* /etc/puppetlabs/.
