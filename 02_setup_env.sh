#!/bin/bash

# Set up environment variables

# Get entitlement key from https://myibm.ibm.com/products-services/containerlibrary
export API_KEY_GENERATED=""
export USER_EMAIL="gmortel@us.ibm.com"
export NAMESPACE=cp4ba

# Example BAW CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-cs-bawautomation/2.4.5/ibm-cs-bawautomation-2.4.5.tgz

export CASE_ARCHIVE=ibm-cs-bawautomation-2.4.5.tgz
export CASE_INVENTORY_SETUP=cp4aOperatorSetup
export OFFLINEDIR=${HOME}/offline
export LOCAL_REGISTRY="cp.icr.io"

echo ""
echo "================================================================================"
echo ""