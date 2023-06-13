#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 03_install_cloudctl.sh =================================================="
echo "================================================================================"
echo ""

#################################################
### From https://github.com/IBM/cloud-pak-cli ###
#################################################

# Download cloudctl
curl -L https://github.com/IBM/cloud-pak-cli/releases/latest/download/cloudctl-linux-amd64.tar.gz -o cloudctl-linux-amd64.tar.gz
curl -L https://github.com/IBM/cloud-pak-cli/releases/latest/download/cloudctl-linux-amd64.tar.gz.sig -o cloudctl-linux-amd64.tar.gz.sig

# Extract cloudctl
tar -xvf cloudctl-linux-amd64.tar.gz

# Copy cloudctl to /usr/bin directory which in the PATH and rename to cloudctl
cp cloudctl-linux-amd64 /usr/bin/cloudctl