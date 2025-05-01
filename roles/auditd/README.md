# Ansible Rolle: Auditd

[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

## Description

Manages auditd logging.

## Role Variables

The variables that can be overridden are defined in [defaults/main.yml](defaults/main.yml) and [vars](vars) directory. Below are the key variables:

## Variablen

| Name                     | Default Value                | Description                                      |
| ------------------------ | ---------------------------- | ------------------------------------------------ |
| auditd_extra_rules       | `[]`                         | Liste zusätzlicher Audit-Regeln                  |


## Dependencies

None.

## Additional rules

```yaml
auditd_extra_rules:
  - "-w /etc/shadow -p r -k shadow-file-read"
```

