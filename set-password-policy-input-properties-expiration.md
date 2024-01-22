# Untitled object in set-password-policy input Schema

```txt
http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                         |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [set-password-policy-input.json\*](openldap/set-password-policy-input.json "open original schema") |

## expiration Type

`object` ([Details](set-password-policy-input-properties-expiration.md))

# expiration Properties

| Property              | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                            |
| :-------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [enforced](#enforced) | `boolean` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-expiration-properties-enforced.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/enforced") |
| [max\_age](#max_age)  | `integer` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-expiration-properties-max_age.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/max_age")   |
| [min\_age](#min_age)  | `integer` | Required | cannot be null | [set-password-policy input](set-password-policy-input-properties-expiration-properties-min_age.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/min_age")   |

## enforced



`enforced`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-expiration-properties-enforced.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/enforced")

### enforced Type

`boolean`

## max\_age



`max_age`

*   is required

*   Type: `integer`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-expiration-properties-max_age.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/max_age")

### max\_age Type

`integer`

## min\_age



`min_age`

*   is required

*   Type: `integer`

*   cannot be null

*   defined in: [set-password-policy input](set-password-policy-input-properties-expiration-properties-min_age.md "http://schema.nethserver.org/openldap/set-password-policy-input.json#/properties/expiration/properties/min_age")

### min\_age Type

`integer`
