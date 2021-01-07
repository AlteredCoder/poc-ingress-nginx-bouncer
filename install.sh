#!/bin/sh

PLUGIN_NAME="cs-ingress-nginx-bouncer"
PLUGIN_PATH="/etc/nginx/lua/plugins/${PLUGIN_NAME}"

mkdir -p ${PLUGIN_PATH}
pwd
git clone https://github.com/crowdsecurity/lua-cs-bouncer.git
cp lua-cs-bouncer/lib/*.lua /etc/nginx/lua/plugins/${PLUGIN_NAME}
wget https://raw.githubusercontent.com/AlteredCoder/poc-ingress-nginx-bouncer/main/main.lua
ls /etc/nginx/lua/plugins/
cp main.lua ${PLUGIN_PATH}/
echo "OK"