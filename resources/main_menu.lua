--[[
Main Menu is second screen for game. Here, Play, settings, social media sharing and other main activities are linked.
--]]

local scene = director:createScene()
scene.name = "main_menu"


local sb;
local play_btn
local help_btn
local sound_btn
local mute_btn
--local fb_btn
local view1
function scene:setUp(event)
  sb = newScaleBox();
	dbg.print("scene1:setUp")

 self.main_menu_bg =  makeSprite(globals.xCentre, globals.yCentre, "graphics/mainMenuScreen.png");
 self.splashLogo = makeSprite(globals.width - 370, globals.height - 120,"graphics/feedyourbird.png" );

 play_btn = director:createSprite( {
		x=globals.width - 450, y= globals.height - 220,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/play.png",
    zOrder = 1,
	} )
 local platform = device:getInfo("platform")
  if (ads:isAvailable()) then
    if (platform == "ANDROID") then
      ads:newAd(director.displayHeight, 70, "leadbolt", "banner", "607857363")
    elseif (platform == "IPHONE") then
      ads:newAd(director.displayHeight,70, "leadbolt", "banner", "389355581")
    else  
    ads:newAd(director.displayHeight,70, "leadbolt", "banner", "389355581")  
    end	
  else
    dbg.log("Ads are not available")
  end
  --]]
  local current_sound
function play_btn_fn(event)
   if event.phase == "ended" then
       print("At play btn, current sound is "..current_sound)
       if current_sound then
       set_sound(current_sound)
        else
       set_sound(0)
     end
     --]]
       director:moveToScene(level_selector,{ transitionType = "slideInR", transitionTime = 0.2 })
    end 
end


current_sound = get_sound()
print("Current sound is "..current_sound)
  if current_sound == 1 then
  --    play_sound()
  end
  
      sound_btn = director:createSprite( {
          x=50, y=50,
          source="graphics/soundImg.png",
          xAnchor=0.5, yAnchor=0.5,
          zOrder=-1,
          } )
      
      mute_btn = director:createSprite( {
          x=50, y=50,
          source="graphics/muteImg.png",
          xAnchor=0.5, yAnchor=0.5,
          zOrder=-1,
          } )
      
     help_btn = director:createSprite( {
          x=120, y=50,
          source="graphics/helpBtnSmall.png",
          xAnchor=0.5, yAnchor=0.5,
          zOrder=1,
          } )
      --[[
    fb_btn = director:createSprite( {
          x=190, y=50,
          source="graphics/fbBtn.png",
          xAnchor=0.5, yAnchor=0.5,
          zOrder=1,
          } )
      --]]
 local function sound_btn_fn(event)
  if event.phase == "ended" then
  print("sound btn fin")
    if current_sound == 1 then
    current_sound = 0
  --  set_sound(0)
    stop_sound()
    mute_btn.zOrder =1
    sound_btn.zOrder =-1
    elseif current_sound == 0 then
    current_sound = 1 
  --  set_sound(1)
    play_sound()
    mute_btn.zOrder =-1
    sound_btn.zOrder =1
    end
  end
