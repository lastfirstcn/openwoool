--packet_const.lua
	
IDIP_QUERY_ROLE_INFO_REQ		= 0x1001	--查询角色信息请求
IDIP_QUERY_ROLE_INFO_RSP		= 0x1002	--查询角色信息应答
IDIP_QUERY_EQUIP_INFO_REQ		= 0x1003	--查询身上装备请求
IDIP_QUERY_EQUIP_INFO_RSP		= 0x1004	--查询身上装备应答
IDIP_QUERY_BAG_REQ				= 0x1005	--查询背包请求
IDIP_QUERY_BAG_RSP				= 0x1006	--查询背包应答
IDIP_QUERY_DEPOT_REQ			= 0x1007	--查询仓库请求
IDIP_QUERY_DEPOT_RSP			= 0x1008	--查询仓库应答
IDIP_QUERY_SKILL_REQ			= 0x1009	--查询技能请求
IDIP_QUERY_SKILL_RSP			= 0x100a	--查询技能应答
IDIP_QUERY_STEED_REQ			= 0x100b	--查询坐骑请求
IDIP_QUERY_STEED_RSP			= 0x100c	--查询坐骑应答
IDIP_DO_MAIL_SEND_BIND_GOLD_REQ = 0x100d	--邮件赠送绑定元宝请求
IDIP_DO_MAIL_SEND_BIND_GOLD_RSP = 0x100e	--邮件赠送绑定元宝应答
IDIP_DO_MAIL_SEND_MONEY_REQ		= 0x100f	--邮件赠送金币请求
IDIP_DO_MAIL_SEND_MONEY_RSP		= 0x1010	--邮件赠送金币应答
IDIP_DO_MAIL_SEND_ITEM_REQ		= 0x1011	--邮件赠送物品请求
IDIP_DO_MAIL_SEND_ITEM_RSP		= 0x1012	--邮件赠送物品应答
IDIP_DO_DEL_BIND_GOLD_REQ		= 0x1013	--删除绑定元宝请求
IDIP_DO_DEL_BIND_GOLD_RSP		= 0x1014	--删除绑定元宝应答
IDIP_DO_DEL_ITEM_REQ			= 0x1015	--删除物品请求
IDIP_DO_DEL_ITEM_RSP			= 0x1016	--删除物品应答
IDIP_DO_ACTIVE_USR_REQ			= 0x1017	--激活帐号请求
IDIP_DO_ACTIVE_USR_RSP			= 0x1018	--激活帐号应答
IDIP_DO_BAN_ROLE_REQ			= 0x1019	--封停角色请求
IDIP_DO_BAN_ROLE_RSP			= 0x101a	--封停角色应答
IDIP_DO_UNBAN_ROLE_REQ			= 0x101b	--解封角色请求
IDIP_DO_UNBAN_ROLE_RSP			= 0x101c	--解封角色应答
IDIP_DO_BAN_USR_REQ				= 0x101d	--封停帐号请求
IDIP_DO_BAN_USR_RSP				= 0x101e	--封停帐号应答
IDIP_QUERY_REGION_BAN_INFO_REQ	= 0x101f	--查询全区封号信息请求
IDIP_QUERY_REGION_BAN_INFO_RSP	= 0x1020	--查询全区封号信息应答
IDIP_QUERY_ROLE_BAN_INFO_REQ	= 0x1021	--查询角色封号信息请求
IDIP_QUERY_ROLE_BAN_INFO_RSP	= 0x1022	--查询角色封号信息应答
IDIP_DO_UNBAN_USR_REQ			= 0x1023	--解封帐号请求
IDIP_DO_UNBAN_USR_RSP			= 0x1024	--解封帐号应答
IDIP_DO_MASK_CHAT_REQ			= 0x1025	--禁言请求
IDIP_DO_MASK_CHAT_RSP			= 0x1026	--禁言应答
IDIP_DO_UNMASK_CHAT_REQ			= 0x1027	--解除禁言请求
IDIP_DO_UNMASK_CHAT_RSP			= 0x1028	--解除禁言应答
IDIP_DO_HOUSE_LAMP_REQ			= 0x1029	--走马灯请求
IDIP_DO_HOUSE_LAMP_RSP			= 0x102a	--走马灯应答
IDIP_DO_GAME_POPUP_REQ			= 0x102b	--游戏中弹窗请求
IDIP_DO_GAME_POPUP_RSP			= 0x102c	--游戏中弹窗应答
IDIP_DO_SHOOT_FACE_NOTICE_REQ	= 0x102d	--拍脸公告请求
IDIP_DO_SHOOT_FACE_NOTICE_RSP	= 0x102e	--拍脸公告应答
IDIP_DO_GROUP_SEND_MAIL_REQ		= 0x102f	--群发邮件请求
IDIP_DO_GROUP_SEND_MAIL_RSP		= 0x1030	--群发邮件应答
IDIP_DO_DEL_NOTICE_REQ			= 0x1031	--删除公告请求
IDIP_DO_DEL_NOTICE_RSP			= 0x1032	--删除公告应答

