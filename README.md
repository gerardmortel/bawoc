# Install IBM Business Automation Workflow on Containers (BAWoC) on OpenShift on Fyre
# https://github.ibm.com/gmortel/bawoc

# Resources used to create this
Setting up the cluster without an internet connection
https://www.ibm.com/docs/en/baw/22.x?topic=deployment-setting-up-cluster-without-internet-connection

Installing IBM Business Automation Workflow on containers 22.0.1 or 22.0.2 on Kubernetes
https://www.ibm.com/support/pages/node/6590269

IBM/cloud-pak-cli
https://github.com/IBM/cloud-pak-cli

# Purpose
The purpose of this repo is to install the IBM Business Automation on Containers (BAWoC) on OpenShift on Fyre.

# Prerequisites
1. OpenShift cluster on Fyre
2. NFS Storage configured https://github.com/gerardmortel/nfs-storage-for-fyre
3. Entitlement key https://myibm.ibm.com/products-services/containerlibrary

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip podman
3. cd
4. rm -rf bawoc-main
5. rm -f main.zip
6. wget https://github.com/gerardmortel/bawoc/archive/refs/heads/main.zip
7. unzip main.zip
8. rm -f main.zip
9. cd bawoc-main
10. Put your values for API_KEY_GENERATED, USER_EMAIL, NS and CASE_VERSION inside file 02_setup_env.sh
11. ./01_driver.sh
