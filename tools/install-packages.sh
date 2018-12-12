#!/bin/sh

sleep 30

sudo yum -y update

sudo yum -y install wget python-pip python-devel libffi-devel openssl-devel gcc redhat-rpm-config

wget https://bootstrap.pypa.io/get-pip.py -O - | sudo python

sudo pip install ansible
