#! /bin/sh

OCC="/var/www/html/occ"

LDAP_USER_DN="CN=$LDAP_USER,CN=Users,$LDAP_BASE_DN"
LDAP_LOGIN_GROUP_DN="CN=$LDAP_LOGIN_GROUP,CN=Users,$LDAP_BASE_DN"

$OCC app:enable user_ldap
$OCC ldap:create-empty-config
$OCC ldap:set-config s01 hasMemberOfFilterSupport 1
$OCC ldap:set-config s01 ldapAgentName $LDAP_USER_DN
$OCC ldap:set-config s01 ldapAgentPassword $LDAP_PASSWORD
$OCC ldap:set-config s01 ldapBase $LDAP_BASE_DN
$OCC ldap:set-config s01 ldapConfigurationActive 1
$OCC ldap:set-config s01 ldapExperiencedAdmin 1
$OCC ldap:set-config s01 ldapHost $LDAP_HOST
# limita para pessoas do $LOGIN_GROUP 
$OCC ldap:set-config s01 ldapLoginFilter "(&(&(objectclass=person)(memberof=$LDAP_LOGIN_GROUP_DN))(uid=%uid))"
$OCC ldap:set-config s01 ldapPort 636
$OCC ldap:set-config s01 ldapUserFilter "(&(objectclass=person)(memberof=$LDAP_LOGIN_GROUP_DN))"
$OCC ldap:set-config s01 ldapUserFilterGroups $LDAP_LOGIN_GROUP
$OCC ldap:set-config s01 ldapUserFilterObjectclass person
