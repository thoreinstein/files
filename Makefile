SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

HOSTNAME = $(word 1, $(subst ., ,$(shell uname -n)))

.DEFAULT_GOAL :=
default: switch
.PHONY: default

result/sw/bin/darwin-rebuild: 
	@nix build ".#darwinConfigurations.$(HOSTNAME).system"

switch: result/sw/bin/darwin-rebuild
	@./result/sw/bin/darwin-rebuild switch --flake .
	@rm -rf result
