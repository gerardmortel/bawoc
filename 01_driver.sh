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