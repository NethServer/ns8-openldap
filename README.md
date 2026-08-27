# ns8-openldap

The `ns8-openldap` core module implements a multi-provider OpenLDAP
cluster. Both data and configuration are replicated among the cluster
nodes.  The user and group accounts are stored according to the RFC2307
schema.

## Domain admins

Members of the builtin group `domain admins` are granted a special
read-only access to the configuration database, that is necessary to
retrieve `olcRootPW` and configure (join) additional nodes.

They are also granted `manage` permissions on the full data set.

## Configure the module

The domain is usually managed through the cluster APIs. Consider the
following information as "low-level" implementation.

Create a new LDAP domain `dom.test`

    api-cli run module/openldap1/configure-module --data '{"provision":"new-domain","admuser":"admin","admpass":"secret","domain":"dom.test"}'

The *admuser* credentials are used to create an initial account in the
user database. The account is granted permission to join additional
servers to the domain.

Further OpenLDAP instances for the same `domain` must be joined in a
multi-provider cluster:

    api-cli run module/openldap2/configure-module --data '{"provision":"join-domain","admuser":"admin","admpass":"secret","domain":"dom.test"}'

The *admuser* credentials are now necessary to join the second node with the
first one.

## Rotate the ldapservice password

The `ldapservice` account is the LDAP bind user of an internal domain: every
module that consumes the domain binds with it. Its password is generated
once, when the domain is created, and can be rotated with the following
manual procedure. The password is stored in three places, that must be
kept in sync:

- the `userPassword` attribute of `cn=ldapservice,<base DN>`
- the `LDAP_SVCPASS` variable, in the `environment` file of every `openldap`
  module of the domain
- the `bind_password` field of the `module/<module id>/srv/tcp/ldap` Redis
  key. This is the key designed to publish the credentials: consumers must
  read them from here, and never from the `module/<module id>/environment`
  Redis copy.

Store the new password in the module environment first, so that the next
command can read it back from the `environment` file. Repeat this on every
node running a provider of the domain (`openldap2`, `openldap3`...), with
the same value:

    runagent -m openldap1 python3 -c 'import agent ; agent.set_env("LDAP_SVCPASS", "NEWPASS")'

Change the password in the LDAP database. Run this on one provider only:
replication propagates the change to the other providers of the domain.

    runagent -m openldap1 sh -c 'podman exec -i openldap ldappasswd -Q -s "${LDAP_SVCPASS}" "cn=${LDAP_SVCUSER},${LDAP_SUFFIX}"'

From this moment consumers bind with a stale password, until the service
discovery record is updated. Each provider advertises its own record, but
they are all stored in the same database: as root on the leader node,
update the record of every `openldap` module of the domain with `redis-cli`:

    redis-cli HSET module/openldap1/srv/tcp/ldap bind_password NEWPASS
    redis-cli HSET module/openldap2/srv/tcp/ldap bind_password NEWPASS

Finally propagate the change with the `user-domain-changed` event, so that
modules caching the credentials in their own configuration files refresh
them. One event is enough for the whole cluster:

    redis-cli PUBLISH module/openldap1/event/user-domain-changed '{"domain":"dom.test","domains":["dom.test"],"node_id":1}'

If an application does not handle the `user-domain-changed` event correctly,
it may be necessary to restart it, to pick up the new password.

The `openldap` container does not need a restart, and replication is not
affected, because syncrepl binds with different credentials.

To verify the rotation:

    runagent -m openldap1 sh -c 'podman exec -i openldap ldapwhoami -x -D "cn=${LDAP_SVCUSER},${LDAP_SUFFIX}" -w "$LDAP_SVCPASS" -H ldap://127.0.0.1:${LDAP_PORT}'
    redis-cli HGETALL module/openldap1/srv/tcp/ldap

## Debug and Log

The module sends slapd log messages to the syslog. The `LDAP_LOGLEVEL`
variable sets the initial syslog-level value of slapd when the `openldap`
container is created.  To alter the syslog-level value on a module that
has been already configured, run the following command instead:

    podman exec -i openldap ldapmodify <<EOF
    dn: cn=config
    changetype: modify
    replace: olcLogLevel
    olcLogLevel: config stats sync
    EOF

It is possible to run slapd with an increased debug level. Debug messages
are sent to stderr, which is forwarded to Systemd journal. Set
`LDAP_DEBUGLEVEL` environment variable and restart the `openldap` service.

    runagent sh -c 'echo LDAP_DEBUGLEVEL=255 >> environment'
    systemctl --user restart openldap

See also the server README.

## Users and group management APIs

Create group `mygroup1`

    api-cli run module/openldap1/add-group --data '{"group":"mygroup1","description":"My group","users":[]}'

Change the group description

    api-cli run module/openldap1/alter-group --data '{"group":"mygroup1","description":"My Group 1"}'

Create user `first.user` as member of `mygroup1`

    api-cli run module/openldap1/add-user --data '{"user":"first.user","display_name":"First User","password":"Nethesis,1234","groups":["mygroup1"]}'

Change First User's password

    api-cli run module/openldap1/alter-user --data '{"user":"first.user","password":"Neth,123"}'

## Domain password policy

Get the domain password policy

    api-cli run module/openldap1/get-password-policy

Set the domain password policy

    api-cli run module/openldap2/set-password-policy --data '{"expiration": {"min_age": 0, "max_age": 7, "enforced": true}, "strength": {"enforced": true, "history_length": 0, "password_min_length": 8, "complexity_check": true}}'

## User management web portal

The `openldap` module provides a public web portal where LDAP users can
authenticate and change their passwords.

The module registers a Traefik path route, with the domain name as suffix.
For instance:

    https://<node FQDN>/users-admin/domain.test/

The backend endpoint is advertised as `users-admin` service and can be
discovered in the usual ways, as documented in [Service
discovery](https://nethserver.github.io/ns8-core/modules/service_providers/#service-discovery).
For instance:

    api-cli run module/mymodule1/list-service-providers  --data '{"service":"users-admin", "filter":{"domain":"dp.nethserver.net","node":"1"}}'

The event `service-users-admin-changed` is raised when the serivice
becomes available or is changed.

The backend of the module runs under the `api-moduled.service` Systemd
unit supervision. Refer also to `api-moduled` documentation, provided by
`ns8-core` repository.

API implementation code is under `imageroot/api-moduled/handlers/`, which
is mapped to an URL like

    https://<node FQDN>/users-admin/domain.test/api/

An OpenAPI description of the implemented users-admin HTTP API is available
at `imageroot/api-moduled/openapi.yaml`.

The `.json` files define the API input/output syntax validation, using the
JSON schema language. As such they can give an idea of request/response
payload structure.

## Running tests locally

This module uses the NS8 standard testing infrastructure. For instructions
on how to run the test suite locally, refer to the [Running tests
locally](https://github.com/NethServer/ns8-github-actions/blob/v1/README.md#running-tests-locally)
section of the ns8-github-actions repository.

## Migration notes

- On the NS7 side a Python filter `ns8fixschema.py3` converts the LDIF dump
  to a NS8 compatible schema. The script `utils/genschema.py` was used to
  export NS8 schema data in Python format.
- The password policy feature does not exist in NS7. When the NS7 LDAP
  account provider is migrated to NS8, the password policy starts in a
  disabled state and can be enabled later from the Domains and Users page.
- NS7 users with password-never-expires flag (`shadowMax: 99999`) are
  migrated without the `pwdChangedTime` attribute. In NS8, that state is
  treated as non-expiring.
- If password expiration is later re-enabled for one of those users, the
  current password is preserved and `pwdChangedTime` is initialized at that
  point.
