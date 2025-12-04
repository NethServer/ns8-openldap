# Initial password Schema

```txt
http://schema.nethserver.org/openldap/import-users-input.json#/$defs/record/properties/password
```

If missing, a random password is set

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [import-users-input.json\*](openldap/import-users-input.json "open original schema") |

## password Type

`string` ([Initial password](import-users-input-defs-record-properties-initial-password.md))

## password Constraints

**maximum length**: the maximum number of characters for this string is: `256`
