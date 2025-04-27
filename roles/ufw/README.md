# UFW Tasks und Variablen

Diese Rolle konfiguriert und verwaltet UFW (Uncomplicated Firewall) unter Linux. Die Konfiguration basiert auf folgenden Tasks:

## Aufgabenübersicht

1. **Installation**: Installiert das UFW-Paket, wenn es nicht vorhanden ist.
2. **Service-Management**: Aktiviert und startet den UFW-Dienst.
3. **Standardkonfiguration**: Konfiguriert die Datei `/etc/default/ufw` über eine Jinja2-Template.
4. **Regel-Anwendung**: Setzt Firewall-Regeln basierend auf einer zentralen Variablen `ufw_rules`.
5. **Standardrichtlinie**: Aktiviert UFW mit einer `deny`-Standardrichtlinie.

---

## Wichtige Variablen

### Allgemein

| Variable          | Beschreibung                                              | Beispiel                       | Standardwert |
|--------------------|----------------------------------------------------------|--------------------------------|--------------|
| `proxy_env`        | Proxy-Umgebungsvariablen, die für die Installation genutzt werden. | `{ http_proxy: ... }`         | Keine        |
| `ufw_manage_config`| Gibt an, ob `/etc/default/ufw` über ein Template verwaltet wird. | `true`                        | `false`      |

### UFW Regeln (`ufw_rules`)

Die UFW-Regeln werden über die Variable `ufw_rules` definiert. Jede Regel ist ein Dictionary mit folgenden Feldern:

| Feld                  | Beschreibung                                              | Beispiel                         |
|------------------------|----------------------------------------------------------|----------------------------------|
| `comment`             | Kommentar zu der Regel                                    | `"Allow SSH"`                   |
| `default`             | Setzt Standardrichtlinien (`allow`, `deny`, `reject`)     | `"deny"`                        |
| `delete`              | Entfernt die Regel, wenn `true`                          | `true`                          |
| `direction`           | Richtung der Regel (`in`, `out`, `routed`)               | `"in"`                          |
| `from_ip`             | Quell-IP der Regel                                       | `"192.168.1.0/24"`              |
| `from_port`           | Quell-Port der Regel                                     | `22`                            |
| `to_ip`               | Ziel-IP der Regel                                        | `"192.168.1.10"`                |
| `to_port`             | Ziel-Port der Regel                                      | `80`                            |
| `proto`               | Protokoll (`tcp`, `udp`)                                 | `"tcp"`                         |
| `rule`                | Aktion der Regel (`allow`, `deny`, `reject`)             | `"allow"`                       |
| `interface_in`        | Eingangs-Interface                                       | `"eth0"`                        |
| `interface_out`       | Ausgangs-Interface                                       | `"eth1"`                        |

---

## Beispiel für Variablenkonfiguration

```yaml
proxy_env:
  http_proxy: "http://proxy.example.com:3128"
  https_proxy: "http://proxy.example.com:3128"

ufw_manage_config: true

ufw_rules:
  - comment: "Allow SSH"
    rule: "allow"
    proto: "tcp"
    from_port: 22
  - comment: "Allow HTTP"
    rule: "allow"
    proto: "tcp"
    from_port: 80
    to_port: 80
  - comment: "Block outbound traffic"
    rule: "deny"
    direction: "out"
```