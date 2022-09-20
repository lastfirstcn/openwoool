require "cocos.init"
require "src/login/LoginUtils"
require "src/layers/SplashLayer"
require "src/YMConfig"
require "src/YMHelper"
require "src/YMUIHelper"

g_adChannel = 1000
-- for CCLuaEngine traceback

local videoPlayer = nil
local isVideoPlaying = false

g_crashLogMd5Table = {}




local onSplashEnd = function()

	 --语聊初始化
    --release_print("yuexiaojun VoiceApollo:ApolloVoiceInit")
    --VoiceApollo:ApolloVoiceInit()

    isVideoPlaying = false

	if videoPlayer then
		videoPlayer:removeFromParent()
	end

	local target = cc.Application:getInstance():getTargetPlatform()
		if target == cc.PLATFORM_OS_ANDROID then
		local args = {false}
		local sigs = "(Z)V"
		local luaj = require "kuniu/cocos/cocos2d/luaj"
	    luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setVideoStatus", args, sigs)
	end

	local json = require("json")
	local path = cc.FileUtils:getInstance():fullPathForFilename("adChannel.json")
    local channel_data = nil
    if path then
        channel_data = cc.FileUtils:getInstance():getStringFromFile(path)
        if channel_data then
            g_Channel_tab = json.decode(channel_data)
            g_adChannel = tonumber(g_Channel_tab.adChannel)
        end
    end

    print(getDownloadDir())

	-- run
	-- local sceneGame = cc.Scene:create()
	-- sceneGame:addChild(SplashLayer.new())
	local LoginScene = require("src/login/LoginScene")
    LoginScene.VERSION = LoginUtils.getLocalRecordByKey(2, "current-version-code")
    if #LoginScene.VERSION == 0 then
        LoginScene.VERSION = cc.FileUtils:getInstance():getStringFromFile("version.txt") 

        if #LoginScene.VERSION == 0 then
        	LoginScene.VERSION = "0.0.0"
        end

        LoginUtils.setLocalRecordByKey(2, "current-version-code", LoginScene.VERSION)
    end
    


    local sceneGame = LoginScene.new()

    if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(sceneGame)
	else
		cc.Director:getInstance():runWithScene(sceneGame)
	end

	local function onKeyReleased(keyCode, event)
        if keyCode == cc.KeyCode.KEY_BACK then
            local target = cc.Application:getInstance():getTargetPlatform()

            if target == cc.PLATFORM_OS_ANDROID then
	            local function gameQuit()
	            	if _OnGameAppEvent ~= nil then
	            		_OnGameAppEvent("1")
	            	else
	            		cc.Director:getInstance():endToLua()
	            	end
	            end

	            local runScene = cc.Director:getInstance():getRunningScene()
				if runScene then
					local quitWnd = runScene:getChildByName("GameQuit")
					if quitWnd then
						quitWnd:removeFromParent()
					else
						local msg = LoginUtils.MessageBoxYesNo("提示", "是否要退出游戏？", gameQuit, nil)
			            msg:setLocalZOrder(60000)
			            msg:setName("GameQuit")
					end
				end
			end

        end
    end

    local listener = cc.EventListenerKeyboard:create()
    listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED )
    local dispatcher = cc.Director:getInstance():getEventDispatcher()
    dispatcher:addEventListenerWithFixedPriority(listener, 1)

end

_G_ChangeVideoStatus = function(str)
	if videoPlayer ~= nil then
		if str == "pause" then
			videoPlayer:pause()
		end
	end
end

_G_voiceBtnEvent = function(str)
	require("src/layers/chat/Microphone"):onVoiceLock(str)
end

