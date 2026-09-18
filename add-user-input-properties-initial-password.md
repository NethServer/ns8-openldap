# Initial password Schema

```txt
http://schema.nethserver.org/openldap/add-user-input.json#/properties/password
```

If missing, a random password is set

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                   |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [add-user-input.json\*](openldap/add-user-input.json "open original schema") |

## password Type

`string` ([Initial password](add-user-input-properties-initial-password.md))

## password Constraints

**maximum length**: the maximum number of characters for this string is: `256`
