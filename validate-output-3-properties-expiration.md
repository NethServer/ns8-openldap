# Untitled undefined type in get-password-expiration output Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-expiration/validate-output.json#/properties/expiration
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                    |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :-------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [validate-output.json\*](get-password-expiration/validate-output.json "open original schema") |

## expiration Type

`string`

## expiration Constraints

**date time**: the string must be a date time string, according to [RFC 3339, section 5.6](https://tools.ietf.org/html/rfc3339 "check the specification")
