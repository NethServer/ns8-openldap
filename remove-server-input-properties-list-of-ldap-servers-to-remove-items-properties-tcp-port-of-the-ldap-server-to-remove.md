# TCP port of the LDAP server to remove Schema

```txt
http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/port
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                             |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [remove-server-input.json\*](openldap/remove-server-input.json "open original schema") |

## port Type

`integer` ([TCP port of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-tcp-port-of-the-ldap-server-to-remove.md))

## port Constraints

**minimum**: the value of this number must greater than or equal to: `20000`
