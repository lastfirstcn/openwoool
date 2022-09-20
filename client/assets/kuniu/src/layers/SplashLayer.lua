
--------------------------------------------
---- SplashLayer
--------------------------------------------

SplashLayer = class("SplashLayer", function()
    return cc.Layer:create()
end)

function SplashLayer:ctor()
    self:init()
end

function SplashLayer:init()

    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()

    local splashSprite = cc.Sprite:create("res/login/splash.png")
    local scale = visibleSize.width * 0.3 / splashSprite:getContentSize().width
    splashSprite:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    splashSprite:setScale(scale)
    self:addChild(splashSprite)


    local function login(sender)

        local LoginScene = require("src/login/LoginScene")
        LoginScene.VERSION = LoginUtils.getLocalRecordByKey(2, "current-version-code")
        if #LoginScene.VERSION == 0 then
            LoginScene.VERSION = cc.FileUtils:getInstance():getStringFromFile("version.txt")

         

            LoginUtils.setLocalRecordByKey(2, "current-version-code", LoginScene.VERSION)
        end

      

        local scene = LoginScene.new()
        cc.Director:getInstance():replaceScene(scene)
    end


    local fadeIn = cc.FadeIn:create(1.0)
    local fadeOut = cc.FadeOut:create(3.0)
    local seq = cc.Sequence:create(fadeIn,fadeOut,cc.CallFunc:create(login));
    splashSprite:runAction(seq)

end
