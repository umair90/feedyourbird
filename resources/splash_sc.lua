--[[
Splash screen for FeedYourBird which comes at the start of game for some time and then moves to main menu
--]]

local scene = director:createScene()
scene.name = "splash_sc"

function scene:setUp(event)
	dbg.print("scene1:setUp")
 self.scaleBox = newScaleBox("top");
   

    self.splashSc = makeSprite( globals.xCentre, globals.yCentre,"graphics/splashWithParrot.png" );
		self.splashLogo = makeSprite( globals.width - 370, globals.height - 120, "graphics/feedyourbird.png" );


end
function scene:tearDown(event)
	dbg.print("scene1:tearDown")
  self.scaleBox:removeFromParent()
  self.splashLogo:removeFromParent()
  self.splashSc:removeFromParent()
  
  director:getCurrentScene():releaseAtlas(self.splashLogo.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.splashLogo.animation)
  
  director:getCurrentScene():releaseAtlas(self.splashSc.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.splashSc.animation)
    
  director:getCurrentScene():releaseResources()
  
  splash_sc=nil
  self.splashSc = nil
  self.splashLogo = nil
  self.scaleBox = nil
  scene=nil
  
  director:cleanupTextures()
  collectgarbage("collect")
  print("Mem. at end of splash screen    "..collectgarbage("count"))
end
function scene:enterPreTransition(event)
	dbg.print("scene1:enterPreTransition")
  local function goToMain(event)
  director:moveToScene(main_menu,{})
  end
  self.splashSc:addTimer(goToMain, 2)
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

scene:addEventListener( { "setUp", "tearDown", "enterPreTransition",
	"enterPostTransition", "exitPreTransition", "exitPostTransition" }, scene)

return scene
