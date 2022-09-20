local MColor = require "src/config/FontColor"
return { new = function(params)

    -----------------------------------------------------------------------
    if params.q_sort == nil then
        print("should set param q_sort, equipMakeSelectTypeLayer.lua")
    end
    if params.q_sort ~= nil and params.protoId ~= nil then
        local sex = MRoleStruct:getAttr(PLAYER_SEX)          --�Ա�
        local school = MRoleStruct:getAttr(ROLE_SCHOOL)      --ְҵ
        local table_forge = require("src/config/Forge")
        local prop_tab = {}
        for k, v in pairs(require("src/config/propCfg")) do
            prop_tab[v.q_id] = v
        end
        local v = prop_tab[params.protoId]
        local bool_showable = (
                params.protoId ~= nil
                        and v ~= nil
                        and (v.q_sex == sex or v.q_sex == 0)
                        and (v.q_job == school or v.q_job == 0)
        )
        if bool_showable == false then
            TIPS({str = game.getStrByKey("equip_not_my_school")})
            return false
        end
        local bool_exist_in_forge = false
        for k_forge, v_forge in pairs(table_forge) do
            while true do
                if bool_showable == false then
                    break
                end
                local table_item = assert(loadstring("return " .. v_forge.q_itemID))()
                local bool_item_more_than_one = false
                for k_forgable_item, v_forgable_item in pairs(table_item) do
                    if table.size(v_forgable_item) > 1 then
                        bool_item_more_than_one = true
                        break
                    end
                end
                for k_forgable_item, v_forgable_item in pairs(bool_item_more_than_one and table_item[school] or table_item[1]) do
                    if params.protoId == k_forgable_item then
                        bool_exist_in_forge = true
                        break
                    end
                end
                break
            end
        end
        if bool_exist_in_forge == nil then
            print("not target found in forge.lua")
            return false
        end
    end
    local Mbaseboard = require "src/functional/baseboard"
    local root = Mbaseboard.new(
            {
                src = "res/common/bg/bg18.png",
                close = {
                    src = {"res/component/button/x2.png", "res/component/button/x2_sel.png"},
                    offset = { x = -8, y = 4 },
                },
                title = {
                    src = params.q_sort == 1 and game.getStrByKey("equip_make") or game.getStrByKey("compound"),
                    size = 25,
                    color = MColor.lable_yellow,
                    offset = { y = -25 },
                }
            })
    local node = require("src/layers/equipment/equipMakeSelectTypeLayer").new(params)
    local bg_left_padding = 17
    node:setPosition(cc.p(bg_left_padding, 0))
    root:addChild(node)
    --todo:��Ҫ��100��Ϊrequire("src/config/CommDef").BASE_SUB_NODE_TAG
    root:setTag(100 + require("src/config/CommDef").PARTIAL_TAG_EQUIP_MAKE_DIALOG_TEMP)
    if getRunScene():getChildByTag(100 + require("src/config/CommDef").PARTIAL_TAG_EQUIP_MAKE_DIALOG_TEMP) then
        getRunScene():removeChildByTag(100 + require("src/config/CommDef").PARTIAL_TAG_EQUIP_MAKE_DIALOG_TEMP)
    end

    root:registerScriptHandler(function(event)
        if event == "enter" then
            G_TUTO_NODE:setShowNode(root, SHOW_MAKE)
        elseif event == "exit" then
        end
    end)
    -----------------------------------------------------------------------

    -----------------------------------------------------------------------
    return root
end}