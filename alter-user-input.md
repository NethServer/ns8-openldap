# alter-user input Schema

```txt
http://schema.nethserver.org/openldap/alter-user-input.json
```

Alter an existing user. Only the user identifier attibute is mandatory

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                     |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [alter-user-input.json](openldap/alter-user-input.json "open original schema") |

## alter-user input Type

`object` ([alter-user input](alter-user-input.md))

## alter-user input Examples

```json
{
  "user": "alice",
  "display_name": "Alice Jordan",
  "password": "secret",
  "locked": false,
  "groups": [
    "developers",
    "managers"
  ],
  "mail": "alice@nethserver.org"
}
```

# alter-user input Properties

| Property                       | Type      | Required | Nullable       | Defined by                                                                                                                                           |
| :----------------------------- | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user)                  | `string`  | Required | cannot be null | [alter-user input](alter-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/user")    |
| [display\_name](#display_name) | `string`  | Optional | cannot be null | [alter-user input](alter-user-input-properties-full-name.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/display_name")  |
| [password](#password)          | `string`  | Optional | cannot be null | [alter-user input](alter-user-input-properties-new-password.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/password")   |
| [groups](#groups)              | `array`   | Optional | cannot be null | [alter-user input](alter-user-input-properties-group-membership.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups") |
| [locked](#locked)              | `boolean` | Optional | cannot be null | [alter-user input](alter-user-input-properties-locked.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/locked")           |
| [mail](#mail)                  | Merged    | Optional | cannot be null | [alter-user input](alter-user-input-properties-email-address.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/mail")      |

## user

The user must exist

`user`

* is required

* Type: `string` ([User identifier](alter-user-input-properties-user-identifier.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/user")

### user Type

`string` ([User identifier](alter-user-input-properties-user-identifier.md))

### user Constraints

**minimum length**: the minimum number of characters for this string is: `1`

## display\_name



`display_name`

* is optional

* Type: `string` ([Full name](alter-user-input-properties-full-name.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-full-name.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/display_name")

### display\_name Type

`string` ([Full name](alter-user-input-properties-full-name.md))

### display\_name Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## password

If empty, a random password is set

`password`

* is optional

* Type: `string` ([New password](alter-user-input-properties-new-password.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-new-password.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/password")

### password Type

`string` ([New password](alter-user-input-properties-new-password.md))

### password Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## groups

Set the user as a member of the given list of groups

`groups`

* is optional

* Type: `string[]` ([Group identifier](alter-user-input-properties-group-membership-group-identifier.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-group-membership.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups")

### groups Type

`string[]` ([Group identifier](alter-user-input-properties-group-membership-group-identifier.md))

## locked

True, if the user account has been locked, preventing the user from logging in

`locked`

* is optional

* Type: `boolean` ([Locked](alter-user-input-properties-locked.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-locked.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/locked")

### locked Type

`boolean` ([Locked](alter-user-input-properties-locked.md))

## mail



`mail`

* is optional

* Type: `string` ([Email address](alter-user-input-properties-email-address.md))

* cannot be null

* defined in: [alter-user input](alter-user-input-properties-email-address.md "http://schema.nethserver.org/openldap/alter-user-input.json#/properties/mail")

### mail Type

`string` ([Email address](alter-user-input-properties-email-address.md))

one (and only one) of

* [Untitled string in alter-user input](alter-user-input-properties-email-address-oneof-0.md "check type definition")

* [Untitled string in alter-user input](alter-user-input-properties-email-address-oneof-1.md "check type definition")

# alter-user input Definitions
