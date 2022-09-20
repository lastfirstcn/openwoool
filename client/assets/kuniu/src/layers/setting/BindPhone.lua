
local BindPhoneDialog = class("BindPhoneDialog")

function BindPhoneDialog.showDialog()

    local rScene = getRunScene()

    local bg = createSprite(rScene, "res/common/bg/bg31.png", cc.p(display.cx,display.cy),cc.p(0.5,0.5),299)

    createLabel(bg,"绑定手机", cc.p(bg:getContentSize().width/2, 260), cc.p(0.5, 0.5), 22, true)

    local tipLabel = createLabel(bg, "",cc.p(bg:getContentSize().width/2,120),cc.p(0.5,0.5),20,nil,nil,nil,MColor.alarm_red)
    tipLabel:setString("请仔细检查填入的手机号哦！")

    local editePwdBg = createScale9Sprite(bg , "res/common/bg/inputBg9.png",cc.p(bg:getContentSize().width/2, bg:getContentSize().height - 90), cc.size(320 , 48 ) , cc.p( 0.5 , 0.5 ) )
    local editBox = createEditBox(editePwdBg, nil ,cc.p(130, editePwdBg:getContentSize().height/2) ,cc.size(250,48),MColor.lable_yellow , 22,"请输入要绑定的手机号！")
    editBox:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
    editBox:setPlaceholderFontSize(20)
    editBox:setMaxLength(14)
    editBox:setPlaceHolder("请输入要绑定的手机号！")

    local function closeFunc()
        removeFromParent(bg)
    end


    local function commitPhone(phone)
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
        xhr:open("POST", YMApiUrl)
        local function onReadyStateChange()
            print("xhr.readyState", xhr.readyState)
            print("xhr.status", xhr.status)
            print("xhr.response", xhr.response)
            if xhr.readyState == 4 and xhr.status == 200 then
                -- 解析json数据
                local responseJson = json.decode(xhr.response)
                if responseJson.code == "1" then
                    TIPS({type=1, str=responseJson.message})
                    removeFromParent(bg)
                else
                    TIPS({type=1, str=responseJson.message})
                end
            end
        end
        xhr:registerScriptHandler(onReadyStateChange)
        local param = "action=bindPhone&roleId=" .. CURRENT_ROLE.RoleID .. "&phone=" .. phone .. "&token=".. YMToken
        xhr:send(param)
    end

    local cancelBtn = createMenuItem(bg, "res/component/button/50.png", cc.p(bg:getContentSize().width/2-100, 45), closeFunc)
    createLabel(cancelBtn, game.getStrByKey("cancel"), getCenterPos(cancelBtn), cc.p(0.5, 0.5), 22, true)
    local function sureFunc()
        local str = editBox:getText()
        if str and #str > 0 then
            commitPhone(str)
        else
            TIPS({ type = 1 , str = "请输入手机号码！" , isMustShow = true})
        end
    end

    local sureBtn = createMenuItem(bg, "res/component/button/50.png", cc.p(bg:getContentSize().width/2+100, 45), sureFunc)
    createLabel(sureBtn, game.getStrByKey("sure"), getCenterPos(sureBtn), cc.p(0.5, 0.5), 22, true)

    registerOutsideCloseFunc(bg, closeFunc, true)
end


return BindPhoneDialog
