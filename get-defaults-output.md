# get-defaults output Schema

```txt
http://schema.nethserver.org/openldap/get-defaults-output.json
```

Return values that suit the configure-module action input

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [get-defaults-output.json](openldap/get-defaults-output.json "open original schema") |

## get-defaults output Type

`object` ([get-defaults output](get-defaults-output.md))

## get-defaults output Examples

```json
{
  "domain": "nethserver.test",
  "admuser": "administrator"
}
```

# get-defaults output Properties

| Property            | Type     | Required | Nullable       | Defined by                                                                                                                                            |
| :------------------ | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [admuser](#admuser) | `string` | Required | cannot be null | [get-defaults output](get-defaults-output-properties-admuser.md "http://schema.nethserver.org/openldap/get-defaults-output.json#/properties/admuser") |
| [domain](#domain)   | `string` | Required | cannot be null | [get-defaults output](get-defaults-output-properties-domain.md "http://schema.nethserver.org/openldap/get-defaults-output.json#/properties/domain")   |

## admuser



`admuser`

* is required

* Type: `string`

* cannot be null

* defined in: [get-defaults output](get-defaults-output-properties-admuser.md "http://schema.nethserver.org/openldap/get-defaults-output.json#/properties/admuser")

### admuser Type

`string`

## domain



`domain`

* is required

* Type: `string`

* cannot be null

* defined in: [get-defaults output](get-defaults-output-properties-domain.md "http://schema.nethserver.org/openldap/get-defaults-output.json#/properties/domain")

### domain Type

`string`
