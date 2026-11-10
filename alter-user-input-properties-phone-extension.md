# Phone extension Schema

```txt
http://schema.nethserver.org/openldap/alter-user-input.json#/properties/phone_extension
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [alter-user-input.json\*](openldap/alter-user-input.json "open original schema") |

## phone_extension Type

`string` ([Phone extension](alter-user-input-properties-phone-extension.md))

## phone_extension Constraints

**maximum length**: the maximum number of characters for this string is: `64`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[A-Za-z0-9 '()+,.=/:?-]*$
```

[try pattern](https://regexr.com/?expression=%5E%5BA-Za-z0-9%20'\(\)%2B%2C.%3D%2F%3A%3F-%5D*%24 "try regular expression with regexr.com")
