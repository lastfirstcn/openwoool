local StoryAI = class("StoryAI")

function StoryAI:ctor(storyNode, role)
    self.m_storyNode = storyNode;
    self.m_role = role;
    self.m_type = 0;   --0 soldier; 1 monster; 2 pet; 3 player
    self.m_attackRange = 3;  --������Χ
    self.m_lockRange = 10;   --���з�Χ
    self.m_state = 0;        --����
    self.m_lockRole = nil;   
    self.m_isMoveing = false;
    self.m_lastAtkTime = 1
    self.m_onCollideTime = 0; 
end
 
function StoryAI:update(dt)
    if G_MAINSCENE == nil or self.m_bOver or self.m_state == 0 then
        return
    end
    
    if self.m_role == nil or self.m_role:getHP() < 1 then
        self.m_bOver = true
        if self.m_type == 0 then   --սʿû����������
            self.m_role:setVisible(false)
        end
        return
    end

    if self.m_role:getCurrActionState() == ACTION_STATE_IDLE then
        self.m_isMoveing = false
    end

    self.m_onCollideTime = self.m_onCollideTime - dt
    if self.m_onCollideTime > 0 then
        return
    end
  
    --�����ɫ����, �����У������У��ƶ��У�����
    self.m_lastAtkTime = self.m_lastAtkTime - dt
    if self.m_isMoveing == true or self.m_lastAtkTime > 0 then
        return;
    end 

    --���Ŀ���������ÿ�
    if self.m_lockRole ~= nil and self.m_lockRole:getHP() < 1 then
        self.m_lockRole = nil;
    end

    --����
    if self.m_lockRole == nil then
        self.m_lockRole = self:lockTarget()
        if self.m_lockRole == nil then
            self.m_role:standed()
            return;
        end        
    end

    --�Ƿ���Ҫ�ƶ�
    if self:isNeedMove() == true then
        if self.m_canMove == false then
            return;
        end

        self:moveToRole(self.m_lockRole);
        return;
    end
    
    --����
    self:attackTarget();
end

function StoryAI:lockTarget()
    return nil
end

function StoryAI:isNeedMove()
    if self.m_lockRole == nil or G_MAINSCENE == nil then
        return false
    end
    local state = self.m_role:getCurrActionState()
    if state == ACTION_STATE_WALK or state == ACTION_STATE_RUN then
        return false
    end
    local pos1 = G_MAINSCENE.map_layer:space2Tile(cc.p(self.m_lockRole:getPosition()))
    local pos2 = G_MAINSCENE.map_layer:space2Tile(cc.p(self.m_role:getPosition()))
    if ((pos1.x - pos2.x)*(pos1.x - pos2.x) + (pos1.y - pos2.y)*(pos1.y - pos2.y)) > self.m_attackRange*self.m_attackRange then
        return true
    end

    return false
end

function StoryAI:getNearPosOfRole(role)
    local pos = cc.p(self.m_role:getPositionX(), self.m_role:getPositionY())
    if role == nil then
        return pos
    end

    local dx =(self.m_role:getPositionX() - role:getPositionX())
    local dy =(self.m_role:getPositionY() - role:getPositionY())
    local dTotal = math.sqrt(dx*dx + dy*dy)
    pos.x = role:getPositionX() + dx/dTotal*80 
    pos.y = role:getPositionY() + dy/dTotal*80 

--[[    if (math.abs(dx) / math.abs(dy)) > 5 then
        pos.x = role:getPositionX() + dx/math.abs(dx)*64 
        pos.y = role:getPositionY()
    elseif (math.abs(dx) / math.abs(dy)) < 0.2 then
        pos.x = role:getPositionX()
        pos.y = role:getPositionY() + dy/math.abs(dy)*48 
    else
        pos.x = role:getPositionX() + dx/math.abs(dx)*64 
        pos.y = role:getPositionY() + dy/math.abs(dy)*48 
    end
]]
    return pos
end

