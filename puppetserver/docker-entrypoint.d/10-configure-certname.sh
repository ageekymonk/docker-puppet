#!/bin/bash

puppet config set certname ${CERTNAME:-puppetserver} --section master
