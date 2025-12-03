# import-users input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json
```

Import users and groups definitions in OpenLDAP, with optional attribute merge behavior.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                     |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-input.json](import-users/validate-input.json "open original schema") |

## import-users input Type

`object` ([import-users input](validate-input-1.md))

## import-users input Examples

```json
[
  {
    "skip_existing": true,
    "records": [
      {
        "user": "alice",
        "display_name": "Alice Jordan",
        "password": "secret",
        "locked": false,
        "groups": [
          "developers"
        ],
        "mail": "alice@nethserver.org",
        "must_change_password": false,
        "no_password_expiration": false
      },
      {
        "user": "bob",
        "display_name": "Robert Smith",
        "password": "secret",
        "locked": false,
        "groups": [
          "support"
        ],
        "mail": "robert@nethserver.org",
        "must_change_password": false,
        "no_password_expiration": false
      }
    ]
  }
]
```

# import-users input Properties

| Property                         | Type      | Required | Nullable       | Defined by                                                                                                                                                                                     |
| :------------------------------- | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [skip\_existing](#skip_existing) | `boolean` | Optional | cannot be null | [import-users input](validate-input-1-properties-skip_existing.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/properties/skip_existing") |
| [records](#records)              | `array`   | Required | cannot be null | [import-users input](validate-input-1-properties-records.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/properties/records")             |

## skip\_existing



`skip_existing`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [import-users input](validate-input-1-properties-skip_existing.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/properties/skip_existing")

### skip\_existing Type

`boolean`

### skip\_existing Default Value

The default value is:

```json
false
```

## records



`records`

* is required

* Type: `object[]` ([Details](validate-input-1-defs-record.md))

* cannot be null

* defined in: [import-users input](validate-input-1-properties-records.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/properties/records")

### records Type

`object[]` ([Details](validate-input-1-defs-record.md))

# import-users input Definitions

## Definitions group record

Reference this group by using

```json
{"$ref":"http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record"}
```

| Property                                            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                  |
| :-------------------------------------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user)                                       | `string`  | Required | cannot be null | [import-users input](validate-input-1-defs-record-properties-user-identifier.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/user")                                                            |
| [display\_name](#display_name)                      | `string`  | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-display-name-if-missing-user-identifier-is-applied-with-title-case.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/display_name") |
| [password](#password)                               | `string`  | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-initial-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/password")                                                       |
| [locked](#locked)                                   | `boolean` | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-locked.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/locked")                                                                   |
| [groups](#groups)                                   | `array`   | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-initial-group-membership.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/groups")                                                 |
| [mail](#mail)                                       | Merged    | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-email-address.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/mail")                                                              |
| [must\_change\_password](#must_change_password)     | `boolean` | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-must-change-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/must_change_password")                                       |
| [no\_password\_expiration](#no_password_expiration) | `boolean` | Optional | cannot be null | [import-users input](validate-input-1-defs-record-properties-no-password-expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/no_password_expiration")                                   |

### user



`user`

* is required

* Type: `string` ([User identifier](validate-input-1-defs-record-properties-user-identifier.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-user-identifier.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/user")

#### user Type

`string` ([User identifier](validate-input-1-defs-record-properties-user-identifier.md))

#### user Constraints

**maximum length**: the maximum number of characters for this string is: `255`

**minimum length**: the minimum number of characters for this string is: `1`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z][-._a-zA-Z0-9]*$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z%5D%5B-._a-zA-Z0-9%5D*%24 "try regular expression with regexr.com")

### display\_name



`display_name`

* is optional

* Type: `string` ([Display name, if missing User identifier is applied with Title Case](validate-input-1-defs-record-properties-display-name-if-missing-user-identifier-is-applied-with-title-case.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-display-name-if-missing-user-identifier-is-applied-with-title-case.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/display_name")

#### display\_name Type

`string` ([Display name, if missing User identifier is applied with Title Case](validate-input-1-defs-record-properties-display-name-if-missing-user-identifier-is-applied-with-title-case.md))

#### display\_name Constraints

**maximum length**: the maximum number of characters for this string is: `256`

### password

If missing, a random password is set

`password`

* is optional

* Type: `string` ([Initial password](validate-input-1-defs-record-properties-initial-password.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-initial-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/password")

#### password Type

`string` ([Initial password](validate-input-1-defs-record-properties-initial-password.md))

#### password Constraints

**maximum length**: the maximum number of characters for this string is: `256`

### locked

If true, the account is locked, preventing logins

`locked`

* is optional

* Type: `boolean` ([Locked](validate-input-1-defs-record-properties-locked.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-locked.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/locked")

#### locked Type

`boolean` ([Locked](validate-input-1-defs-record-properties-locked.md))

#### locked Default Value

The default value is:

```json
false
```

### groups

List of initial groups. Non existing groups are created on the fly.

`groups`

* is optional

* Type: `string[]`

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-initial-group-membership.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/groups")

#### groups Type

`string[]`

#### groups Constraints

**minimum number of items**: the minimum number of items for this array is: `0`

**unique items**: all items in this array must be unique. Duplicates are not allowed.

### mail



`mail`

* is optional

* Type: `string` ([Email address](validate-input-1-defs-record-properties-email-address.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-email-address.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/mail")

#### mail Type

`string` ([Email address](validate-input-1-defs-record-properties-email-address.md))

one (and only one) of

* [Untitled string in import-users input](validate-input-1-defs-record-properties-email-address-oneof-0.md "check type definition")

* [Untitled string in import-users input](validate-input-1-defs-record-properties-email-address-oneof-1.md "check type definition")

### must\_change\_password

If true, the user must change their password at next login

`must_change_password`

* is optional

* Type: `boolean` ([Must change password](validate-input-1-defs-record-properties-must-change-password.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-must-change-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/must_change_password")

#### must\_change\_password Type

`boolean` ([Must change password](validate-input-1-defs-record-properties-must-change-password.md))

### no\_password\_expiration

If true, the user's password will not expire

`no_password_expiration`

* is optional

* Type: `boolean` ([No password expiration](validate-input-1-defs-record-properties-no-password-expiration.md))

* cannot be null

* defined in: [import-users input](validate-input-1-defs-record-properties-no-password-expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/no_password_expiration")

#### no\_password\_expiration Type

`boolean` ([No password expiration](validate-input-1-defs-record-properties-no-password-expiration.md))
