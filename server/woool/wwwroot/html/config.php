<?php

	session_start();
	date_default_timezone_set('PRC');
	
	//API密钥 和客户端调用参数匹配的  用于验证访问来源的
	$token = 'de6cd28f4c24273a131821a8awelcometo90175comandwkymwcom';
	
	
	$key = 'fd908a3f9bd8c8ec38722c02ee036b2f';
	//下发参数:ordernumber=订单号码&gameid=分区ID&userid=充值账号&realmoney=实际充值金额&paychannel=充值通道&gamecurrency=游戏币&sign=MD5(充值通道密钥订单号码充值账号实际充值金额游戏币)
	
	// ip 账号 密码 账号库名
	$db = array('172.17.0.2','root','123456','longwen','/var/www/logs/Tlogs'); 
	
?>
