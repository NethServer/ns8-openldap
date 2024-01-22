# remove-group input Schema

```txt
http://schema.nethserver.org/openldap/remove-group-input.json
```

Remove an existing group of users

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [remove-group-input.json](openldap/remove-group-input.json "open original schema") |

## remove-group input Type

`object` ([remove-group input](remove-group-input.md))

## remove-group input Examples

```json
{
  "group": "developers"
}
```

# remove-group input Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                |
| :-------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [group](#group) | `string` | Required | cannot be null | [remove-group input](remove-group-input-properties-group-identifier.md "http://schema.nethserver.org/openldap/remove-group-input.json#/properties/group") |

## group



`group`

*   is required

*   Type: `string` ([Group identifier](remove-group-input-properties-group-identifier.md))

*   cannot be null

*   defined in: [remove-group input](remove-group-input-properties-group-identifier.md "http://schema.nethserver.org/openldap/remove-group-input.json#/properties/group")

### group Type

`string` ([Group identifier](remove-group-input-properties-group-identifier.md))

### group Constraints

**minimum length**: the minimum number of characters for this string is: `1`

# remove-group input Definitions
