#!/usr/bin/env bash

echo ">>> Installing Supervisord"

# Supervisord
# -qq implies -y --force-yes
sudo apt-get install -qq supervisor

sed -i "s:files = /etc/supervisor/conf.d/\*.conf:files = /vagrant/etc/supervisor/*.ini:" /etc/supervisor/supervisord.conf

sudo service supervisor restart