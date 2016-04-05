Debian Workstation (for DevOps, with love)
==========================================

Hi! I love to format my workstation and try many versions of operating systems.
The one I use more is Debian.

This is an Ansible Playbook that you can run just after install your system.
It's built to be compatible with Debian Jessie, and after running it you will
have many goodies:

- Debian updated to Testing version 
- Compatibility with i386 packages
- A full instalation of KDE
- LibreOffice
- Brazilian Portuguese locales
- Vim and Emacs
- VLC, Flash Player, Gimp and Inkscape
- Wireshark, Nmap, and Cryptkeeper
- Docker, VirtualBox, Vagrant and AWS CLI
- Ruby with Rbenv, Python 2 and 3, Oracle JDK 8 and Elixir
- Git, SVN and GCC
- Arduino
- Google Chrome
- Slack Messenger
- Skype Messenger
- ~~Google Hangouts Plugin~~ (the Google's repo is down)
- TeamViewer
- Android Studio and Android SDK
- Important folders using Dropbox
- User included in SUDO
- Many other improvements

**After install, remember to connect to your Dropbox Account to start backing up your files.**


How to install?
===============

You have just finished setting up your Debian Jessie and have a good Internet connection and CURL.
Just run: 

`bash -c "$(curl https://raw.githubusercontent.com/wesleyit/debian_workstation_devops/master/installer.sh)"`

It will take a lot of time because some downloads are very big (Java, Android SDK and Images for example).
The good part is that you can follow the status of each step. Ansible will display the individual results.

At the end, reboot your PC, find Dropbox, make your login and start using your new Workstation :)
 
