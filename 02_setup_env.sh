#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 02_setup_env.sh ========================================================="
echo "================================================================================"
echo ""

# Set up environment variables

# Get entitlement key from https://myibm.ibm.com/products-services/containerlibrary
export API_KEY_GENERATED=""
export LDAPADMINPASSWORD=""
export USER_EMAIL="gmortel@us.ibm.com"
export NAMESPACE=cp4ba
export P8ADMINUSER="user1@your.company.com"
export P8ADMINPASSWORD=""
export P8ADMINGROUP="Admins"
export CPEWORKFLOWCONNPOINTNAME="cpe_conn_tos"
export BANLTPAPASSWORD=""
export BANKEYSTOREPASSWORD=""
export BANJMAILUSERNAME="jMailAdmin"
export BANJMAILPASSWORD=""
export UMSADMINUSER="cpeadmin" # Must NOT be in LDAP
export UMSADMINPASSWORD=""

# Example BAW CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-cs-bawautomation/2.4.5/ibm-cs-bawautomation-2.4.5.tgz

export CASE_ARCHIVE=ibm-cs-bawautomation-2.4.5.tgz
export CASE_INVENTORY_SETUP=cp4aOperatorSetup
export OFFLINEDIR=${HOME}/offline
export LOCAL_REGISTRY="cp.icr.io"