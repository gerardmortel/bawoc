#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 11_apply_CR.sh =========================================================="
echo "================================================================================"
echo ""

# Check if db2ucluster pod is running and ready every 10 seconds
oc project ${NAMESPACE}
while [ true ]
do
  oc get pods | grep "c-db2ucluster-cp4ba-db2u-0" | grep "Running" | grep "1/1"
  if [ $? -eq 0 ]; then
    echo "=============================================================================="
    echo "=================== db2ucluster IS available. ================================"
    echo "=============================================================================="
    # Check if last BAWDB has been created
    while [ true ]
    do
      oc exec c-db2ucluster-cp4ba-db2u-0 -- /mnt/blumeta0/home/db2inst1/sqllib/bin/db2 list db directory | grep BAWDB
      if [ $? -eq 0 ]; then
        echo "#### BAWDB database was found, exiting check BAWDB loop"
        break
      else
        echo "#### BAWDB database was NOT found, sleeping for 10 seconds"
        sleep 10
      fi
      echo ""
    done
    echo "#### Exiting check c-db2ucluster-cp4ba-db2u-0 is ready loop."
    break
  else
    echo "db2ucluster is NOT available."
    echo "Sleeping for 10 seconds"
    sleep 10
  fi
done

echo "#### Apply CR"
oc apply -f ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites/generated-cr/ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml