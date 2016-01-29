#!/usr/bin/env bash
echo ">>> Installing Node.js"

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -qq -y nodejs
