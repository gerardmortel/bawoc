#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 07_generate_property_files.sh ==========================================="
echo "================================================================================"
echo ""

# Generate property files
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts
./baw-prerequisites.sh -m generate