local ma_miniMapDialog = class("ma_miniMapDialog", function() return cc.Node:create() end)
local cellColor_visited, cellColor_lightUp, cellColor_unknown = 0, 1, 2

function ma_miniMapDialog:ctor(proto)
    --test data:
    --[[
    local proto = {
	    curIndex = 3    --���������󷿼�����


	    , endIndex = 3     --������
	    , prizeIndexs = {4, 5, 6}  --С����������
	    , curPathNodes = {
            {
	            index = 0           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 8    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 4           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 8    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 2           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 8    --�¼�״̬ 0δ���� 1���� 2���
            }
        }  --��ͨ���ķ�������,��ʽ�Ǿ���ĵ�ͼ��Ϣ
	    , rightPathNodes = {
            {
	            index = 0           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 2    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 4           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 1    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 2           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 0    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 3           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 2    --�¼�״̬ 0δ���� 1���� 2���
            } 
            , {
	            index = 10           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 9    --�¼�״̬ 0δ���� 1���� 2���
            } 
        }	--��ȷ·������



	    , mazeNodes = {
            {
	            index = 0           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 2    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 4           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 1    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 2           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 0    --�¼�״̬ 0δ���� 1���� 2���
            }
            , {
	            index = 3           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 2    --�¼�״̬ 0δ���� 1���� 2���
            } 
            , {
	            index = 10           --��������
	            , mapId = 2         --��ͼId
	            , openState	= 3 + 8     --�Ŵ򿪱�־������λ��ʾ 0�� 1�� 2�� 3��
	            , eventType = 4     --�¼�����:��Ҫ���嶨
	            , eventState = 1    --�¼�״̬ 0δ���� 1���� 2���
            } 
        } --���������󷿼������Ϣ
    }
    ]]
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
    local bg = createBgSprite(self, game.getStrByKey("mysteriousArea_title"))
    local x_offset = - 45 + 1 + 20
    local y_offset = 568
    local spr_bg = cc.Sprite:create("res/layers/mysteriousArea/bg.jpg")
    spr_bg:setPosition(cc.p(505 + x_offset, 288))
    bg:addChild(spr_bg)
    --��ڿ�
    createScale9Sprite(
        bg,
        "res/layers/mysteriousArea/outer_border.png",
        cc.p(20 + 13, 20 + 18),
        cc.size(894, 500),
        cc.p(0, 0)
    )
    local distance_x, distance_y = 63, 35
    --ƽ�̵�ͼ
    for index = 0, 48, 1 do
        local x, y = (index % 7 + 1) * 2, (math.floor(index / 7) + 1) * 2
        local spr_grid_bg = cc.Sprite:create("res/layers/mysteriousArea/cell_bg.png")
        spr_grid_bg:setPosition(cc.p(x * distance_x + x_offset, - y * distance_y + y_offset))
        bg:addChild(spr_grid_bg)
    end
    local tag_gap = 100
    --�Ȳ��������û�з��͹��������ݣ�������index�����ٽ����������Ⱦ����
    for k, v in ipairs(proto.mazeNodes) do
        --������ţ����Ҳ������״̬������Ϊ����һ�������ķ��䣬���������Ϊ���������༤���δ�����Ϊ����
        local spr_grid_bg = cc.Sprite:create(v.style == cellColor_visited and "res/layers/mysteriousArea/cell_visited.png" or (v.style == cellColor_lightUp and "res/layers/mysteriousArea/cell_lightUp.png" or "res/layers/mysteriousArea/cell_unvisited.png"))
        GetUIHelper():AddTouchEventListener(true, spr_grid_bg, nil, function()
            if G_MAINSCENE.map_layer.currentMazeNode.index == v.index then
                return
            end
            if G_MAINSCENE.map_layer.currentMazeNode.eventState ~= 2 then
                TIPS(getConfigItemByKeys("clientmsg", {"sth", "mid"}, {38000, -9}))
                return
            end
            if v.eventState ~= 2 then
                TIPS(getConfigItemByKeys("clientmsg", {"sth", "mid"}, {38000, -8}))
                return
            end
            if not G_MYSTERIOUS_NOT_SHOW_AGAIN_STETE.transfor then
                local tempLayer
                tempLayer = MessageBoxYesNo(nil, game.getStrByKey("mysteriousArea_transfor_confirm"), function()
                    G_MYSTERIOUS_NOT_SHOW_AGAIN_STETE.transfor = (tempLayer.checkBox:getTexture() == TextureCache:getTextureForKey("res/component/checkbox/1-2.png"))
                    G_MAINSCENE.map_layer.willEnterNextRoom = true
                    g_msgHandlerInst:sendNetDataByTable(MAZE_CS_JUMP_OTHER_REQ, "MazeJumpOtherReq", {index = v.index})
                end, nil)
    	        tempLayer.checkBox = createTouchItem(tempLayer, "res/component/checkbox/1.png", cc.p(170, 110), function(sender)
                    sender:setTexture(sender:getTexture() == TextureCache:getTextureForKey("res/component/checkbox/1.png") and "res/component/checkbox/1-2.png" or "res/component/checkbox/1.png")
		        end)
    	        createLabel(tempLayer, game.getStrByKey("ping_btn_no_more"), cc.p(195, 110), cc.p(0, 0.5), 20, true, nil, nil, MColor.lable_black, nil, nil, MColor.black, 3)
            else
                G_MAINSCENE.map_layer.willEnterNextRoom = true
    	        g_msgHandlerInst:sendNetDataByTable(MAZE_CS_JUMP_OTHER_REQ, "MazeJumpOtherReq", {index = v.index})
            end
        end)
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
        bg:addChild(spr_grid_bg)
        if not bg:getChildByTag((x + 1) * tag_gap + y) and lua_byteAnd(v.openState, num_east) ~= 0 then
            local door_x, door_y = x + 1, y
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(0)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            bg:addChild(spr_door_icon)
        end
        if not bg:getChildByTag((x - 1) * tag_gap + y) and lua_byteAnd(v.openState, num_west) ~= 0 then
            local door_x, door_y = x - 1, y
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(0)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            bg:addChild(spr_door_icon)
        end
        if not bg:getChildByTag(x * tag_gap + y - 1) and lua_byteAnd(v.openState, num_north) ~= 0 then
            local door_x, door_y = x, y - 1
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(90)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            bg:addChild(spr_door_icon)
        end
        if not bg:getChildByTag(x * tag_gap + y + 1) and lua_byteAnd(v.openState, num_sourth) ~= 0 then
            local door_x, door_y = x, y + 1
            local spr_door_icon = cc.Sprite:create("res/layers/mysteriousArea/door_icon.png")
            spr_door_icon:setPosition(cc.p(door_x * distance_x + x_offset, - door_y * distance_y + y_offset))
            spr_door_icon:setRotation(90)
            spr_door_icon:setTag(door_x * tag_gap + door_y)
            bg:addChild(spr_door_icon)
        end
        if v.index == proto.endIndex and v.eventState ~= 2 then
            --���մ�
            local spr_finalReward = cc.Sprite:create("res/fb/defense/boxCan1.png")
            spr_finalReward:setPosition(cc.p(50, 39))
            spr_finalReward:setScale(45 / 84)
            spr_grid_bg:addChild(spr_finalReward)
        end
        for k, prizeIndex in ipairs(proto.prizeIndexs) do
            if v.index == prizeIndex and v.eventState ~= 2 then
                --�ر���
                local spr_normalReward = cc.Sprite:create("res/fb/defense/unpassed_box1.png")
                spr_normalReward:setPosition(cc.p(50, 39))
                spr_normalReward:setScale(45 / 84)
                spr_grid_bg:addChild(spr_normalReward)
            end
        end
    end
    local spr_user_icon = cc.Sprite:create("res/mapui/29.png")
    local cell_width, cell_height = 116, 60
    spr_user_icon:setPosition(cc.p(cell_width / 2, cell_height / 2))
    local user_x, user_y = proto.curIndex % 7 + 1, math.floor(proto.curIndex / 7) + 1
    bg:getChildByTag(user_x * 2 * tag_gap + user_y * 2):addChild(spr_user_icon)
    SwallowTouches(self)
end

return ma_miniMapDialog