end
function sound_init()
        if current_sound == 1 then
          sound_btn.zOrder =1
          mute_btn.zOrder =-1
        
          sound_btn:addEventListener("touch", sound_btn_fn)
          elseif current_sound == 0 then
           sound_btn.zOrder =-1
           mute_btn.zOrder =1
           mute_btn:addEventListener("touch", sound_btn_fn)
        end 
  print("Sound init endss")      
 end

 function help_btn_fn(event)
   if event.phase == "ended" then
     print("Help caled")
   
  help_btn:removeEventListener("touch", help_btn_fn)
  play_btn:removeEventListener("touch", play_btn_fn)
  --fb_btn:removeEventListener("touch", fb_btn_fn)
   if current_sound == 1 then
     sound_btn:removeEventListener("touch", sound_btn_fn)
   elseif current_sound == 0 then
     mute_btn:removeEventListener("touch", sound_btn_fn)
   end 
    local overlayHelp= director:createSprite( {
    x=0, y=0, 
    xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
    source="graphics/gameHelp.png",
  --  alpha = 0.2,
    zOrder = 2,
    } )
  local button_back = director:createSprite( {
		x=730, y=370,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/close.png",
    zOrder = 2,
	} )

    function button_back:touch(event)
      if event.phase == "ended" then
      
      overlayHelp:removeFromParent()
      director:getCurrentScene():releaseAtlas(overlayHelp.animation.usedAtlases)
      director:getCurrentScene():releaseAnimation(overlayHelp.animation)
      overlayHelp = nil
      button_back:removeFromParent()
      director:getCurrentScene():releaseAtlas(button_back.animation.usedAtlases)
      director:getCurrentScene():releaseAnimation(button_back.animation)
      button_back = nil
      
      play_btn:addEventListener("touch", play_btn_fn)
      help_btn:addEventListener("touch", help_btn_fn)
    --  fb_btn:addEventListener("touch", fb_btn_fn)
      if current_sound == 1 then
     sound_btn:addEventListener("touch", sound_btn_fn)
      elseif current_sound == 0 then
     mute_btn:addEventListener("touch", sound_btn_fn)
      end 
    
      end
     end
     button_back:addEventListener("touch", button_back)
  
  end
   
 end

 --[[
function fb_btn_fn(event)
 if event.phase == "ended" then
      
local io = require("io")
local http = require("socket.http")
local ltn12 = require("ltn12")

-- recTable is filled with a sorted array of values that once concatenated are equals to the downloaded content
local recTable = {}

dbg.print("Starting request...")
local a,b,c,d = http.request( {
    url = "https://www.facebook.com/islamicencylopedia",
	sink = ltn12.sink.table(recTable)
    } )

dbg.print("Got response.")
dbg.print(a)
dbg.print(b)
dbg.print(d)
dbg.printTable(recTable)

  view1 = director:createWebView("https://www.facebook.com/islamicencylopedia")

end
end
--]]
 ----  calling above functions to call objects on main screen
 sound_init()
 play_btn:addEventListener("touch", play_btn_fn)
 help_btn:addEventListener("touch", help_btn_fn)
 --fb_btn:addEventListener("touch", fb_btn_fn)
end
function scene:tearDown(event)
	dbg.print("scene1:tearDown Current Sound is "..tostring(current_sound))
  
  self.main_menu_bg:removeFromParent()
  play_btn:removeFromParent()
  help_btn:removeFromParent()
 -- fb_btn:removeFromParent()
  self.splashLogo:removeFromParent()
  
  
  director:getCurrentScene():releaseAtlas(self.main_menu_bg.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.main_menu_bg.animation) 
  
  director:getCurrentScene():releaseAtlas(play_btn.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(play_btn.animation)
  
  director:getCurrentScene():releaseAtlas(help_btn.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(help_btn.animation)
  
 -- director:getCurrentScene():releaseAtlas(fb_btn.animation.usedAtlases)
  --director:getCurrentScene():releaseAnimation(fb_btn.animation)
  
  director:getCurrentScene():releaseAtlas(self.splashLogo.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.splashLogo.animation)

  if sound_btn then
  sound_btn:removeFromParent()
  director:getCurrentScene():releaseAtlas(sound_btn.usedAtlases)
  director:getCurrentScene():releaseAnimation(sound_btn.animation)
  sound_btn = nil
  end
  if mute_btn then
 -- self.mute_btn:removeEventListener("touch", sound_btn_fn)
  mute_btn:removeFromParent()
  director:getCurrentScene():releaseAtlas(mute_btn.usedAtlases)
  director:getCurrentScene():releaseAnimation(mute_btn.animation)
  mute_btn= nil
  end
  
  if view1 then
  view1:removeFromParent()
  director:getCurrentScene():releaseAtlas(view1.usedAtlases)
  director:getCurrentScene():releaseAnimation(view1.animation)
  view1 = nil
  end
  
  director:getCurrentScene():releaseResources()

  sb:removeFromParent()
  current_sound = nil
  self.main_menu_bg = nil
  play_btn = nil
  help_btn = nil
  --fb_btn = nil
  self.splashLogo = nil
  sb=nil
  scene=nil

  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Main-Menu    "..collectgarbage("count"))
  
  
end
function scene:enterPreTransition(event)
	dbg.print("scene1:enterPreTransition")
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
