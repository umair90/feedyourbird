--[[

level_selector.lua is first screen on which all levels are displayed.
player has to clear the first level before procding to the next as those were closed.

--]]

local scene = director:createScene()
scene.name = "level_selector3"

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
   
  self.label_stage5  = director:createSprite( {
		x=30, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage3.png",
	} )
  
  self.label_stage6  = director:createSprite( {
		x=410, y=60,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/stage4.png",
	} )
  
if (purchase_status == 1) then
  
    self.button_level17 = director:createSprite( {
      x=40, y=280,
      xScale=dw/800, -- stretch from original image size
      yScale=dh/480, -- stretch from original image size
      source="graphics/1.png",
    } )

    self.label_level17 = director:createLabel(self.button_level17.x+45, self.button_level17.y+45, "17","fonts/Arial32.fnt")

else
    self.button_level17 = director:createSprite( {
		x=40, y=280,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/buy.png",
	} )
end

  self.button_back = director:createSprite( {
		x=40, y=40,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
	} )
  
  local function button_level17_fn(event)
    if event.phase == "ended" then
    print("touch active on level 17 button")
    director:moveToScene(level_17,{ transitionType = "zoomFlipX", transitionTime = 0.5 })
    end
  end
  
  local function button_back_fn(event)
    if event.phase == "ended" then
    print("touch active on level 12 button")
    director:moveToScene(level_selector2,{transitionType = "slideInL", transitionTime = 0.2})
    end
  end
 
  self.button_level17:addEventListener("touch", button_level17_fn)
  
  self.button_back:addEventListener("touch", button_back_fn)
end

function scene:tearDown(event)
	print("level_selector2:tearDown")

  
  self.backGround:removeFromParent()
  
  self.label_stage5:removeFromParent()
  self.label_stage6:removeFromParent()
  
  self.button_level17:removeFromParent()
  self.label_level17:removeFromParent()
 
  self.button_back:removeFromParent()
 
  director:getCurrentScene():releaseAtlas(self.backGround.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.backGround.animation)
  
  director:getCurrentScene():releaseAtlas(self.button_level17.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_level17.animation)
  
  
  
  director:getCurrentScene():releaseAtlas(self.label_stage5.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage5.animation)
  
  director:getCurrentScene():releaseAtlas(self.label_stage6.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.label_stage6.animation)
 --
  director:getCurrentScene():releaseFont(self.label_level17)
 
  --]]
  director:getCurrentScene():releaseAtlas(self.button_back.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_back.animation)
  
  self:releaseResources()
  director:getCurrentScene():releaseResources()
 
  sb:removeFromParent()
	self.backGround = nil
  purchase_status=nil
  scene=nil
  sb=nil
  fontArial = nil
	self.button_level17 = nil
	
  self.label_stage5 = nil
  self.label_stage6 = nil

  self.label_level17 = nil
 
  self.button_back = nil
  

  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Level_selector17    "..math.floor(collectgarbage("count")))
end


-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
