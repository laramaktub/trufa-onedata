#!/bin/bash
apt-get update -y
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*
ansible-galaxy install indigo-dc.oneclient && ansible-playbook /etc/ansible/roles/indigo-dc.oneclient/tests/test.yml

env

mkdir -p /onedata/TRUFA

export ONE_CLIENT_AUTHORIZATION_TOKEN=MDAxNWxvY2F00aW9uIG9uZXpvbmUKMDAzYmlkZW500aWZpZXIgVlY4UHBIQXBrV001aay1RcDYzTmdNM1RYVnJDM1FYNWtYVmp2ZmVJeVdlSQowMDFhY2lkIHRpbWUgPCAxNTM2MTM3ODg3CjAwMmZzaWduYXR1cmUgegSVJbLV02mOP7NEkKURNGfj2BJLKEhgXnGhRMl026kJ4K
export PROVIDER_HOSTNAME=oneprovider-test.cloud.ba.infn.it


oneclient --authentication token --no_check_certificate  /onedata/TRUFA


