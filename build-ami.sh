#!/bin/sh

export PACKER_LOG=1
export PACKER_LOG_PATH=./packer.log

packer build -var-file=variables.json baas-server.json

