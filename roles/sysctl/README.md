## Die sysctl-Einträge können in mehreren Ebenen definiert werden:

```yaml
# Defaults (defaults/main.yml):
defaults_sysctl_entries:
  net.ipv4.ip_forward: 1
  net.ipv4.conf.all.rp_filter: 1

# group_vars_sysctl_entries:
group_vars_sysctl_entries:
  net.ipv4.ip_forward: 0
  kernel.randomize_va_space: 2

# Hostvariablen (host_vars/my_host.yml):
host_vars_sysctl_entries:
  vm.swappiness: 10
  net.ipv4.conf.default.rp_filter: 0

# Playbook (playbook.yml):
vars:
  playbook_sysctl_entries:
    kernel.randomize_va_space: 1
    net.ipv4.tcp_syncookies: 1
```

## Beispiel für kombinierte Einträge
Nach der Kombination ergibt sich eine konsolidierte Liste der sysctl-Einträge, wobei spätere Quellen frühere überschreiben:

```yaml
sysctl_entries:
  net.ipv4.ip_forward: 0
  net.ipv4.conf.all.rp_filter: 1
  kernel.randomize_va_space: 1
  vm.swappiness: 10
  net.ipv4.conf.default.rp_filter: 0
  net.ipv4.tcp_syncookies: 1
```