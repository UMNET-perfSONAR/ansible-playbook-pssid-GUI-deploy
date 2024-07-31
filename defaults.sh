#!/bin/bash

if [ "$1" == "" ]; then
  directory="inventory"
else
  directory=$1
fi

host_group = "pssid-gui-controller"
deploy_role_name = "ansible-role-pssid-GUI-install-configure"

# add_provision_role_name
provision_role_name = "ansible-role-pssid-probe-provisioning-scripts"

mkdir -p ${directory}/group_vars

# if ! [ -f ${directory}/group_vars/${host_group}/${deploy_role_name}.yml ]; then
#     cp roles/${deploy_role_name}/defaults/main.yml \
#        ${directory}/group_vars/${host_group}/${deploy_role_name}.yml
# fi

# function to initialize group variable files
initialize_group_vars() {
    local role_name=$1
    if ! [ -f ${directory}/group_vars/${host_group}/${role_name}.yml ]; then
        cp roles/${role_name}/defaults/main.yml \
           ${directory}/group_vars/${host_group}/${role_name}.yml
    fi
}

# initialize group variable files for each role
initialize_group_vars ${deploy_role_name}
initialize_group_vars ${provision_role_name}