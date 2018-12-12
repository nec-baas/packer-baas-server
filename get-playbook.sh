#!/bin/sh

PB_DIR=playbook

/bin/rm -rf $PB_DIR 
git clone https://github.com/nec-baas/ansible-playbook-necbaas-server.git $PB_DIR
(cd $PB_DIR && git submodule init && git submodule update)
