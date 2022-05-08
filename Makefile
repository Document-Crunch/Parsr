ifneq (,)
.error This Makefile requires GNU Make.
endif

.DEFAULT_GOAL := build
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
HASH := $(shell git rev-parse HEAD)

ifneq ("$(wildcard ./.env)","")
    include ./.env
	export
endif


SERVICE=ml

.PHONY: set-kubeconfig

set-kubeconfig:
	@aws eks --region us-east-2 update-kubeconfig --name ${SERVICE}

