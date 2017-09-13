#!/bin/bash


env

mkdir -p /onedata/TRUFA

ONECLIENT_AUTHORIZATION_TOKEN="$INPUT_ONEDATA_TOKEN" PROVIDER_HOSTNAME="$INPUT_ONEDATA_PROVIDERS" oneclient --no_check_certificate --authentication token --host oneprovider-test.cloud.ba.infn.it -o rw /onedata/TRUFA || exit 1

echo " esta ya aqui "
#cd /onedata/TRUFA/TRUFA/users/admin/jobs/Job_trial_new_release2/.cache/tmp/
#chmod 777 script_fastqc_*
#/bin/bash script_fastqc_* 
