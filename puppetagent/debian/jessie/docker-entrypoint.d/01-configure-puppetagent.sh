#!/bin/bash

puppet config set server ${PUPPETSERVER} --section agent
puppet config set certname ${AGENTNAME} --section agent
puppet config set environment ${ENVIRONMENT} --section agent
