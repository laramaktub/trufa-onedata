#!/bin/bash

apt-get update -y
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible
apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/* 
ansible-galaxy install indigo-dc.oneclient && ansible-playbook /etc/ansible/roles/indigo-dc.oneclient/tests/test.yml

env

mkdir -p /onedata/TRUFA

ONECLIENT_AUTHORIZATION_TOKEN="$INPUT_ONEDATA_TOKEN" PROVIDER_HOSTNAME="$INPUT_ONEDATA_PROVIDERS" oneclient --no_check_certificate --authentication token --host oneprovider-test.cloud.ba.infn.it -o rw /onedata/TRUFA || exit 1

echo " esta ya aqui "
cd /onedata/TRUFA/TRUFA/users/admin/jobs/Job_trial_new_release2/.cache/tmp/
chmod 777 script_fastqc_*
source script_fastqc_* 
