# IPv4 address of the LDAP server to remove Schema

```txt
http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/host
```



| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                             |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [remove-server-input.json\*](openldap/remove-server-input.json "open original schema") |

## host Type

`string` ([IPv4 address of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-ipv4-address-of-the-ldap-server-to-remove.md))

## host Constraints

**IPv4**: the string must be an IPv4 address (dotted quad), according to [RFC 2673, section 3.2](https://tools.ietf.org/html/rfc2673 "check the specification")
