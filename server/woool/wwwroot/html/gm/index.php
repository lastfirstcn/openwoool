<?php

require '../config.php';

$item1=array('222222'=>'元宝','888888'=>'绑定元宝','999998'=>'金钱','777777'=>'声望','333333'=>'荣誉','444444'=>'经验','555555'=>'功勋','666666'=>'熔炼值','111111'=>'个人贡献');

function so8($a,$b,$c,$d) {
	$so8 = @mysql_pconnect($a,$b,$c);
	mysql_query("set names latin1");
	mysql_select_db($d, $so8);
	return $so8;
}
function c86($a) {
	return intval(floor($a/128));
}
function b86($a,$b) {
	return $a%128+$b;
}
function item($a) {
	if($a>=128) {
		$a1=c86($a);
		$a0=b86($a,128);
		if($a1>=128) {
			$a2=c86($a1);
			$a1=b86($a1,128);
		} else {
			$a2='';
		}
		if($a2>=128) {
			$a3=c86($a2);
			$a2=b86($a2,128);
		} else {
			$a3='';
		}
		if($a3>=128) {
			$a4=c86($a3);
			$a3=b86($a3,128);
		} else {
			$a4='';
		}
	} else {
		$a2='';
		$a1=$a%128;
		$a0='';
	}
	$b='';
	if($a4!='') {
		$b=pack('c', $a4);
	}
	if($a3!='') {
		$b=pack('c', $a3).$b;
	}
	if($a2!='') {
		$b=pack('c', $a2).$b;
	}
	if($a1!='') {
		$b=pack('c', $a1).$b;
	}
	if($a0!='') {
		$b=pack('c', $a0).$b;
	}
	return bin2hex($b);
}
function itemnum($a,$b) {
	if($a>=128) {
		$aa=7+$b;
		$a1=c86($a);
		$a0=b86($a,128);
		if($a1>=128) {
			$a2=c86($a1);
			$a1=b86($a1,128);
			$aa=8+$b;
		} else {
			$a2='';
		}
		if($a2>=128) {
			$a3=c86($a2);
			$a2=b86($a2,128);
			$aa=9+$b;
		} else {
			$a3='';
		}
		if($a3>=128) {
			$a4=c86($a3);
			$a3=b86($a3,128);
			$aa=10+$b;
		} else {
			$a4='';
		}
	} else {
		$aa=6+$b;
	}
	return dechex($aa);
}
function Tlog($a) {
	$fp = fopen($a,"r");
	$a1='';
	while(! feof($fp)) {
		$a2=fgets($fp);
		if(substr($a2,0,11)=='SecTalkFlow') {
			$a2=explode("|",$a2);
			if(substr($a2[18],0,1)!='^') {
				$a1=$a1.'【'.$a2[8].'】：'.$a2[18].'<br/>';
			}
		}
	}
	fclose($fp);
	return $a1;
}
if($_POST[t]=='') {
	$time1=date('Y-m-d').' 00:00:00';
	$time2=date('Y-m-d').' 23:59:59';
} else {
	$time1=$_POST[t].' 00:00:00';
	$time2=$_POST[t].' 23:59:59';
}
$log6=Tlog($db[4].'.log');

$so8=so8($db[0],$db[1],$db[2],$db[3]) or die(mysql_error());

if($_SESSION[acc]!='') {

	$result=mysql_query("SELECT * FROM `paylog` WHERE `create_time` >= '$time1' AND `create_time` <= '$time2' ORDER BY `create_time` DESC");
	if($result&&mysql_num_rows($result)>0) {
		while($gm[] = mysql_fetch_array($result, MYSQL_NUM)) {
		}
		array_pop($gm);
	}

	if($_POST[roleName]!='') {
	    $roleName = $_POST[roleName];
    	$sql="SELECT `RoleID`,`UserID` FROM player WHERE `Name` = '$roleName' LIMIT 1";
    	$result=mysql_query($sql,$so8);
    	if($result&&mysql_num_rows($result)>0) {
    		$dwID = mysql_fetch_array($result, MYSQL_NUM);
    	}
	}

}

