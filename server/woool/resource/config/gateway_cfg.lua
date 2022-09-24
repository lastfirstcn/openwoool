--gateway_cfg.lua

--1-99999为gateway服务器ID
local gateway_servers = 
{
	--1-799为内测服务器组
--	[1] = {name = "gateway_105W", connectAddr = '120.132.53.105', loginAddr = '10.10.2.230', loginPort = 20020, 
--		sessionAddr = '10.10.2.230:2300', worldPort = 2200},
	--700为版署服务器
	[700] = {name = "gateway_217W", connectAddr = '123.59.54.217:20020', loginAddr = '10.10.109.16', loginPort = 20020, 
		sessionAddr = '10.10.109.16', sessionPort = 2300, worldPort= 2200},
	--800后为预发布服务器
	[800] = {name = "gateway_180W", connectAddr = '18.143.152.206:20020', loginAddr = '18.143.152.206', loginPort = 20020, 
		sessionAddr = '127.0.0.1', sessionPort = 2300, worldPort= 2200},
	[801] = {name = "gateway_105W", connectAddr = '103.91.211.169:20030', loginAddr = '103.91.211.169', loginPort = 20030, 
		sessionAddr = '127.0.0.1', sessionPort = 2300, worldPort= 2200},
	--900为本地私服，901为内网
	[900] = {name = "gateway", connectAddr = '192.168.1.39:20020', loginAddr = '192.168.1.39', loginPort = 20020, 
		sessionAddr = '127.0.0.1', sessionPort = 2300, worldPort= 2200},
	[901] = {name = "gateway_10", connectAddr = '119.29.35.50:20020', loginAddr = '10.104.58.185', loginPort = 20020, 
		sessionAddr = '119.29.35.50', sessionPort = 2300, worldPort= 2200},
	[902] = {name = "gateway_48", connectAddr = '192.168.101.32:20020', loginAddr = '192.168.101.32', loginPort = 20020, 
		sessionAddr = '192.168.101.32', sessionPort = 2300, worldPort= 2200},
}

--加载gateway配置
function load_gateway_config(buff, gateway_server_id)
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		local server_info = gateway_servers[gateway_server_id]
		luabuf:pushInt(server_info and server_info.worldPort or 2200)
		luabuf:pushInt(server_info and server_info.loginPort or 20020)
		luabuf:pushInt(server_info and server_info.sessionPort or 2300)
		luabuf:pushString(server_info and server_info.loginAddr or "127.0.0.1")
		luabuf:pushString(server_info and server_info.connectAddr or "127.0.0.1:20020")
		luabuf:pushString(server_info and server_info.sessionAddr or "127.0.0.1")
		
		luabuf:pushShort(#RAND_NAMES)
		for i, info in pairs(RAND_NAMES) do
			luabuf:pushShort(info.f_id)
			luabuf:pushString(info.f_value)
		end
	end
end

