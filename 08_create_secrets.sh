#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 08_create_secrets.sh ===================================================="
echo "================================================================================"
echo ""

# Create secrets
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites/secret_template
find . -name "*.yaml" -type f | xargs -I{} kubectl apply -f {}