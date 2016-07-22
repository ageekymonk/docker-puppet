SHELL := /bin/bash
WORKING_DIR := $(shell pwd)

IMAGE_NAME = puppetagent
IMAGE_VERSION = 1.5.3-1jessie
IMAGE_TAG = $(IMAGE_NAME):$(IMAGE_VERSION)

.PHONY: build

build:
	@docker build -t $(IMAGE_TAG) --build-arg=http_proxy=http://calamari.auiag.corp:3128 --build-arg=https_proxy=http://calamari.auiag.corp:3128 $(WORKING_DIR)
