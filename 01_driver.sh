#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 01_driver.sh ============================================================"
echo "================================================================================"
echo ""

. ./02_setup_env.sh
./03_install_cloudctl.sh
./04_install_baw_pfs_fncm_operators.sh
./05_baw_prerequisites_property.sh
./06_edit_property_files.sh
./07_generate_property_files.sh
./08_create_secrets.sh
./09_edit_final_cr.sh
./10_create_ingresses.sh
./11_apply_CR.sh