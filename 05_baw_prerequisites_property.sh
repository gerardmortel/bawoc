#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 05_baw_prerequisites_property.sh ========================================"
echo "================================================================================"
echo ""

cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts
# Generate property files
./baw-prerequisites.sh -m property
2
2
1
2
1
bpmdb,bawaudb,umsdb,appdb,aaedb,aeosdb,bawtos,bawdos,bawdocs,os1db,icndb,gcddb
nfs-managed-storage
nfs-managed-storage
nfs-managed-storage

# Edit property files
cd baw-prerequisites/propertyfile
