#!/bin/bash

echo ""
echo "================================================================================"
echo "=== In 06_edit_property_files.sh ========================================"
echo "================================================================================"
echo ""

# Edit property files
cd ibm-cs-bawautomation/inventory/cp4aOperatorSdk/files/deploy/crs/cert-kubernetes/scripts/baw-prerequisites/propertyfile

# To Do in SQL create databases
# rename AEOSDB to AEOS
# rename BPMDB to BAWDB

# Edit baw_db_name_user.property
cp -p baw_db_name_user.property baw_db_name_user.property.orig
# %s/<DB_SERVER_NAME>\.GCD/GCDDB\.GCD/g
sed -r "s|<DB_SERVER_NAME>.GCD|GCDDB.GCD|g" baw_db_name_user.property.orig > baw_db_name_user.property.1
# %s/<DB_SERVER_NAME>\.BAWDOCS/BAWDOCS\.BAWDOCS/g
sed -r "s|<DB_SERVER_NAME>.BAWDOCS|BAWDOCS.BAWDOCS|g" baw_db_name_user.property.1 > baw_db_name_user.property.2
# %s/<DB_SERVER_NAME>\.BAWDOS/BAWDOS\.BAWDOS/g
sed -r "s|<DB_SERVER_NAME>.BAWDOS|BAWDOS.BAWDOS|g" baw_db_name_user.property.2 > baw_db_name_user.property.3
# %s/<DB_SERVER_NAME>\.BAWTOS/BAWTOS\.BAWTOS/g
sed -r "s|<DB_SERVER_NAME>.BAWTOS|BAWTOS.BAWTOS|g" baw_db_name_user.property.3 > baw_db_name_user.property.4
# %s/<DB_SERVER_NAME>\.AEOS/AEOS\.AEOS/g
sed -r "s|<DB_SERVER_NAME>.AEOS|AEOS.AEOS|g" baw_db_name_user.property.4 > baw_db_name_user.property.5
# %s/DB_NAME=\"AEOS\"/DB_NAME=\"AEOS\"/g
# sed -r "s|DB_NAME="AEOS"|DB_NAME="AEOS"|g" baw_db_name_user.property.5 > baw_db_name_user.property.6
# %s/<DB_SERVER_NAME>\.ICN/ICNDB\.ICN/g
sed -r "s|<DB_SERVER_NAME>.ICN|ICNDB.ICN|g" baw_db_name_user.property.5 > baw_db_name_user.property.6
# %s/<DB_SERVER_NAME>\.APP/AAEDB\.APP/g
sed -r "s|<DB_SERVER_NAME>.APP|AAEDB.APP|g" baw_db_name_user.property.6 > baw_db_name_user.property.7
# %s/<DB_SERVER_NAME>\.BAW_/BAWDB\.BAW_/g
sed -r "s|<DB_SERVER_NAME>.BAW_|BPMDB.BAW_|g" baw_db_name_user.property.7 > baw_db_name_user.property.8
# %s/DB_NAME=\"BAWDB\"/DB_NAME=\"BAWDB\"/g
#sed -r "s|DB_NAME="BAWDB"|DB_NAME="BAWDB"|g" baw_db_name_user.property.8 > baw_db_name_user.property.9
# %s/<DB_SERVER_NAME>\.UMS_/UMSDB\.UMS_/g
sed -r "s|<DB_SERVER_NAME>.UMS_|UMSDB.UMS_|g" baw_db_name_user.property.9 > baw_db_name_user.property.10
sed -r "s/USER_NAME=\"<youruser1>\"/USER_NAME=\"db2inst1\"/g" baw_db_name_user.property.10 > baw_db_name_user.property.11
sed -r "s/USER_PASSWORD=\"<yourpassword>\"/USER_PASSWORD=\"cicdtest\"/g" baw_db_name_user.property.11 > baw_db_name_user.property.12

# Copy last file to first file
rm -f baw_db_name_user.property
cp baw_db_name_user.property.12 baw_db_name_user.property