local function playVideo()
	isVideoPlaying = true
	local target = cc.Application:getInstance():getTargetPlatform()

	if target == cc.PLATFORM_OS_WINDOWS then
		onSplashEnd()
	else
		if target == cc.PLATFORM_OS_ANDROID then
			local args = {true}
			local sigs = "(Z)V"
			local luaj = require "kuniu/cocos/cocos2d/luaj"
		    luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "setVideoStatus", args, sigs)
		end
		local Director = cc.Director:getInstance()
		local scene = Director:getRunningScene()
		if not scene then
			scene = cc.Scene:create()
			Director:runWithScene(scene)
		end
		local csize = scene:getContentSize()
		videoPlayer = ccexp.VideoPlayer:create()
		videoPlayer:setKeepAspectRatioEnabled(true)
	    videoPlayer:setPosition(cc.p(csize.width/2,csize.height/2))
	    videoPlayer:setAnchorPoint(cc.p(0.5, 0.5))
	    if csize.width == 960 then
	    	videoPlayer:setContentSize(cc.size(csize.width,csize.height))
	    else
	    	videoPlayer:setContentSize(csize)
	    end
	    scene:addChild(videoPlayer)

        local function onSplashEnd_delay()
            if target == cc.PLATFORM_OS_ANDROID then
                onSplashEnd()
            else
                performWithDelay(scene, onSplashEnd, 0.01)
            end
        end

	    local function onVideoEventCallback(sener, eventType)
	        if eventType == ccexp.VideoPlayerEvent.PLAYING then

	       	elseif eventType == ccexp.VideoPlayerEvent.PAUSED then
	       		if target == cc.PLATFORM_OS_ANDROID then
	        		onSplashEnd()
	        	end
	        elseif eventType == ccexp.VideoPlayerEvent.STOPPED then
  				onSplashEnd_delay()
	       	elseif eventType == ccexp.VideoPlayerEvent.COMPLETED then
	       		onSplashEnd_delay()
	       	end
	   	end
	    videoPlayer:addEventListener(onVideoEventCallback)

	    if target == cc.PLATFORM_OS_IPHONE or target == cc.PLATFORM_OS_IPAD then
	    	local function onTouchVideoCallback(sender)
	    		onSplashEnd()
	    	end
	    	local listener = cc.EventListenerTouchOneByOne:create()
    		listener:setSwallowTouches(true)
    		listener:registerScriptHandler(onTouchVideoCallback,cc.Handler.EVENT_TOUCH_BEGAN)
    		local dispatcher = cc.Director:getInstance():getEventDispatcher()
    		dispatcher:addEventListenerWithSceneGraphPriority(listener, scene)
	    end

        local videoFullPath = cc.FileUtils:getInstance():fullPathForFilename("kuniu/video/gameVideo.mp4")
        videoPlayer:setFileName(videoFullPath)
        videoPlayer:play()
        --videoPlayer:seekTo(5)
  		--onSplashEnd()
    end
end

local function initGLView()
	local director = cc.Director:getInstance()
	local glView = director:getOpenGLView()
	if nil == glView then
		glView = cc.GLViewImpl:create("Test")
		director:setOpenGLView(glView)
	end

	director:setOpenGLView(glView)

	glView:setDesignResolutionSize(1920, 1080, cc.ResolutionPolicy.NO_BORDER)

	--turn on display FPS
	director:setDisplayStats(true)

	--set FPS. the default value is 1.0/60 if you don't call this
	director:setAnimationInterval(1.0 / 60)
end


local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    math.randomseed(os.time())

	--initGLView()

	onSplashEnd()
end

_G_SkipVideoFunction = function()
	if isVideoPlaying and videoPlayer then
		performWithDelay(videoPlayer, onSplashEnd, 0.01)
	end
end


Device_target = cc.Application:getInstance():getTargetPlatform()
function isIOS()
    return (Device_target == cc.PLATFORM_OS_IPHONE or Device_target == cc.PLATFORM_OS_IPAD)
end

function isAndroid()
    return (Device_target == cc.PLATFORM_OS_ANDROID)
end

function isWindows()
    return (Device_target == cc.PLATFORM_OS_WINDOWS)
end

function doString(str)
	if str then
		local func, msg = loadstring(str)
		if type(func) == "function" then
            func()
        elseif msg then
        	print(msg)
        end
	end
end

-- socket 轮寻开关
GameSocketLunXun = false

if LoginUtils.isTestMode() and not isWindows() then
    cc.Director:getInstance():getConsole():listenOnTCP(1234)
end

xpcall(main, __G__TRACKBACK__)
