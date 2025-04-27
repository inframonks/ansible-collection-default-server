# QEMU Guest Agent Role

This Ansible role installs and configures the `qemu-guest-agent` on Debian, RedHat, SUSE, and OpenBSD systems.

## Variables

- `qemu_guest_agent_packages`: List of packages required for qemu-guest-agent on the specific OS.
- `qemu_guest_agent_service`: Name of the qemu-guest-agent service to manage.

## Example Playbook

```yaml
- hosts: all
  become: yes
  roles:
    - qemu_guest_agent