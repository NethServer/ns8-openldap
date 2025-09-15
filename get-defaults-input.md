# get-defaults input Schema

```txt
http://schema.nethserver.org/openldap/get-defaults-input.json
```

Compute the values that suit the configure-module action input

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [get-defaults-input.json](openldap/get-defaults-input.json "open original schema") |

## get-defaults input Type

`object` ([get-defaults input](get-defaults-input.md))

# get-defaults input Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                             |
| :---------------------- | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------- |
| [provision](#provision) | `string` | Required | cannot be null | [get-defaults input](get-defaults-input-properties-provision.md "http://schema.nethserver.org/openldap/get-defaults-input.json#/properties/provision") |
| [domain](#domain)       | Merged   | Optional | cannot be null | [get-defaults input](get-defaults-input-properties-domain-name.md "http://schema.nethserver.org/openldap/get-defaults-input.json#/properties/domain")  |

## provision



`provision`

* is required

* Type: `string`

* cannot be null

* defined in: [get-defaults input](get-defaults-input-properties-provision.md "http://schema.nethserver.org/openldap/get-defaults-input.json#/properties/provision")

### provision Type

`string`

### provision Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | :---------- |
| `"new-domain"`  |             |
| `"join-domain"` |             |

## domain

Can be empty or a valid domain name

`domain`

* is optional

* Type: merged type ([Domain name](get-defaults-input-properties-domain-name.md))

* cannot be null

* defined in: [get-defaults input](get-defaults-input-properties-domain-name.md "http://schema.nethserver.org/openldap/get-defaults-input.json#/properties/domain")

### domain Type

merged type ([Domain name](get-defaults-input-properties-domain-name.md))

one (and only one) of

* [Untitled string in get-defaults input](get-defaults-input-properties-domain-name-oneof-0.md "check type definition")

* [Untitled string in get-defaults input](get-defaults-input-properties-domain-name-oneof-1.md "check type definition")

# get-defaults input Definitions
