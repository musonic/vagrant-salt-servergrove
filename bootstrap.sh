#!/usr/bin/env bash

apt-get -y install curl

echo deb http://repos.servergrove.com/servergrove-ubuntu-precise precise main > /etc/apt/sources.list.d/servergrove.list

curl -O http://repos.servergrove.com/servergrove-ubuntu-precise/servergrove-ubuntu-precise.gpg.key 
apt-key add servergrove-ubuntu-precise.gpg.key

apt-get update

rm -rf /var/www
ln -fs /vagrant /var/www
