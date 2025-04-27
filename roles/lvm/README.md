# Ansible Role: LVM Management

## Description

This Ansible role manages Logical Volume Management (LVM) on Linux systems. It creates volume groups, logical volumes, formats file systems, sets up mount points, and mounts the volumes.

## Requirements

A Linux system with LVM support

### Installed Ansible modules:

```bash
community.general.lvg
community.general.lvol
community.general.filesystem
```

## Supported Distributions

This role has been tested on:

Debian-based systems (Debian, Ubuntu)

RHEL-based systems (Red Hat, CentOS, AlmaLinux, Rocky Linux)

## Variables

`host_vars_lvm_config`

This variable defines the entire LVM configuration. The data is combined from multiple sources (defaults, group_vars, host_vars, playbook_vars). The structure is as follows:

l```yaml
host_vars_lvm_config:
  - vg: system
    pv: /dev/vda
    logical_volumes:
      - lv: root
        size: 10G
        mount: /
        fs_type: xfs
        opts: "defaults"
      - lv: log
        size: 3G
        mount: /var/log
        fs_type: xfs
        opts: "noatime"
  - vg: content
    pv: /dev/vdb
    logical_volumes:
      - lv: data
        size: 100G
        mount: /data
        fs_type: ext4
        opts: "defaults"
```

## Role Tasks

The role executes the following steps:

Combine LVM configuration: Merges all configuration sources into lvm_config.

Install required packages: Installs lvm2 and xfsprogs.

Create volume groups: Creates volume groups using the specified physical volumes.

Create logical volumes: Defines and creates logical volumes.

Format file systems: Sets up file systems on logical volumes.

Create mount directories: Creates necessary mount points.

Mount volumes: Mounts logical volumes with the specified options.

## Handlers

The role includes the following handler:

Reload systemd: Triggered when a new volume is mounted.

## Usage Example

Playbook Example

```bash
- hosts: all
  roles:
    - role: lvm_management
      vars:
        playbook_lvm_config:
          - vg: data_vg
            pv: /dev/sdb
            logical_volumes:
              - lv: storage
                size: 50G
                mount: /mnt/storage
                fs_type: xfs
                opts: "defaults"
```

## Tags

All tasks are tagged with lvm, allowing selective execution:

```bash
ansible-playbook playbook.yml --tags lvm
```

## License

MIT License

## Author

This role was created by Dominik Lenhardt.

