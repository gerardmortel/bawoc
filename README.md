# Install IBM Business Automation on Containers on OpenShift on Fyre
# https://github.ibm.com/gmortel/bawoc

# Resources used to create this
https://www.ibm.com/docs/en/baw/22.x?topic=deployment-setting-up-cluster-without-internet-connection

# Purpose
The purpose of this repo is to install the IBM Business Automation on Containers on OpenShift on Fyre.

# Prerequisites
1. OpenShift cluster on Fyre
2. NFS Storage configured https://github.com/gerardmortel/nfs-storage-for-fyre
3. Entitlement key https://myibm.ibm.com/products-services/containerlibrary

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip
3. cd
4. rm -f main.zip
5. wget https://github.com/gerardmortel/db2bawoc/archive/refs/heads/main.zip
6. unzip main.zip
7. rm -f main.zip
8. cd bawoc-main
9. Put your values for API_KEY_GENERATED, USER_EMAIL, NS and CASE_VERSION inside file 02_setup_env.sh
10. ./01_driver.sh
