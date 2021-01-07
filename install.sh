#!/bin/sh

PLUGIN_NAME="cs-ingress-nginx-bouncer"
PLUGIN_PATH="/etc/nginx/lua/plugins/${PLUGIN_NAME}"

mkdir -p ${PLUGIN_PATH}
git clone https://github.com/crowdsecurity/lua-cs-bouncer.git ${PLUGIN_PATH}/
wget https://raw.githubusercontent.com/AlteredCoder/poc-ingress-nginx-bouncer/main/main.lua
cp main.lua ${PLUGIN_PATH}/
