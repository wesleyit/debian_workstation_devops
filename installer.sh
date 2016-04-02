#!/bin/bash

echo "Starting the setup... $(date)"

CURRENT_USER=$(whoami)
COMMANDS=$(
cat << EOF
apt-get install -y ansible git
export TMP="$(mktemp)"
cd "$TMP"
git clone https://github.com/wesleyit/debian_workstation_devops.git .
ansible-playbook debian-workstation-devops.yml --extra-vars "main_user=$CURRENT_USER"
cd /tmp && rm -rf "$TMP"
EOF
)

echo "Lets install Ansible and Git"
echo -n "Please provide the Root " && su -c "$COMMANDS"

if [ $? -ne 0 ]  
then
	echo "An error occured."
	exit 1
else
	echo "Well done, enjoy :)"
fi
