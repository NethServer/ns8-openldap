# get-password-policy output Schema

```txt
http://schema.nethserver.org/openldap/get-password-policy-output.json
```

Get the domain password policy

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [get-password-policy-output.json](openldap/get-password-policy-output.json "open original schema") |

## get-password-policy output Type

`object` ([get-password-policy output](get-password-policy-output.md))

## get-password-policy output Examples

```json
{
  "expiration": {
    "enforced": false,
    "max_age": 0,
    "min_age": 0
  },
  "strength": {
    "enforced": true,
    "history_length": 24,
    "password_min_length": 5,
    "complexity_check": true
  }
}
```

# get-password-policy output Properties

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                       |
| :------------------------ | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [expiration](#expiration) | `object` | Required | cannot be null | [get-password-policy output](get-password-policy-output-properties-expiration.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration") |
| [strength](#strength)     | `object` | Required | cannot be null | [get-password-policy output](get-password-policy-output-properties-strength.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/strength")     |

## expiration



`expiration`

* is required

* Type: `object` ([Details](get-password-policy-output-properties-expiration.md))

* cannot be null

* defined in: [get-password-policy output](get-password-policy-output-properties-expiration.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration")

### expiration Type

`object` ([Details](get-password-policy-output-properties-expiration.md))

## strength



`strength`

* is required

* Type: `object` ([Details](get-password-policy-output-properties-strength.md))

* cannot be null

* defined in: [get-password-policy output](get-password-policy-output-properties-strength.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/strength")

### strength Type

`object` ([Details](get-password-policy-output-properties-strength.md))

# get-password-policy output Definitions
