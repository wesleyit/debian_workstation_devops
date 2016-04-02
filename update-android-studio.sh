#!/bin/bash

echo -n "Starting at "
date

## Set here the items you wanna install
export ITEMS="platform-tools,tools,android-19,sysimg-19,build-tools-19.0.0,addon-google_apis-google-19"

## Ensure the right paths and variables
source /etc/profile.d/android-studio-env.sh 

## Wait the installer to load and then answer y to 
# license terms
sleep 5
( while true; do sleep 1; echo y; done  ) | 
	android update sdk --no-ui --filter $ITEMS
