<?php

header('Content-Type:application/json; charset=utf-8');
require '../config.php';

$data = $_POST;
$action = $data['action'];
$roleId = $data['roleId'];
$tokenServerList = "de6cd28f4c24273a131821a8awelcometo90175comandwkymwcom";

if ($action == "serverList"){
    if($data['token'] != $tokenServerList){
        $response = '{ "code" : "-1", "message" : "404 IP地址和端口错误" }';
        exit($response);
    }
}else{
    if($data['token'] != $token){
        $response = '{ "code" : "-1", "message" : "404 IP地址和端口错误" }';
        exit($response);
    }
}


function c86($a){return intval(floor($a/128));}
function b86($a,$b){return $a%128+$b;}

function item($a){
    if($a>=128){
        $a1=c86($a);
        $a0=b86($a,128);
        if($a1>=128){$a2=c86($a1);$a1=b86($a1,128);}else{$a2='';}
        if($a2>=128){$a3=c86($a2);$a2=b86($a2,128);}else{$a3='';}
        if($a3>=128){$a4=c86($a3);$a3=b86($a3,128);}else{$a4='';}
    }else{
        $a2='';$a1=$a%128;$a0='';
    }
    $b='';
    if($a4!=''){$b=pack('c', $a4);}
    if($a3!=''){$b=pack('c', $a3).$b;}
    if($a2!=''){$b=pack('c', $a2).$b;}
    if($a1!=''){$b=pack('c', $a1).$b;}
    if($a0!=''){$b=pack('c', $a0).$b;}
    return bin2hex($b);
}
function itemnum($a,$b){
    if($a>=128){
        $aa=7+$b;
        $a1=c86($a);
        $a0=b86($a,128);
        if($a1>=128){$a2=c86($a1);$a1=b86($a1,128);$aa=8+$b;}else{$a2='';}
        if($a2>=128){$a3=c86($a2);$a2=b86($a2,128);$aa=9+$b;}else{$a3='';}
        if($a3>=128){$a4=c86($a3);$a3=b86($a3,128);$aa=10+$b;}else{$a4='';}
    }else{
        $aa=6+$b;
    }
    return dechex($aa);
}

function so8($a,$b,$c,$d) {
    $so8 = @mysql_pconnect($a,$b,$c);
    mysql_query("set names latin1");
    mysql_select_db($d, $so8);
    return $so8;
}

