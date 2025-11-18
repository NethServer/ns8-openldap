# New password Schema

```txt
http://schema.nethserver.org/openldap/alter-user-input.json#/properties/password
```

If empty, a random password is set

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [alter-user-input.json\*](openldap/alter-user-input.json "open original schema") |

## password Type

`string` ([New password](alter-user-input-properties-new-password.md))

## password Constraints

**maximum length**: the maximum number of characters for this string is: `256`
