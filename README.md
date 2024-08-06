# ansible-playbook-pssid-GUI-deploy
An Ansible playbook that deploys pSSID GUI containers and provisioning scripts
to the GUI server / pSSID controller.

## Quick Start
Clone this repository:
```
git clone https://github.com/UMNET-perfSONAR/ansible-playbook-pssid-GUI-deploy.git
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
Optionally edit the variables:
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
