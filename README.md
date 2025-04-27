# Ansible Collection: inframonks.default_server

Diese Ansible Collection stellt standardisierte Rollen für die Serverbereitstellung innerhalb von **inframonks** bereit. Sie dient der effizienten und konsistenten Konfiguration von Servern in verschiedenen Linux-Umgebungen.

## Inhalt

- `roles/`: Enthält die spezifischen Ansible-Rollen dieser Collection.
- `plugins/`: Beinhaltet benutzerdefinierte Plugins (falls vorhanden).

## Unterstützte Plattformen

Diese Rollen wurden getestet und sind kompatibel mit:

- Red Hat Enterprise Linux 8 und 9
  * CentOS 8 und 9
  * AlmaLinux 8 und 9
  * Rocky Linux 8 und 9
- Debian 11 und 12
- Ubuntu 22.04 und 24.04

## Voraussetzungen

- Ansible Version 2.9 oder höher [docs.ansible.com](https://docs.ansible.com/ansible/2.9/installation_guide/intro_installation.html)
- Python 3.6 oder höher auf den Zielsystemen

Stelle sicher, dass die Zielsysteme über SSH erreichbar sind und der Ansible-Controller die entsprechenden Berechtigungen besitzt.

## Installation

Um diese Collection zu installieren, verwende folgenden Befehl:

```bash
ansible-galaxy collection install git+https://github.com/inframonks/default_server.git
````

## Alternativ kannst du sie in einer requirements.yml definieren:

```yaml
collections:
  - name: git+https://github.com/inframonks/default_server.git
````

Und dann installieren mit:

```bash
ansible-galaxy collection install -r requirements.yml
```

## Nutzung

In deinem Playbook kannst du die Rollen dieser Collection wie folgt einbinden:

```bash
- name: Server Setup
  hosts: all
  roles:
    - role: inframonks.default_server.ROLLE_NAME
```

Ersetze ROLLE_NAME durch den Namen der spezifischen Rolle, die du verwenden möchtest.

## Beiträge und Support

Beiträge zu dieser Collection sind willkommen. Bitte erstelle einen Pull-Request oder ein Issue im [GitHub-Repository](https://github.com/inframonks/default_server).

Für Support oder Fragen kontaktiere bitte das DevOps-Team von inframonks.

## Lizenz

Diese Collection steht unter der MIT-Lizenz. Details findest du in der Datei LICENSE im Repository.