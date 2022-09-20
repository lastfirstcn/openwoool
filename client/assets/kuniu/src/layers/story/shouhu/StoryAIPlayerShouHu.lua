local StoryAIPlayerShouHu = class("StoryAIPlayerShouHu", require ("src/layers/story/StoryAI"))

function StoryAIPlayerShouHu:ctor(storyNode, role, school, oriPos)
    require ("src/layers/story/StoryAI").ctor(self, storyNode, role)   
    self.m_lockRange = 10;   --���з�Χ

    self.m_type = 3
    self.m_school = school
    self.m_oriPos = oriPos
    self.m_lastAtkTime = 1
    self.m_maxDisWithOwner = 2
    self.m_canMove = true
    if school > 1 then
        self.m_attackRange = 10
    end
end

function StoryAIPlayerShouHu:update(dt)
    
    if self.m_bOver or self.m_state == 0 then
        return
    end

    if self.m_owner and self.m_owner:getHP() < 1 then
        self.m_bOver = true
        self.m_role:standed()
        return
    end
    
    require ("src/layers/story/StoryAISoldier").update(self,dt)

    --���������̫Զ�����������Ա�
    if self.m_lockRole == nil and not self.m_isMoveing then        
        local pos1 = self.m_oriPos
        local pos2 = G_MAINSCENE.map_layer:space2Tile(cc.p(self.m_role:getPosition()))
        if ((pos1.x - pos2.x) *(pos1.x - pos2.x) +(pos1.y - pos2.y) *(pos1.y - pos2.y)) > self.m_maxDisWithOwner * self.m_maxDisWithOwner then
            self:moveToPos(pos1)
            return
        end
    end
end

function StoryAIPlayerShouHu:lockTarget()
    local myPos = G_MAINSCENE.map_layer:space2Tile(cc.p(self.m_role:getPosition()))
    local function getDistance(role)
        if role == nil or role:getHP() < 1 then
            return 200000000
        end

        local targetPos = G_MAINSCENE.map_layer:space2Tile(cc.p(role:getPosition()))
        local dis = (myPos.x - targetPos.x)*(myPos.x - targetPos.x) + (myPos.y - targetPos.y)*(myPos.y - targetPos.y)
        return dis
    end

    local curDis = 100000000
    local target = nil
    if self.m_storyNode.playerTab and self.m_storyNode.playerTab[2] then
        for k, v in pairs(self.m_storyNode.playerTab[2]) do 
            local dis = getDistance(v)
            if dis < curDis then
                curDis = dis
                target = v
            end
        end
    end
    
    --�жϾ����Ƿ������з�Χ��
    if target ~= nil and curDis > self.m_lockRange*self.m_lockRange then
        target = nil      
    end 

    return target
end

function StoryAIPlayerShouHu:attackTarget()
    local topNode = self.m_role:getTopNode()
    if topNode and not topNode:isVisible() then
        if self.m_school == 1 then
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(1003, self.m_role, {self.m_lockRole}) end)
        elseif self.m_school == 2 then
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(2010, self.m_role, {self.m_lockRole}) end)
        else
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(3011, self.m_role, {self.m_lockRole}) end)
        end
        self.m_lastAtkTime = 1
    else
        --����Ŀ��
        local dir = self:getDirOfTarget()
        self.m_role:setSpriteDir(dir)   

        --���ݲ�ͬ��ְҵ�ͷŲ�ͬ�ļ���
        local idx = math.random(1,2)
        if self.m_school == 1 then
            if idx == 1 then   --��ɱ����
                self.m_role:attackOneTime(0.35, cc.p(0, 0))            
                CMagicCtrlMgr:getInstance():CreateMagic(1003, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(1003, self.m_role, {self.m_lockRole}) end)
                self.m_lastAtkTime = 1
            else               --�һ𽣷�
                self.m_role:attackOneTime(0.35, cc.p(0, 0))
               CMagicCtrlMgr:getInstance():CreateMagic(1006, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(1006, self.m_role, {self.m_lockRole}) end)
                self.m_lastAtkTime = 1
           end
        elseif self.m_school == 2 then
            if idx == 1 then   --�����ϵ�
                self.m_role:magicUpToPos(0.4, cc.p(0, 0)) 
                CMagicCtrlMgr:getInstance():CreateMagic(2010, 0, self.m_role:getTag(), self.m_lockRole:getTag(), 0);
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(2010, self.m_role, {self.m_lockRole}) end)
                self.m_lastAtkTime = 1
            else               --���л���
                self.m_role:magicUpToPos(0.4, cc.p(0, 0))
                G_MAINSCENE.map_layer:playSkillEffect(0.1, 2011, self.m_role, self.m_lockRole, nil, nil)
                local dstPos = cc.p(self.m_lockRole:getPosition())
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(2011, self.m_role, {self.m_lockRole}, dstPos) end)
                self.m_lastAtkTime = 1.2
            end
        else
            if idx == 1 then   --��ڤ����
                self.m_role:magicUpToPos(0.4, cc.p(0, 0))
                CMagicCtrlMgr:getInstance():CreateMagic(3011, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());             
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(3011, self.m_role, {self.m_lockRole}) end)
                self.m_lastAtkTime = 1
            else               --ʩ����
                self.m_role:magicUpToPos(0.4, cc.p(0, 0))
                CMagicCtrlMgr:getInstance():CreateMagic(3004, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
                startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(3004, self.m_role, {self.m_lockRole}) end)
                self.m_lastAtkTime = 1
            end
        end
    end
    
    
end

return StoryAIPlayerShouHu;