# Edit baw_db_server.property
cp -p baw_db_server.property baw_db_server.property.orig
# %s/SERVERNAME=\"<Required>\"/SERVERNAME=\"c-db2ucluster-cp4ba-db2u.cp4ba.svc.cluster.local\"/g
sed -r "s/SERVERNAME=\"<Required>\"/SERVERNAME=\"c-db2ucluster-cp4ba-db2u.cp4ba.svc.cluster.local\"/g" baw_db_server.property.orig > baw_db_server.property.1
# %s/PORT=\"<Required>\"/PORT=\"50000\"/g
sed -r "s/PORT=\"<Required>\"/PORT=\"50000\"/g" baw_db_server.property.1 > baw_db_server.property.2
# %s/SSL_ENABLE=\"True\"/SSL_ENABLE=\"false\"/g
sed -r "s/SSL_ENABLE=\"True\"/SSL_ENABLE=\"false\"/g" baw_db_server.property.2 > baw_db_server.property.3
# %s/SERVERNAME=\"<Optional>\"/SERVERNAME=\"\"/g
sed -r "s/SERVERNAME=\"<Optional>\"/SERVERNAME=\"\"/g" baw_db_server.property.3 > baw_db_server.property.4
# %s/PORT=\"<Optional>\"/PORT=\"\"/g
sed -r "s/PORT=\"<Optional>\"/PORT=\"\"/g" baw_db_server.property.4 > baw_db_server.property.5

# Copy last file to first file
rm -f baw_db_server.property
cp baw_db_server.property.5 baw_db_server.property

# Edit baw_LDAP.property
cp -p baw_LDAP.property baw_LDAP.property.orig
sed -r 's|LDAP_SERVER="<Required>"|LDAP_SERVER="openldap.cp4ba.svc.cluster.local"|g' baw_LDAP.property.orig > baw_LDAP.property.1
sed -r 's|LDAP_PORT="<Required>"|LDAP_PORT="389"|g' baw_LDAP.property.1 > baw_LDAP.property.2
sed -r 's|LDAP_BASE_DN="<Required>"|LDAP_BASE_DN="dc=your,dc=company,dc=com"|g' baw_LDAP.property.2 > baw_LDAP.property.3
sed -r 's|LDAP_BIND_DN="<Required>"|LDAP_BIND_DN="cn=admin,dc=your,dc=company,dc=com"|g' baw_LDAP.property.3 > baw_LDAP.property.4
sed -r 's|LDAP_BIND_DN_PASSWORD="<Required>"|LDAP_BIND_DN_PASSWORD="thesummerofBpmr0cks!"|g' baw_LDAP.property.4 > baw_LDAP.property.5
sed -r 's|LDAP_SSL_ENABLED="True"|LDAP_SSL_ENABLED="false"|g' baw_LDAP.property.5 > baw_LDAP.property.6
sed -r 's|LDAP_USER_NAME_ATTRIBUTE="<Required>"|LDAP_USER_NAME_ATTRIBUTE="*:uid"|g' baw_LDAP.property.6 > baw_LDAP.property.7
sed -r 's|LDAP_USER_DISPLAY_NAME_ATTR="<Required>"|LDAP_USER_DISPLAY_NAME_ATTR="cn"|g' baw_LDAP.property.7 > baw_LDAP.property.8
sed -r 's|LDAP_GROUP_BASE_DN="<Required>"|LDAP_GROUP_BASE_DN="dc=your,dc=company,dc=com"|g' baw_LDAP.property.8 > baw_LDAP.property.9
sed -r 's|LDAP_GROUP_NAME_ATTRIBUTE="<Required>"|LDAP_GROUP_NAME_ATTRIBUTE="*:cn"|g' baw_LDAP.property.9 > baw_LDAP.property.10
sed -r 's|LDAP_GROUP_DISPLAY_NAME_ATTR="<Required>"|LDAP_GROUP_DISPLAY_NAME_ATTR="cn"|g' baw_LDAP.property.10 > baw_LDAP.property.11
sed -r 's|LDAP_GROUP_MEMBERSHIP_SEARCH_FILTER="<Required>"|LDAP_GROUP_MEMBERSHIP_SEARCH_FILTER="(\&(cn=%v)(objectclass=groupOfUniqueNames))"|g' baw_LDAP.property.11 > baw_LDAP.property.12
sed -r 's|LDAP_GROUP_MEMBER_ID_MAP="<Required>"|LDAP_GROUP_MEMBER_ID_MAP="groupOfUniqueNames:uniqueMember"|g' baw_LDAP.property.12 > baw_LDAP.property.13
sed -r 's|LC_USER_FILTER="<Required>"|LC_USER_FILTER="(\&(uid=%v)(objectclass=person))"|g' baw_LDAP.property.13 > baw_LDAP.property.14
sed -r 's|LC_GROUP_FILTER="<Required>"|LC_GROUP_FILTER="(\&(cn=%v)(objectclass=groupOfUniqueNames))"|g' baw_LDAP.property.14 > baw_LDAP.property.15

