local StoryAIPet = class("StoryAIPet", require ("src/layers/story/StoryAISoldier"))

function StoryAIPet:ctor(storyNode, role)
    require ("src/layers/story/StoryAISoldier").ctor(self, storyNode, role) 
    self.m_type = 2;   --0 soldier; 1 monster; 2 pet 
    self.m_maxDisWithOwner = 8  
    self.m_needMoveToOwner = false
end

function StoryAIPet:update(dt)
 --[[   if self.m_bOver then
        return
    end

    if self.m_role == nil or self.m_role:getHP() < 1 then
        self.m_bOver = true
        return
    end
    
    --���޵�ai��Ҫ�ҵ�����
    --�����ɫ����, �����У������У��ƶ��У�����
    if self.m_state == 0 or self.m_isMoveing == true or self.m_isActing == true then
        return;
    end 

    --���Ŀ���������ÿ�
    if self.m_lockRole ~= nil and self.m_lockRole:getHP() < 1 then
        self.m_lockRole = nil;
    end
]]
    
    require ("src/layers/story/StoryAISoldier").update(self,dt)

    --���������̫Զ�����������Ա�
    if self.m_lockRole == nil and self.m_needMoveToOwner and not self.m_isMoveing and self.m_state > 0 then        
        local pos1 = G_MAINSCENE.map_layer:space2Tile(cc.p(G_ROLE_MAIN:getPosition()))
        local pos2 = G_MAINSCENE.map_layer:space2Tile(cc.p(self.m_role:getPosition()))
        if ((pos1.x - pos2.x) *(pos1.x - pos2.x) +(pos1.y - pos2.y) *(pos1.y - pos2.y)) > self.m_maxDisWithOwner * self.m_maxDisWithOwner then
            self:moveToRole(G_ROLE_MAIN)
            return
        end
    end
end

function StoryAIPet:attackTarget()
    if G_MAINSCENE == nil then
        return
    end
    
    local function callback()
        self.m_iCalHurt = false
        self.m_storyNode:onSkillSend(9999, {self.m_lockRole})
    end

    --����Ŀ��
    local dir = self:getDirOfTarget()
    self.m_role:setSpriteDir(dir)
    self.m_lastAtkTime = 2
    self.m_role:attackOneTime(0.8 , cc.p(0, 0))
    if self.m_iCalHurt ~= true then
        startTimerAction(G_MAINSCENE.storyNode, 1, false, callback)
    end
    self.m_iCalHurt = true

    local function skillShow()
        G_MAINSCENE.map_layer:playSkillEffect(0.4, 6000, self.m_role, self.m_lockRole, nil, nil)
    end
         
    startTimerAction(G_MAINSCENE.storyNode, 0.5, false, skillShow)

end

return StoryAIPet;