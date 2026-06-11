# remove-server input Schema

```txt
http://schema.nethserver.org/openldap/remove-server-input.json
```

Remove stale olcSyncrepl and olcServerID entries from the local slapd configuration. Called when one or more OpenLDAP providers are removed. All servers are removed in a single LDAP transaction to avoid syncrepl race conditions.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                           |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :----------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [remove-server-input.json](openldap/remove-server-input.json "open original schema") |

## remove-server input Type

`object` ([remove-server input](remove-server-input.md))

## remove-server input Examples

```json
{
  "servers": [
    {
      "host": "10.5.4.2",
      "port": 20004
    },
    {
      "host": "10.5.4.2",
      "port": 20007
    }
  ]
}
```

# remove-server input Properties

| Property            | Type    | Required | Nullable       | Defined by                                                                                                                                                                   |
| :------------------ | :------ | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [servers](#servers) | `array` | Required | cannot be null | [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers") |

## servers



`servers`

* is required

* Type: `object[]` ([Details](remove-server-input-properties-list-of-ldap-servers-to-remove-items.md))

* cannot be null

* defined in: [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers")

### servers Type

`object[]` ([Details](remove-server-input-properties-list-of-ldap-servers-to-remove-items.md))

### servers Constraints

**minimum number of items**: the minimum number of items for this array is: `1`