switch($_POST[t3]) {
	case '登录': {
		if($_POST[acc]!='' and $_POST[passwd]!='') {
		    $acc = $_POST[acc];
		    $password = $_POST[passwd];
		    //echo '<script>alert("'.$_POST[passwd].'");</script>';
			$result=mysql_query("SELECT `type` FROM GM WHERE `acc` = '$acc' AND `pass` = '$password'");
			if($result&&mysql_num_rows($result)>0) {
				$t = mysql_fetch_array($result, MYSQL_NUM);
				$_SESSION['acc']=array($_POST[acc],$t[0]);
			} else {
				echo '<script>alert("账号密码错误，请重新登陆");</script>';
			}
		}
		break;
	}
	case '退出': {
		$_SESSION['acc']='';
		break;
	}
	case '注册': {
		//if($_POST[acc]!='' and $_POST[passwd]!='') {
		//	mysql_query("INSERT INTO `gm` (`user_name`,`password`,`type`) VALUES ('$_POST[acc]','$_POST[passwd]','2')")or die('<script>alert("Account Duplicate");history//.go(-1);</script>');
		//	$_SESSION['acc']=array($_POST[acc],0);
		//}
		break;
	}
	case '兑换积分':{



	    if($_POST[exchange]!='') {

            	$result1 = mysql_query("SELECT sum(num) FROM exchangelog WHERE `role_id` = '$dwID[0]' and `type` = 1 ");
    			if($result1 && mysql_num_rows($result1)>0) {
    			    $exchange = mysql_fetch_array($result1, MYSQL_NUM);
    			}

            	$result2 = mysql_query("SELECT sum(num) FROM exchangelog WHERE `role_id` = '$dwID[0]' and `type` = 2 ");
    			if($result2 && mysql_num_rows($result2)>0) {
    			    $exchange2 = mysql_fetch_array($result2, MYSQL_NUM);
    			}

            	$num = $_POST[exchange];

            	if(($exchange[0] - $exchange2[0]) < $num){
        	    	$response = '{ "code" : "-1", "message" : "积分不足"'. ($exchange[0] - $exchange2[0]).' }';
                    exit($response);
            	}else{
            	    $sql = "insert into exchangelog(role_id,role_name,item_id,num,type,description) value('$dwID[0]','$roleName','1081','$num',2,'GM')";

                    $result = mysql_query($sql,$so8);

                	$response = '{ "code" : "1", "message" : "兑换成功" }';
                    exit($response);
            	}

		}
		break;
	}
	case '提升权限': {
		if($_POST[acc]!='') {
			mysql_query("UPDATE `GM` SET `type`='1' WHERE (`acc`='$_POST[acc]')");
			echo '<script>alert("提升权限成功");</script>';
		}
		break;
	}
	case '撒消权限': {
		if($_POST[acc]!='') {
			mysql_query("UPDATE `GM` SET `type`='0' WHERE (`acc`='$_POST[acc]')");
			echo '<script>alert("撒消权限成功");</script>';
		}
		break;
	}
	case '修改等级': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			mysql_query("UPDATE `player` SET `Level`='$_POST[num]' WHERE (`RoleID`='$dwID[0]')");
			mysql_query("CALL GM('$dwID[0]')");
			mysql_query("INSERT INTO `paylog` (`title`, `description`, `num`) VALUES ('修改等级', '$_POST[acc]', '$_POST[num]')");
			echo '<script>alert("修改等级成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '修改密码': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			$PwdHash=md5($dwID[1].$_POST[num]);
			mysql_query("UPDATE `user` SET `PwdHash`='$PwdHash' WHERE (`UserID`='$dwID[1]')");
			$t=$_POST[acc]."|".$_POST[num];
			mysql_query("INSERT INTO `paylog` (`title`, `description`, `num`) VALUES ('修改密码', '$t', '$_POST[num]')");
			echo '<script>alert("修改密码成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '查封': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			mysql_query("replace into lockplayer(RoleID, LockDate) value('$dwID[0]', '-1')");
			mysql_query("INSERT INTO `paylog` (`title`, `description`) VALUES ('封号', '$_POST[acc]')");
			echo '<script>alert("查封['.$dwID[0].']成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '解封': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			mysql_query("replace into lockplayer(RoleID, LockDate) value('$dwID[0]', '0')");
			mysql_query("INSERT INTO `paylog` (`title`, `description`) VALUES ('解封', '$_POST[acc]')");
			echo '<script>alert("解封成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '禁言': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			mysql_query("UPDATE `player` SET `SpeakTick`='-1' WHERE (`RoleID`='$dwID[0]')");
			mysql_query("INSERT INTO `paylog` (`title`, `description`) VALUES ('禁言', '$_POST[acc]')");
			echo '<script>alert("禁言成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '解禁': {
		if($dwID!='' and $_SESSION['acc'][1]>0) {
			mysql_query("UPDATE `player` SET `SpeakTick`='0' WHERE (`RoleID`='$dwID[0]')");
			mysql_query("INSERT INTO `paylog` (`title`, `description`) VALUES ('解禁', '$_POST[acc]')");
			echo '<script>alert("解禁成功");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '发送邮件': {

		if($dwID!='' and $_SESSION[acc][1]>0) {
			$_POST[wid1]=rtrim($_POST[wid1],';');
			$it0=explode(';',$_POST[wid1]);
			$it='';
			foreach($it0 as $it1) {
				$it2=explode('-',$it1);
				if($item1[$it2[0]]!='') {
					$t=$_POST[acc].'｜获得｜'.$item1[$it2[0]];
				} else {
					$t=$_POST[acc].'｜获得｜'.$it2[0];
				}
				mysql_query("INSERT INTO `paylog` (`role_id`,`title`, `description`,`num`) VALUES ('$dwID[0]','发送邮件', '$t', '$it2[1]')");
				$it1=item($it2[0]);
				$it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);
				$it2=item($it2[1]);
				$it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;
			}
			$it1='3018'.$it;

			//echo $it1;  //301852 07 08 ffe0f401 10 01 2801
			mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$dwID[0]',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());
			echo '<script>alert("发送邮件成功，重上游戏到账");</script>';
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
	case '全服邮件': {
		if($dwID!='' and $_SESSION['acc'][1]>1) {
			$t='';
			$_POST[wid1]=rtrim($_POST[wid1],';');
			$it0=explode(';',$_POST[wid1]);
			$it='';
			foreach($it0 as $it1) {
				$it2=explode('-',$it1);
				if($item1[$it2[0]]!='') {
					$tt=$item1[$it2[0]];
				} else {
					$tt=$it2[0];
				}
				$t[]=array($tt,$it2[1]);
				$it1=item($it2[0]);
				$it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);
				$it2=item($it2[1]);
				$it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;
			}
			$it1='3018'.$it;
			$sql="SELECT `RoleID`,`Name` FROM player";
			$result=mysql_query($sql,$so8);
			if($result&&mysql_num_rows($result)>0) {
				while($dwID = mysql_fetch_array($result,MYSQL_NUM)) {
					foreach($t as $value) {
						$tt=$dwID[1].'｜获得｜'.$value[0];
						mysql_query("INSERT INTO `paylog` (`title`, `description`,`num`) VALUES ('全服邮件', '$tt', '$value[1]')");
					}
					mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$dwID[0]',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());
				}
				echo '<script>alert("全服邮件成功，重上游戏到账");</script>';
			}
		} else {
			echo '<script>alert("权限不足，不能操作");</script>';
		}
		break;
	}
}
?>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <title>元神传世· 后台</title>
     <meta name="keywords" content=""/>
     <meta name="description" content=""/>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	 <link rel="stylesheet" href="../style.css">
	 <style>
	 	.title{
	 		font-size: 30px;
    		color: #222222;
    		padding:40px;
    		font-weight: bold;
	 	}
	 	.form{
	 		padding:20px;
	 		color: #555555;
	 	}
	 	.form input{
	 		margin:5px;
	 	}

	 	.form .inputMin{
	 		margin:5px;
	 		width:130px;
	 	}
	 </style>
