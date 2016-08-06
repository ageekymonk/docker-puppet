SHELL := /bin/bash
WORKING_DIR := $(shell pwd)

DOLLAR := $$
export DOLLAR

ifdef VERBOSE
	Q =
else
	Q = @
endif

IMAGE_NAME := ramz/puppetserver
ifeq ($(LINUX_DISTRIB), debian)
	IMAGE_VERSION := 2.4.0-1puppetlabs1-$(LINUX_DISTRIB_VERSION)
	DOCKER_TEMPLATE := Dockerfile.debian.template
else ifeq ($(LINUX_DISTRIB), ubuntu)
	IMAGE_VERSION := 2.4.0-1puppetlabs1-$(LINUX_DISTRIB_VERSION)
	DOCKER_TEMPLATE := Dockerfile.debian.template
else ifeq ($(LINUX_DISTRIB), centos)
	IMAGE_VERSION := 2.4.0-1puppetlabs1-el-$(LINUX_DISTRIB_VERSION)
	DOCKER_TEMPLATE := Dockerfile.centos.template
endif

IMAGE_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)

# Function for checking mandatory env variable Exists
check_defined = $(foreach 1,$1,$(.check_defined))
.check_defined = \
	$(if $(value $1),, \
	$(error Missing mandatory variable: \
	$1$(if $(value 2), ($(strip $2)))))

# Function for creating the dockerfile from template

# Mandatory vars
check_mandatory = \
	$(call check_defined, LINUX_DISTRIB, Linux Distribution) \
	$(call check_defined, LINUX_DISTRIB_VERSION, Linux Distribution version)

.PHONY: build release print-dockerfile

print-dockerfile: ## Prints the generated Dockerfile
	$(call check_mandatory)
	envsubst < $(DOCKER_TEMPLATE)

clean: ## Clean all temporary files
	echo "Cleaning all the temporary Files"
	${Q}rm -Rf ./temp_dockerfile_*

generate: ## Generate all Dockerfiles
	${Q}cat $(DOCKER_TEMPLATE) | envsubst > Dockerfile_$(LINUX_DISTRIB_VERSION)

build: ## Build docker container and tag it
	TEMPFILE := $(shell mktemp ./temp_dockerfile_XXXXX)
	$(call check_mandatory)
	${Q}cat $(DOCKER_TEMPLATE) | envsubst > $(TEMPFILE)
	docker build -t $(IMAGE_TAG) -f $(TEMPFILE) .
	${Q}rm $(TEMPFILE)


release: build ## Build and Tag the git repository with puppetserver version
	${Q}echo "Tagging the repo with $(IMAGE_VERSION)"

# Custom Help Message with self Documenting Targets
define USAGE_DOC
Usage: make TARGET ... [VAR1=VALUE]...

Mandatory variables:
$$LINUX_DISTRIB					Target Linux Distribution. Supported are debian, centos
$$LINUX_DISTRIB_VERSION				Target Linux Distribution Version

Available targets:
endef
export USAGE_DOC

help:
	${Q}echo "$$USAGE_DOC"
	${Q}awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)
