# SSH Keys Role

## Role Variables

```yaml
users:
  - name: "litsadmin"
    fullname: "LITS Admin"
    authorized_keys:
      - "{{ lookup('file', 'files/sshkeys/id_rsa_litsadmin.pub') }}"
    cmd: "ALL=(ALL) NOPASSWD:ALL"
    state: present
    sudo: true
    system_account: false
    password: "{{ vc_admin_password }}"
    bash_files:
      - name: ms.sh
        mode: '0755'
      - name: tmux.conf
        mode: '0644'
      - name: vimrc
        mode: '0644'
      - name: curlrc
        mode: '0644'
      - name: wgetrc
        mode: '0644'
```
In order to authorize SSH public keys you need to edit the variable
`ssh_user_list` and add a list entry containing the `name` of the user, a
list of `authorized_keys` and optionally the `create_user_account` flag if you
want the role to take care of creating the account. Each list entry corresponds
to one user account.

```yaml
ssh_authorized_keys_exclusive: true
```