IDIP_QUERY_TOTAL_INFO_REQ		= 0x1033	--查询累计信息请求
IDIP_QUERY_TOTAL_INFO_RSP		= 0x1034	--查询累计信息应答
IDIP_QUERY_FAIRY_WING_INFO_REQ	= 0x1035	--查询仙翼请求
IDIP_QUERY_FAIRY_WING_INFO_RSP	= 0x1036	--查询仙翼应答
IDIP_QUERY_FRIEND_REQ 			= 0x1059	--查好友请求
IDIP_QUERY_FRIEND_RSP 			= 0x105a	--查好友应答
IDIP_QUERY_TITLE_REQ 			= 0x1039	--查询称号请求
IDIP_QUERY_TITLE_RSP 			= 0x103a	--查询称号应答
IDIP_QUERY_MAIL_REQ 			= 0x103b	--查询邮件请求
IDIP_QUERY_MAIL_RSP 			= 0x103c	--查询邮件应答
IDIP_QUERY_GUILD_MEMBER_REQ		= 0x103d	--查询行会成员请求
IDIP_QUERY_GUILD_MEMBER_RSP		= 0x103e	--查询行会成员应答
IDIP_QUERY_GUILD_APPLICATION_LIST_REQ = 0x103f  --查询行会申请列表请求
IDIP_QUERY_GUILD_APPLICATION_LIST_RSP = 0x1040  --查询行会申请列表应答
IDIP_QUERY_GUILD_INFO_REQ 		= 0x1041	--查询行会信息请求
IDIP_QUERY_GUILD_INFO_RSP 		= 0x1042	--查询行会信息应答
IDIP_QUERY_GUILD_CONTRIBUTE_INFO_REQ = 0x1043  --查询行会捐献情况请求
IDIP_QUERY_GUILD_CONTRIBUTE_INFO_RSP = 0x1044  --查询行会捐献情况应答
IDIP_QUERY_GUILD_DIPLOMACY_REQ	= 0x1045	--查询行会外交请求
IDIP_QUERY_GUILD_DIPLOMACY_RSP	= 0x1046	--查询行会外交应答
IDIP_QUERY_NICK_REQ 			= 0x1047	--查询昵称请求
IDIP_QUERY_NICK_RSP 			= 0x1048	--查询昵称应答
IDIP_QUERY_LEVEL_RANK_REQ 		= 0x1049	--查询等级排行榜请求
IDIP_QUERY_LEVEL_RANK_RSP 		= 0x104a	--查询等级排行榜应答
IDIP_QUERY_GUILD_RANK_REQ 		= 0x104b	--查询行会排行榜请求
IDIP_QUERY_GUILD_RANK_RSP 		= 0x104c	--查询行会排行榜应答
IDIP_QUERY_EVIL_RANK_REQ 		= 0x104d	--查询恶人排行榜请求
IDIP_QUERY_EVIL_RANK_RSP 		= 0x104e	--查询恶人排行榜应答
IDIP_QUERY_FAIRY_RANK_REQ 		= 0x104f	--查询仙翼排行榜请求
IDIP_QUERY_FAIRY_RANK_RSP 		= 0x1050	--查询仙翼排行榜应答
IDIP_DO_RECOVER_DEL_ROLE_REQ 	= 0x1051	--恢复被删除的角色请求
IDIP_DO_RECOVER_DEL_ROLE_RSP	= 0x1052	--恢复被删除的角色应答
IDIP_DO_PLAYER_HUIDANG_REQ 		= 0x1053	--玩家回档请求
IDIP_DO_PLAYER_HUIDANG_RSP		= 0x1054	--玩家回档应答
IDIP_DO_ADD_SENSITIVE_WORD_REQ	= 0x1055	--添加敏感字请求
IDIP_DO_ADD_SENSITIVE_WORD_RSP	= 0x1056	--添加敏感字应答
IDIP_DO_DEL_MAIL_REQ 			= 0x1057	--删除邮件请求
IDIP_DO_DEL_MAIL_RSP			= 0x1058	--删除邮件应答
IDIP_QUERY_PLAYER_DEAL_REQ 		= 0x105b	--查玩家交易行请求
IDIP_QUERY_PLAYER_DEAL_RSP 		= 0x105c	--查玩家交易行应答
IDIP_DO_DOWN_DEAL_ITEM_REQ 		= 0x105d	--下架交易行物品请求
IDIP_DO_DOWN_DEAL_ITEM_RSP 		= 0x105e	--下架交易行物品应答
IDIP_DO_FORCE_TRANSFER_ITEM_REQ	= 0x105f	--强制转移物品(从背包/仓库)请求
IDIP_DO_FORCE_TRANSFER_ITEM_RSP	= 0x1060	--强制转移物品(从背包/仓库)应答
IDIP_DO_KICK_USR_OFF_REQ 		= 0x1061	--踢角色下线请求
IDIP_DO_KICK_USR_OFF_RSP 		= 0x1062	--踢角色下线应答
IDIP_QUERY_AREA_ONLINE_NUM_REQ	= 0x1063	--查小区在线人数请求
IDIP_QUERY_AREA_ONLINE_NUM_RSP	= 0x1064	--查小区在线人数应答
IDIP_QUERY_HOUSE_LAMP_REQ		= 0x1065	--查询走马灯请求
IDIP_QUERY_HOUSE_LAMP_RSP		= 0x1066	--查询走马灯应答
IDIP_QUERY_GAME_POPUP_REQ		= 0x1067	--查询游戏中弹窗请求
IDIP_QUERY_GAME_POPUP_RSP		= 0x1068	--查询游戏中弹窗应答
IDIP_QUERY_GROUP_SEND_MAIL_REQ	= 0x1069	--查询群发邮件请求
IDIP_QUERY_GROUP_SEND_MAIL_RSP	= 0x106a	--查询群发邮件应答
IDIP_DO_ADD_ACTIVITY_REQ		= 0x106b	--添加活动请求
IDIP_DO_ADD_ACTIVITY_RSP		= 0x106c	--添加活动应答
IDIP_QUERY_ACTIVITY_REQ			= 0x106d	--查询活动请求
IDIP_QUERY_ACTIVITY_RSP			= 0x106e	--查询活动应答
IDIP_DO_UPDATE_ACTIVITY_REQ		= 0x106f	--修改活动请求
IDIP_DO_UPDATE_ACTIVITY_RSP		= 0x1070	--修改活动应答
IDIP_DO_DEL_ACTIVITY_REQ		= 0x1071	--删除活动请求
IDIP_DO_DEL_ACTIVITY_RSP		= 0x1072	--删除活动应答
IDIP_DO_AUCTION_TRANSFER_ITEM_REQ=0x1073	--强制转移物品（从拍卖行待领取页签）请求
IDIP_DO_AUCTION_TRANSFER_ITEM_RSP=0x1074	--强制转移物品（从拍卖行待领取页签）应答

