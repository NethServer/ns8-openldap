# README

## Top-level Schemas

* [add-group input](./add-group-input.md "Add a group of users to the LDAP database") – `http://schema.nethserver.org/openldap/add-group-input.json`

* [add-user input](./add-user-input.md "Add a user to the LDAP database") – `http://schema.nethserver.org/openldap/add-user-input.json`

* [alter-group input](./alter-group-input.md "Alter an existing group of users") – `http://schema.nethserver.org/openldap/alter-group-input.json`

* [alter-user input](./alter-user-input.md "Alter an existing user") – `http://schema.nethserver.org/openldap/alter-user-input.json`

* [change-password input](./validate-input.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json`

* [change-password output](./validate-output.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json`

* [configure-module input](./configure-module-input.md "Provision a new OpenLDAP instance") – `http://schema.nethserver.org/openldap/configure-module-input.json`

* [export-users output](./export-users-output.md "Export users and groups definitions from OpenLDAP") – `http://schema.nethserver.org/openldap/export-users-output.json`

* [export-users output](./validate-output-1.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json`

* [get password policy](./validate-output-2.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json`

* [get-defaults input](./get-defaults-input.md "Compute the values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-input.json`

* [get-defaults output](./get-defaults-output.md "Return values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-output.json`

* [get-password-policy output](./get-password-policy-output.md "Get the domain password policy") – `http://schema.nethserver.org/openldap/get-password-policy-output.json`

* [import-users input](./import-users-input.md "Import users and groups definitions in OpenLDAP, with optional attribute merge behavior") – `http://schema.nethserver.org/openldap/import-users-input.json`

* [import-users input](./validate-input-1.md "Import users and groups definitions in OpenLDAP, with optional attribute merge behavior") – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json`

* [import-users output](./validate-output-3.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-output.json`

* [login input](./validate-input-2.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json`

* [remove-group input](./remove-group-input.md "Remove an existing group of users") – `http://schema.nethserver.org/openldap/remove-group-input.json`

* [remove-user input](./remove-user-input.md "Remove an existing user") – `http://schema.nethserver.org/openldap/remove-user-input.json`

* [set-password-policy input](./set-password-policy-input.md "Set the domain password policy") – `http://schema.nethserver.org/openldap/set-password-policy-input.json`

## Other Schemas

### Objects

* [Untitled object in export-users output](./export-users-output-properties-records-items.md) – `http://schema.nethserver.org/openldap/export-users-output.json#/properties/records/items`

* [Untitled object in export-users output](./validate-output-1-defs-record.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record`

* [Untitled object in get-password-policy output](./get-password-policy-output-properties-expiration.md) – `http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration`

* [Untitled object in get-password-policy output](./get-password-policy-output-properties-strength.md) – `http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/strength`

* [Untitled object in import-users input](./import-users-input-defs-record.md) – `http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record`

* [Untitled object in import-users input](./validate-input-1-defs-record.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record`

* [Untitled object in set-password-policy input](./set-password-policy-input-properties-expiration.md) – `http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration`

* [Untitled object in set-password-policy input](./set-password-policy-input-properties-strength.md) – `http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength`

### Arrays

* [Group members](./add-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/add-group-input.json#/properties/users`

* [Group members](./alter-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/alter-group-input.json#/properties/users`

* [Group membership](./alter-user-input-properties-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups`

* [Initial group membership](./add-user-input-properties-initial-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/add-user-input.json#/properties/groups`

* [Initial group membership](./import-users-input-defs-record-properties-initial-group-membership.md "List of initial groups") – `http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/groups`

* [Initial group membership](./validate-input-1-defs-record-properties-initial-group-membership.md "List of initial groups") – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/groups`

* [Untitled array in export-users output](./export-users-output-properties-records.md) – `http://schema.nethserver.org/openldap/export-users-output.json#/properties/records`

* [Untitled array in export-users output](./export-users-output-properties-records-items-properties-groups.md "List of groups") – `http://schema.nethserver.org/openldap/export-users-output.json#/properties/records/items/properties/groups`

* [Untitled array in export-users output](./validate-output-1-properties-records.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/properties/records`

* [Untitled array in export-users output](./validate-output-1-defs-record-properties-groups.md "List of groups") – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/groups`

* [Untitled array in import-users input](./import-users-input-properties-records.md) – `http://schema.nethserver.org/openldap/import-users-input.json#/properties/records`

* [Untitled array in import-users input](./validate-input-1-properties-records.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/properties/records`

## Version Note

The schemas linked above follow the JSON Schema Spec version: `http://json-schema.org/draft-07/schema#`
