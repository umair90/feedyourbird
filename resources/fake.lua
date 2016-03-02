--[[
fake scene
--]]

local scene = director:createScene()
scene.name = "fake"

local currentLevel  
function scene:setUp(event)
	print("fake:setUp")
  self.sb = newScaleBox();
  self.bg = makeSprite(globals.xCentre, globals.yCentre, "graphics/bg.png");
 
 
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
	print("fake:tearDown Starts")
  
  self.bg:removeFromParent()
  self.sb:removeFromParent()

  director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.bg.animation) 
  director:getCurrentScene():releaseResources()
  self.bg = nil
  self.sb = nil
  
  collectgarbage("collect")
  director:cleanupTextures()
  print("GarBage Collector "..math.floor(collectgarbage("count")))
  print("fake:tearDown Endss")
end
function scene:enterPreTransition(event)
	print("fake:enterPreTransition")

end
function scene:enterPostTransition(event)
	print("fake:enterPostTransition")
  --print("current level is "..currentLevel)

  local function moveScene(event)  
   -- director:setCurrentScene(nil)
    if currentLevel == "1" then
   director:moveToScene(level_1,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "2" then
    director:moveToScene(level_2,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "3" then
    director:moveToScene(level_3,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "4" then
    director:moveToScene(level_4,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "5" then
    director:moveToScene(level_5,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "6" then
    director:moveToScene(level_6,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "7" then
    director:moveToScene(level_7,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "8" then
    director:moveToScene(level_8,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "9" then
    director:moveToScene(level_9,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "10" then
    director:moveToScene(level_10,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "11" then
    director:moveToScene(level_11,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "12" then
    director:moveToScene(level_12,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "13" then
    director:moveToScene(level_13,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "14" then
    director:moveToScene(level_14,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "15" then
    director:moveToScene(level_15,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "16" then
    director:moveToScene(level_16,{ transitionType = "fadeDown", transitionTime = 0.5 })
    elseif currentLevel == "17" then
    director:moveToScene(level_17,{ transitionType = "fadeDown", transitionTime = 0.5 })
    end
  end
  self.bg:addTimer(moveScene, 0.01) 
end
function scene:exitPreTransition(event)
	print("fake:exitPreTransition")
end
function scene:exitPostTransition(event)
	print("fake:exitPostTransition")
end

scene:addEventListener( { "setUp", "tearDown", "enterPreTransition",
	"enterPostTransition" }, scene)

return scene