if ($action == "serverList"){
    $data = '{"version":"1.0.0","default":[1],
        "servers":[
            {
                "id":1,"name":"传世回忆区","status":1,
                "ip":"18.143.152.206","port":20013,
                "gamename":"传世回忆区",
                "apiport":81,
                "apipath":"",
                "index":"http://18.143.152.206:81/index.html",
                "register":"http://18.143.152.206:81/register.php",
                "pay":"http://18.143.152.206:81/pay/pay2.php",
                "bbs":"http://18.143.152.206:81/bbs.php",
                "notice":"沧海传世.客服微信:slwcjy.cn;客服QQ:1337861109."

            }
        ]
    }';

    echo $data;

}else if($action == "login"){
    if($_POST[username]!='' and $_POST[password]!='') {
        $username = $_POST[username];
        $PwdHash=md5($_POST[username].$_POST[password]);

        $so8 = so8($db[0],$db[1],$db[2],$db[3]);
        $result = mysql_query("SELECT * FROM user WHERE `Username` = '$username' AND `PwdHash` = '$PwdHash'",$so8);

        if($result&&mysql_num_rows($result)>0) {
            $t = mysql_fetch_array($result, MYSQL_NUM);
            //$_SESSION['acc']=array($_POST[acc],$t[0]);
            //登录成功返回获取分区列表的token
            $response = '{ "code" : "1","token":"'.$tokenServerList.'", "message" : "登录成功" }';
            exit($response);
        } else {
            $response = '{ "code" : "-1", "message" : "账户名或密码错误" }';
            exit($response);
        }
    }

}else if ($action == "firstPay"){


    $so8 = so8($db[0],$db[1],$db[2],$db[3]);


    $firstpaystate = 1;  //未充值

    $gmlogsql = "SELECT * FROM paylog WHERE `role_id`='$roleId' order by pay_id asc";
    $result = mysql_query($gmlogsql,$so8);
    if($result && mysql_num_rows($result)>0){
        $row = mysql_fetch_array($result);
        $getfirstpay = $row['get_first_pay'];

        if ($getfirstpay == 1){
            $response = '{ "code" : "-1", "message" : "已经充过值,已领取" }';
            exit($response);
        }else{
            //已经充过值 未领取
            $firstpaystate = 0;
        }

    }

    $sql = "SELECT * FROM player WHERE `RoleID`='$roleId'";
    $result = mysql_query($sql,$so8);
    $wuqi = '2010101';
    $zq = '107';


    if($result && mysql_num_rows($result)>0){
         $row = mysql_fetch_array($result);

         $school = $row['School'];

         //4030111 离别钩 4020111狼牙  4010111井中月
         if ($school == 1){
            $wuqi = '4010115';
            $zq = '1415';
         }else if($school == 2){
            $wuqi = '4020111';
            $zq = '1415';
         }else if($school == 3){
            $wuqi = '4030111';
            $zq = '1415';
         }
    }



    //物品从propCfg获取
    $data = '{"code":"1","message":"首充礼包查询成功",
        "netData":{"contentText":"","endTick":0,"dayNum":0,"state":'.$firstpaystate.',"startTick":0,
            "awards" : [
                {"num":1,"streng":0,"showBind":true,"isBind":false,"time":0,"id":' .$wuqi.'},
                {"num":1,"streng":0,"showBind":true,"isBind":true,"time":0,"id":'.$zq.'},
                {"num":10,"streng":0,"showBind":true,"isBind":false,"time":0,"id":20023},
                {"num":10,"streng":0,"showBind":true,"isBind":false,"time":0,"id":1405},
                {"num":5,"streng":0,"showBind":true,"isBind":true,"time":0,"id":1043}

            ]
        }
    }';


    echo $data;
}else if($action == "getFirstPay"){


    $items = $data['items'];

    $so8 = so8($db[0],$db[1],$db[2],$db[3]);


    $sql = "SELECT * FROM player WHERE `RoleID`='$roleId'";
    $result = mysql_query($sql,$so8);
    $roleName = '';

    if($result && mysql_num_rows($result)>0){
         $row = mysql_fetch_array($result);
         $roleName = $row['Name'];
    }

    $it0=explode(';',rtrim($items,';'));
    $it='';

    foreach($it0 as $it1){

        //echo $it1; //4020111-1-0

        $it2 = explode('-',$it1);
        $t = $roleName .'｜获得｜' . $it2[0];
        mysql_query("INSERT INTO `paylog` (`role_id`,`title`, `description`,`num`) VALUES ('$roleId','发送邮件', '$t', '$it2[1]')");

        $it1=item($it2[0]);
        $it3=str_pad(itemnum($it2[1],$it2[2]),2,'0',STR_PAD_LEFT);
        $it2=item($it2[1]);
        $it='52'.$it3.'08'.$it1.'10'.$it2.'2801'.$it;


    }
    $it1='3018'.$it;

    //echo $it1;

    mysql_query("INSERT INTO `email` (`roleID`, `emailIndex`, `datas`) VALUES ('$roleId',CONCAT('00',HEX(UNIX_TIMESTAMP()),'43820C'), CAST(UNHEX('$it1') AS CHAR))") or die(mysql_error());


    //更新paylog的字段为1已领取 亲 测 源 码网  ww w. q c ym w. c om
    mysql_query("UPDATE `paylog` SET `get_first_pay`='1' WHERE (`role_id`='$roleId')");

    $response = '{ "code" : "1", "message" : "领取成功" }';
    exit($response);

}else if($action == "costScore"){

    $so8 = so8($db[0],$db[1],$db[2],$db[3]);

    $sql = "SELECT * FROM player WHERE `RoleID`='$roleId'";
    $result = mysql_query($sql,$so8);
    $roleName = '';

    if($result && mysql_num_rows($result)>0){
         $row = mysql_fetch_array($result);
         $roleName = $row['Name'];
    }

    $num = $data['num'];
    $remain = $data['remain'];

    $sql = "insert into exchangelog(role_id,role_name,item_id,num,remain,type,description) value('$roleId','$roleName','1081','$num','$remain',1,'player')";

    $result = mysql_query($sql,$so8);

    $response = '{ "code" : "1", "message" : "兑换成功" }';
    exit($response);
}else if($action == "bindPhone"){

    $response = '{ "code" : "1", "message" : "绑定成功" }';
    exit($response);
}


?>
