# Untitled object in set-password-policy input Schema

```txt
http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [set-password-policy-input.json\*](openldap/set-password-policy-input.json "open original schema") |

## strength Type

`object` ([Details](set-password-policy-input-properties-strength.md))

# strength Properties

| Property                                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                              |
| :-------------------------------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [enforced](#enforced)                         | `boolean` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-strength-properties-enforced.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/enforced")                       |
| [history\_length](#history_length)            | `integer` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-strength-properties-history_length.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/history_length")           |
| [password\_min\_length](#password_min_length) | `integer` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-strength-properties-password_min_length.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/password_min_length") |
| [complexity\_check](#complexity_check)        | `boolean` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-strength-properties-complexity_check.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/complexity_check")       |

## enforced



`enforced`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-strength-properties-enforced.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/enforced")

### enforced Type

`boolean`

## history\_length



`history_length`

*   is required

*   Type: `integer`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-strength-properties-history_length.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/history_length")

### history\_length Type

`integer`

## password\_min\_length



`password_min_length`

*   is required

*   Type: `integer`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-strength-properties-password_min_length.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/password_min_length")

### password\_min\_length Type

`integer`

## complexity\_check



`complexity_check`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-strength-properties-complexity_check.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/strength/properties/complexity_check")

### complexity\_check Type

`boolean`
