# Group identifier Schema

```txt
http://schema.nethserver.org/openldap/alter-user-input.json#/properties/groups/items
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [alter-user-input.json\*](openldap/alter-user-input.json "open original schema") |

## items Type

`string` ([Group identifier](alter-user-input-properties-group-membership-group-identifier.md))

## items Constraints

**minimum length**: the minimum number of characters for this string is: `1`

**unique items**: all items in this array must be unique. Duplicates are not allowed.
