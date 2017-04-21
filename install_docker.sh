#!/bin/bash

echo 172.16.1.22 dockerops.chanjet.com >>/etc/hosts
sudo apt-get install \
linux-image-extra-$(uname -r) \
linux-image-extra-virtual

sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88


sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo apt-get update
sudo apt-get install -y docker-ce

echo DOCKER_OPTS=\"--ip=0.0.0.0 --insecure-registry=dockerrepo.test.com\" >> /etc/default/docker
service docker restart
docker login dockerrepo.test.com --username=test --password=test
