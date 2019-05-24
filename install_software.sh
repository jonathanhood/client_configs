#!/bin/bash

## Get the system up-to-date
sudo apt-get update
sudo apt-get upgrade -y

## Install base packages
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
    software-properties-common \
    python-virtualenv \
    python-tox


## Setup the SBT Repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo add-apt-repository "deb [arch=amd64] https://dl.bintray.com/sbt/debian /"

## Setup te Docker Repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

## Setup the vscode repository
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode \
    stable \
    main" 

## Remove old versions of docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc

## Update dependencies and install extra deps
sudo apt-get update
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    sbt \
    code

## Add my normal user "jhood" to the docker group
sudo usermod -aG docker $USER

## Download and extract postman
mkdir ~/apps
wget https://dl.pstmn.io/download/latest/linux64 -O ~/apps/postman.tgz
tar -xvf ~/apps/postman.tgz -C ~/apps
rm ~/apps/postman.tgz

echo
echo "Setup completed! Log out and log back in to finish."
echo

