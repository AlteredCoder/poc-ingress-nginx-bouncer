package.path = package.path .. ";./lib/?.lua"

local ngx = ngx

local _M = {}

function _M.init_worker()
	cs = require "CrowdSec"
	local ok, err = cs.init("/etc/crowdsec/cs-nginx-bouncer/crowdsec.conf", "cs-nginx-bouncer/v0.0.4")
	if ok == nil then
		ngx.log(ngx.ERR, "[Crowdsec] " .. err)
		error()
	end
	ngx.log(ngx.ERR, "[Crowdsec] Initialisation done")
end

function _M.rewrite()
    -- Convert the Ip to integer, and check if present in sqlite
    ok, err = require "CrowdSec".allowIp(ngx.var.remote_addr)
    if err ~= nil then 
        ngx.log(ngx.ERR, "[Crowdsec] bouncer error " .. err)
    end
    if ok == nil then
    ngx.log(ngx.ERR, "[Crowdsec] " .. err)
    end
    if not ok then
        ngx.log(ngx.ERR, "[Crowdsec] denied '" .. ngx.var.remote_addr .. "'")
        ngx.exit(ngx.HTTP_FORBIDDEN)
end


end


return _M