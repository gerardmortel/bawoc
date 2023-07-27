#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 05_baw_prerequisites_property.sh ========================================"
echo "================================================================================"
echo ""

# Generate property files
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts
printf "%s\n" 2 2 1 2 1 BPMDB,BAWAUDB,UMSDB,APPDB,AAEDB,AEOSDB,BAWTOS,BAWDOS,BAWDOCS,OS1DB,ICNDB,GCDDB nfs-managed-storage nfs-managed-storage nfs-managed-storage | ./baw-prerequisites.sh -m property

## Options provided to baw-prerequisites.sh script
# 2
# 2
# 1
# 2
# 1
# bpmdb,bawaudb,umsdb,appdb,aaedb,aeosdb,bawtos,bawdos,bawdocs,os1db,icndb,gcddb
# BPMDB,BAWAUDB,UMSDB,APPDB,AAEDB,AEOSDB,BAWTOS,BAWDOS,BAWDOCS,OS1DB,ICNDB,GCDDB
# nfs-managed-storage
# nfs-managed-storage
# nfs-managed-storage