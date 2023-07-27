#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 08_create_secrets.sh ===================================================="
echo "================================================================================"
echo ""

# Create secrets
# cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites/secret_template
# find . -name "*.yaml" -type f | xargs -I{} kubectl apply -f {}
cd /root/bawoc-main/ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites
./create_secret.sh

# Create the ibm-entitlement-key secret
oc delete secret ibm-entitlement-key
oc create secret docker-registry ibm-entitlement-key \
--docker-username=cp \
--docker-password="${API_KEY_GENERATED}" \
--docker-server=cp.icr.io