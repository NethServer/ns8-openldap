# export-users output Schema

```txt
http://schema.nethserver.org/openldap/export-users-output.json
```

Export users and groups definitions from OpenLDAP

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [export-users-output.json](openldap/export-users-output.json "open original schema") |

## export-users output Type

`object` ([export-users output](export-users-output.md))

## export-users output Examples

```json
[
  {
    "records": [
      {
        "user": "alice",
        "display_name": "Alice Jordan",
        "locked": false,
        "groups": [
          "developers"
        ],
        "mail": "alice@nethserver.org",
        "must_change_password": false,
        "no_password_expiration": false
      },
      {
        "user": "bob",
        "display_name": "Robert Smith",
        "locked": false,
        "groups": [
          "support"
        ],
        "mail": "robert@nethserver.org",
        "must_change_password": false,
        "no_password_expiration": false
      }
    ]
  }
]
```

# export-users output Properties

| Property            | Type    | Required | Nullable       | Defined by                                                                                                                                            |
| :------------------ | :------ | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [records](#records) | `array` | Required | cannot be null | [export-users output](export-users-output-properties-records.md "http://schema.nethserver.org/openldap/export-users-output.json#/properties/records") |

## records



`records`

* is required

* Type: `object[]` ([Details](export-users-output-properties-records-items.md))

* cannot be null

* defined in: [export-users output](export-users-output-properties-records.md "http://schema.nethserver.org/openldap/export-users-output.json#/properties/records")

### records Type

`object[]` ([Details](export-users-output-properties-records-items.md))
