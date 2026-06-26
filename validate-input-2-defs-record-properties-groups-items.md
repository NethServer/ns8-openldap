# Untitled string in import-users input Schema

```txt
http://schema.nethserver.org/ns8-openldap/api-moduled/handlers/import-users/validate-input.json#/$defs/record/properties/groups/items
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [validate-input.json\*](import-users/validate-input.json "open original schema") |

## items Type

`string`

## items Constraints

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z_][-._ a-zA-Z0-9]{0,255}$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z_%5D%5B-._%20a-zA-Z0-9%5D%7B0%2C255%7D%24 "try regular expression with regexr.com")
