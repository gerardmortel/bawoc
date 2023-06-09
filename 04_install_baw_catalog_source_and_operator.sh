#!/bin/bash

# Login to IBM Container Registry
podman login cp.icr.io -u cp -p $ENTITLED_REGISTRY_KEY

# Login to your local private registry
# docker login -u admin -p Passw0rd $HOSTNAME:5000

# Download the latest CASE file
curl -L https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-cs-bawautomation/2.4.5/ibm-cs-bawautomation-2.4.5.tgz -o ibm-cs-bawautomation-2.4.5.tgz

# Extract the CASE file
tar -zxvf ibm-cs-bawautomation-2.4.5.tgz

# Extract the BAW  22.0.2-IF004.tar file
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs
tar -xvf 22.0.2-IF004.tar

#################################################################################################################
### From https://www.ibm.com/docs/en/baw/22.x?topic=deployment-setting-up-cluster-without-internet-connection ###
#################################################################################################################

# Remove offline directory if it exists
rm -rf ${HOME}/offline
mkdir ${HOME}/offline

# Download the BAW CASE file
cloudctl case save \
--case https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-cs-bawautomation/2.4.5/${CASE_ARCHIVE} \
--outputdir ${OFFLINEDIR}

# Extract 22.0.2 tar file
cd offline
tar -zxvf ibm-*.tgz
cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs
tar -xvf 22.0.2*.tar
cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts

# Install the Business Automation Workflow on Containers (BAWoC) catalog source
cloudctl case launch \
--case ${OFFLINEDIR}/${CASE_ARCHIVE} \
--inventory ${CASE_INVENTORY_SETUP} \
--action install-catalog \
--namespace ${NAMESPACE} \
{}args "{-}-registry ${LOCAL_REGISTRY} --inputDir ${OFFLINEDIR} --recursive

# Install the Business Automation Workflow on Containers (BAWoC) operator
cloudctl case launch \
--case ${OFFLINEDIR}/${CASE_ARCHIVE} \
--inventory ${CASE_INVENTORY_SETUP} \
--action install-operator \
--namespace ${NAMESPACE} \
{}args "{-}-registry ${LOCAL_REGISTRY} --inputDir ${OFFLINEDIR}

echo ""
echo "================================================================================"
echo ""
