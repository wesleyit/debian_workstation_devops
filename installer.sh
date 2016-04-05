#!/bin/bash

echo "Starting the setup... $(date)"

CURRENT_USER=$(whoami)
COMMANDS=$(
cat << EOF
apt-get install -y ansible git
[ -e /etc/apt/sources.list ] && rm -rf /etc/apt/sources*
[ -e /var/lib/apt ] && rm -rf /var/lib/apt
mkdir -p /etc/apt/sources.list.d
apt-get update
cd "/tmp"
[ -e debian_workstation_devops ] && rm -rf debian_workstation_devops
git clone https://github.com/wesleyit/debian_workstation_devops.git
cd debian_workstation_devops
ansible-playbook -i .ansible-hosts debian-workstation-devops.yml --extra-vars "main_user=$CURRENT_USER"
EOF
)

echo "Lets install Ansible and Git"
echo -n "Please provide the Root " && su --login -c "$COMMANDS"

if [ $? -ne 0 ]
then
	echo "An error occured."
	exit 1
else
	echo "Well done, enjoy :)"
fi
