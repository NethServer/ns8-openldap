# login input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                              |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-input.json](login/validate-input.json "open original schema") |

## login input Type

`object` ([login input](validate-input-1.md))

# login input Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                             |
| :-------------------- | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [username](#username) | `string` | Required | cannot be null | [login input](validate-input-1-properties-username.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/username") |
| [password](#password) | `string` | Required | cannot be null | [login input](validate-input-1-properties-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/password") |

## username



`username`

* is required

* Type: `string`

* cannot be null

* defined in: [login input](validate-input-1-properties-username.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/username")

### username Type

`string`

## password



`password`

* is required

* Type: `string`

* cannot be null

* defined in: [login input](validate-input-1-properties-password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/login/validate-input.json#/properties/password")

### password Type

`string`
