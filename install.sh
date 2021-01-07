#!/bin/sh

PLUGIN_NAME="cs-ingress-nginx-bouncer"
PLUGIN_PATH="/etc/nginx/lua/plugins/${PLUGIN_NAME}"
LIB_PATH="/etc/nginx/lua/"
mkdir -p ${PLUGIN_PATH}
git clone https://github.com/crowdsecurity/lua-cs-bouncer.git
cp lua-cs-bouncer/lib/*.lua ${LIB_PATH}
wget https://raw.githubusercontent.com/AlteredCoder/poc-ingress-nginx-bouncer/main/main.lua
ls /etc/nginx/lua/plugins/
cp main.lua ${PLUGIN_PATH}/