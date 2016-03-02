--[[

level_selector.lua is first screen on which all levels are displayed.
player has to clear the first level before procding to the next as those were closed.

--]]

local scene = director:createScene()
scene.name = "level_selector"

local sb

function scene:setUp(event)
	dbg.print("level_selector:setUp")
  sb = newScaleBox();
   self.backGround = makeSprite(globals.xCentre, globals.yCentre, "graphics/main_menu.png");
  
    self.label_stage1  = director:createSprite( {
		x=30, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage1.png",
	} )

  self.label_stage2  = director:createSprite( {
		x=410, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage2.png",
	} )

  self.button_level1 = director:createSprite( {
		x=40, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/1.png",
	} )

  self.button_level2 = director:createSprite( {
		x=240, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/2.png",
	} )

  self.button_level3 = director:createSprite( {
		x=40, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/3.png",
	} )

  self.button_level4 = director:createSprite( {
		x=240, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/4.png",
	} )

  self.button_level5 = director:createSprite( {
    x=440, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/1.png",
	} )

  self.button_level6 = director:createSprite( {
		
    x=640, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/2.png",
	} )
  self.button_level7 = director:createSprite( {
		x=440, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/3.png",
	} )
  self.button_level8 = director:createSprite( {
		x=640, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/4.png",
	} )
  
self.button_back = director:createSprite( {
		x=40, y=40,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
	} )

self.button_forward = director:createSprite( {
		x=740, y=80,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
    rotation = 180,
	} )

