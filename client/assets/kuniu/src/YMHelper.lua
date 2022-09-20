
-- cclog
cclog = function(...)
    -- 在logcat中打印用release_print
    --release_print(string.format(...))
    print(string.format(...))
end

YMHelper = {
    performWithDelay = nil,
    schedule = nil,
    getAnimFrames = nil,
    openUrl = nil,
    getCollisionRect = nil,
    urlEncode = nil,
    urlDecode = nil
}

YMHelper.performWithDelay = function(node, callback, delay)
    local delay = cc.DelayTime:create(delay)
    local sequence = cc.Sequence:create(delay, cc.CallFunc:create(callback))
    node:runAction(sequence)
end

YMHelper.schedule = function(node, callback, delay,tag)
    local delay = cc.DelayTime:create(delay)
    local sequence = cc.Sequence:create(delay, cc.CallFunc:create(callback))
    local action = cc.RepeatForever:create(sequence)
    node:runAction(action)
    if tag and tag > 0 then
        action:setTag(tag)
    end

end

YMHelper.getCollisionRect = function(position,width,height)
    return cc.rect(position.x - width/2,position.y - height/2,width,height)
end


YMHelper.getAnimFrames = function(path,count)
    local cache = cc.SpriteFrameCache:getInstance()
    local animFrames = {}
    for j = 1,count do
        local frame = cache:getSpriteFrame( string.format(path .. "%02d.png", j-1) )
        if frame then
            animFrames[j] = frame
        end
    end
    return animFrames
end

YMHelper.openUrl = function(key,param)
    if key == 'index' and YMIndexUrl then
        cc.Application:getInstance():openURL(YMIndexUrl)
    elseif key == 'bbs' and YMBBSUrl then
        cc.Application:getInstance():openURL(YMBBSUrl)
    elseif key == 'register' and YMRegisterUrl then
        cc.Application:getInstance():openURL(YMRegisterUrl)
    elseif key == 'pay' and  YMPayUrl then
        cc.Application:getInstance():openURL(YMPayUrl .. "?" .. param)
    end
end

YMHelper.urlEncode = function(s)
    s = string.gsub(s, "([^%w%.%-])", function(c)
        if c == " " then
            return "+"
        end
        return string.format("%%%02X", string.byte(c))
    end)
    return s
end

YMHelper.urlDecode = function(s)
    s = string.gsub(s, "%%(%x%x)", function(h)
        return string.char(tonumber(h, 16))
    end)
    return s
end
