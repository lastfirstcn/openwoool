G_VS_MAP_MSG_CACHE = {}
local commConst = require("src/config/CommDef")
local MsgCreateTeam = function(buffer)
    local proto = g_msgHandlerInst:convertBufferToTable("FightTeamCreateRetProtocol", buffer);
    if proto then
        VSDataManager:SetSelfTeamId(proto.fightTeamID)
        -- ����ս�ӳɹ���Ч
        playCommonFontEffect(2)
    end
    getRunScene():removeChildByTag(commConst.TAG_3V3_CREATE_TEAM_DIALOG)
end

g_msgHandlerInst:registerMsgHandler(FIGTHTEAM_SC_CREATE_RET, MsgCreateTeam)

local Msg_figthteam_sc_be_invite = function(buffer)
    local proto = g_msgHandlerInst:convertBufferToTable("FightTeamBeInviteProtocol", buffer)
    if getRunScene():getChildByTag(commConst.TAG_3V3_INVITE_INTO_TEAM) == nil then
        local msgBox = MessageBoxYesNo(
            game.getStrByKey("p3v3_invite_message_title")
            , string.format(game.getStrByKey("p3v3_invited_message"), proto.fightTeamName, proto.LeaderName)
            , function()
                g_msgHandlerInst:sendNetDataByTableExEx(FIGTHTEAM_CS_REPLY_INVITE, "FightTeamReplyInviteProtocol", {fightTeamID = proto.fightTeamID, result = true})
            end
            , function()
                g_msgHandlerInst:sendNetDataByTableExEx(FIGTHTEAM_CS_REPLY_INVITE, "FightTeamReplyInviteProtocol", {fightTeamID = proto.fightTeamID, result = false})
            end
        )
        if msgBox then
            msgBox:setTag(commConst.TAG_3V3_INVITE_INTO_TEAM);
        end
    end
end

g_msgHandlerInst:registerMsgHandler(FIGTHTEAM_SC_BE_INVITE, Msg_figthteam_sc_be_invite)

g_msgHandlerInst:registerMsgHandler(FIGHTTEAM3V3_SC_GAMESTATENOTIFY, function(buff)
    --��Ϊ�������˳������Ժ����յ���ս��Ϣ
    --������Ϣ�����ս����Ϣͬʱ���͹������п����ڳ�����Ⱦ���֮ǰ�����գ������Ҫ�����棬��������Ⱦenterʱ��ʹ��,ÿ��������һ����Ϣ���ͻ������ǰ�����buff
    if G_MAINSCENE and G_MAINSCENE.map_layer and G_MAINSCENE.map_layer.is3v3 and G_MAINSCENE.map_layer.ready then
        G_MAINSCENE.map_layer:process_msg_fightteam3v3_sc_gamestatenotify(buff)
        return
    end
    table.insert(G_VS_MAP_MSG_CACHE, {cache_type = "game", data = buff})--�ȴ�3v3map enter��ʱ��һ����ȫ������
end)

g_msgHandlerInst:registerMsgHandler(FIGHTTEAM3V3_SC_MEMBERSTATENOTIFY, function(buff)
    --ͬ��
    if G_MAINSCENE and G_MAINSCENE.map_layer and G_MAINSCENE.map_layer.is3v3 and G_MAINSCENE.map_layer.ready then
        G_MAINSCENE.map_layer:process_msg_fightteam3v3_sc_memberstatenotify(buff)
        return
    end
    table.insert(G_VS_MAP_MSG_CACHE, {cache_type = "member", data = buff})
end)

g_msgHandlerInst:registerMsgHandler(FIGHTTEAM3V3_SC_COUNTDOWNTIME, function(buff)
    --ͬ��
    if G_MAINSCENE and G_MAINSCENE.map_layer and G_MAINSCENE.map_layer.is3v3 and G_MAINSCENE.map_layer.ready then
        G_MAINSCENE.map_layer:process_msg_fightteam3v3_sc_countdowntime(buff)
        return
    end
    table.insert(G_VS_MAP_MSG_CACHE, {cache_type = "timeCountDown", data = buff})
end)