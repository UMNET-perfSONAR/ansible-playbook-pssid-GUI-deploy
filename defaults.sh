#!/bin/bash

if [ "$1" == "" ]; then
  directory="inventory"
else
  directory=$1
fi

host_group = "pssid-gui-controller"
deploy_role_name = "ansible-role-pssid-GUI-install-configure"

mkdir -p ${directory}/group_vars

if ! [ -f ${directory}/group_vars/${host_group}/${deploy_role_name}.yml ]; then
    cp roles/${deploy_role_name}/defaults/main.yml \
       ${directory}/group_vars/${host_group}/${deploy_role_name}.yml
fi
