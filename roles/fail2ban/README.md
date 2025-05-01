# Ansible Role: fail2ban

[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

## Description

Install and configure fail2ban.

## Role Variables

The variables that can be overridden are defined in [defaults/main.yml](defaults/main.yml). Below are the key variables:

| Name | Default Value | Description |
|------|---------------|-------------|
| fail2ban_mail_recipient | root@localhost | Recipient address for Fail2Ban email notifications. |
| fail2ban_loglevel | INFO | Log level for Fail2Ban (CRITICAL, ERROR, WARNING, NOTICE, INFO, DEBUG). |
| fail2ban_logtarget | /var/log/fail2ban.log | File path for Fail2Ban logs. |
| fail2ban_syslog_target | /var/log/fail2ban.log | Syslog target path. |
| fail2ban_syslog_facility | 1 | Syslog facility value. |
| fail2ban_socket | /var/run/fail2ban/fail2ban.sock | Path to the Fail2Ban socket. |
| fail2ban_pidfile | /var/run/fail2ban/fail2ban.pid | Path to the Fail2Ban PID file. |
| fail2ban_sendername | `{{ ansible_hostname + '.' + ansible_domain if ansible_domain is defined and ansible_domain != '' else ansible_hostname }}` | Sender name used in notification emails. |
| fail2ban_ignoreips | See default list | IP addresses that will never be banned. |
| fail2ban_bantime | 600 | Duration (in seconds) for which a host is banned. |
| fail2ban_maxretry | 3 | Number of failures before banning an IP. |
| fail2ban_findtime | 600 | Time window (in seconds) to count failures. |
| fail2ban_backend | systemd | Backend used for service monitoring (systemd, polling, etc.). |
| fail2ban_destemail | `{{ fail2ban_mail_recipient }}` | Destination email address for alerts. |
| fail2ban_banaction | iptables-multiport | Action to take when banning occurs. |
| fail2ban_jails | See example | List of configured jails and their specific options. |

## Dependencies

None.