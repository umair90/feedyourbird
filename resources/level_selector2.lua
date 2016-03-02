--[[

level_selector.lua is first screen on which all levels are displayed.
player has to clear the first level before procding to the next as those were closed.

--]]

local scene = director:createScene()
scene.name = "level_selector2"

print("level_selector starts")

local sb
local purchase_status
function scene:setUp(event)
 -- stop_sound()
	dbg.print("level_selector:setUp")
  sb = newScaleBox();
  print("getting purchase is  "..get_purchase())
  
  --purchase_status = get_purchase()
  purchase_status = 1
  self.backGround = director:createSprite( 0, 0,"graphics/main_menu.png" );
	self.backGround.x = 	globals.xCentre
	self.backGround.y =  globals.yCentre
   self.backGround.xAnchor=0.5;
   self.backGround.yAnchor=0.5;
   
  self.label_stage3  = director:createSprite( {
		x=30, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage3.png",
	} )
  
  self.label_stage4  = director:createSprite( {
		x=410, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage4.png",
	} )
  
  if (purchase_status == 1) then
    --
  self.button_level9 = director:createSprite( {
		x=40, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/1.png",
	} )
  
  self.button_level10 = director:createSprite( {
		x=240, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/2.png",
	} )
  
  self.button_level11 = director:createSprite( {
		x=40, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/3.png",
	} )
  
  self.button_level12 = director:createSprite( {
		x=240, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/4.png",
	} )
  
  self.button_level13 = director:createSprite( {
		--x=40, y=120,
		x=440, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/1.png",
	} )

  self.button_level14 = director:createSprite( {
		--x=40, y=120,
		x=640, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/2.png",
	} )

  self.button_level15 = director:createSprite( {
		--x=40, y=120,
		x=440, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/3.png",
	} )
 self.button_level16 = director:createSprite( {
		x=640, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/4.png",
	} )
--[[
 self.button_level16 = director:createSprite( {
		x=640, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
	} )
--]]
self.button_forward = director:createSprite( {
		x=740, y=80,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
    rotation = 180,
	} )
self.label_level9 = director:createLabel(self.button_level9.x+55, self.button_level9.y+45, "9","fonts/Arial32.fnt")
self.label_level10 = director:createLabel(self.button_level10.x+45, self.button_level10.y+45,"10","fonts/Arial32.fnt")
self.label_level11 = director:createLabel(self.button_level11.x+45, self.button_level11.y+45, "11","fonts/Arial32.fnt")
self.label_level12 = director:createLabel(self.button_level12.x+45,self.button_level12.y+45, "12","fonts/Arial32.fnt")
self.label_level13 = director:createLabel(self.button_level13.x+45,self.button_level13.y+45, "13","fonts/Arial32.fnt")  
self.label_level14 = director:createLabel(self.button_level14.x+45,self.button_level14.y+45, "14","fonts/Arial32.fnt")
self.label_level15 = director:createLabel(self.button_level15.x+45,self.button_level15.y+45, "15","fonts/Arial32.fnt")
self.label_level16 = director:createLabel(self.button_level16.x+45,self.button_level16.y+45, "16","fonts/Arial32.fnt")

--]]
else
    self.button_level9 = director:createSprite( {
		x=40, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/buy.png",
	} )

  self.button_level10 = director:createSprite( {
		x=240, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
	} )

  self.button_level11 = director:createSprite( {
		x=40, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
	} )

  self.button_level12 = director:createSprite( {
		x=240, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
	} )

  self.button_level13 = director:createSprite( {
		x=440, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
  })

  self.button_level14 = director:createSprite( {
		x=640, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
  })

  self.button_level15 = director:createSprite( {
		x=440, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
  })
--
 self.button_level16 = director:createSprite( {
		x=640, y=120,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buy.png",
	} )
