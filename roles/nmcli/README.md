# Ansible Role: nmcli

Administrate and configure network interfaces on Rocky Linux 9.5+ using NetworkManager (nmcli).
Supports DHCP, Static IP, VLAN, Bridge, Bond and WiFi (optional).

---

## 🚀 Features
	•	Autodetect default interface (based on ansible_default_ipv4)
	•	DHCP by default
	•	Static IP configuration (optional)
	•	VLAN configuration
	•	Bridge configuration
	•	Bonding configuration
	•	WiFi support (optional)
	•	Idempotent using community.general.nmcli

---

## 📥 Role Variables

General:

```yaml
network_default_iface: "{{ ansible_default_ipv4.interface | default('eth0') }}"
```

→ Automatically detected default interface.

→ Can be overwritten in host_vars or group_vars.

**Example: DHCP (Default)**

```yaml
network_interfaces:
  - iface: "{{ network_default_iface }}"
    state: up
    type: ethernet
    method4: auto   # DHCP
```

**Example: Static IP**
```yaml
network_interfaces:
  - iface: eth0
    state: up
    type: ethernet
    method4: static
    ip4: 192.168.1.50/24
    gw4: 192.168.1.1
    dns4:
      - 192.168.1.1
```

**More Examples:**

```yaml
network_interfaces:
  - iface: eth0
    state: up
    type: ethernet
    ip4: 192.168.10.10/24
    gw4: 192.168.10.1
    dns4:
      - 1.1.1.1
      - 8.8.8.8

  - iface: vlan100
    type: vlan
    vlan_id: 100
    vlan_parent: eth0
    ip4: 192.168.100.2/24
    gw4: 192.168.100.1
    dns4:
      - 8.8.8.8

  - iface: br0
    type: bridge
    bridge_ports:
      - eth1
      - eth2
    bridge_stp: false
    ip4: 10.10.10.10/24

  - iface: bond0
    type: bond
    mode: 802.3ad
    master: bond0
    ip4: 10.20.30.10/24
    gw4: 10.20.30.1
    dns4:
      - 192.168.1.1

  - iface: wlan0
    type: wifi
    wifi_ssid: "MyWiFi"
    wifi_sec: "wpa-psk"
    wifi_psk: "SuperSecretPassword"
    ip4: 192.168.200.50/24
    gw4: 192.168.200.1
```

## 🛡️ Notes
	•	If method4 is set to auto, IP/DNS/Gateway will not be configured → DHCP is used.
	•	If dns4 is set → overrides DHCP DNS servers.
	•	If state is down, connection is removed.

