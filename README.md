# ansible-playbook-pssid-GUI-deploy
An Ansible playbook that deploys pSSID GUI containers and provisioning scripts
to the GUI server / pSSID controller.

## Prerequisites
* `docker` and `docker-compose` are installed on the target host. If not, install them
with
```
sudo apt update && sudo apt install docker.io docker-compose -y
```
* Two-factor authentication is disabled for Ansible on the target host.
Add the following line to `/etc/group`.
```
not2fa:x:650:<username>
```

## Quick Start
Clone this repository:
```
git clone https://github.com/UMNET-perfSONAR/ansible-playbook-pssid-GUI-deploy.git
```
and `cd` into it
```
cd ansible-playbook-pssid-GUI-deploy
```
Install the required roles:
```
ansible-galaxy install -r requirements.yml
```
Set up variables by running the `defaults.sh` script.
```
sh defaults.sh
```
**Optionally** edit the variables:
```
vi inventory/group_vars/pssid-gui-controller/ansible-role-pssid-GUI-install-configure.yml
```
Set up the inventory and optionally add connection variables:
```
vi inventory/hosts.ini
```
Run the playbook:
```
ansible-playbook \
    --inventory inventory/hosts.ini \
    --become \
    --become-method sudo \
    --become-user root \
    --ask-become-pass \
    --ask-pass \
    playbook.yml
```
