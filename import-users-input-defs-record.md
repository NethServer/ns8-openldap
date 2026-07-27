# Untitled object in import-users input Schema

```txt
http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [import-users-input.json\*](openldap/import-users-input.json "open original schema") |

## record Type

`object` ([Details](import-users-input-defs-record.md))

# record Properties

| Property                                            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :-------------------------------------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user)                                       | `string`  | Required | cannot be null | [import-users input](import-users-input-defs-record-properties-user.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/user")                                     |
| [display\_name](#display_name)                      | `string`  | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-display_name.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/display_name")                     |
| [password](#password)                               | `string`  | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-password.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/password")                             |
| [locked](#locked)                                   | `boolean` | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-locked.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/locked")                                 |
| [groups](#groups)                                   | `array`   | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-groups.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/groups")                                 |
| [mail](#mail)                                       | Merged    | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-mail.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/mail")                                     |
| [must\_change\_password](#must_change_password)     | `boolean` | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-must_change_password.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/must_change_password")     |
| [no\_password\_expiration](#no_password_expiration) | `boolean` | Optional | cannot be null | [import-users input](import-users-input-defs-record-properties-no_password_expiration.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/no_password_expiration") |

## user



`user`

* is required

* Type: `string`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-user.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/user")

### user Type

`string`

### user Constraints

**maximum length**: the maximum number of characters for this string is: `255`

**minimum length**: the minimum number of characters for this string is: `1`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z][-._a-zA-Z0-9]*$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z%5D%5B-._a-zA-Z0-9%5D*%24 "try regular expression with regexr.com")

## display\_name

Display name, if missing User identifier is applied with Title Case

`display_name`

* is optional

* Type: `string`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-display_name.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/display_name")

### display\_name Type

`string`

### display\_name Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## password

If missing, a random password is set for a new user

`password`

* is optional

* Type: `string`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-password.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/password")

### password Type

`string`

### password Constraints

**maximum length**: the maximum number of characters for this string is: `256`

## locked

If true, the account is locked, preventing logins

`locked`

* is optional

* Type: `boolean` ([Locked](import-users-input-defs-record-properties-locked.md))

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-locked.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/locked")

### locked Type

`boolean` ([Locked](import-users-input-defs-record-properties-locked.md))

### locked Default Value

The default value is:

```json
false
```

## groups

List of initial groups. Non existing groups are created on the fly.

`groups`

* is optional

* Type: `string[]`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-groups.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/groups")

### groups Type

`string[]`

### groups Constraints

**minimum number of items**: the minimum number of items for this array is: `0`

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## mail



`mail`

* is optional

* Type: `string` ([Details](import-users-input-defs-record-properties-mail.md))

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-mail.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/mail")

### mail Type

`string` ([Details](import-users-input-defs-record-properties-mail.md))

one (and only one) of

* all of

  * [Untitled undefined type in import-users input](import-users-input-defs-record-properties-mail-oneof-0-allof-0.md "check type definition")

  * [Untitled undefined type in import-users input](import-users-input-defs-record-properties-mail-oneof-0-allof-1.md "check type definition")

* [Untitled string in import-users input](import-users-input-defs-record-properties-mail-oneof-1.md "check type definition")

## must\_change\_password

If true, the user must change their password at next login

`must_change_password`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-must_change_password.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/must_change_password")

### must\_change\_password Type

`boolean`

### must\_change\_password Default Value

The default value is:

```json
false
```

## no\_password\_expiration

If true, the user's password will not expire

`no_password_expiration`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [import-users input](import-users-input-defs-record-properties-no_password_expiration.md "http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/no_password_expiration")

### no\_password\_expiration Type

`boolean`

### no\_password\_expiration Default Value

The default value is:

```json
false
```