--]]
--[[
self.label_level9 = director:createLabel(self.button_level9.x+55, self.button_level9.y+45, "","fonts/Arial32.fnt")
self.label_level10 = director:createLabel(self.button_level10.x+55, self.button_level10.y+45,"","fonts/Arial32.fnt")
self.label_level11 = director:createLabel(self.button_level11.x+55, self.button_level11.y+45, "","fonts/Arial32.fnt")
self.label_level12 = director:createLabel(self.button_level12.x+55,self.button_level12.y+45, "","fonts/Arial32.fnt")
self.label_level13 = director:createLabel(self.button_level13.x+55,self.button_level13.y+45, "","fonts/Arial32.fnt")
self.label_level14 = director:createLabel(self.button_level14.x+55,self.button_level14.y+45, "","fonts/Arial32.fnt")
self.label_level15 = director:createLabel(self.button_level15.x+55,self.button_level15.y+45, "","fonts/Arial32.fnt")
--]]
end

  self.button_back = director:createSprite( {
		x=40, y=40,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
	} )
  
  local function button_level9_fn(event)
    if event.phase == "ended" then
    if (purchase_status == "bought") then
    print("touch active on level 9 button")
    director:moveToScene(level_9,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
   else
  --  director:moveToScene(buy_levels,{ transitionType = "jumpZoom", transitionTime = 1.5 })
    director:moveToScene(level_9,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
   end
    end
  end
  
   local function button_level10_fn(event)
    if event.phase == "ended" then
    print("touch active on level 10 button")
    director:moveToScene(level_10,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
    end
    
    local function button_level11_fn(event)
    if event.phase == "ended" then
    print("touch active on level 11 button")
    director:moveToScene(level_11,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
    end
  
  local function button_level12_fn(event)
    if event.phase == "ended" then
    print("touch active on level 12 button")
    director:moveToScene(level_12,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
  local function button_level13_fn(event)
    if event.phase == "ended" then
    print("touch active on level 13 button")
    director:moveToScene(level_13,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
   local function button_level14_fn(event)
    if event.phase == "ended" then
    print("touch active on level 14 button")
    director:moveToScene(level_14,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
   local function button_level15_fn(event)
    if event.phase == "ended" then
    print("touch active on level 15 button")
    director:moveToScene(level_15,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  local function button_level16_fn(event)
    if event.phase == "ended" then
    print("touch active on level 16 button")
    director:moveToScene(level_16,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  --[[
  local function button_level16_fn(event)
    if event.phase == "ended" then
    print("touch active on level 16 button")
    director:moveToScene(buy_levels,{ transitionType = "jumpZoom", transitionTime = 1.5 })
    end
  end
  --]]
  local function button_back_fn(event)
    if event.phase == "ended" then
    print("touch active on level 12 button")
    director:moveToScene(level_selector,{transitionType = "slideInL", transitionTime = 0.2})
    end
  end
  
  local function button_forward_fn(event)
    if event.phase == "ended" then
    print("touch active on forward button")
    director:moveToScene(level_selector3,{transitionType = "slideInR", transitionTime = 0.2})
    end
  end
  
 
  self.button_level9:addEventListener("touch", button_level9_fn)
  self.button_level10:addEventListener("touch", button_level10_fn)
  self.button_level11:addEventListener("touch", button_level11_fn)
  self.button_level12:addEventListener("touch", button_level12_fn)
  self.button_level13:addEventListener("touch", button_level13_fn)
  self.button_level14:addEventListener("touch", button_level14_fn)
  self.button_level15:addEventListener("touch", button_level15_fn)
  self.button_level16:addEventListener("touch", button_level16_fn)
  --self.button_level16:addEventListener("touch", button_level16_fn)
  self.button_back:addEventListener("touch", button_back_fn)
  self.button_forward:addEventListener("touch", button_forward_fn)
end

function scene:tearDown(event)
	print("level_selector2:tearDown")

  
  self.backGround:removeFromParent()
 
  self.button_level9:removeFromParent()
  self.button_level10:removeFromParent()
  self.button_level11:removeFromParent()
  self.button_level12:removeFromParent()
  self.button_level13:removeFromParent()
  self.button_level14:removeFromParent()
  self.button_level15:removeFromParent()
  self.button_level16:removeFromParent()
  self.label_stage3:removeFromParent()
  self.label_stage4:removeFromParent()
  
  self.label_level9:removeFromParent()
  self.label_level10:removeFromParent()
  self.label_level11:removeFromParent()
  self.label_level12:removeFromParent()
  self.label_level13:removeFromParent()
  self.label_level14:removeFromParent()
  self.label_level15:removeFromParent()
  --]]
  self.button_back:removeFromParent()
  self.button_forward:removeFromParent()
 
 
  director:getCurrentScene():releaseAtlas(self.backGround.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.backGround.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level9.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level9.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level10.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level10.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level11.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level11.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level12.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level12.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level13.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level13.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level14.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level14.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level15.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level15.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level16.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level16.animation)
  
  director:getCurrentScene():releaseAtlas(self.label_stage3.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage3.animation)
  
  director:getCurrentScene():releaseAtlas(self.label_stage4.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage4.animation)
 --
  director:getCurrentScene():releaseFont(self.label_level9)
  director:getCurrentScene():releaseFont(self.label_level10)
  director:getCurrentScene():releaseFont(self.label_level11)
  director:getCurrentScene():releaseFont(self.label_level12)
  director:getCurrentScene():releaseFont(self.label_level13)
  director:getCurrentScene():releaseFont(self.label_level14)
  director:getCurrentScene():releaseFont(self.label_level15)
  director:getCurrentScene():releaseFont(self.label_level16)
  --]]
  director:getCurrentScene():releaseAtlas(self.button_back.animation.usedAtlases)
  director:getCurrentScene():releaseAtlas(self.button_forward.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_back.animation)
  director:getCurrentScene():releaseAnimation(self.button_forward.animation)
  
  self:releaseResources()
  director:getCurrentScene():releaseResources()
 
  sb:removeFromParent()
	self.backGround = nil
  purchase_status=nil
  scene=nil
  sb=nil
  fontArial = nil
	self.button_level9 = nil
	self.button_level10 = nil
	self.button_level11 = nil
	self.button_level12 = nil
  self.button_level13 = nil
  self.button_level14 = nil
  self.button_level15 = nil
  self.button_level16 = nil
  self.label_stage3 = nil
  self.label_stage4 = nil
	-- all function equal to nil for garbage.
 --[[
  button_level9_fn = nil
  button_level10_fn = nil
  button_level11_fn = nil
  button_level12_fn = nil
  button_level13_fn = nil
  button_level14_fn = nil
  button_level15_fn = nil
  --]]

  self.label_level9 = nil
  self.label_level10 = nil
  self.label_level11 = nil
  self.label_level12 = nil
  self.label_level13 = nil
  self.label_level14 = nil
  self.label_level15 = nil
  self.label_level16 = nil
  --]]
  self.button_back = nil
  self.button_forward = nil
  

  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Level_selector2    "..math.floor(collectgarbage("count")))
end



-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
