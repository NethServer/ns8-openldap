# Untitled object in remove-server input Schema

```txt
http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                             |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [remove-server-input.json\*](openldap/remove-server-input.json "open original schema") |

## items Type

`object` ([Details](remove-server-input-properties-list-of-ldap-servers-to-remove-items.md))

# items Properties

| Property      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                    |
| :------------ | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [host](#host) | `string`  | Required | cannot be null | [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-ipv4-address-of-the-ldap-server-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/host") |
| [port](#port) | `integer` | Required | cannot be null | [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-tcp-port-of-the-ldap-server-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/port")     |

## host



`host`

* is required

* Type: `string` ([IPv4 address of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-ipv4-address-of-the-ldap-server-to-remove.md))

* cannot be null

* defined in: [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-ipv4-address-of-the-ldap-server-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/host")

### host Type

`string` ([IPv4 address of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-ipv4-address-of-the-ldap-server-to-remove.md))

### host Constraints

**IPv4**: the string must be an IPv4 address (dotted quad), according to [RFC 2673, section 3.2](https://tools.ietf.org/html/rfc2673 "check the specification")

## port



`port`

* is required

* Type: `integer` ([TCP port of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-tcp-port-of-the-ldap-server-to-remove.md))

* cannot be null

* defined in: [remove-server input](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-tcp-port-of-the-ldap-server-to-remove.md "http://schema.nethserver.org/openldap/remove-server-input.json#/properties/servers/items/properties/port")

### port Type

`integer` ([TCP port of the LDAP server to remove](remove-server-input-properties-list-of-ldap-servers-to-remove-items-properties-tcp-port-of-the-ldap-server-to-remove.md))

### port Constraints

**minimum**: the value of this number must greater than or equal to: `20000`
