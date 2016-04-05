#!/bin/bash

## We need the current user name to setup the tools
export CURRENT_USER=$(whoami)

## Lets create a temp file to execute our commands
export TMPFILE=$(mktemp)

## The heredoc creates an shell script
cat > "$TMPFILE" << EOF
#!/bin/bash
set -x

## Get rid of the cache and old sources.list files
rm -rf /etc/apt/sources.list
rm -rf /etc/apt/sources.list.d
rm -rm /var/lib/apt/lists/*

## Generate a temporary and default sources.list
echo deb http://ftp.debian.org/debian jessie main contrib non-free > /etc/apt/sources.list
echo deb http://ftp.br.debian.org/debian wheezy-updates main contrib non-free >> /etc/apt/sources.list
echo deb http://security.debian.org/ wheezy/updates main contrib non-free >> /etc/apt/sources.list

## Update cache and install Git and Ansible
apt-get update
apt-get install -y ansible git

## Again, get rid of the cache and old sources.list files
rm -rf /etc/apt/sources.list
rm -rf /etc/apt/sources.list.d
rm -rm /var/lib/apt/lists/*
apt-get update

## Ensure the repository has the latest code and RUN!
cd /tmp/
[ -e debian_workstation_devops ] && rm -rf debian_workstation_devops
git clone https://github.com/wesleyit/debian_workstation_devops.git
cd debian_workstation_devops
ansible-playbook -i .ansible-hosts debian-workstation-devops.yml --extra-vars "main_user=$CURRENT_USER"
EOF

echo "Hello! It is time to install some packages.
It will take a long time, go take a coffee (a long one).
We will ask you the root password in a few momments..."

chmod a+x "$TMPFILE"
su -c "bash $TMPFILE"

echo "Removing the temporary files..."
rm -rf "$TMPFILE" /tmp/debian_workstation_devops
echo "Done! Please, reboot your computer."

