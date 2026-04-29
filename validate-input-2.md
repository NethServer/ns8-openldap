# login input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                              |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-input.json](login/validate-input.json "open original schema") |

## login input Type

`object` ([login input](validate-input-2.md))

# login input Properties

| Property                       | Type     | Required | Nullable       | Defined by                                                                                                                                                                     |
| :----------------------------- | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [username](#username)          | `string` | Required | cannot be null | [login input](validate-input-2-properties-username.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/username")         |
| [password](#password)          | `string` | Required | cannot be null | [login input](validate-input-2-properties-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/password")         |
| [auth\_backend](#auth_backend) | `string` | Optional | cannot be null | [login input](validate-input-2-properties-auth_backend.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/auth_backend") |

## username



`username`

* is required

* Type: `string`

* cannot be null

* defined in: [login input](validate-input-2-properties-username.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/username")

### username Type

`string`

## password



`password`

* is required

* Type: `string`

* cannot be null

* defined in: [login input](validate-input-2-properties-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/password")

### password Type

`string`

## auth\_backend



`auth_backend`

* is optional

* Type: `string`

* cannot be null

* defined in: [login input](validate-input-2-properties-auth_backend.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/auth_backend")

### auth\_backend Type

`string`

### auth\_backend Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value          | Explanation |
| :------------- | :---------- |
| `"ldap"`       |             |
| `"api-server"` |             |

### auth\_backend Default Value

The default value is:

```json
"ldap"
```
