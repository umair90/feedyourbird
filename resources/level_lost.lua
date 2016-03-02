--[[
level lost
--]]

local scene = director:createScene()
scene.name = "level_lost"
--local level_selector = dofile("level_selector.lua")
local dw = director.displayWidth
local dh = director.displayHeight
local currentLevel
function scene:setUp(event)
	dbg.print("level lost:setUp")

  self.sb = newScaleBox();
  self.background = makeSprite(globals.xCentre, globals.yCentre, "graphics/game_over_fail.png");

  self.button_replay = director:createSprite( {
		x=120, y=250,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		zOrder = 2,
    source="graphics/replay.png",
	} )
   self.button_menu = director:createSprite( {
		x=120, y=200,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		zOrder = 2,
    source="graphics/menu.png",
	} )
  function readLastLevel ()
                                                        -- Get the system path where we can write/read files
  local pathS = system:getFilePath("storage", "")
                                                        -- Here's the filename we'll use
  local filename = "current_level.txt"
                                                        -- Here's a file handle variable
  local file
  file = io.open(pathS .. filename)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. filename, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    currentLevel = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. currentLevel)
    file:close()
    end
  end  
  readLastLevel()
end
function scene:tearDown(event)
	dbg.print("scene1:tearDown")
  self.button_replay:removeFromParent()
  self.button_menu:removeFromParent()
  self.background:removeFromParent()
  
  director:getCurrentScene():releaseAtlas(self.button_replay.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_replay.animation)

  director:getCurrentScene():releaseAtlas(self.button_menu.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_menu.animation)
  
  director:getCurrentScene():releaseAtlas(self.background.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.background.animation)
  
  director:getCurrentScene():releaseResources()
  
	self.button_replay = nil
	self.button_menu = nil
	self.background = nil
  pathS = nil
  filename = nil
  file = nil
  self.sb:removeFromParent();
  self.sb = nil;
  
  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Level_Lost    "..math.floor(collectgarbage("count")))
end
function scene:enterPreTransition(event)
	dbg.print("scene1:enterPreTransition")
  function button_menu_fn(event)
    if event.phase == "ended" then
    print("touch active on menu button")
  --  director:setCurrentScene(nil)
    director:moveToScene(level_selector,{ transitionType = "crossFade", transitionTime = 0.5 })
    end
  end
  
  function button_replay_fn(event)
    if event.phase == "ended" then

    if currentLevel == "1" then
    director:moveToScene(level_1,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "2" then
    director:moveToScene(level_2,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "3" then
    director:moveToScene(level_3,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "4" then
    director:moveToScene(level_4,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "5" then
    director:moveToScene(level_5,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "6" then
    director:moveToScene(level_6,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "7" then
    director:moveToScene(level_7,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "8" then
    director:moveToScene(level_8,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "9" then
    director:moveToScene(level_9,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "10" then
    director:moveToScene(level_10,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "11" then
    director:moveToScene(level_11,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "12" then
    director:moveToScene(level_12,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "13" then
    director:moveToScene(level_13,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "14" then
    director:moveToScene(level_14,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "15" then
    director:moveToScene(level_15,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "16" then
    director:moveToScene(level_16,{ transitionType = "crossFade", transitionTime = 0.5 })
    elseif currentLevel == "17" then
    director:moveToScene(level_17,{ transitionType = "crossFade", transitionTime = 0.5 })
  else
    print("Current level is s s "..currentLevel)
    end
    
    end
  end
  self.button_replay:addEventListener("touch", button_replay_fn)
  self.button_menu:addEventListener("touch", button_menu_fn)
end
function scene:enterPostTransition(event)
	dbg.print("scene1:enterPostTransition")
end
function scene:exitPreTransition(event)
	dbg.print("scene1:exitPreTransition")
end
function scene:exitPostTransition(event)
	dbg.print("scene1:exitPostTransition")
end

-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown", "enterPreTransition",
	"enterPostTransition", "exitPreTransition", "exitPostTransition" }, scene)

return scene