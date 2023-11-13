# set-password-policy input Schema

```txt
http://schema.nethserver.org/openldap/set-password-policy-input.json
```

Set the domain password policy

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [set-password-policy-input.json](openldap/set-password-policy-input.json "open original schema") |

## set-password-policy input Type

`object` ([set-password-policy input](set-password-policy-input.md))

## set-password-policy input Examples

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

# set-password-policy input Properties

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                    |
| :------------------------ | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [expiration](#expiration) | `object` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-expiration.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration") |
| [strength](#strength)     | `object` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-strength.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength")     |

## expiration



`expiration`

*   is required

*   Type: `object` ([Details](set-password-policy-input-properties-expiration.md))

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-expiration.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration")

### expiration Type

`object` ([Details](set-password-policy-input-properties-expiration.md))

## strength



`strength`

*   is required

*   Type: `object` ([Details](set-password-policy-input-properties-strength.md))

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-strength.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength")

### strength Type

`object` ([Details](set-password-policy-input-properties-strength.md))

# set-password-policy input Definitions
