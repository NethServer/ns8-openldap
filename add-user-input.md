# add-user input Schema

```txt
http://schema.nethserver.org/openldap/add-user-input.json
```

Add a user to the LDAP database

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                 |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [add-user-input.json](openldap/add-user-input.json "open original schema") |

## add-user input Type

`object` ([add-user input](add-user-input.md))

## add-user input Examples

```json
{
  "user": "alice",
  "display_name": "Alice Jordan",
  "password": "secret",
  "locked": false,
  "groups": [
    "developers"
  ],
  "mail": "alice@nethserver.org"
}
```

# add-user input Properties

| Property                       | Type      | Required | Nullable       | Defined by                                                                                                                                             |
| :----------------------------- | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user)                  | `string`  | Required | cannot be null | [add-user input](add-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/user")            |
| [display\_name](#display_name) | `string`  | Optional | cannot be null | [add-user input](add-user-input-properties-display-name.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/display_name")       |
| [password](#password)          | `string`  | Optional | cannot be null | [add-user input](add-user-input-properties-initial-password.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/password")       |
| [locked](#locked)              | `boolean` | Optional | cannot be null | [add-user input](add-user-input-properties-locked.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/locked")                   |
| [groups](#groups)              | `array`   | Optional | cannot be null | [add-user input](add-user-input-properties-initial-group-membership.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/groups") |
| [mail](#mail)                  | Merged    | Optional | cannot be null | [add-user input](add-user-input-properties-email-address.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/mail")              |

## user



`user`

* is required

* Type: `string` ([User identifier](add-user-input-properties-user-identifier.md))

* cannot be null

* defined in: [add-user input](add-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/user")

### user Type

`string` ([User identifier](add-user-input-properties-user-identifier.md))

### user Constraints

**maximum length**: the maximum number of characters for this string is: `255`

**minimum length**: the minimum number of characters for this string is: `1`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z][-._a-zA-Z0-9]*$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z%5D%5B-._a-zA-Z0-9%5D*%24 "try regular expression with regexr.com")

## display\_name



`display_name`

* is optional

* Type: `string` ([Display name](add-user-input-properties-display-name.md))

* cannot be null

* defined in: [add-user input](add-user-input-properties-display-name.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/display_name")

### display\_name Type

`string` ([Display name](add-user-input-properties-display-name.md))

### display\_name Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## password

If missing, a random password is set

`password`

* is optional

* Type: `string` ([Initial password](add-user-input-properties-initial-password.md))

* cannot be null

* defined in: [add-user input](add-user-input-properties-initial-password.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/password")

### password Type

`string` ([Initial password](add-user-input-properties-initial-password.md))

### password Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## locked

True, if the user account has been locked, preventing the user from logging in

`locked`

* is optional

* Type: `boolean` ([Locked](add-user-input-properties-locked.md))

* cannot be null

* defined in: [add-user input](add-user-input-properties-locked.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/locked")

### locked Type

`boolean` ([Locked](add-user-input-properties-locked.md))

## groups

Set the user as a member of the given list of groups

`groups`

* is optional

* Type: `string[]`

* cannot be null

* defined in: [add-user input](add-user-input-properties-initial-group-membership.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/groups")

### groups Type

`string[]`

### groups Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## mail



`mail`

* is optional

* Type: `string` ([Email address](add-user-input-properties-email-address.md))

* cannot be null

* defined in: [add-user input](add-user-input-properties-email-address.md "http://schema.nethserver.org/openldap/add-user-input.json#/properties/mail")

### mail Type

`string` ([Email address](add-user-input-properties-email-address.md))

one (and only one) of

* [Untitled string in add-user input](add-user-input-properties-email-address-oneof-0.md "check type definition")

* [Untitled string in add-user input](add-user-input-properties-email-address-oneof-1.md "check type definition")

# add-user input Definitions
