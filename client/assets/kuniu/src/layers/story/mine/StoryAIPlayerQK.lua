local StoryAIPlayerQK = class("StoryAIPlayerQK", require ("src/layers/story/StoryAI"))

function StoryAIPlayerQK:ctor(storyNode, role, school)
    require ("src/layers/story/StoryAI").ctor(self, storyNode, role)   
    self.m_lockRange = 50;   --���з�Χ

    self.m_type = 3
    self.m_school = school
    self.m_lastAtkTime = 1
    self.m_canMove = true
    if school > 1 then
        self.m_attackRange = 6
    end
end

function StoryAIPlayerQK:lockTarget()
    return G_ROLE_MAIN
end

function StoryAIPlayerQK:attackTarget()

    -- ����Ŀ��
    local dir = self:getDirOfTarget()
    self.m_role:setSpriteDir(dir)   

    -- ���ݲ�ͬ��ְҵ�ͷŲ�ͬ�ļ���
    local idx = math.random(1, 2)
    if self.m_school == 1 then
        if idx == 1 then
            -- ��ɱ����
            self.m_role:attackOneTime(0.35, cc.p(0, 0))
            CMagicCtrlMgr:getInstance():CreateMagic(1003, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(1003, self.m_role, { self.m_lockRole }) end)
            self.m_lastAtkTime = 1
        else
            -- �һ𽣷�
            self.m_role:attackOneTime(0.35, cc.p(0, 0))
            CMagicCtrlMgr:getInstance():CreateMagic(1006, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(1006, self.m_role, { self.m_lockRole }) end)
            self.m_lastAtkTime = 1
        end
    elseif self.m_school == 2 then
        if idx == 1 then
            -- �����ϵ�
            self.m_role:magicUpToPos(0.4, cc.p(0, 0))
            CMagicCtrlMgr:getInstance():CreateMagic(2010, 0, self.m_role:getTag(), self.m_lockRole:getTag(), 0);
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(2010, self.m_role, { self.m_lockRole }) end)
            self.m_lastAtkTime = 1
        else
            -- ���л���
            self.m_role:magicUpToPos(0.4, cc.p(0, 0))
            G_MAINSCENE.map_layer:playSkillEffect(0.1, 2011, self.m_role, self.m_lockRole, nil, nil)
            local dstPos = cc.p(self.m_lockRole:getPosition())
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(2011, self.m_role, { self.m_lockRole }, dstPos) end)
            self.m_lastAtkTime = 1.2
        end
    else
        if idx == 1 then
            -- ��ڤ����
            self.m_role:magicUpToPos(0.4, cc.p(0, 0))
            CMagicCtrlMgr:getInstance():CreateMagic(3011, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(3011, self.m_role, { self.m_lockRole }) end)
            self.m_lastAtkTime = 1
        else
            -- ʩ����
            self.m_role:magicUpToPos(0.4, cc.p(0, 0))
            CMagicCtrlMgr:getInstance():CreateMagic(3004, 0, self.m_role:getTag(), self.m_lockRole:getTag(), self.m_role:getCurrectDir());
            startTimerAction(G_MAINSCENE.storyNode, 1, false, function() self.m_storyNode:onPlayerSkill(3004, self.m_role, { self.m_lockRole }) end)
            self.m_lastAtkTime = 1
        end
    end   
end

function StoryAIPlayerQK:fight()
    self.m_state = 1;

    G_ROLE_MAIN:isChangeToHoe(self.m_role,false)
    self.m_role:standed()
end

return StoryAIPlayerQK;