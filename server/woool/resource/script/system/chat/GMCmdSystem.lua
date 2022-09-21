--GMCmdSystem.lua
require "event.EventSetDoer"
require "system.chat.ShellSystem"
--require "game.ShellSystemConfig"
----------


local logger = Logger.getLogger()
local evtFct = EventFactory.getInstance()
local evtMgr = EventManager.getInstance()
local chatSys=ChatSystem.getInstance()
--local ptManager=PetManager:getInstance()
--part of single global ShellSystem object
GMSystem={}