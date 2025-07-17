# BorgBackup Ansible Role

This Ansible role installs and configures BorgBackup, a deduplicating backup program.

## Requirements

- Ansible 2.9 or higher
- Supported operating systems: Ubuntu, Debian, CentOS, and other Linux distributions.

## Role Variables

The following variables can be defined in `vars/main.yml` or overridden in your playbook:

- `borgbackup_version`: The version of BorgBackup to install (default: latest).
- `borgbackup_repo`: The repository location for backups.
- `borgbackup_passphrase`: The passphrase for the Borg repository.

## Dependencies

This role has no dependencies on other roles.

## Example Playbook

```yaml
- hosts: all
  roles:
    - borgbackup
```

## License

MIT

## Author Information

This role was created in 2023 by [Your Name].