function StoryAI:getDirOfTarget()
    if self.m_lockRole == nil then
        return 0
    end

    local dx =(self.m_lockRole:getPositionX() - self.m_role:getPositionX())
    local dy =(self.m_lockRole:getPositionY() - self.m_role:getPositionY())
    if (math.abs(dx) / math.abs(dy)) > 5 then
        if dx < 0 then
            return 4
        else
            return 0
        end
    elseif (math.abs(dx) / math.abs(dy)) < 0.2 then
        if dy < 0 then
            return 6
        else
            return 2
        end
    else
        if dx > 0 and dy > 0 then
            return 1
        elseif dx < 0 and dy > 0 then
            return 3
        elseif dx < 0 and dy < 0 then
            return 5
        else
            return 7
        end
    end

    return pos
end

function StoryAI:moveToRole(role)
    if role == nil or G_MAINSCENE == nil then
        return
    end
    
    self.m_isMoveing = true;
    
    --��ȡĿ���������������
    local pos = self:getNearPosOfRole(role)
    pos = G_MAINSCENE.map_layer:space2Tile(pos)
    local paths = G_MAINSCENE.map_layer:moveMonsterByPos(pos, self.m_role, 2, false)
    if self.m_type < 3 then
        G_MAINSCENE.map_layer:moveByPaths(paths, self.m_role, self.m_role:getTag(), 0.3 + math.random(1,3)*0.1, nil, function() self.m_isMoveing = false end)
    else
        G_MAINSCENE.map_layer:moveByPaths(paths, self.m_role, self.m_role:getTag(), 0.23, nil, function() self.m_isMoveing = false end)
    end

end

function StoryAI:moveToPos(dstPos)
    if dstPos == nil or G_MAINSCENE == nil then
        return
    end
    
    self.m_isMoveing = true;
    
    pos = dstPos
    local paths = G_MAINSCENE.map_layer:moveMonsterByPos(pos, self.m_role, 2, false)
    if self.m_type < 3 then
        G_MAINSCENE.map_layer:moveByPaths(paths, self.m_role, self.m_role:getTag(), 0.3 + math.random(1,3)*0.1, nil, function() self.m_isMoveing = false end)
    else
        G_MAINSCENE.map_layer:moveByPaths(paths, self.m_role, self.m_role:getTag(), 0.23, nil, function() self.m_isMoveing = false end)
    end

end

function StoryAI:attackTarget()
    if G_MAINSCENE == nil then
        return
    end
    
    local function callback()
        self.m_iCalHurt = false

        --�˺�����
        if self.m_type == 2 then
            self.m_storyNode:onSkillSend(9999, {self.m_lockRole})
        elseif self.m_type == 1 then
            self.m_storyNode:onSkillSend(9998, {self.m_lockRole})
        else
            self.m_storyNode:onSkillSend(9997, {self.m_lockRole})
        end
    end

    --����Ŀ��
    local dir = self:getDirOfTarget()
    self.m_role:setSpriteDir(dir)
    self.m_lastAtkTime = 2
    self.m_role:attackOneTime(0.8 + math.random(1,4)*0.1 , cc.p(0, 0))
    if self.m_iCalHurt ~= true then
        startTimerAction(G_MAINSCENE.storyNode, 1, false, callback)
    end
    self.m_iCalHurt = true

    if self.m_type == 2 then
        local function skillShow()
            G_MAINSCENE.map_layer:playSkillEffect(0.4, 6000, self.m_role, self.m_lockRole, nil, nil)
        end
         
        startTimerAction(G_MAINSCENE.storyNode, 0.7, false, skillShow)
    end
end

function StoryAI:idle()   
    self.m_state = 0;
    self.m_isMoveing = false 

    if self.m_type == 2 then
        self.m_role:standed()
    end
end

function StoryAI:fight()
    self.m_state = 1;
end

function StoryAI:onCollide(time)
    self.m_onCollideTime = time or 2.0
end


return StoryAI;