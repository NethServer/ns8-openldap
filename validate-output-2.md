# get password policy Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                              |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :-------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-output.json](get-password-policy/validate-output.json "open original schema") |

## get password policy Type

`object` ([get password policy](validate-output-2.md))

# get password policy Properties

| Property            | Type          | Required | Nullable       | Defined by                                                                                                                                                                                   |
| :------------------ | :------------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [status](#status)   | Not specified | Required | cannot be null | [get password policy](validate-output-2-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json#/properties/status")   |
| [message](#message) | `string`      | Required | cannot be null | [get password policy](validate-output-2-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json#/properties/message") |

## status



`status`

* is required

* Type: unknown

* cannot be null

* defined in: [get password policy](validate-output-2-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json#/properties/status")

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

* defined in: [get password policy](validate-output-2-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/get-password-policy/validate-output.json#/properties/message")

### message Type

`string`
