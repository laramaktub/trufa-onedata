#!/bin/bash
env
mkdir -p /onedata/TRUFA

apt-get update -y
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible
apt-get update  && apt-get install -y ansible && rm -rf /var/lib/apt/lists/* 
ansible-galaxy install indigo-dc.oneclient && ansible-playbook /etc/ansible/roles/indigo-dc.oneclient/tests/test.yml


ONECLIENT_AUTHORIZATION_TOKEN="$INPUT_ONEDATA_TOKEN" PROVIDER_HOSTNAME="$INPUT_ONEDATA_PROVIDERS" oneclient --no_check_certificate --authentication token -o ro /onedata/TRUFA || exit 1
