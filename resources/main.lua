--[[
Utrade_Game

Implementing Physics game
--]]

--local dw = director.displayWidth
--local dh = director.displayHeight

--All code of dofiles are here 
dofile("globals.lua");
dofile("scaleBox.lua");
dofile("wrappers.lua");
--system:setFrameRateLimit(0)
--local a = system.deltaTime("2")
main_menu = dofile("main_menu.lua");
splash_sc = dofile("splash_sc.lua");
level_selector = dofile("level_selector.lua")
level_selector2 = dofile("level_selector2.lua")
level_selector3 = dofile("level_selector3.lua")

level_1 = dofile("level_1.lua")
level_2 = dofile("level_2.lua")
level_3 = dofile("level_3.lua")
level_4 = dofile("level_4.lua")
level_5 = dofile("level_5.lua")
level_6 = dofile("level_6.lua")
level_7 = dofile("level_7.lua")
level_8 = dofile("level_8.lua")
level_9 = dofile("level_9.lua")
level_10 = dofile("level_10.lua")
level_11 = dofile("level_11.lua")
level_12 = dofile("level_12.lua")
level_13 = dofile("level_13.lua")
level_14 = dofile("level_14.lua")
level_15 = dofile("level_15.lua")
level_16 = dofile("level_16.lua")
level_17 = dofile("level_17.lua")

level_lost = dofile("level_lost.lua")         --added from main.lua
level_complete = dofile("level_complete.lua") --added from main.lua
fake = dofile("fake.lua")
buy_levels = dofile("buy_levels.lua")
require("staging")

dw = director.displayWidth                          -- getting device width
dh = director.displayHeight                         -- getting device width
physics.debugDraw = false
director:setCurrentScene(nil)

collectgarbage("collect")  
print("Mem. at Main completion    "..math.floor(collectgarbage("count")))
--director:moveToScene(level_17,{ transitionType = "crossFade", transitionTime = 0.05 })
director:moveToScene(splash_sc,{ transitionType = "crossFade", transitionTime = 0.05 })
