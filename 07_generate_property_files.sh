#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 07_generate_property_files.sh ==========================================="
echo "================================================================================"
echo ""

# Get deployment hostname suffix, replace "api" with "apps"
DEPLOYMENTHOSTNAMESUFFIX=$(sed "s/api/apps/" <<< "$HOSTNAME")

# Generate property files
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts
./baw-prerequisites.sh -m generate

# Disable "Press any key to continue" from script
sed -ri "s/(    read -rsn1 -p\"Press any key to continue\";echo)/#\1/" baw-prerequisites.sh

#./baw-prerequisites.sh -m generate-cr
printf "%s\n" Yes 2 1 $DEPLOYMENTHOSTNAMESUFFIX 1 | ./baw-prerequisites.sh -m generate-cr