self.label_level1 = director:createLabel({x =self.button_level1.x+55,y=self.button_level1.y+45, text =  "1",font = "fonts/Arial32.fnt"})
self.label_level2 = director:createLabel({x = self.button_level2.x+55, y=self.button_level2.y+45, text =  "2",font = "fonts/Arial32.fnt"})
self.label_level3 = director:createLabel({x = self.button_level3.x+55, y=self.button_level3.y+45, text =  "3",font = "fonts/Arial32.fnt"})
self.label_level4 = director:createLabel({x = self.button_level4.x+55, y=self.button_level4.y+45, text =  "4",font = "fonts/Arial32.fnt"})
self.label_level5 = director:createLabel({x = self.button_level5.x+55, y=self.button_level5.y+45,  text = "5",font = "fonts/Arial32.fnt"})
self.label_level6 = director:createLabel({x = self.button_level6.x+55, y=self.button_level6.y+45,  text = "6",font = "fonts/Arial32.fnt"})
self.label_level7 = director:createLabel({x = self.button_level7.x+55, y=self.button_level7.y+45,  text = "7",font = "fonts/Arial32.fnt"})
self.label_level8 = director:createLabel({x = self.button_level8.x+55, y=self.button_level8.y+45,  text = "8",font = "fonts/Arial32.fnt"})

  
  local function button_level1_fn(event)
    if event.phase == "ended" then
    print("touch active on level 1 button")
    director:moveToScene(level_1,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end  
  
  local function button_level2_fn(event)
    if event.phase == "ended" then
    print("touch active on level 2 button")
     director:moveToScene(level_2,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
  local function button_level3_fn(event)
    if event.phase == "ended" then
    print("touch active on level 3 button")
    director:moveToScene(level_3,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
  local function button_level4_fn(event)
    if event.phase == "ended" then
    print("touch active on level 4 button")
    director:moveToScene(level_4,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
   local function button_level5_fn(event)
    if event.phase == "ended" then
    print("touch active on level 5 button")
    director:moveToScene(level_5,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
   local function button_level6_fn(event)
    if event.phase == "ended" then
    print("touch active on level 6 button")
    director:moveToScene(level_6,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
   local function button_level7_fn(event)
    if event.phase == "ended" then
    print("touch active on level 7 button")
    director:moveToScene(level_7,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
   local function button_level8_fn(event)
    if event.phase == "ended" then
    print("touch active on level 8 button")
    director:moveToScene(level_8,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end

   
  local function button_back_fn(event)
    if event.phase == "ended" then
    print("touch active on back button")
    director:moveToScene(main_menu,{transitionType = "slideInL", transitionTime = 0.2})
    end
  end
  
    local function button_forward_fn(event)
    if event.phase == "ended" then
    print("touch active on forward button")
    director:moveToScene(level_selector2,{ transitionType = "slideInR", transitionTime = 0.2 })
    end
  end
  

  self.button_level1:addEventListener("touch", button_level1_fn)
  self.button_level2:addEventListener("touch", button_level2_fn)
  self.button_level3:addEventListener("touch", button_level3_fn)
  self.button_level4:addEventListener("touch", button_level4_fn)
  self.button_level5:addEventListener("touch", button_level5_fn)
  self.button_level6:addEventListener("touch", button_level6_fn)
  self.button_level7:addEventListener("touch", button_level7_fn)
  self.button_level8:addEventListener("touch", button_level8_fn)

  self.button_back:addEventListener("touch", button_back_fn)
  self.button_forward:addEventListener("touch", button_forward_fn)
end
function scene:tearDown(event)
  print("level_selector:tearDown")

  
  self.backGround:removeFromParent()
  self.button_level1:removeFromParent()
  self.button_level2:removeFromParent()
  self.button_level3:removeFromParent()
  self.button_level4:removeFromParent()
  self.button_level5:removeFromParent()
  self.button_level6:removeFromParent()
  self.button_level7:removeFromParent()
  self.button_level8:removeFromParent()
  
  self.label_stage1:removeFromParent()
  self.label_stage2:removeFromParent()
  
  self.label_level1:removeFromParent()
  self.label_level2:removeFromParent()
  self.label_level3:removeFromParent()
  self.label_level4:removeFromParent()
  self.label_level5:removeFromParent()
  self.label_level6:removeFromParent()
  self.label_level7:removeFromParent()
  self.label_level8:removeFromParent()
  
  self.button_back:removeFromParent()
  self.button_forward:removeFromParent()
  
  
  director:getCurrentScene():releaseAtlas(self.backGround.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.backGround.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level1.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level1.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level2.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level3.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level3.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level4.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level4.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level5.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level5.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level6.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level6.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level7.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level7.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level8.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level8.animation)
  
  director:getCurrentScene():releaseAtlas(self.label_stage1.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage1.animation)
  
  director:getCurrentScene():releaseAtlas(self.label_stage2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage2.animation)
  --
  director:getCurrentScene():releaseFont(self.label_level1)
  director:getCurrentScene():releaseFont(self.label_level2)
  director:getCurrentScene():releaseFont(self.label_level3)
  director:getCurrentScene():releaseFont(self.label_level4)
  director:getCurrentScene():releaseFont(self.label_level5)
  director:getCurrentScene():releaseFont(self.label_level6)
  director:getCurrentScene():releaseFont(self.label_level7)
  director:getCurrentScene():releaseFont(self.label_level8)
  --]]
   director:getCurrentScene():releaseFont(fontArial)
  
  director:getCurrentScene():releaseAtlas(self.button_back.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_back.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_forward.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_forward.animation)
  
  self:releaseResources()
  director:getCurrentScene():releaseResources()
  
  --scene.name=nil
  
  sb:removeFromParent()
  scene=nil
  sb=nil
	self.backGround = nil
	self.button_level1 = nil
	self.button_level2 = nil
	self.button_level3 = nil
	self.button_level4 = nil
	self.button_level5 = nil
	self.button_level6 = nil
	self.button_level7 = nil
	self.button_level8 = nil
	self.label_stage1 = nil
  self.label_stage2 = nil
  
	-- all function equal to nil for garbage.
  button_level1_fn = nil
  button_level2_fn = nil
  button_level3_fn = nil
  button_level4_fn = nil
  button_level5_fn = nil
  button_level6_fn = nil
  button_level7_fn = nil
  button_level8_fn = nil
  
  
  self.label_level1 = nil
  self.label_level2 = nil
  self.label_level3 = nil
  self.label_level4 = nil
  self.label_level5 = nil
  self.label_level6 = nil
  self.label_level7 = nil
  self.label_level8 = nil
  
  self.button_back = nil
  self.button_forward = nil
  
  
  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Level_selector    "..math.floor(collectgarbage("count")))
end
function scene:enterPreTransition(event)
  print("Mem. at start of Level_selector    "..math.floor(collectgarbage("count")))
	dbg.print("level_selector:enterPreTransition")
end
function scene:enterPostTransition(event)
	dbg.print("level_selector:enterPostTransition")
   
end
function scene:exitPreTransition(event)
	dbg.print("level_selector:exitPreTransition")
end
function scene:exitPostTransition(event)
	dbg.print("level_selector:exitPostTransition")
end

-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown", "enterPreTransition",
	"enterPostTransition", "exitPreTransition", "exitPostTransition" }, scene)

return scene
