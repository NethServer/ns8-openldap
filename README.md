# README

## Top-level Schemas

*   [add-group input](./add-group-input.md "Add a group of users to the LDAP database") – `http://schema.nethserver.org/openldap/add-group-input.json`

*   [add-user input](./add-user-input.md "Add a user to the LDAP database") – `http://schema.nethserver.org/openldap/add-user-input.json`

*   [alter-group input](./alter-group-input.md "Alter an existing group of users") – `http://schema.nethserver.org/openldap/alter-group-input.json`

*   [alter-user input](./alter-user-input.md "Alter an existing user") – `http://schema.nethserver.org/openldap/alter-user-input.json`

*   [configure-module input](./configure-module-input.md "Provision a new OpenLDAP instance") – `http://schema.nethserver.org/openldap/configure-module-input.json`

*   [get-defaults input](./get-defaults-input.md "Compute the values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-input.json`

*   [get-defaults output](./get-defaults-output.md "Return values that suit the configure-module action input") – `http://schema.nethserver.org/openldap/get-defaults-output.json`

*   [remove-group input](./remove-group-input.md "Remove an existing group of users") – `http://schema.nethserver.org/openldap/remove-group-input.json`

*   [remove-user input](./remove-user-input.md "Remove an existing user") – `http://schema.nethserver.org/openldap/remove-user-input.json`

## Other Schemas

### Objects



### Arrays

*   [Group members](./add-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/add-group-input.json#/properties/users`

*   [Group members](./alter-group-input-properties-group-members.md) – `http://schema.nethserver.org/openldap/alter-group-input.json#/properties/users`

*   [Group membership](./alter-user-input-properties-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups`

*   [Initial group membership](./add-user-input-properties-initial-group-membership.md "Set the user as a member of the given list of groups") – `http://schema.nethserver.org/openldap/add-user-input.json#/properties/groups`

## Version Note

The schemas linked above follow the JSON Schema Spec version: `http://json-schema.org/draft-07/schema#`