</head>
<body>
<div class="flex_column">
	<div class="title text_center">元神GM后台</div>
</div>
<div>
	<form action="" method="post" class="form">
		<?php if($_SESSION['acc']=='') {
			?>

			<div class="form-group">
                <label for="acc">用户名</label>
                <input type="text" class="form-control" name="acc" placeholder="请输入用户名">
            </div>

            <div class="form-group">
                <label for="passwd">密码</label>
                <input type="password" class="form-control" name="passwd" placeholder="请输入密码">
            </div>

            <div class="form flex_row">
				<button type="submit" class="btn btn-info" name="t3" value="登录">登录</button>
			</div>

			<?php
		} else {
			if($_SESSION['acc'][1]>0) {
				?>

				<div class="flex_row_left">
					<div><?php echo $_SESSION['acc'][0] ?></div>
					<input type="submit" class="btn" value="退出" name="t3" /><br />
				</div>

				<div class="form-group">
                    <label for="roleName">角色名</label>
                    <input type="text" class="form-control" name="roleName" placeholder="请输入角色名">
                </div>

				<div class="flex_row_left">
				    <div class="form-group">
                        <label for="item">物品ID</label>
                        <input type="text" class="form-control inputMin" id="wid" name="wid" placeholder="请输入物品ID">
                    </div>

                    <div class="form-group">
                        <label for="num">数量</label>
                        <input type="text" class="form-control inputMin" id="num" name="num" value="1" placeholder="请输入数量">
                    </div>

                    <button type="button" class="btn btn-info" name="t3" value="添加" style="margin-top:10px;"
    				        onclick="wid1.value+=wid.value+'-'+num.value+'-1;';">添加</button>

				</div>


				<div>
					<input type="button" value="+元宝" onclick="wid1.value+='222222-'+num.value+'-0;';" />
					<input type="button" value="+绑定元宝" onclick="wid1.value+='888888-'+num.value+'-0;';"/>
					<input type="button" value="+金钱" onclick="wid1.value+='999998-'+num.value+'-0;';"/>
					<input type="button" value="+声望" onclick="wid1.value+='777777-'+num.value+'-0;';"/>
					<input type="button" value="+荣誉" onclick="wid1.value+='333333-'+num.value+'-0;';"/>
					<input type="button" value="+经验" onclick="wid1.value+='444444-'+num.value+'-0;';"/>
					<input type="button" value="+功勋" onclick="wid1.value+='555555-'+num.value+'-0;';"/>
					<input type="button" value="+熔炼值" onclick="wid1.value+='666666-'+num.value+'-0;';"/>
					<input type="button" value="+个人贡献" onclick="wid1.value+='111111-'+num.value+'-0;';"/>
					<input type="button" value="+强化技能灵丹" onclick="wid1.value+='2015-'+num.value+'-1;';"/>
					<input type="submit" value="修改等级" name="t3" />
					<input type="submit" value="修改密码" name="t3" />
					<input type="submit" value="查封" name="t3" />
					<input type="submit" value="解封" name="t3" />
					<input type="submit" value="禁言" name="t3" />
					<input type="submit" value="解禁" name="t3" />
				</div>
				<div class="flex_row text_left">
					<textarea class="form-control" rows="4" cols="30" id="wid1" name="wid1" placeholder="id-数量;id-数量;id-数量;"></textarea>
					<div class="flex_column" style="margin-left:10px;">
					    <button type="submit" class="btn btn-info" name="t3" value="发送邮件">发送邮件</button>
					    <button type="submit" class="btn btn-info" name="t3" value="全服邮件">全服邮件</button>
					</div>
				</div>

				<div class="flex_row_left">
    				<div class="form-group">
                        <label for="exchange">积分兑换</label>
                        <input type="text" class="form-control" name="exchange"
                        style="width:200px;" placeholder="请输入积分数量">
                    </div>

        			<button type="submit" class="btn btn-info" name="t3" value="兑换积分" style="margin-top:10px;">兑换积分</button>
    			</div>

			<?php
			}

			?>

			<div class="flex_row">

				<input type="date" name="t" class="btn" style="width:200px;"/>
				<input type="submit" class="btn" value="查询" name="t3" />

			</div>

			<table style="width:100%;font-size:10px;" cellpadding="0" cellspacing="0" border="1">
				<tr>
					<th>角色ID</th>
					<th>订单号</th>
					<th>标题</th>
					<th>描述</th>
					<th>数量</th>
					<th>首充奖励领取</th>
					<th>日期</th>
				</tr>
				<?php
				if($gm!='') {
					foreach($gm as $value) {
						echo '<tr style="color:#666666;"><td>'.$value[1].'</td><td>'.$value[2].'</td><td>'.$value[3].'</td><td>'.$value[4].'</td><td>'.$value[5].'</td><td>'.$value[6].'</td><td>'.$value[7].'</td></tr>';
					}
				}
				?>
			</table>
			<?php
		}
		?>
	</form>
</div>
</body>
</html>
