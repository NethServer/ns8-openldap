# change-password input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :-------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-input.json](change-password/validate-input.json "open original schema") |

## change-password input Type

`object` ([change-password input](validate-input.md))

# change-password input Properties

| Property                               | Type     | Required | Nullable       | Defined by                                                                                                                                                                                               |
| :------------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [current\_password](#current_password) | `string` | Required | cannot be null | [change-password input](validate-input-properties-current_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json#/properties/current_password") |
| [new\_password](#new_password)         | `string` | Required | cannot be null | [change-password input](validate-input-properties-new_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json#/properties/new_password")         |

## current\_password



`current_password`

* is required

* Type: `string`

* cannot be null

* defined in: [change-password input](validate-input-properties-current_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json#/properties/current_password")

### current\_password Type

`string`

## new\_password



`new_password`

* is required

* Type: `string`

* cannot be null

* defined in: [change-password input](validate-input-properties-new_password.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-input.json#/properties/new_password")

### new\_password Type

`string`
