# Ansible role - certbot

Install and manage certbot

## :gear: Role variables

Variable | Default value | Description
---------|---------------|------------
certbot_packages                          | **['certbot', 'python3-pip']**     | Package name
certbot_certs                             | **[]**                             | See defaults/main.yml for details

## :arrows_counterclockwise: Dependencies

### Exmaple

```yaml
certbot_certs:
  - domains:
    - "*.molecule.clara.net"
    reload_services:
    - nginx
```
