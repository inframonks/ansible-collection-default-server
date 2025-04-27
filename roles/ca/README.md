# Role: CA

This role copies the CA certificates to the system trust stores and reloads them.

default/main.yml ist the default filepath for the source folder defined.

## Default Variables

The default variables for this role are defined in [defaults/main.yml](defaults/main.yml). The default filepath for the source folder is defined as:

```yml
# Stored in ansible-infra/files/ca/
ca_source_path: "../files/ca"
```

## Destination Path

The destination path is calculated based on Ansible facts, depending on the Linux distribution.

Supported distributions are:

- Debian
- FreeBSD
- RedHat
- SUSE
