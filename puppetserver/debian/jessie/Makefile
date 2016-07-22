SHELL := /bin/bash
WORKING_DIR := $(shell pwd)

IMAGE_NAME = ramz/puppetserver
IMAGE_VERSION = 2.4.0-1puppetlabs1-jessie
IMAGE_TAG = $(IMAGE_NAME):$(IMAGE_VERSION)

.PHONY: build

build:
	@docker build -t $(IMAGE_TAG) $(WORKING_DIR)
