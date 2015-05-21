#!/bin/bash

# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get update
sudo apt-get install nodejs -y

sudo npm install -g grunt-cli bower