IDIP_AQ_QUERY_OPENID_INFO_REQ	= 0x1075	--查询openid基本信息（AQ）请求
IDIP_AQ_QUERY_OPENID_INFO_RSP	= 0x1076	--查询openid基本信息（AQ）应答
IDIP_AQ_DO_UPDATE_MONEY_REQ		= 0x1077	--修改货币数量（AQ）请求
IDIP_AQ_DO_UPDATE_MONEY_RSP		= 0x1078	--修改货币数量（AQ）应答
IDIP_AQ_DO_UPDATE_GAMECOIN_REQ	= 0x1079	--修改游戏币数量（AQ）请求
IDIP_AQ_DO_UPDATE_GAMECOIN_RSP	= 0x107a	--修改游戏币数量（AQ）应答
IDIP_AQ_DO_MASK_CHAT_REQ		= 0x107b	--禁言（AQ）请求
IDIP_AQ_DO_MASK_CHAT_RSP		= 0x107c	--禁言（AQ）应答
IDIP_AQ_DO_CLEAR_SPEAK_REQ		= 0x107d	--发言清除（AQ）请求
IDIP_AQ_DO_CLEAR_SPEAK_RSP		= 0x107e	--发言清除（AQ）应答
IDIP_AQ_QUERY_ROLE_INFO_REQ		= 0x107f	--查询账号下角色信息（AQ）请求
IDIP_AQ_QUERY_ROLE_INFO_RSP		= 0x1080	--查询账号下角色信息（AQ）应答
IDIP_AQ_DO_SEND_MESSAGE_REQ		= 0x1081	--发消息（AQ）请求
IDIP_AQ_DO_SEND_MESSAGE_RSP		= 0x1082	--发消息（AQ）应答
IDIP_AQ_DO_BAN_USR_REQ			= 0x1083	--封号（AQ）请求
IDIP_AQ_DO_BAN_USR_RSP			= 0x1084	--封号（AQ）应答
IDIP_AQ_DO_UNBAN_USR_REQ		= 0x1085	--解除处罚（AQ）请求
IDIP_AQ_DO_UNBAN_USR_RSP		= 0x1086	--解除处罚（AQ）应答

