#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 09_edit_final_cr.sh ====================================================="
echo "================================================================================"
echo ""

cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites/generated-cr
cp -p ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml.orig
sed -ri "s|sc_run_as_user:|sc_run_as_user: 1000670000|" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
#sed -ri "s/lc_ldap_user_name_attribute: \"\*:uid\"/lc_ldap_user_name_attribute: 'user:sAMAccountName'/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
sed -ri "s/(lc_ldap_user_name_attribute:).*/\1 \"*:cn\"/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
sed -ri "s/(lc_ldap_user_display_name_attr:).*/\1 \"displayName\"/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
#lc_ldap_group_base_dn: "dc=your,dc=company,dc=com"
sed -ri "s/(lc_ldap_group_name_attribute:).*/\1 \"cn\"/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
#lc_ldap_group_display_name_attr: "cn"
sed -ri "s/(    lc_ldap_group_membership_search_filter:).*/\1 (\&(cn=%v}(objectcategory=group))/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
sed -ri "s/(    lc_ldap_group_member_id_map:).*/\1 'groupOfUniqueNames:uniqueMember'/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
sed -ri "s/(      lc_user_filter:).*/\1 (\&(cn=%v)(objectclass=inetOrgPerson))/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
#sed -ri "s/(      lc_group_filter:).*/\1 (\&(cn=%v)(|(objectclass=groupofnames)(objectclass=groupofuniquenames)(objectclass=groupofurls)))/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml
sed -ri "s/(      lc_group_filter:).*/\1 >-\n        (\&(cn=%v)(|(objectclass=groupofnames)(objectclass=groupofuniquenames)(objectclass=groupofurls)))/" ibm_cp4a_cr_production_FC_workflow-standalone_final.yaml