# Untitled object in export-users output Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-output.json\*](export-users/validate-output.json "open original schema") |

## record Type

`object` ([Details](validate-output-1-defs-record.md))

# record Properties

| Property                                            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                   |
| :-------------------------------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user)                                       | `string`  | Required | cannot be null | [export-users output](validate-output-1-defs-record-properties-user.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/user")                                     |
| [display\_name](#display_name)                      | `string`  | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-display_name.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/display_name")                     |
| [locked](#locked)                                   | `boolean` | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-locked.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/locked")                                 |
| [groups](#groups)                                   | `array`   | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-groups.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/groups")                                 |
| [mail](#mail)                                       | `string`  | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-email-address.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/mail")                            |
| [must\_change\_password](#must_change_password)     | `boolean` | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-must_change_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/must_change_password")     |
| [no\_password\_expiration](#no_password_expiration) | `boolean` | Optional | cannot be null | [export-users output](validate-output-1-defs-record-properties-no_password_expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/no_password_expiration") |

## user



`user`

* is required

* Type: `string`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-user.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/user")

### user Type

`string`

## display\_name



`display_name`

* is optional

* Type: `string`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-display_name.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/display_name")

### display\_name Type

`string`

## locked

If true, the account is locked, preventing logins

`locked`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-locked.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/locked")

### locked Type

`boolean`

### locked Default Value

The default value is:

```json
false
```

## groups

List of groups

`groups`

* is optional

* Type: `string[]`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-groups.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/groups")

### groups Type

`string[]`

## mail



`mail`

* is optional

* Type: `string` ([Email address](validate-output-1-defs-record-properties-email-address.md))

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-email-address.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/mail")

### mail Type

`string` ([Email address](validate-output-1-defs-record-properties-email-address.md))

## must\_change\_password

If true, the user must change their password at next login

`must_change_password`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-must_change_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/must_change_password")

### must\_change\_password Type

`boolean`

## no\_password\_expiration

If true, the user's password will not expire

`no_password_expiration`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [export-users output](validate-output-1-defs-record-properties-no_password_expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/export-users/validate-output.json#/$defs/record/properties/no_password_expiration")

### no\_password\_expiration Type

`boolean`
