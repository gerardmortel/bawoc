#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 10_create_ingresses.sh =================================================="
echo "================================================================================"
echo ""

cat << EOF >> ingress-nginx-controller.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: ingress-nginx-controller
  namespace: ${NAMESPACE}
data:
  enable-underscores-in-headers: "true"
  proxy-body-size: "60m"
  proxy-buffer-size: 512k
  proxy-buffering: "on"
  proxy-buffers-number: "8"
EOF
echo "#### Create the ingress-nginx-controller"
oc apply -f ingress-nginx-controller.yaml

# echo "#### Download ingress.yaml__8.zip"
# curl -L https://www.ibm.com/support/pages/system/files/inline-files/ingress.yaml__8.zip -o ingress.yaml__8.zip

# echo "#### Extract ingress.yaml__8.zip"
# unzip ingress.yaml__8.zip

echo "#### Backup ingress.yaml"
cp -p ingress.yaml ingress.yaml.orig

echo "#### Replace <hostname_suffix> and <metadata_name>"
HOSTNAMESUFFIX=$(sed "s/api\.//" <<< "$HOSTNAME")
UNIQUENAME=$(sed "s/\.cp\.fyre\.ibm\.com//" <<< $HOSTNAMESUFFIX)
sed -ri "s/<hostname_suffix>/cp4ba\.apps\.$UNIQUENAME\.cp\.fyre\.ibm\.com/g" ingress.yaml
# %s/<metadata_name>/workflow/g
sed -ri "s/<metadata_name>/workflow/g" ingress.yaml

echo "#### Apply the ingress.yaml"
oc apply -f ingress.yaml
