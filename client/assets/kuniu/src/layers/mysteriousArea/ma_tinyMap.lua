local ma_tinyMap = class("ma_tinyMap", function() return cc.Node:create() end)
local cellColor_visited, cellColor_lightUp, cellColor_unknown = 0, 1, 2

function ma_tinyMap:ctor(proto)
    for cellIndex, cell in ipairs(proto.mazeNodes) do
        cell.style = cellColor_lightUp
    end
    --�����ķ������ȼ����,ֱ���滻������Χ�ڵķ�����Ϣ
    for cellIndex, cell in ipairs(proto.curPathNodes) do
        local bool_foundCell = false
        local index_to_remove
        for k, v in ipairs(proto.mazeNodes) do
            if v.index == cell.index then
                bool_foundCell = true
                index_to_remove = k
                break
            end
        end
        if bool_foundCell then
            table.remove(proto.mazeNodes, index_to_remove)
        end
        cell.style = cellColor_visited
        table.insert(proto.mazeNodes, cell)
    end
    --��ȷ·�ߵķ������ȼ���ͣ�ֻ����������Χ�ڷ�����Ϣ������ʱ�ż���
    for k, cell in ipairs(proto.rightPathNodes) do
        local bool_foundCell = false
        for k, v in ipairs(proto.mazeNodes) do
            if v.index == cell.index then
                bool_foundCell = true
                break
            end
        end
        if not bool_foundCell then
            cell.style = cellColor_lightUp
            table.insert(proto.mazeNodes, cell)
        end
    end
    for i = 0, 7 * 7 - 1, 1 do
        local bool_foundCell = false
        for k, v in ipairs(proto.mazeNodes) do
            if v.index == i then
                bool_foundCell = true
                break
            end
        end
        if not bool_foundCell then
            table.insert(
                proto.mazeNodes
                , {
	                index = i           --��������
	                , mapId = 0         --��ͼId��������Ч
	                , openState	= 0     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��, ������Ч
	                , eventType = 0     --�¼�����:��Ҫ���嶨, ������Ч
	                , eventState = 0    --�¼�״̬ 0δ���� 1���� 2���, ����
                    , style = cellColor_unknown
                }
            )
        end
    end
    if proto.completed ==1 then
        for k, v in pairs(proto.mazeNodes) do
            v.style = cellColor_visited
        end
    end
    table.sort(proto.mazeNodes, function(a, b)
        return a.index < b.index
    end)
    local x_offset = display.width - 150
    local y_offset = display.height + 10 - 35
    -- + 568
    local distance_x, distance_y = 10, 10
    local tag_gap = 100
    --�Ȳ��������û�з��͹��������ݣ�������index�����ٽ����������Ⱦ����
    for k, v in ipairs(proto.mazeNodes) do
        --������ţ����Ҳ������״̬������Ϊ����һ�������ķ��䣬���������Ϊ���������༤���δ�����Ϊ����
        local spr_grid_bg = cc.Sprite:create(v.index == proto.curIndex and "res/layers/mysteriousArea/cell_current_xiao.png" or (v.style == cellColor_visited and "res/layers/mysteriousArea/cell_visited_xiao.png" or (v.style == cellColor_lightUp and "res/layers/mysteriousArea/cell_lightUp_xiao.png" or "res/layers/mysteriousArea/cell_unvisited_xiao.png")))
        local num_north = 1  --0x0001
        local num_east = 2  --0x0010
        local num_sourth = 4  --0x0100
        local num_west = 8  --0x1000
        --�����м����ȥ��
        --�ŵķֲ�ʾ��ͼ,���±�ʾ:
        --          door_2,1            door_4,1
        --door_1,2    2,2     door_3,2    4,2     door_5,2
        --          door_2,3            door_4,3
        --
        --�ŵ�tagƴ��, ����: door_2,1 => tag = 21
        --door index => tag
        local x, y = (v.index % 7 + 1) * 2, (math.floor(v.index / 7) + 1) * 2
        spr_grid_bg:setTag(x * tag_gap + y)
        spr_grid_bg:setPosition(cc.p(x * distance_x + x_offset, - y * distance_y + y_offset))
        self:addChild(spr_grid_bg)
        if not self:getChildByTag((x + 1) * tag_gap + y) and lua_byteAnd(v.openState, num_east) ~= 0 then
            local door_x, door_y = x + 1, y
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon_xiao.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(0)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            self:addChild(spr_door_icon, 2)
        end
        if not self:getChildByTag((x - 1) * tag_gap + y) and lua_byteAnd(v.openState, num_west) ~= 0 then
            local door_x, door_y = x - 1, y
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon_xiao.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(0)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            self:addChild(spr_door_icon, 2)
        end
        if not self:getChildByTag(x * tag_gap + y - 1) and lua_byteAnd(v.openState, num_north) ~= 0 then
            local door_x, door_y = x, y - 1
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon_xiao.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(90)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            self:addChild(spr_door_icon, 2)
        end
        if not self:getChildByTag(x * tag_gap + y + 1) and lua_byteAnd(v.openState, num_sourth) ~= 0 then
            local door_x, door_y = x, y + 1
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon_xiao.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(90)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            self:addChild(spr_door_icon, 2)
        end
        if v.index == proto.endIndex and v.eventState ~= 2 then
            --���մ�
            local spr_finalReward = cc.Sprite:create("res/fb/defense/boxCan1.png")
            spr_finalReward:setPosition(cc.p(8, 13))
            spr_finalReward:setScale(45 / 84 / 3)
            spr_grid_bg:addChild(spr_finalReward)
        end
        for k, prizeIndex in ipairs(proto.prizeIndexs) do
            if v.index == prizeIndex and v.eventState ~= 2 then
                --�ر���
                local spr_normalReward = cc.Sprite:create("res/fb/defense/unpassed_box1.png")
                spr_normalReward:setPosition(cc.p(8, 13))
                spr_normalReward:setScale(45 / 84 / 3)
                spr_grid_bg:addChild(spr_normalReward)
            end
        end
        --��ʱֱ�Ӱ󶨵����ʾ��ͼ�¼���ÿ��cell��
        GetUIHelper():AddTouchEventListener(true, spr_grid_bg, nil, function()
            g_msgHandlerInst:sendNetDataByTable(MAZE_CS_NOTIFY_REQ, "NotifyMazeReq", {})
        end)
    end
end

return ma_tinyMap