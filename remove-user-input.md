# remove-user input Schema

```txt
http://schema.nethserver.org/openldap/remove-user-input.json
```

Remove an existing user

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [remove-user-input.json](openldap/remove-user-input.json "open original schema") |

## remove-user input Type

`object` ([remove-user input](remove-user-input.md))

## remove-user input Examples

```json
{
  "user": "alice"
}
```

# remove-user input Properties

| Property      | Type     | Required | Nullable       | Defined by                                                                                                                                           |
| :------------ | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| [user](#user) | `string` | Required | cannot be null | [remove-user input](remove-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/remove-user-input.json#/properties/user") |

## user



`user`

*   is required

*   Type: `string` ([User identifier](remove-user-input-properties-user-identifier.md))

*   cannot be null

*   defined in: [remove-user input](remove-user-input-properties-user-identifier.md "http://schema.nethserver.org/openldap/remove-user-input.json#/properties/user")

### user Type

`string` ([User identifier](remove-user-input-properties-user-identifier.md))

### user Constraints

**minimum length**: the minimum number of characters for this string is: `1`

# remove-user input Definitions
