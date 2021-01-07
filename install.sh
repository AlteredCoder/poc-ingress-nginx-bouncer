#!/bin/sh

#PLUGIN_NAME="cs-ingress-nginx-bouncer"
#PLUGIN_PATH="/etc/nginx/lua/plugins/${PLUGIN_NAME}"
#LIB_PATH="/etc/nginx/lua/"
#mkdir -p ${PLUGIN_PATH}
#git clone https://github.com/crowdsecurity/lua-cs-bouncer.git
#cp lua-cs-bouncer/lib/*.lua ${LIB_PATH}
#wget https://raw.githubusercontent.com/AlteredCoder/poc-ingress-nginx-bouncer/main/main.lua
#ls /etc/nginx/lua/plugins/
#cp main.lua ${PLUGIN_PATH}/

wget https://github.com/crowdsecurity/cs-nginx-bouncer/releases/download/v0.0.4/cs-nginx-bouncer.tgz
tar xzvf cs-nginx-bouncer.tgz
cd cs-nginx-bouncer-v*
chmod +x install.sh
echo "y" | sh install.sh