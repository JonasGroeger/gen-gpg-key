# SPDX-FileCopyrightText: 2022 Jonas Gröger
#
# SPDX-License-Identifier: MIT

.PHONY: help test

pwd = $(shell pwd)

help:
	@cat Makefile

test: ubuntu debian alpine

ubuntu:
	docker run \
		-v "$(pwd)/gen:/app/gen:ro" \
		ubuntu:latest \
		bash -c 'apt-get update && apt-get install --yes --no-install-recommends gnupg2 && /app/gen'

debian:
	docker run \
		-v "$(pwd)/gen:/app/gen:ro" \
		debian:latest \
		bash -c 'apt-get update && apt-get install --yes --no-install-recommends gnupg2 && /app/gen'

alpine:
	docker run \
		-v "$(pwd)/gen:/app/gen:ro" \
		alpine:latest \
		sh -c 'apk -U add gnupg bash && /app/gen'
