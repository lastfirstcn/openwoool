--��Ѷdb��־������ݿ��ַ����
local tdlogConfig = 
{
	host = "119.147.15.140",
	port = 20026,
	user = "user_cqsj",
	passwd = "cqsj@2015",
	dbname = "db_cqsj_online",
}

--local tdlogConfig = 
--{
--	host = "127.0.0.1",
--	port = 3306,
--	user = "root",
--	passwd = "root",
--	dbname = "logger",
--}

function load_tdlog_config()
	return tdlogConfig.host, tdlogConfig.port, tdlogConfig.user, tdlogConfig.passwd, tdlogConfig.dbname
end