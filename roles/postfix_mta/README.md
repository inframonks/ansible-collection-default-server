# Ansible Role: Postfix-MTA

## Description

This Ansible role installs and configures Postfix as a Mail Transfer Agent (MTA) on your servers. It ensures that your mail server is properly set up and secure.

## Requirements

- Ansible 2.9 or higher
- Supported platforms: Debian, Ubuntu, CentOS, RedHat

## Role Variables

| Variable                   | Description                                      | Default Value            |
|----------------------------|--------------------------------------------------|--------------------------|
| `postfix_mta_hostname`     | The hostname to be used by Postfix               | `{{ ansible_hostname }}` |
| `postfix_mta_domain`       | The domain name to be used by Postfix            | `{{ ansible_domain }}`   |
| `postfix_mta_relayhost`    | The relay host to forward emails to              | ``                       |
| `postfix_mta_root_mail`    | The Root mailadresse                             | `root`                   |
| `postfix_mta_aliases`      | Additial mailaliases in key: value               | ``                       |


## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
    roles:
        - role: postfix-mta
            vars:
                postfix_mta_hostname: "srv01"
                postfix_mta_domain: "lenhardt.cc"
                postfix_mta_relayhost: "mail.lenhardt.cc"
                postfix_mta_root_mail: "support@lenhardt.cc"
                postfix_mta_aliases:
                  support: support@lenhardt.cc
```

## License

MIT

## Author Information

This role was created by Dominik Lenhardt.
