# Administrative user name Schema

```txt
http://schema.nethserver.org/openldap/configure-module-input.json#/properties/admuser
```

This user is created as member of the builtin group `domain admins` and is granted domain join rights.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                   |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [configure-module-input.json\*](openldap/configure-module-input.json "open original schema") |

## admuser Type

`string` ([Administrative user name](configure-module-input-properties-administrative-user-name.md))

## admuser Constraints

**minimum length**: the minimum number of characters for this string is: `1`
