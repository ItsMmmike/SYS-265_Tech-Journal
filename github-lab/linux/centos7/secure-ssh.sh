#!/bin/bash

#secure-ssh.sh
#author ItsMmmike
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in

echo "Enter Username for New SSH User: $1"

NewUser=$1

#Adds New SSH User
useradd -m -d /home/"$NewUser" -s /bin/bash "$NewUser"
mkdir -p /home/"$NewUser"/.ssh
sudo cp /home/michael-loc/SYS-265_Tech-Journal/github-lab/linux/centos7/id_rsa.pub /home/"$NewUser"/.ssh
sudo chmod 700 /home/"$NewUser"/.ssh
sudo chown -R "$NewUser":"$NewUser" /home/"$NewUser"/.ssh

#Removes Root SSH Login
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
