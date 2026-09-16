# Untitled string in login input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/auth_backend
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [validate-input.json\*](login/validate-input.json "open original schema") |

## auth\_backend Type

`string`

## auth\_backend Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value          | Explanation |
| :------------- | :---------- |
| `"ldap"`       |             |
| `"api-server"` |             |

## auth\_backend Default Value

The default value is:

```json
"ldap"
```
