# Untitled array in import-users input Schema

```txt
http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/groups
```

List of initial groups. Non existing groups are created on the fly.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [import-users-input.json\*](openldap/import-users-input.json "open original schema") |

## groups Type

`string[]`

## groups Constraints

**minimum number of items**: the minimum number of items for this array is: `0`

**unique items**: all items in this array must be unique. Duplicates are not allowed.
