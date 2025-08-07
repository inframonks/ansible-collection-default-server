# Ansible role - certbot

Install and manage certbot with multi-distribution support

## :gear: Supported Operating Systems

- **Debian/Ubuntu**: Uses `apt` package manager
- **RedHat/Rocky Linux/CentOS**: Uses `dnf` package manager with optional EPEL repository

## :gear: Role variables

Variable | Default value | Description
---------|---------------|------------
certbot_cloudflare_api_email               | **Required**                       | Cloudflare API email
certbot_cloudflare_api_key                 | **Required**                       | Cloudflare API key (encrypted)
certbot_cloudflare_credentials_path        | **/etc/letsencrypt/cloudflare.ini** | Path to Cloudflare credentials file
certbot_renew_hook                         | **""**                             | Additional renew hook (e.g., "haproxy")
certbot_certs                              | **[]**                             | List of certificates to manage (see examples below)

Each certificate in `certbot_certs` can contain:
- `domains`: List of domains for the certificate
- `services`: List of services to manage after certificate deployment (see Service Management Options)

**Note**: `certbot_packages` is now automatically set based on the detected operating system via distribution-specific vars files.

## :arrows_counterclockwise: Dependencies

The role automatically detects the operating system using `gather_facts` and loads appropriate variables from the `vars/` directory.

### Example

```yaml
certbot_certs:
  - domains:
    - "*.molecule.clara.net"
    services:
    - nginx
    - name: apache2
      action: reload
    - name: haproxy  
      action: restart
```

### Service Management Options

The `services` can be configured in two ways:

**Simple format** (defaults to restart):
```yaml
services:
  - nginx
  - apache2
```

**Advanced format** with custom actions:
```yaml
services:
  - name: nginx
    action: reload    # reload, restart, start, stop
  - name: apache2
    action: restart
  - name: haproxy
    action: reload
```

**Available actions:**
- `restart` (default) - Restart the service
- `reload` - Reload configuration (falls back to restart if reload fails)
- `start` - Start the service
- `stop` - Stop the service

The deploy hook includes logging to `/var/log/certbot-deployhook.log` and checks if services exist before attempting operations.

### Backward Compatibility

For backward compatibility, the old `reload_services` parameter is still supported but deprecated. Please migrate to using `services` instead:

```yaml
# Deprecated (still works)
certbot_certs:
  - domains: ["example.com"]
    reload_services: ["nginx"]

# Recommended
certbot_certs:
  - domains: ["example.com"]  
    services: ["nginx"]
```
