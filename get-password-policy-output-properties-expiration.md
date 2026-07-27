# Untitled object in get-password-policy output Schema

```txt
http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                                           |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [get-password-policy-output.json\*](openldap/get-password-policy-output.json "open original schema") |

## expiration Type

`object` ([Details](get-password-policy-output-properties-expiration.md))

# expiration Properties

| Property              | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                               |
| :-------------------- | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [enforced](#enforced) | `boolean` | Required | cannot be null | [get-password-policy output](get-password-policy-output-properties-expiration-properties-enforced.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/enforced") |
| [max\_age](#max_age)  | `integer` | Required | cannot be null | [get-password-policy output](get-password-policy-output-properties-expiration-properties-max_age.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/max_age")   |
| [min\_age](#min_age)  | `integer` | Required | cannot be null | [get-password-policy output](get-password-policy-output-properties-expiration-properties-min_age.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/min_age")   |

## enforced



`enforced`

* is required

* Type: `boolean`

* cannot be null

* defined in: [get-password-policy output](get-password-policy-output-properties-expiration-properties-enforced.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/enforced")

### enforced Type

`boolean`

## max\_age



`max_age`

* is required

* Type: `integer`

* cannot be null

* defined in: [get-password-policy output](get-password-policy-output-properties-expiration-properties-max_age.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/max_age")

### max\_age Type

`integer`

## min\_age



`min_age`

* is required

* Type: `integer`

* cannot be null

* defined in: [get-password-policy output](get-password-policy-output-properties-expiration-properties-min_age.md "http://schema.nethserver.org/openldap/get-password-policy-output.json#/properties/expiration/properties/min_age")

### min\_age Type

`integer`
