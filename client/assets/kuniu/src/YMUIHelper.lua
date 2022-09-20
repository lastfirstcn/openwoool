

YMUIHelper = {
    toScene = nil,
    fontPath = "fonts/msyh.ttf",
    createTTFLabel = nil,
    createEditBox = nil,
    createButton = nil,
    createImageButton = nil,
    createScaleButton = nil,
    createScaleImageButton = nil,
    showToast = nul,
    addEffectWithMode = nil,
}


YMUIHelper.toScene = function (sceneMain,purgeCache)
    if purgeCache then
        cc.Director:getInstance():purgeCachedData()
    end
    cc.Director:getInstance():replaceScene(sceneMain)
end


YMUIHelper.createButton = function (text,fontSize,normalImage,selectedImage,disableImage,listener)
    local button = ccui.Button:create(normalImage,selectedImage,disableImage);
    button:setAnchorPoint(cc.p(0.5, 0.5) )
    button:setTitleText(text)
    button:setTitleFontName(YMUIHelper.fontPath)
    button:setTitleFontSize(fontSize)
    button:setTitleColor(cc.c3b(255, 215, 0))
    button:addClickEventListener(function(sender)
        AudioEnginer.playTouchPointEffect()
        listener(button)
    end)
    return button
end

YMUIHelper.createImageButton = function (normalImage,selectedImage)
    local button = ccui.Button:create(normalImage,selectedImage)
    button:setAnchorPoint(cc.p(0.5, 0.5) )
    button:setTitleText("")
    return button
end

YMUIHelper.createScaleButton = function (text,fontSize,normalImage,listener)
    local button = ccui.Button:create(normalImage);
    local scale = 1.0
    button:setAnchorPoint(cc.p(0.5, 0.5) )
    button:setTitleText(text)
    button:setTitleFontName(YMUIHelper.fontPath)
    button:setTitleFontSize(fontSize)
    button:setTitleColor(cc.c3b(255, 215, 0))

    button:addTouchEventListener(function(sender,eventType)
        if eventType == ccui.TouchEventType.began then
            scale = button:getScale()
            button:setScale(scale + 0.2)
        elseif eventType == ccui.TouchEventType.moved then

        elseif eventType == ccui.TouchEventType.ended then
            button:setScale(scale)
            AudioEnginer.playTouchPointEffect()
            listener(button)
        elseif eventType == ccui.TouchEventType.canceled then
            button:setScale(scale)
        end
    end)
    return button
end

YMUIHelper.createScaleImageButton = function (parent,normalImage,listener)
    local button = ccui.Button:create(normalImage);
    button:setAnchorPoint(cc.p(0.5, 0.5) )
    local scale = 1.0
    button:addTouchEventListener(function(sender,eventType)
        if eventType == ccui.TouchEventType.began then
            scale = button:getScale()
            button:setScale(scale + 0.2)
        elseif eventType == ccui.TouchEventType.moved then

        elseif eventType == ccui.TouchEventType.ended then
            button:setScale(scale)
            AudioEnginer.playTouchPointEffect()
            listener(button)
        elseif eventType == ccui.TouchEventType.canceled then
            button:setScale(scale)
        end
    end)
    if parent then
        parent:addChild(button)
    end
    return button
end

YMUIHelper.createTTFLabel = function (text,fontSize)
    local label = cc.Label:createWithTTF(text,YMUIHelper.fontPath,fontSize)
    label:setAnchorPoint( cc.p(0.5, 0.5) )
    --label:setString(text)
    return label
end


YMUIHelper.createEditBox = function (placeHolder,size,fontSize)
    local editBox = ccui.EditBox:create(size,ccui.Scale9Sprite:create())
    editBox:setAnchorPoint(cc.p(0.5, 0.5))
    editBox:setPlaceHolder(placeHolder)
    editBox:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE);
    editBox:setFont(YMUIHelper.fontPath,fontSize)
    editBox:setPlaceholderFont(YMUIHelper.fontPath,fontSize)
    return editBox
end


YMUIHelper.showToast = function (layer,text)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local toastLabel = cc.Label:createWithTTF(text,YMUIHelper.fontPath, 20)
    toastLabel:setAnchorPoint(cc.p(0.5, 0.5))
    toastLabel:setPosition(visibleSize.width / 2, visibleSize.height/2)
    toastLabel:setTextColor( cc.c3b(0, 250, 154) )
    layer:addChild(toastLabel)
    local fadeIn = cc.FadeIn:create(1.0)
    local fadeOut = cc.FadeOut:create(3.0)
    local seq = cc.Sequence:create(fadeIn,fadeOut,cc.CallFunc:create(function(sender)
        toastLabel:removeFromParent()
    end))
    toastLabel:runAction(seq)

end


--混合模式
YMUIHelper.addEffectWithMode = function(effect_node,mode_id)
    --effect_node:setRenderMode(mode_id)
    if mode_id == 1 then
        effect_node:setBlendFunc(cc.blendFunc(ccb.BlendFactor.ONE , ccb.BlendFactor.ONE_MINUS_SRC_COLOR))
    elseif mode_id == 2 then
        effect_node:setBlendFunc(cc.blendFunc(ccb.BlendFactor.ONE , ccb.BlendFactor.ONE))
    elseif mode_id == 3 then
        effect_node:setBlendFunc(cc.blendFunc(ccb.BlendFactor.SRC_ALPHA , ccb.BlendFactor.ONE))
    elseif mode_id == 0 then
        effect_node:setBlendFunc(cc.blendFunc(ccb.BlendFactor.SRC_ALPHA , ccb.BlendFactor.ONE_MINUS_SRC_ALPHA))
    elseif mode_id == 4 then
        effect_node:setBlendFunc(cc.blendFunc(ccb.BlendFactor.ZERO , ccb.BlendFactor.SRC_COLOR))
    end
end


