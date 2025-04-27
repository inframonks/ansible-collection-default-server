# IfCFG

Exmaple for RedHat based Systems

```bash
ifcfg_interfaces:
  - name: eth0
    bootproto: static
    ipaddr: 192.168.1.100
    netmask: 255.255.255.0
    gateway: 192.168.1.1
    dns1: 8.8.8.8
    dns2: 8.8.4.4
    macaddr: "00:1A:2B:3C:4D:5E"
    ipv6addr: "2001:db8::1/64"
    ipv6gateway: "2001:db8::fffe"
    dns1_ipv6: "2001:4860:4860::8888"
    dns2_ipv6: "2001:4860:4860::8844"
    routes:
      - address: 10.0.0.0
        netmask: 255.255.255.0
        gateway: 192.168.1.1
      - address: 10.0.1.0
        netmask: 255.255.255.0
        gateway: 192.168.1.1
    routes6:
      - address: 2001:db8:1::/64
        prefix: 64
        gateway: 2001:db8::fffe
  - name: eth1
    bootproto: dhcp
    onboot: yes
    macaddr: "00:1A:2B:3C:4D:5F"
```