# Copy last file to first file
rm -f baw_LDAP.property
cp baw_LDAP.property.15 baw_LDAP.property

# Edit baw_user_profile.property
cp -p baw_user_profile.property baw_user_profile.property.orig
sed -r "s/CONTENT.APPLOGIN_USER=\"<Required>\"/CONTENT.APPLOGIN_USER=\"${P8ADMINUSER}\"/g" baw_user_profile.property.orig > baw_user_profile.property.1
sed -r "s/CONTENT.APPLOGIN_PASSWORD=\"<Required>\"/CONTENT.APPLOGIN_PASSWORD=\"${P8ADMINPASSWORD}\"/g" baw_user_profile.property.1 > baw_user_profile.property.2
sed -r "s/CONTENT.LTPA_PASSWORD=\"<Required>\"/CONTENT.LTPA_PASSWORD=\"${P8ADMINPASSWORD}\"/g" baw_user_profile.property.2 > baw_user_profile.property.3
sed -r "s/CONTENT.KEYSTORE_PASSWORD=\"<Required>\"/CONTENT.KEYSTORE_PASSWORD=\"password\"/g" baw_user_profile.property.3 > baw_user_profile.property.4
# CONTENT_INITIALIZATION.ENABLE="Yes"
## user name for P8 domain admin, for example, "CEAdmin". This parameter accepts comma-separated lists, for example, "CEAdmin1, CEAdmin2"
sed -r "s/CONTENT_INITIALIZATION.LDAP_ADMIN_USER_NAME=\"<Required>\"/CONTENT_INITIALIZATION.LDAP_ADMIN_USER_NAME=\"${P8ADMINUSER}\"/g" baw_user_profile.property.4 > baw_user_profile.property.5
## group name for P8 domain admin, for example, "P8Administrators". This parameter accepts comma-separated lists, for example, "P8Group1, P8Group2"
sed -r "s/CONTENT_INITIALIZATION.LDAP_ADMINS_GROUPS_NAME=\"<Required>\"/CONTENT_INITIALIZATION.LDAP_ADMINS_GROUPS_NAME=\"${P8ADMINGROUP}\"/g" baw_user_profile.property.5 > baw_user_profile.property.6
## user name and group name for object store admin, for example, "CEAdmin" or "P8Administrators". This parameter accepts comma-separated lists, for example, "P8Group1, P8Group2"
sed -r "s/CONTENT_INITIALIZATION.CPE_OBJ_STORE_ADMIN_USER_GROUPS=\"<Required>\"/CONTENT_INITIALIZATION.CPE_OBJ_STORE_ADMIN_USER_GROUPS=\"${P8ADMINGROUP}\"/g" baw_user_profile.property.6 > baw_user_profile.property.7
## Specify whether to enable workflow for the object store, the default vaule is "Yes"
# CONTENT_INITIALIZATION.CPE_OBJ_STORE_ENABLE_WORKFLOW="Yes"
## Specify a table space for the workflow data
sed -r "s/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_DATA_TBL_SPACE=\"<Required>\"/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_DATA_TBL_SPACE=\"default\"/g" baw_user_profile.property.7 > baw_user_profile.property.8
## Designate an LDAP group for the workflow admin group.
sed -r "s/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_ADMIN_GROUP=\"<Required>\"/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_ADMIN_GROUP=\"${P8ADMINGROUP}\"/g" baw_user_profile.property.8 > baw_user_profile.property.9
## Designate an LDAP group for the workflow config group
sed -r "s/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_CONFIG_GROUP=\"<Required>\"/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_CONFIG_GROUP=\"${P8ADMINGROUP}\"/g" baw_user_profile.property.9 > baw_user_profile.property.10
## Provide a name for the connection point
sed -r "s/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_PE_CONN_POINT_NAME=\"<Required>\"/CONTENT_INITIALIZATION.CPE_OBJ_STORE_WORKFLOW_PE_CONN_POINT_NAME=\"${CPEWORKFLOWCONNPOINTNAME}\"/g" baw_user_profile.property.10 > baw_user_profile.property.11
####################################################
##              USER Property for BAN             ##
####################################################
## Provide the user name for BAN. For example: "BANAdmin"
sed -r "s/BAN\.APPLOGIN_USER=\"<Required>\"/BAN\.APPLOGIN_USER=\"${P8ADMINUSER}\"/g" baw_user_profile.property.11 > baw_user_profile.property.12
## Provide the user password for BAN.
sed -r "s/BAN\.APPLOGIN_PASSWORD=\"<Required>\"/BAN\.APPLOGIN_PASSWORD=\"${P8ADMINPASSWORD}\"/g" baw_user_profile.property.12 > baw_user_profile.property.13
## Provide LTPA key password for BAN deployment.
sed -r "s/BAN\.LTPA_PASSWORD=\"<Required>\"/BAN\.LTPA_PASSWORD=\"${BANLTPAPASSWORD}\"/g" baw_user_profile.property.13 > baw_user_profile.property.14
## Provide keystore password for BAN deployment.
sed -r "s/BAN\.KEYSTORE_PASSWORD=\"<Required>\"/BAN\.KEYSTORE_PASSWORD=\"${BANKEYSTOREPASSWORD}\"/g" baw_user_profile.property.14 > baw_user_profile.property.15
## Provide the user name for jMail used by BAN. For example: "jMailAdmin"
sed -r "s/BAN\.JMAIL_USER_NAME=\"<Optional>\"/BAN\.JMAIL_USER_NAME=\"${BANJMAILUSERNAME}\"/g" baw_user_profile.property.15 > baw_user_profile.property.16
## Provide the user password for jMail used by BAN.
sed -r "s/BAN\.JMAIL_USER_PASSWORD=\"<Optional>\"/BAN\.JMAIL_USER_PASSWORD=\"${BANJMAILPASSWORD}\"/g" baw_user_profile.property.16 > baw_user_profile.property.17

