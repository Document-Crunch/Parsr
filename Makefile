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

.PHONY: set-kubeconfig build run run-ui

set-kubeconfig:
	@aws eks --region us-east-2 update-kubeconfig --name ${SERVICE}

build:
	@docker-compose -f ./docker-compose-build.yml build --no-cache parsr parsr-ui	

run: 
	@docker-compose up parsr parsr-ui

run-ui: 
	@docker-compose up parsr-ui

deploy:
	cd kustomize && kustomize build . | kubectl apply -f -


.PHONY: login tag push
login:
	aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 111084481543.dkr.ecr.us-east-2.amazonaws.com

DOCKER_APP ?= parsr
TAG ?= latest

tag:
	docker tag ${DOCKER_APP}:latest 111084481543.dkr.ecr.us-east-2.amazonaws.com/${DOCKER_APP}:${TAG}

push:
	docker push 111084481543.dkr.ecr.us-east-2.amazonaws.com/${DOCKER_APP}:${TAG}

