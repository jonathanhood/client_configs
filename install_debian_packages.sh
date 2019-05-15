#!/bin/bash

## Get the system up-to-date
sudo apt-get update
sudo apt-get upgrade -y

## Install base packagess
sudo apt-get install -y \
    vim \
    tmux \
    openjdk-8-jdk \
    git \
    scala \
    python-pip \
    wget \
    meld \
    unzip \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


## Remove old versions of docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc

## Setup Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

## Update dependencies and install docker
sudo apt-get update
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

## Add my normal user "jhood" to the docker group
sudo usermod -aG docker $USER

## Get a python environment working
sudo pip install virtualenv tox

echo "Setup completed! Log out and log back in to finish."

