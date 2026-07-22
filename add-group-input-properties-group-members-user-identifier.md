# User identifier Schema

```txt
http://schema.nethserver.org/openldap/add-group-input.json#/properties/users/items
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                     |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [add-group-input.json\*](openldap/add-group-input.json "open original schema") |

## items Type

`string` ([User identifier](add-group-input-properties-group-members-user-identifier.md))

## items Constraints

**minimum length**: the minimum number of characters for this string is: `1`

**unique items**: all items in this array must be unique. Duplicates are not allowed.
