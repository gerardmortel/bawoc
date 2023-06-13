#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 04_install_baw_pfs_fncm_operators.sh ===================================="
echo "================================================================================"
echo ""

# Login to IBM Container Registry
podman login cp.icr.io -u cp -p $ENTITLED_REGISTRY_KEY

# Login to your local private registry
# docker login -u admin -p Passw0rd $HOSTNAME:5000

# Delete files and directories if they already exist
rm -f ibm-cs-bawautomation-2.4.5.tgz
rm -rf ibm-cs-bawautomation

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

# # Remove offline directory if it exists
# rm -rf ${HOME}/offline
# mkdir -p ${HOME}/offline

# # Download the BAW CASE file
# cloudctl case save \
# --case https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-cs-bawautomation/2.4.5/${CASE_ARCHIVE} \
# --outputdir ${OFFLINEDIR}

# # Extract 22.0.2 tar file
# cd offline
# tar -zxvf ibm-*.tgz
# cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs
# tar -xvf 22.0.2*.tar
# cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts

# # Install the Business Automation Workflow on Containers (BAWoC) catalog source
# cloudctl case launch \
# --case ${OFFLINEDIR}/${CASE_ARCHIVE} \
# --inventory ${CASE_INVENTORY_SETUP} \
# --action install-catalog \
# --namespace ${NAMESPACE} \
# {}args "{-}-registry ${LOCAL_REGISTRY} --inputDir ${OFFLINEDIR} --recursive

# # Install the Business Automation Workflow on Containers (BAWoC) operator
# cloudctl case launch \
# --case ${OFFLINEDIR}/${CASE_ARCHIVE} \
# --inventory ${CASE_INVENTORY_SETUP} \
# --action install-operator \
# --namespace ${NAMESPACE} \
# {}args "{-}-registry ${LOCAL_REGISTRY} --inputDir ${OFFLINEDIR}

###########################################################
### From https://www.ibm.com/support/pages/node/6590269 ###
###########################################################

# Apply IBM Cloud Pak for Automation yamls
# cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/descriptors
cd cert-kubernetes/descriptors
kubectl apply -f ibm_cp4a_crd.yaml
kubectl apply -f role.yaml  
kubectl apply -f role_binding.yaml
kubectl apply -f cluster_role.yaml
# Note: Replace the <NAMESPACE> in the cluster_role_binding.yaml file.
rm -f new_cluster_role_binding.yaml
cp -p cluster_role_binding.yaml new_cluster_role_binding.yaml
sed -ri "s|<NAMESPACE>|${NAMESPACE}|g" new_cluster_role_binding.yaml
kubectl apply -f new_cluster_role_binding.yaml
kubectl apply -f service_account.yaml
kubectl apply -f operator.yaml

# Apply Process Federation Server yamls
# cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/descriptors/sub-operator/PFS
cd sub-operator/PFS
kubectl apply -f ibm_pfs_crd.yaml
# Delete new_cluster_role.yaml if it exists
rm -f new_cluster_role.yaml
# Copy the cluster_role.yaml
cp -p cluster_role.yaml new_cluster_role.yaml
# Append the following to the cluster_role.yaml to prevent CrashLoopBackoff
cat << EOF >> new_cluster_role.yaml

- apiGroups:
  - icp4a.ibm.com
  resources:
  - '*'
  verbs:
  - get
  - list
  - update
  - patch
  - delete
  - create
  - watch
EOF
kubectl apply -f new_cluster_role.yaml
# Note: Replace the <NAMESPACE> in the cluster_role_binding.yaml file.
rm -f new_cluster_role_binding.yaml
cp -p cluster_role_binding.yaml new_cluster_role_binding.yaml
sed -ri "s|<NAMESPACE>|${NAMESPACE}|g" new_cluster_role_binding.yaml
kubectl apply -f new_cluster_role_binding.yaml
kubectl apply -f service_account.yaml
kubectl apply -f operator.yaml

# Apply FileNet Content Manager yamls
# cd ${HOME}/offline/ibm-*/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/descriptors/sub-operator/FNCM
cd ../FNCM
kubectl apply -f icp4a.ibm.com_contentrequests.yaml
kubectl apply -f icp4a.ibm.com_contents.yaml
kubectl apply -f cluster_role.yaml
# Note: Replace the <NAMESPACE> in the cluster_role_binding.yaml file.
rm -f new_cluster_role_binding.yaml
cp -p cluster_role_binding.yaml new_cluster_role_binding.yaml
sed -ri "s|<NAMESPACE>|${NAMESPACE}|g" new_cluster_role_binding.yaml
kubectl apply -f new_cluster_role_binding.yaml
kubectl apply -f role.yaml
kubectl apply -f role_binding.yaml
kubectl apply -f service_account.yaml
kubectl apply -f operator.yaml