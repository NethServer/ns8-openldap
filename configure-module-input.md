# configure-module input Schema

```txt
http://schema.nethserver.org/openldap/configure-module-input.json
```

Provision a new OpenLDAP instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                 |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [configure-module-input.json](openldap/configure-module-input.json "open original schema") |

## configure-module input Type

`object` ([configure-module input](configure-module-input.md))

## configure-module input Examples

```json
{
  "provision": "new-domain",
  "domain": "example.com",
  "admuser": "admin",
  "admpass": "secret"
}
```

# configure-module input Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                      |
| :---------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [provision](#provision) | `string` | Required | cannot be null | [configure-module input](configure-module-input-properties-provision.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/provision")              |
| [admuser](#admuser)     | `string` | Required | cannot be null | [configure-module input](configure-module-input-properties-administrative-user-name.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/admuser") |
| [admpass](#admpass)     | `string` | Required | cannot be null | [configure-module input](configure-module-input-properties-the-admin-password.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/admpass")       |
| [domain](#domain)       | `string` | Required | cannot be null | [configure-module input](configure-module-input-properties-domain-name.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/domain")               |

## provision



`provision`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [configure-module input](configure-module-input-properties-provision.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/provision")

### provision Type

`string`

### provision Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | :---------- |
| `"new-domain"`  |             |
| `"join-domain"` |             |

## admuser

This user is created as member of the builtin group `domain admins` and is granted domain join rights.

`admuser`

*   is required

*   Type: `string` ([Administrative user name](configure-module-input-properties-administrative-user-name.md))

*   cannot be null

*   defined in: [configure-module input](configure-module-input-properties-administrative-user-name.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/admuser")

### admuser Type

`string` ([Administrative user name](configure-module-input-properties-administrative-user-name.md))

### admuser Constraints

**minimum length**: the minimum number of characters for this string is: `1`

## admpass



`admpass`

*   is required

*   Type: `string` ([The admin password](configure-module-input-properties-the-admin-password.md))

*   cannot be null

*   defined in: [configure-module input](configure-module-input-properties-the-admin-password.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/admpass")

### admpass Type

`string` ([The admin password](configure-module-input-properties-the-admin-password.md))

### admpass Constraints

**minimum length**: the minimum number of characters for this string is: `1`

## domain



`domain`

*   is required

*   Type: `string` ([Domain name](configure-module-input-properties-domain-name.md))

*   cannot be null

*   defined in: [configure-module input](configure-module-input-properties-domain-name.md "http://schema.nethserver.org/openldap/configure-module-input.json#/properties/domain")

### domain Type

`string` ([Domain name](configure-module-input-properties-domain-name.md))

### domain Constraints

**maximum length**: the maximum number of characters for this string is: `140`

**minimum length**: the minimum number of characters for this string is: `1`

**pattern**: the string must match the following regular expression:&#x20;

```regexp
^[a-zA-Z][-a-zA-Z0-9]{0,62}(\.[a-zA-Z][-a-zA-Z0-9]{0,62})+$
```

[try pattern](https://regexr.com/?expression=%5E%5Ba-zA-Z%5D%5B-a-zA-Z0-9%5D%7B0%2C62%7D\(%5C.%5Ba-zA-Z%5D%5B-a-zA-Z0-9%5D%7B0%2C62%7D\)%2B%24 "try regular expression with regexr.com")
