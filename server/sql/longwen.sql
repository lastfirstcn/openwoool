/*
自己耗时修复的传世不回档、不回任务脚本
现免费赠送
Mysql 数据库请使用 5.6版本的最好，起码目前没回档过
另外已经把数据都清空了，留下一个干净的库
T9AM

Source Database       : longwen
Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-07-09 08:00:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for achieve
-- ----------------------------
DROP TABLE IF EXISTS `achieve`;
CREATE TABLE `achieve` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) DEFAULT '',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for achieveevent
-- ----------------------------
DROP TABLE IF EXISTS `achieveevent`;
CREATE TABLE `achieveevent` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) DEFAULT '""',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activecode
-- ----------------------------
DROP TABLE IF EXISTS `activecode`;
CREATE TABLE `activecode` (
  `code` varchar(64) NOT NULL,
  `status` int(4) DEFAULT '0',
  `openid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activecode
-- ----------------------------

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `modelID` int(4) NOT NULL COMMENT '??ID',
  `activityID` int(4) NOT NULL COMMENT '??ID',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`modelID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_list
-- ----------------------------
DROP TABLE IF EXISTS `activity_list`;
CREATE TABLE `activity_list` (
  `activityID` varchar(64) NOT NULL DEFAULT '' COMMENT '??ID',
  `gameActivityID` int(4) NOT NULL COMMENT '??ID',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_list
-- ----------------------------

-- ----------------------------
-- Table structure for activity_normal
-- ----------------------------
DROP TABLE IF EXISTS `activity_normal`;
CREATE TABLE `activity_normal` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) not NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for adore
-- ----------------------------
DROP TABLE IF EXISTS `adore`;
CREATE TABLE `adore` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bossinfo
-- ----------------------------
DROP TABLE IF EXISTS `bossinfo`;
CREATE TABLE `bossinfo` (
  `ModelId` int(11) NOT NULL DEFAULT '0',
  `MapId` int(11) NOT NULL DEFAULT '0',
  `Event` int(11) NOT NULL DEFAULT '0',
  `EvtTime` datetime DEFAULT NULL,
  `EvtValue1` int(11) DEFAULT NULL,
  PRIMARY KEY (`ModelId`,`MapId`,`Event`),
  KEY `MapId` (`MapId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bossinfo
-- ----------------------------
INSERT INTO `bossinfo` VALUES ('6001', '2114', '2', '2019-06-20 22:55:45', '70');
INSERT INTO `bossinfo` VALUES ('6001', '2114', '3', '2019-06-11 05:00:00', '4');
INSERT INTO `bossinfo` VALUES ('6002', '2123', '2', '2019-06-21 04:01:20', '53');
INSERT INTO `bossinfo` VALUES ('6002', '2123', '3', '2019-06-18 05:00:00', '6');
INSERT INTO `bossinfo` VALUES ('6004', '3122', '2', '2019-06-20 22:44:37', '66');
INSERT INTO `bossinfo` VALUES ('6004', '3122', '3', '2019-06-18 05:00:00', '8');
INSERT INTO `bossinfo` VALUES ('6005', '4124', '2', '2019-06-20 23:21:11', '64');
INSERT INTO `bossinfo` VALUES ('6005', '4124', '3', '2019-06-18 05:00:00', '9');
INSERT INTO `bossinfo` VALUES ('6006', '4112', '2', '2019-06-20 21:13:12', '118');
INSERT INTO `bossinfo` VALUES ('6006', '4112', '3', '2019-06-05 05:00:00', '8');
INSERT INTO `bossinfo` VALUES ('6007', '4132', '2', '2019-06-20 22:18:14', '76');
INSERT INTO `bossinfo` VALUES ('6007', '4132', '3', '2019-06-13 05:00:00', '21');
INSERT INTO `bossinfo` VALUES ('6008', '2133', '2', '2019-06-20 04:23:56', '45');
INSERT INTO `bossinfo` VALUES ('6008', '2133', '3', '2019-06-18 05:00:00', '9');
INSERT INTO `bossinfo` VALUES ('6053', '3112', '2', '2019-06-20 21:42:02', '97');
INSERT INTO `bossinfo` VALUES ('6053', '3112', '3', '2019-06-02 05:00:00', '5');

-- ----------------------------
-- Table structure for buff
-- ----------------------------
DROP TABLE IF EXISTS `buff`;
CREATE TABLE `buff` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for common
-- ----------------------------
DROP TABLE IF EXISTS `common`;
CREATE TABLE `common` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for commondata
-- ----------------------------
DROP TABLE IF EXISTS `commondata`;
CREATE TABLE `commondata` (
  `worldID` int(11) NOT NULL,
  `dataID` int(11) NOT NULL,
  `dataValue` varchar(2048) NOT NULL,
  PRIMARY KEY (`worldID`,`dataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commondata
-- ----------------------------
INSERT INTO `commondata` VALUES ('800', '2', '{{[1]=\"901128579290774400\",[2]=\"ç¶ºæ¥½èŠ»\",[3]=2,[4]=17,[5]=1560624837,[6]=0,[8]=1560776403}}');
INSERT INTO `commondata` VALUES ('800', '5', '{}');
INSERT INTO `commondata` VALUES ('800', '7', '{roleInfo={901128592145005120={8,7},901128554580032448={8,7},901128555020169344={7,8},901128579290774400={8,7}},stamp=20190618}');
INSERT INTO `commondata` VALUES ('800', '8', '{{memName=\"å¤§é­”çŽ‹\",num=26,facName=\"é€é¥é˜\",addTime=1560851009},{memName=\"å¤§é­”çŽ‹\",num=21,facName=\"é€é¥é˜\",addTime=1560851014},{memName=\"å¤§é­”çŽ‹\",num=99,facName=\"é€é¥é˜\",addTime=1560851034},{memName=\"é¥•é¥•é¥•é¤®é¥•é¥•\",num=3,facName=\"é€é¥é˜\",addTime=1560865119},{memName=\"é¥•é¥•é¥•é¥•é¤®é¥•\",num=8,facName=\"é€é¥é˜\",addTime=1560873197},{memName=\"Herk\",num=7,facName=\"é€é¥é˜\",addTime=1560874096},{memName=\"é¸Ÿå¤§äºº\",num=100,facName=\"é€é¥é˜\",addTime=1560901207},{memName=\"èª“è¨€\",num=1,facName=\"é€é¥é˜\",addTime=1560920899},{memName=\"èª“è¨€\",num=1,facName=\"é€é¥é˜\",addTime=1560920900},{memName=\"èª“è¨€\",num=1,facName=\"é€é¥é˜\",addTime=1560920901},{memName=\"èª“è¨€\",num=1,facName=\"é€é¥é˜\",addTime=1560920901},{memName=\"èª“è¨€\",num=1,facName=\"é€é¥é˜\",addTime=1560920902},{memName=\"é¥•é¥•é¥•é¥•é¤®é¥•\",num=6,facName=\"é€é¥é˜\",addTime=1560936036},{memName=\"çˆºä¸¶è·¨çœå°‹æ­¡\",num=5,facName=\"é€é¥é˜\",addTime=1560947845},{memName=\"èª“è¨€\",num=9,facName=\"é€é¥é˜\",addTime=1560959673},{memName=\"Herk\",num=14,facName=\"é€é¥é˜\",addTime=1560960968},{memName=\"å°é»„èœ‚\",num=1,facName=\"é€é¥é˜\",addTime=1560973842},{memName=\"é¥•é¥•é¥•é¥•é¤®é¥•\",num=7,facName=\"é€é¥é˜\",addTime=1560974967},{memName=\"çˆºä¸¶è·¨çœå°‹æ­¡\",num=1,facName=\"é€é¥é˜\",addTime=1560976832},{memName=\"é¥•é¥•é¥•é¤®é¥•é¥•\",num=8,facName=\"é€é¥é˜\",addTime=1561039893}}');
INSERT INTO `commondata` VALUES ('800', '11', '{{{dbid=\"901128554572423168\",Lv=46,name=\"äº”æ¥¼ã€\",exp=6855638},{dbid=\"901128554632721024\",Lv=53,name=\"å®™æ–¯\",exp=17446996}},{{dbid=\"901128554917670656\",Lv=53,name=\"Herk\",exp=20560833},{dbid=\"901128583387818496\",Lv=54,name=\"æ³•æ—¨\",exp=39024029}},{{dbid=\"901128554587107008\",Lv=52,name=\"ä¸ç‹¼é’å¹´\",exp=18376917},{dbid=\"901128554833785152\",Lv=51,name=\"é¥•é¥•é¥•é¥•é¤®é¥•\",exp=14760607}}}');
INSERT INTO `commondata` VALUES ('800', '14', '{[6051]=1,[6007]=1,[6005]=1,[6003]=1,[6053]=1,[6004]=1,[6008]=2,[6001]=1,[6002]=1,[6052]=1,[6006]=1}');
INSERT INTO `commondata` VALUES ('800', '17', '{901128779248445952=1560893264,901128651258738880=1560972551,901128664478923008=1560972559,901128604287253184=1560972565,901128845590015360=1560893273,901128554591041600=1560972544}');
INSERT INTO `commondata` VALUES ('800', '18', '\n\n901128555902280576 Â\n\n901128579215275584 Â\n\n901128680342038336 Â\n\Z\n901128574098485952 Â\n\n901128798600703168 Â\n\n901128761482947136à‚H\n\Z\n901128662800152640 Â');
INSERT INTO `commondata` VALUES ('800', '19', '{taskID=2,timeTick=20190708}');
INSERT INTO `commondata` VALUES ('800', '21', '{blackTick=20190708,black={{[1]={{price=1000,prob=100000,itemID=1219,limit=200,num=200,isBind=2,spe=0,roleLimit=20,sellnum=200},{price=88000,prob=1000,itemID=1510,limit=1,num=1,isBind=1,spe=3102,roleLimit=1,sellnum=1},{price=20,prob=500,itemID=1306,limit=100,num=100,isBind=1,spe=0,roleLimit=20,sellnum=100},{price=100,prob=500,itemID=6200091,limit=20,num=20,isBind=1,spe=0,roleLimit=5,sellnum=20},{price=120,prob=500,itemID=1403,limit=100,num=100,isBind=1,spe=0,roleLimit=20,sellnum=100},{price=1000,prob=500,itemID=5018,limit=50,num=50,isBind=1,spe=0,roleLimit=10,sellnum=50},{price=50,prob=500,itemID=1043,limit=500,num=500,isBind=1,spe=0,roleLimit=50,sellnum=500},{price=50,prob=1000,itemID=1081,limit=500,num=500,isBind=1,spe=0,roleLimit=50,sellnum=500}},lmax=99}},blackRH=12}');
INSERT INTO `commondata` VALUES ('800', '23', '{{1558952102,22,{\"è–åŸŽ\",\"é€é¥é˜\"}},{1559027875,22,{\"é€é¥é˜\",\"è–åŸŽ\"}},{1559068657,22,{\"è–åŸŽ\",\"é€é¥é˜\"}},{1559151066,17,{\"é€é¥é˜\",2}},{1559204399,17,{\"è–åŸŽ\",2}},{1560254402,18,{\"é€é¥é˜\",\"æœºå…³æ´ž\"}},{1560254402,18,{\"é€é¥é˜\",\"é€†é­”å¤åˆ¹\"}},{1560254402,18,{\"é€é¥é˜\",\"ç¦åœ°é­”ç©´\"}},{1560254402,18,{\"é€é¥é˜\",\"é€šå¤©å¡”\"}},{1560254402,18,{\"é€é¥é˜\",\"é“è¡€é­”åŸŽ\"}},{1560254402,18,{\"é€é¥é˜\",\"ä¿®ç½—å¤©\"}},{1560254570,23,{\"é€é¥é˜\",\"é€é¥é˜\"}},{1560427202,18,{\"é€é¥é˜\",\"é“è¡€é­”åŸŽ\"}},{1560427202,18,{\"é€é¥é˜\",\"ä¿®ç½—å¤©\"}},{1560773264,23,{\"é€é¥é˜\",\"é€é¥é˜\"}},{1560961000,22,{\"é€é¥é˜\",\"è–åŸŽ\"}}}');
INSERT INTO `commondata` VALUES ('801', '5', '{}');
INSERT INTO `commondata` VALUES ('801', '14', '{[6051]=2,[6007]=1,[6005]=1,[6003]=2,[6053]=2,[6004]=1,[6008]=2,[6001]=2,[6002]=2,[6052]=1,[6006]=2}');
INSERT INTO `commondata` VALUES ('801', '19', '{taskID=2,timeTick=20190602}');
INSERT INTO `commondata` VALUES ('801', '21', '{blackTick=20190602,black={{[1]={{price=1000,prob=100000,itemID=1219,limit=5,num=5,isBind=2,spe=0,roleLimit=1,sellnum=5},{price=20000,prob=1000,itemID=1510,limit=3,num=3,isBind=1,spe=3102,roleLimit=1,sellnum=3},{price=50,prob=1000,itemID=1081,limit=500,num=500,isBind=1,spe=0,roleLimit=50,sellnum=500},{price=50,prob=500,itemID=1043,limit=500,num=500,isBind=1,spe=0,roleLimit=50,sellnum=500},{price=120,prob=500,itemID=1403,limit=100,num=100,isBind=1,spe=0,roleLimit=20,sellnum=100},{price=1000,prob=500,itemID=5018,limit=50,num=50,isBind=1,spe=0,roleLimit=10,sellnum=50},{price=20,prob=500,itemID=1306,limit=100,num=100,isBind=1,spe=0,roleLimit=20,sellnum=100},{price=100,prob=500,itemID=6200091,limit=20,num=20,isBind=1,spe=0,roleLimit=5,sellnum=20}},lmax=99}},blackRH=12}');

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for copyreward
-- ----------------------------
DROP TABLE IF EXISTS `copyreward`;
CREATE TABLE `copyreward` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `idx` int(10) NOT NULL DEFAULT '0',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for copystarprize
-- ----------------------------
DROP TABLE IF EXISTS `copystarprize`;
CREATE TABLE `copystarprize` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `type` int(4) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for digmine
-- ----------------------------
DROP TABLE IF EXISTS `digmine`;
CREATE TABLE `digmine` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for droplimit
-- ----------------------------
DROP TABLE IF EXISTS `droplimit`;
CREATE TABLE `droplimit` (
  `itemID` int(11) NOT NULL,
  `dropCnt` int(11) NOT NULL DEFAULT '0',
  `dropPeriod` int(11) DEFAULT NULL,
  `timeTick` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of droplimit
-- ----------------------------

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `emailIndex` varchar(64) NOT NULL DEFAULT '0',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`emailIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for envoyinfo
-- ----------------------------
DROP TABLE IF EXISTS `envoyinfo`;
CREATE TABLE `envoyinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for faction
-- ----------------------------
DROP TABLE IF EXISTS `faction`;
CREATE TABLE `faction` (
  `factionID` int(11) NOT NULL,
  `world` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `leaderID` varchar(32) NOT NULL DEFAULT '',
  `leaderName` varchar(100) NOT NULL,
  `bannerLvl` int(11) DEFAULT '1',
  `xp` int(11) DEFAULT '1',
  `money` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `autoJoin` int(11) DEFAULT '0',
  `createTime` int(11) NOT NULL,
  `assLeaderNum` int(11) DEFAULT '0',
  `allMemberCnt` int(11) DEFAULT '1',
  `comment` varchar(1024) DEFAULT NULL,
  `ability` int(11) DEFAULT '0',
  `statueNum` int(11) DEFAULT '0',
  `statueTime` int(11) DEFAULT NULL,
  `apply` varchar(2048) DEFAULT NULL,
  `commandid` varchar(32) DEFAULT '0' COMMENT '???ID',
  `timeTick` int(11) NOT NULL DEFAULT '0',
  `openId` varchar(32) NOT NULL DEFAULT '""',
  PRIMARY KEY (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factioncontrird
-- ----------------------------
DROP TABLE IF EXISTS `factioncontrird`;
CREATE TABLE `factioncontrird` (
  `FactionID` int(11) NOT NULL DEFAULT '0',
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `RoleName` varchar(50) DEFAULT NULL,
  `ContriTime` int(11) DEFAULT NULL,
  `ContriNum` int(11) DEFAULT NULL,
  `FacMoneyBefore` int(11) DEFAULT NULL,
  `FacMoneyAfter` int(11) DEFAULT NULL,
  PRIMARY KEY (`FactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factioncopy
-- ----------------------------
DROP TABLE IF EXISTS `factioncopy`;
CREATE TABLE `factioncopy` (
  `factionID` int(11) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factioncopy
-- ----------------------------

-- ----------------------------
-- Table structure for factionsocial
-- ----------------------------
DROP TABLE IF EXISTS `factionsocial`;
CREATE TABLE `factionsocial` (
  `SocialID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `WorldID` int(11) NOT NULL,
  `AFactionID` int(11) NOT NULL,
  `BFactionID` int(11) NOT NULL,
  `State` int(11) NOT NULL DEFAULT '0',
  `OpRoleID` varchar(32) NOT NULL DEFAULT '',
  `OpFactionID` int(11) NOT NULL DEFAULT '0',
  `OpTime` bigint(11) NOT NULL DEFAULT '0',
  `AFactionOpTime` bigint(11) NOT NULL DEFAULT '0',
  `BFactionOpTime` bigint(11) NOT NULL DEFAULT '0',
  `Reserved` varchar(1024) NOT NULL DEFAULT '',
  `UpdateTime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`SocialID`),
  KEY `WorldID` (`WorldID`) USING BTREE,
  KEY `AFactionID` (`AFactionID`) USING BTREE,
  KEY `BFactionID` (`BFactionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factiontask
-- ----------------------------
DROP TABLE IF EXISTS `factiontask`;
CREATE TABLE `factiontask` (
  `factionID` int(11) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fightteam
-- ----------------------------
DROP TABLE IF EXISTS `fightteam`;
CREATE TABLE `fightteam` (
  `fightID` int(11) NOT NULL,
  `world` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `leaderID` varchar(32) NOT NULL DEFAULT '',
  `leaderName` varchar(100) NOT NULL,
  `winNum` int(11) DEFAULT '1',
  `loseNum` int(11) DEFAULT '1',
  PRIMARY KEY (`fightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fightteam
-- ----------------------------

-- ----------------------------
-- Table structure for fightteam3v3
-- ----------------------------
DROP TABLE IF EXISTS `fightteam3v3`;
CREATE TABLE `fightteam3v3` (
  `world` int(11) NOT NULL,
  `data` varchar(4098) DEFAULT '',
  PRIMARY KEY (`world`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fightteam3v3
-- ----------------------------

-- ----------------------------
-- Table structure for fightteammem
-- ----------------------------
DROP TABLE IF EXISTS `fightteammem`;
CREATE TABLE `fightteammem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `fightID` int(10) NOT NULL DEFAULT '0',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fightteammem
-- ----------------------------

-- ----------------------------
-- Table structure for gameset
-- ----------------------------
DROP TABLE IF EXISTS `gameset`;
CREATE TABLE `gameset` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for giveflower
-- ----------------------------
DROP TABLE IF EXISTS `giveflower`;
CREATE TABLE `giveflower` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for givefloweroffline
-- ----------------------------
DROP TABLE IF EXISTS `givefloweroffline`;
CREATE TABLE `givefloweroffline` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for givewine
-- ----------------------------
DROP TABLE IF EXISTS `givewine`;
CREATE TABLE `givewine` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for globalemail
-- ----------------------------
DROP TABLE IF EXISTS `globalemail`;
CREATE TABLE `globalemail` (
  `emailID` varchar(64) NOT NULL,
  `worldID` int(11) NOT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  `minLevel` int(11) NOT NULL,
  `maxLevel` int(11) NOT NULL,
  `school` int(5) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of globalemail
-- ----------------------------

-- ----------------------------
-- Table structure for GM
-- ----------------------------
DROP TABLE IF EXISTS `GM`;
CREATE TABLE `GM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc` varchar(60) DEFAULT NULL,
  `pass` varchar(60) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gm` (`acc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of GM
-- ----------------------------
INSERT INTO `GM` VALUES ('9', 'cqsj_gm', 'abc$123456', '2');

-- ----------------------------
-- Table structure for GM_LOG
-- ----------------------------
DROP TABLE IF EXISTS `GM_LOG`;
CREATE TABLE `GM_LOG` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a1` varchar(120) DEFAULT NULL,
  `a2` varchar(255) DEFAULT NULL,
  `a3` int(11) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4182 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `groupIndex` int(10) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`groupIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for itemlimit
-- ----------------------------
DROP TABLE IF EXISTS `itemlimit`;
CREATE TABLE `itemlimit` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for litterfun
-- ----------------------------
DROP TABLE IF EXISTS `litterfun`;
CREATE TABLE `litterfun` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of litterfun
-- ----------------------------

-- ----------------------------
-- Table structure for lockplayer
-- ----------------------------
DROP TABLE IF EXISTS `lockplayer`;
CREATE TABLE `lockplayer` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `LockDate` int(11) NOT NULL DEFAULT '0',
  `LockReason` varchar(128) NOT NULL DEFAULT '""',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lockuser
-- ----------------------------
DROP TABLE IF EXISTS `lockuser`;
CREATE TABLE `lockuser` (
  `OpenID` varchar(64) NOT NULL,
  `LockDate` int(11) NOT NULL DEFAULT '0',
  `LockReason` varchar(128) NOT NULL DEFAULT '""',
  PRIMARY KEY (`OpenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lockuser
-- ----------------------------

-- ----------------------------
-- Table structure for manorwar
-- ----------------------------
DROP TABLE IF EXISTS `manorwar`;
CREATE TABLE `manorwar` (
  `manorID` int(10) NOT NULL COMMENT '????ID',
  `serverID` int(10) NOT NULL DEFAULT '0' COMMENT '?ID',
  `occupyTime` int(10) DEFAULT '0' COMMENT '????',
  `factionID` int(10) DEFAULT '0' COMMENT '????ID',
  `preOpenTime` int(10) DEFAULT '0' COMMENT '???????',
  `totalOpenCnt` int(10) DEFAULT '0' COMMENT '???????',
  `official` varchar(50) DEFAULT '''{}''' COMMENT '??ID',
  `facName` varchar(30) DEFAULT '""' COMMENT '????',
  PRIMARY KEY (`manorID`,`serverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manorwar
-- ----------------------------
INSERT INTO `manorwar` VALUES ('2', '800', '1560251417', '0', '1561028401', '2', '{}', '');
INSERT INTO `manorwar` VALUES ('3', '800', '0', '0', '1561028401', '2', '{0,0,0}', '');
INSERT INTO `manorwar` VALUES ('4', '800', '1560254402', '0', '1561028401', '2', '{}', '');
INSERT INTO `manorwar` VALUES ('5', '800', '1560254006', '0', '1561028401', '2', '{}', '');
INSERT INTO `manorwar` VALUES ('6', '800', '1560253376', '0', '1561028401', '2', '{}', '');
INSERT INTO `manorwar` VALUES ('7', '800', '1560424838', '0', '1561028401', '2', '{}', '');
INSERT INTO `manorwar` VALUES ('8', '800', '1560424223', '0', '1561028401', '2', '{}', '');

-- ----------------------------
-- Table structure for marriageinfo
-- ----------------------------
DROP TABLE IF EXISTS `marriageinfo`;
CREATE TABLE `marriageinfo` (
  `marriageID` varchar(16) NOT NULL,
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`marriageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of marriageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for master_apprentice
-- ----------------------------
DROP TABLE IF EXISTS `master_apprentice`;
CREATE TABLE `master_apprentice` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for master_apprentice2
-- ----------------------------
DROP TABLE IF EXISTS `master_apprentice2`;
CREATE TABLE `master_apprentice2` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mount
-- ----------------------------
DROP TABLE IF EXISTS `mount`;
CREATE TABLE `mount` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(20000) NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mount
-- ----------------------------

-- ----------------------------
-- Table structure for mountglobaldata
-- ----------------------------
DROP TABLE IF EXISTS `mountglobaldata`;
CREATE TABLE `mountglobaldata` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `datas` varchar(20000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mountglobaldata
-- ----------------------------

-- ----------------------------
-- Table structure for mysteryshop
-- ----------------------------
DROP TABLE IF EXISTS `mysteryshop`;
CREATE TABLE `mysteryshop` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p3v3info
-- ----------------------------
DROP TABLE IF EXISTS `p3v3info`;
CREATE TABLE `p3v3info` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for passivity_relation
-- ----------------------------
DROP TABLE IF EXISTS `passivity_relation`;
CREATE TABLE `passivity_relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `targetRoleID` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`roleID`,`type`,`targetRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `RoleID` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `UserID` varchar(64) COLLATE utf8_bin NOT NULL,
  `WorldID` int(11) NOT NULL,
  `WorldName` varchar(30) COLLATE utf8_bin DEFAULT '',
  `Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `School` int(10) unsigned NOT NULL DEFAULT '0',
  `Sex` smallint(2) NOT NULL DEFAULT '0',
  `Level` int(10) unsigned DEFAULT '0',
  `Status` int(10) unsigned DEFAULT '0',
  `Exp` int(11) DEFAULT '0',
  `Ingot` int(11) DEFAULT '0',
  `Cash` int(11) DEFAULT '0',
  `IngotAll` int(11) DEFAULT '0',
  `Battle` int(11) DEFAULT '0',
  `AllEquipLvl` int(11) DEFAULT '0',
  `MedalLevel` int(11) DEFAULT '0',
  `PkValue` int(11) DEFAULT '0',
  `EmailTick` int(11) DEFAULT '0',
  `LastLogin` int(11) DEFAULT '0',
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `SpeakTick` int(11) DEFAULT '0' COMMENT '????',
  `Money` int(11) DEFAULT '0',
  `LoginCnt` int(11) DEFAULT NULL,
  `OnlineTime` int(11) DEFAULT '0',
  `Glamour` int(11) DEFAULT NULL,
  `Vital` int(11) DEFAULT NULL,
  `MapID` int(11) DEFAULT NULL,
  `MapPos` int(11) DEFAULT NULL,
  `Faction` int(11) DEFAULT NULL,
  `Meritorious` int(11) DEFAULT NULL,
  `SoulScore` int(11) DEFAULT '0',
  `CurHP` int(11) DEFAULT NULL,
  `CurMP` int(11) DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  `DeleteTime` datetime DEFAULT '0000-00-00 00:00:00',
  `Contribute` int(11) DEFAULT '0' COMMENT '??',
  `TitleID` int(11) DEFAULT '0' COMMENT '??ID',
  `Integral` int(11) DEFAULT '0' COMMENT '????',
  `PvpRank` int(11) DEFAULT '0' COMMENT '??????',
  `SilentReason` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `TotalGainIngot` int(11) DEFAULT NULL,
  `TotalCosIngot` int(11) DEFAULT NULL,
  `MonsterKillNum` int(11) DEFAULT NULL,
  `SwornBrosID` int(11) NOT NULL DEFAULT '0',
  `LeaveSwornTime` int(11) NOT NULL DEFAULT '0',
  `FightTeamID` int(11) DEFAULT NULL,
  `MarriageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoleID`),
  KEY `UserID` (`UserID`) USING BTREE,
  KEY `Name` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for player_relation
-- ----------------------------
DROP TABLE IF EXISTS `player_relation`;
CREATE TABLE `player_relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playerdropitem
-- ----------------------------
DROP TABLE IF EXISTS `playerdropitem`;
CREATE TABLE `playerdropitem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PlayerDropItem
-- ----------------------------
DROP TABLE IF EXISTS `PlayerDropItem`;
CREATE TABLE `PlayerDropItem` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PlayerDropItem
-- ----------------------------

-- ----------------------------
-- Table structure for playermaze
-- ----------------------------
DROP TABLE IF EXISTS `playermaze`;
CREATE TABLE `playermaze` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Data` varchar(1024) NOT NULL DEFAULT '',
  `CurState` varchar(1024) NOT NULL DEFAULT '',
  `CurPath` varchar(1024) NOT NULL DEFAULT '',
  `LastIndex` int(11) NOT NULL DEFAULT '-1',
  `MazeType` int(11) NOT NULL DEFAULT '0',
  `DailyPrizeTime` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PlayerMaze
-- ----------------------------
DROP TABLE IF EXISTS `PlayerMaze`;
CREATE TABLE `PlayerMaze` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Data` varchar(1024) NOT NULL DEFAULT '',
  `CurState` varchar(1024) NOT NULL DEFAULT '',
  `CurPath` varchar(1024) NOT NULL DEFAULT '',
  `LastIndex` int(11) NOT NULL DEFAULT '-1',
  `MazeType` int(11) NOT NULL DEFAULT '0',
  `DailyPrizeTime` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PlayerMaze
-- ----------------------------

-- ----------------------------
-- Table structure for qqvipinfo
-- ----------------------------
DROP TABLE IF EXISTS `qqvipinfo`;
CREATE TABLE `qqvipinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qqvipinfo
-- ----------------------------

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '??',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT '??',
  `achieve` int(11) NOT NULL DEFAULT '0' COMMENT '???',
  `timeTick1` int(11) NOT NULL DEFAULT '0',
  `timeTick4` int(11) NOT NULL DEFAULT '0',
  `timeTick9` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `targetRoleID` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  PRIMARY KEY (`roleID`,`targetRoleID`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for relation_flowerrd
-- ----------------------------
DROP TABLE IF EXISTS `relation_flowerrd`;
CREATE TABLE `relation_flowerrd` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rewardtask
-- ----------------------------
DROP TABLE IF EXISTS `rewardtask`;
CREATE TABLE `rewardtask` (
  `TaskGUID` int(11) NOT NULL,
  `OwnerGUID` varchar(32) NOT NULL DEFAULT '',
  `OwnerName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `ExpireDate` datetime DEFAULT '0000-00-00 00:00:00',
  `Status` int(10) DEFAULT '0',
  `TaskRank` int(11) DEFAULT '0',
  `TaskID` int(11) DEFAULT '0',
  `ReceiveNum` int(11) DEFAULT NULL,
  `ReceiveTime` int(11) unsigned DEFAULT '0',
  `ReceiveStatus` int(10) DEFAULT '0',
  PRIMARY KEY (`TaskGUID`),
  KEY `OwnerGUID` (`OwnerGUID`) USING BTREE,
  KEY `TaskRank` (`TaskRank`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ride
-- ----------------------------
DROP TABLE IF EXISTS `ride`;
CREATE TABLE `ride` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolechat
-- ----------------------------
DROP TABLE IF EXISTS `rolechat`;
CREATE TABLE `rolechat` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolecopy
-- ----------------------------
DROP TABLE IF EXISTS `rolecopy`;
CREATE TABLE `rolecopy` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolecopystar
-- ----------------------------
DROP TABLE IF EXISTS `rolecopystar`;
CREATE TABLE `rolecopystar` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolecopytime
-- ----------------------------
DROP TABLE IF EXISTS `rolecopytime`;
CREATE TABLE `rolecopytime` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `idx` int(10) NOT NULL DEFAULT '0',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`,`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolefaction
-- ----------------------------
DROP TABLE IF EXISTS `rolefaction`;
CREATE TABLE `rolefaction` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `factionID` int(10) NOT NULL DEFAULT '0',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolesingleinsts
-- ----------------------------
DROP TABLE IF EXISTS `rolesingleinsts`;
CREATE TABLE `rolesingleinsts` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `data` varchar(1024) DEFAULT NULL,
  `eliteInstTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for secondpassword
-- ----------------------------
DROP TABLE IF EXISTS `secondpassword`;
CREATE TABLE `secondpassword` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sharetaskcount
-- ----------------------------
DROP TABLE IF EXISTS `sharetaskcount`;
CREATE TABLE `sharetaskcount` (
  `roleid` varchar(32) NOT NULL DEFAULT '',
  `taskcount` int(10) DEFAULT NULL,
  `tasktype` int(2) NOT NULL,
  PRIMARY KEY (`roleid`,`tasktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sharetaskcount
-- ----------------------------

-- ----------------------------
-- Table structure for shawar
-- ----------------------------
DROP TABLE IF EXISTS `shawar`;
CREATE TABLE `shawar` (
  `serverID` int(10) NOT NULL DEFAULT '0' COMMENT '?ID',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`serverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shawar
-- ----------------------------

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(1024) NOT NULL DEFAULT '"0"',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for stall
-- ----------------------------
DROP TABLE IF EXISTS `stall`;
CREATE TABLE `stall` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) DEFAULT NULL,
  `stallId` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for swornbros
-- ----------------------------
DROP TABLE IF EXISTS `swornbros`;
CREATE TABLE `swornbros` (
  `id` int(11) NOT NULL DEFAULT '0',
  `leader` varchar(32) NOT NULL DEFAULT '',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `skillPoints` int(11) NOT NULL DEFAULT '0',
  `relation` int(11) NOT NULL DEFAULT '0',
  `maxRelationLvl` int(11) NOT NULL DEFAULT '0',
  `lastUpdate` int(11) NOT NULL DEFAULT '0',
  `dailyIncRelation` int(11) NOT NULL DEFAULT '0',
  `members` varchar(1024) NOT NULL,
  `skills` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for targetreward
-- ----------------------------
DROP TABLE IF EXISTS `targetreward`;
CREATE TABLE `targetreward` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of targetreward
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task2
-- ----------------------------
DROP TABLE IF EXISTS `task2`;
CREATE TABLE `task2` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for towerdata
-- ----------------------------
DROP TABLE IF EXISTS `towerdata`;
CREATE TABLE `towerdata` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for treasureinfo
-- ----------------------------
DROP TABLE IF EXISTS `treasureinfo`;
CREATE TABLE `treasureinfo` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Username` varchar(64) DEFAULT NULL,
  `UserID` varchar(64) NOT NULL DEFAULT '0',
  `WorldID` int(11) NOT NULL,
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `LockDate` int(11) DEFAULT '0',
  `DeleteDate` date DEFAULT NULL,
  `SessionID` int(11) DEFAULT '0',
  `PwdHash` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`),
  KEY `Username` (`Username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for whitelist
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
  `OpenID` varchar(64) NOT NULL,
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`OpenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whitelist
-- ----------------------------

-- ----------------------------
-- Table structure for wing
-- ----------------------------
DROP TABLE IF EXISTS `wing`;
CREATE TABLE `wing` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `wingID` int(11) NOT NULL,
  `wingSkill` varchar(1024) NOT NULL DEFAULT '""',
  `pomoteTime` int(11) NOT NULL,
  `wingLevel` int(11) NOT NULL,
  `wingStar` int(11) NOT NULL,
  `successTime` int(11) NOT NULL,
  `fightAbility` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xunbao
-- ----------------------------
DROP TABLE IF EXISTS `xunbao`;
CREATE TABLE `xunbao` (
  `roleID` varchar(32) NOT NULL DEFAULT '',
  `datas` varbinary(2048) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xunbao
-- ----------------------------

-- ----------------------------
-- Table structure for yuanbaotrade
-- ----------------------------
DROP TABLE IF EXISTS `yuanbaotrade`;
CREATE TABLE `yuanbaotrade` (
  `Billno` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Type` int(11) NOT NULL,
  `RoleID` varchar(32) NOT NULL DEFAULT '',
  `RoleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `OpenID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Money` int(11) NOT NULL,
  `Reason` int(11) NOT NULL,
  `TokenId` varchar(256) DEFAULT '',
  `State` int(11) NOT NULL DEFAULT '0',
  `Time` bigint(11) NOT NULL DEFAULT '0',
  `RecvID` varchar(32) DEFAULT '0',
  `ExchangeFee` int(11) DEFAULT '0',
  `RecvOpenID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `RecvPlatID` int(11) DEFAULT '0',
  `RecvGameAppid` varchar(32) DEFAULT '',
  `RecvLevel` int(11) DEFAULT '0',
  `RecvMoney` int(11) DEFAULT '0',
  `UpdateTime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`Billno`,`Type`),
  KEY `RoleName` (`RoleName`) USING BTREE,
  KEY `OpenID` (`OpenID`) USING BTREE,
  KEY `RoleID` (`RoleID`,`Type`) USING BTREE,
  KEY `Time` (`Time`) USING BTREE,
  KEY `State` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yuanbaotrade
-- ----------------------------

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `GM_AGENT`;
CREATE TABLE `GM_AGENT` (
	`AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `AgentName` varchar(64) DEFAULT NULL,
  `CreateDate` datetime DEFAULT '2019-01-01 10:00:00',
  PRIMARY KEY (`AgentID`),
  KEY `Username` (`AgentName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for agentuser
-- ----------------------------
DROP TABLE IF EXISTS `GM_AGENT_USER`;
CREATE TABLE `GM_AGENT_USER` (
  `Username` varchar(64) DEFAULT NULL,
  `UserID` varchar(64) NOT NULL DEFAULT '0',
	`AgentID` varchar(64) NOT NULL DEFAULT '0',
  `CreateDate` datetime DEFAULT '2019-01-01 10:00:00',
  PRIMARY KEY (`UserID`),
  KEY `Username` (`Username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for agentuserpay
-- ----------------------------
DROP TABLE IF EXISTS `GM_AGENT_USER_PAY`;
CREATE TABLE `GM_AGENT_USER_PAY` (
	`OrderID` varchar(64) DEFAULT NULL,
  `Username` varchar(64) DEFAULT NULL,
  `UserID` varchar(64) NOT NULL DEFAULT '0',
	`AgentID` varchar(64) NOT NULL DEFAULT '0',
  `CreateDate` datetime DEFAULT '2019-01-01 10:00:00',
  `PayMoney` int(11) DEFAULT '0',
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
