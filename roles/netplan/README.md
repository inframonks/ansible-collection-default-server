# Netplan

Exmaple for Ubuntu

```bash
netplan_config:
  network:
    ethernets:
      match:
        macaddress: BC:50:56:7e:14:8f
      dhcp4: false
      accept-ra: no
      addresses:
        - 10.10.10.3/24
        - 2a02:b207:6893:3324::1/64
      routes:
        - to: default
          via: 10.10.10.1
        - to: fe80::1
          scope: link
      gateway6: fe80::1
      nameservers:
        addresses:
          - 1.0.0.2
          - 2606:4700:4700::1002
          - 1.1.1.2
          - 2606:4700:4700::1112
```