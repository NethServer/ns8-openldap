# get-password-expiration output Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                  |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-output.json](get-password-expiration/validate-output.json "open original schema") |

## get-password-expiration output Type

`object` ([get-password-expiration output](validate-output-3.md))

# get-password-expiration output Properties

| Property                     | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                          |
| :--------------------------- | :------------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [status](#status)            | Not specified | Required | cannot be null | [get-password-expiration output](validate-output-3-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/status")           |
| [message](#message)          | `string`      | Required | cannot be null | [get-password-expiration output](validate-output-3-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/message")         |
| [expired](#expired)          | `boolean`     | Required | cannot be null | [get-password-expiration output](validate-output-3-properties-expired.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/expired")         |
| [expiration](#expiration)    | `string`      | Required | can be null    | [get-password-expiration output](validate-output-3-properties-expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/expiration")   |
| [must\_change](#must_change) | `boolean`     | Required | cannot be null | [get-password-expiration output](validate-output-3-properties-must_change.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/must_change") |

## status



`status`

* is required

* Type: unknown

* cannot be null

* defined in: [get-password-expiration output](validate-output-3-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/status")

### status Type

unknown

### status Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value       | Explanation |
| :---------- | :---------- |
| `"success"` |             |
| `"failure"` |             |

## message



`message`

* is required

* Type: `string`

* cannot be null

* defined in: [get-password-expiration output](validate-output-3-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/message")

### message Type

`string`

## expired



`expired`

* is required

* Type: `boolean`

* cannot be null

* defined in: [get-password-expiration output](validate-output-3-properties-expired.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/expired")

### expired Type

`boolean`

## expiration



`expiration`

* is required

* Type: `string`

* can be null

* defined in: [get-password-expiration output](validate-output-3-properties-expiration.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/expiration")

### expiration Type

`string`

### expiration Constraints

**date time**: the string must be a date time string, according to [RFC 3339, section 5.6](https://tools.ietf.org/html/rfc3339 "check the specification")

## must\_change



`must_change`

* is required

* Type: `boolean`

* cannot be null

* defined in: [get-password-expiration output](validate-output-3-properties-must_change.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/must_change")

### must\_change Type

`boolean`