####################################################
##           USER Property for AE                 ##
####################################################
## Designate an existing LDAP user for the Application Engine admin user.
## This user ID should be in the IBM Business Automation Navigator administrator role, as specified as appLoginUsername in the Navigator secret. 
## This user should also belong to the User Management Service (UMS) Teams admin group or the UMS Teams Administrators team.
## If not, follow the instructions in "Completing post-deployment tasks for Business Automation Studio and Application Engine" in the IBM Documentation to add it to the Navigator Administrator role and UMS team server admin group.
sed -r "s/APP_ENGINE.ADMIN_USER=\"<Required>\"/APP_ENGINE.ADMIN_USER=\"${P8ADMINUSER}\"/g" baw_user_profile.property.17 > baw_user_profile.property.18
####################################################
##           USER Property for BAW                ##
####################################################
## Designate an existing LDAP user for the Workflow Server admin user.
sed -r "s/BAW_RUNTIME.ADMIN_USER=\"<Required>\"/BAW_RUNTIME.ADMIN_USER=\"${P8ADMINUSER}\"/g" baw_user_profile.property.18 > baw_user_profile.property.19
####################################################
##           USER Property for UMS                ##
####################################################
## Specify the user and password values for an internal UMS admin user that will be created in a local user registry. 
## This user must be unique and not exist in the LDAP user registry. 
sed -r "s/UMS.ADMIN_USER=\"<Required>\"/UMS.ADMIN_USER=\"${UMSADMINUSER}\"/g" baw_user_profile.property.19 > baw_user_profile.property.20
sed -r "s/UMS.ADMIN_PASSWORD=\"<Required>\"/UMS.ADMIN_PASSWORD=\"${UMSADMINPASSWORD}\"/g" baw_user_profile.property.20 > baw_user_profile.property.21

# Copy last file to first file
rm -f baw_user_profile.property
cp baw_user_profile.property.21 baw_user_profile.property