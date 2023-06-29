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

# Edit the baw_db_name_user.property
cp -p baw_db_name_user.property baw_db_name_user.property.orig
# %s/<DB_SERVER_NAME>\.GCD/GCDDB\.GCD/g
sed -r "s|<DB_SERVER_NAME>.GCD|GCDDB.GCD|g" baw_db_name_user.property > baw_db_name_user.property.1
# %s/<DB_SERVER_NAME>\.BAWDOCS/BAWDOCS\.BAWDOCS/g
sed -r "s|<DB_SERVER_NAME>.BAWDOCS|BAWDOCS.BAWDOCS|g" baw_db_name_user.property.1 > baw_db_name_user.property.2
# %s/<DB_SERVER_NAME>\.BAWDOS/BAWDOS\.BAWDOS/g
sed -r "s|<DB_SERVER_NAME>.BAWDOS|BAWDOS.BAWDOS|g" baw_db_name_user.property.2 > baw_db_name_user.property.3
# %s/<DB_SERVER_NAME>\.BAWTOS/BAWTOS\.BAWTOS/g
sed -r "s|<DB_SERVER_NAME>.BAWTOS|BAWTOS.BAWTOS|g" baw_db_name_user.property.3 > baw_db_name_user.property.4
# %s/<DB_SERVER_NAME>\.AEOS/AEOSDB\.AEOS/g
sed -r "s|<DB_SERVER_NAME>.AEOS|AEOSDB.AEOS|g" baw_db_name_user.property.4 > baw_db_name_user.property.5
# %s/DB_NAME=\"AEOS\"/DB_NAME=\"AEOSDB\"/g
sed -r "s|DB_NAME="AEOS"|DB_NAME="AEOSDB"|g" baw_db_name_user.property.5 > baw_db_name_user.property.6
# %s/<DB_SERVER_NAME>\.AEOS/AEOSDB\.AEOS/g
sed -r "s|<DB_SERVER_NAME>.AEOS|AEOSDB.AEOS|g" baw_db_name_user.property.6 > baw_db_name_user.property.7
# %s/<DB_SERVER_NAME>\.ICN/ICNDB\.ICN/g
sed -r "s|<DB_SERVER_NAME>.ICN|ICNDB.ICN|g" baw_db_name_user.property.7 > baw_db_name_user.property.8
# %s/<DB_SERVER_NAME>\.APP/AAEDB\.APP/g
sed -r "s|<DB_SERVER_NAME>.APP|AAEDB.APP|g" baw_db_name_user.property.8 > baw_db_name_user.property.9
# %s/<DB_SERVER_NAME>\.BAW_/BPMDB\.BAW_/g
sed -r "s|<DB_SERVER_NAME>.BAW_|BPMDB.BAW_|g" baw_db_name_user.property.8 > baw_db_name_user.property.9
# %s/DB_NAME=\"BAWDB\"/DB_NAME=\"BPMDB\"/g
sed -r "s|DB_NAME="BAWDB"|DB_NAME="BPMDB"|g" baw_db_name_user.property.9 > baw_db_name_user.property.10
# %s/<DB_SERVER_NAME>\.UMS_/UMSDB\.UMS_/g
sed -r "s|<DB_SERVER_NAME>.UMS_|UMSDB.UMS_|g" baw_db_name_user.property.10 > baw_db_name_user.property.11
sed -r "s/USER_NAME=\"<youruser1>\"/USER_NAME=\"db2inst1\"/g" baw_db_name_user.property.11 > baw_db_name_user.property.12
sed -r "s/USER_PASSWORD=\"<yourpassword>\"/USER_PASSWORD=\"cicdtest\"/g" baw_db_name_user.property.12 > baw_db_name_user.property.13
rm -f baw_db_name_user.property
cp baw_db_name_user.property.11 baw_db_name_user.property

# baw_db_server.property
cp -p baw_db_server.property baw_db_server.property.orig
# %s/SERVERNAME=\"<Required>\"/SERVERNAME=\"c-db2ucluster-cp4ba-db2u.cp4ba.svc.cluster.local\"/g
sed -r "s/SERVERNAME=\"<Required>\"/SERVERNAME=\"c-db2ucluster-cp4ba-db2u.cp4ba.svc.cluster.local\"/g" baw_db_server.property > baw_db_server.property.1
# %s/PORT=\"<Required>\"/PORT=\"50000\"/g
sed -r "s/PORT=\"<Required>\"/PORT=\"50000\"/g" baw_db_server.property.1 > baw_db_server.property.2
# %s/SSL_ENABLE=\"True\"/SSL_ENABLE=\"false\"/g
sed -r "s/SSL_ENABLE=\"True\"/SSL_ENABLE=\"false\"/g" baw_db_server.property.2 > baw_db_server.property.3
# %s/SERVERNAME=\"<Optional>\"/SERVERNAME=\"\"/g
sed -r "s/SERVERNAME=\"<Optional>\"/SERVERNAME=\"\"/g" baw_db_server.property.3 > baw_db_server.property.4
# %s/PORT=\"<Optional>\"/PORT=\"\"/g
sed -r "s/PORT=\"<Optional>\"/PORT=\"\"/g" baw_db_server.property.4 > baw_db_server.property.5
rm -f baw_db_server.property
cp baw_db_server.property.5 baw_db_server.property

# Edit the baw_LDAP.property
cp -p baw_LDAP.property baw_LDAP.property.orig
sed -r 's|LDAP_SERVER="<Required>"|LDAP_SERVER="openldap.cp4ba.svc.cluster.local"|g' baw_LDAP.property > baw_LDAP.property.1
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
rm -f baw_LDAP.property
cp baw_LDAP.property.15 baw_LDAP.property