#!/bin/bash

puppet config set autosign ${AUTOSIGN:-false} --section master
