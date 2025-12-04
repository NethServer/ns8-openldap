# User identifier Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/user
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [validate-input.json\*](import-users/validate-input.json "open original schema") |

## user Type

`string` ([User identifier](validate-input-1-defs-record-properties-user-identifier.md))

## user Constraints

**maximum length**: the maximum number of characters for this string is: `255`

**minimum length**: the minimum number of characters for this string is: `1`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z][-._a-zA-Z0-9]*$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z%5D%5B-._a-zA-Z0-9%5D*%24 "try regular expression with regexr.com")
