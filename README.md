# README

## Top-level Schemas

*   [add-group input](./add-group-input.md "Add a group of users to the LDAP database") – `http://schema.nethserver.org/openldap/add-group-input.json`

*   [add-user input](./add-user-input.md "Add a user to the LDAP database") – `http://schema.nethserver.org/openldap/add-user-input.json`

*   [alter-group input](./alter-group-input.md "Alter an existing group of users") – `http://schema.nethserver.org/openldap/alter-group-input.json`

*   [alter-user input](./alter-user-input.md "Alter an existing user") – `http://schema.nethserver.org/openldap/alter-user-input.json`

*   [change-password input](./validate-input.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json`

*   [change-password output](./validate-output.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json`

*   [configure-module input](./configure-module-input.md "Provision a new OpenLDAP instance") – `http://schema.nethserver.org/openldap/configure-module-input.json`

*   [get-defaults input](./get-defaults-input.md "Compute the values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-input.json`

*   [get-defaults output](./get-defaults-output.md "Return values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-output.json`

*   [get-password-policy output](./get-password-policy-output.md "Get the domain password policy") – `http://schema.nethserver.org/openldap/get-password-policy-output.json`

*   [login input](./validate-input-1.md) – `http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json`

*   [remove-group input](./remove-group-input.md "Remove an existing group of users") – `http://schema.nethserver.org/openldap/remove-group-input.json`

*   [remove-user input](./remove-user-input.md "Remove an existing user") – `http://schema.nethserver.org/openldap/remove-user-input.json`

*   [set-password-policy input](./set-password-policy-input.md "Set the domain password policy") – `http://schema.nethserver.org/openldap/set-password-policy-input.json`

## Other Schemas

### Objects

*   [Untitled object in get-password-policy output](./get-password-policy-output-properties-expiration.md) – `http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration`

*   [Untitled object in get-password-policy output](./get-password-policy-output-properties-strength.md) – `http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/strength`

*   [Untitled object in set-password-policy input](./set-password-policy-input-properties-expiration.md) – `http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration`

*   [Untitled object in set-password-policy input](./set-password-policy-input-properties-strength.md) – `http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength`

### Arrays

*   [Group members](./add-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/add-group-input.json#/properties/users`

*   [Group members](./alter-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/alter-group-input.json#/properties/users`

*   [Group membership](./alter-user-input-properties-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups`

*   [Initial group membership](./add-user-input-properties-initial-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/add-user-input.json#/properties/groups`

## Version Note

The schemas linked above follow the JSON Schema Spec version: `http://json-schema.org/draft-07/schema#`