IDIP_QUERY_NOTICE_REQ			= 0x1087	--查询公告请求
IDIP_QUERY_NOTICE_RSP			= 0x1088	--查询公告应答
IDIP_DO_HOT_UPDATE_REQ			= 0x1089	--热更新请求
IDIP_DO_HOT_UPDATE_RSP			= 0x108a	--热更新应答

IDIP_BAG_ITEM_PAGE_SIZE			= 20

--自定义错误码
OPERATOR_SUCCESS				= 0
OPERATOR_EMPTY_RESULT			= 1
ERROR_EXEC_CODE_FIELD			= -100
ERROR_PARTITION_NOT_EXIST		= -101
ERROR_CMDID_NOT_VAILD			= -102
ERROR_ITEMID_NOT_VAILD			= -103
ERROR_COUNT_NOT_VAILD			= -104
ERROR_MAIL_TITLE_NOT_VAILD		= -105	
ERROR_MAIL_CONTENT_NOT_VAILD	= -106	
ERROR_HORSE_CONTENT_NOT_VAILD	= -107	
ERROR_PUPOP_CONTENT_NOT_VAILD	= -108	
ERROR_USER_ROLE_HAS_FULL		= -109	
ERROR_CMD_CANNOT_BOARDCAST		= -110	
ERROR_ACTIVITY_PARAMS_NOT_VAILD	= -111	
ERROR_AQ_INGOT_TYPE_VAILD		= -112	

ERROR_MESSAGE_LIST = {
	[ERROR_EXEC_CODE_FIELD]			= "exec request failed, because of programm error!",
	[ERROR_PARTITION_NOT_EXIST]		= "partition is not exist!",
	[ERROR_CMDID_NOT_VAILD]			= "cmd id is not valid!",
	[ERROR_ITEMID_NOT_VAILD]		= "send email item id is not valid!",
	[ERROR_COUNT_NOT_VAILD]			= "send email item count is not valid!",	
	[ERROR_MAIL_TITLE_NOT_VAILD]		= "partition is not exist!",
	[ERROR_MAIL_CONTENT_NOT_VAILD]		= "mail content is not valid!",
	[ERROR_HORSE_CONTENT_NOT_VAILD]		= "send email item id is not valid!",
	[ERROR_PUPOP_CONTENT_NOT_VAILD]		= "send email item count is not valid!",
	[ERROR_USER_ROLE_HAS_FULL]			= "this user has over 3 roles!",
	[ERROR_CMD_CANNOT_BOARDCAST]		= "partition is 0, but this cmd cannot boardcast!",
	[ERROR_ACTIVITY_PARAMS_NOT_VAILD]	= "activity params is not vaild!",
	[ERROR_AQ_INGOT_TYPE_VAILD]			= "update role money params type is not vaild!",
}