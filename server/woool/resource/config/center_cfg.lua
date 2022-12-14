--center_cfg.lua

--中心服务器配置
center_config = 
{
	[1] = {addr = "192.168.1.102",	port = 20007, game_name = "cqsj",
		game_id = 1009, url = "http://www.obbo.ga:8080/api.php", app_secret = "5c7f4ea46f0d1c6c5c30693f24016374"},			--传世中心服务器
	-- [2] = {addr = "10.221.249.117",	port = 20007, game_name = "lw_ucloud", 
	-- 	game_id = 1002, url = "http://gameapi.szkuniu.com:80/api.php", app_secret = "06c2c654762a8b76ef64392b77e2e917"},			--内部中心服务器
}

--中心服务器数据库配置
mysql_config = 
{	
	[1] = {name = "backtool", user = "root", password = "123456", host = "127.0.0.1", port = 3306},			--传世	
	[2] = {name = "backtool", user = "root", password = "123456", host = "127.0.0.1", port = 3306},			--内部
}

--加载配置
function load_center_config(buff, configid)
	local luabuf = tolua.cast(buff, "LuaMsgBuffer")
	if luabuf then
		luabuf:pushString(center_config[configid].addr)
		luabuf:pushInt(center_config[configid].port)
	end
end
