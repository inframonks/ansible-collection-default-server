# Interfaces

Example for Debian

```bash
---
interfaces_config:
  - name: lo
    bootproto: loopback
  - name: wlp2s0
    bootproto: manual
  - name: enp1s0
    bootproto: manual
  - name: enp3s0
    bootproto: manual
  - name: bond0
    bootproto: manual
    bond_slaves:
      - enp1s0
      - enp3s0
    bond_options:
      bond-miimon: 100
      bond-mode: 802.3ad
      bond-xmit-hash-policy: layer3+4
  - name: bond0.2
    bootproto: manual
  - name: bond0.3
    bootproto: manual
  - name: vmbr1
    bootproto: static
    address: 10.30.10.21/24
    gateway: 10.30.10.1
    bridge_ports:
      - bond0
    options:
      bridge-stp: off
      bridge-fd: 0
    bootproto6: static
    address6: 2001:db8::21/64
    gateway6: 2001:db8::1
    dns_nameservers6:
      - 2001:4860:4860::8888
      - 2001:4860:4860::8844
  - name: vmbr2
    bootproto: manual
    bridge_ports:
      - bond0.2
    options:
      bridge-stp: off
      bridge-fd: 0
  - name: vmbr3
    bootproto: manual
    bridge_ports:
      - bond0.3
    options:
      bridge-stp: off
      bridge-fd: 0
  - name: eth2
    bootproto: dhcp
    bootproto6: dhcp
```