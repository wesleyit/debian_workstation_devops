#!/bin/bash

## We need the current user name to setup the tools
export CURRENT_USER="$(whoami)"

## Lets create a temp file to execute our commands
export TMPFILE="$(mktemp)"

## The heredoc creates an shell script
cat > "$TMPFILE" << EOF
#!/bin/bash
set -x

## Get rid of the cache and old sources.list files
rm -rf /etc/apt/sources.list
rm -rf /etc/apt/sources.list.d/*
rm -rf /var/lib/apt/lists/*

## Generate a temporary and default sources.list
mkdir -p /etc/apt/sources.list.d/
echo deb http://ftp.us.debian.org/debian/ stretch main contrib non-free > ftp_us_debian_org_debian.list
echo deb http://ftp.us.debian.org/debian/ jessie main contrib non-free >> ftp_us_debian_org_debian.list
echo deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free >> ftp_us_debian_org_debian.list
echo deb http://ftp.us.debian.org/debian/ jessie-updates contrib main non-free >> ftp_us_debian_org_debian.list
echo deb http://ftp.us.debian.org/debian/ jessie-proposed-updates contrib main non-free >> ftp_us_debian_org_debian.list

## Update cache and install Git and Ansible
apt-get update
apt-get install -y ansible git

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

su -c "bash $TMPFILE"

echo "Removing the temporary files..."
rm -rf "$TMPFILE"
echo "Done! Please, reboot your computer."

