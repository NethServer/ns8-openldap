# change-password output Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                          |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [validate-output.json](change-password/validate-output.json "open original schema") |

## change-password output Type

`object` ([change-password output](validate-output.md))

# change-password output Properties

| Property            | Type          | Required | Nullable       | Defined by                                                                                                                                                                                |
| :------------------ | :------------ | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [status](#status)   | Not specified | Required | cannot be null | [change-password output](validate-output-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json#/properties/status")   |
| [message](#message) | `string`      | Required | cannot be null | [change-password output](validate-output-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json#/properties/message") |

## status



`status`

*   is required

*   Type: unknown

*   cannot be null

*   defined in: [change-password output](validate-output-properties-status.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json#/properties/status")

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

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [change-password output](validate-output-properties-message.md "http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/change-password/validate-output.json#/properties/message")

### message Type

`string`
