

function pauseMenu()
  
   
   local dWidth = director.displayWidth   -- getting device width
   local dHeight = director.displayHeight  -- getting device hight
   
   local overlay= director:createSprite( {
    x=282, y=50, 
    xScale=dWidth/1400, -- stretch from original image size
		yScale=dHeight/560, -- stretch from original image size
    source="graphics/transparentBg.png",
    alpha = 0.7,
    } )

 local button_continue = director:createSprite( {
		x=320, y=310,
  	xScale=dWidth /800, -- stretch from original image size
		yScale=dHeight/480, -- stretch from original image size
		source="graphics/continueBtn.png",
    zOrder=1
	} )



 local button_select_level = director:createSprite( {
		x=320, y=230,
  	xScale=dWidth/800, -- stretch from original image size
		yScale=dHeight/480, -- stretch from original image size
		source="graphics/menu.png",
    zOrder=1
	} )



 local button_main_menu = director:createSprite( {
		x=320, y=150,
  	xScale=dWidth/800, -- stretch from original image size
		yScale=dHeight/480, -- stretch from original image size
		source="graphics/mainMenuBtn.png",
    zOrder=1
	} )

 local button_exit = director:createSprite( {
		x=320, y=70,
  	xScale=dWidth /800, -- stretch from original image size
		yScale=dHeight/480, -- stretch from original image size
		source="graphics/helpBtn.png",
    zOrder=1
	} )

function button_continue:touch(event)
    if event.phase == "ended" then
  print("button_continue")
  overlay:removeFromParent()
  button_continue:removeFromParent()
  button_select_level:removeFromParent()
  button_main_menu:removeFromParent()
  button_exit:removeFromParent()

  director:getCurrentScene():releaseAtlas(overlay.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(overlay.animation)
  
  director:getCurrentScene():releaseAtlas(button_continue.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_continue.animation)
  
  director:getCurrentScene():releaseAtlas(button_select_level.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_select_level.animation)
  
  director:getCurrentScene():releaseAtlas(button_main_menu.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_main_menu.animation) 
  
  director:getCurrentScene():releaseAtlas(button_exit.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_exit.animation) 
  
  director:getCurrentScene():releaseResources()
  
  dWidth=nil
  dHeight=nil
  overlay=nil
  button_continue=nil
  button_select_level=nil
  button_main_menu=nil
  button_exit = nil
  collectgarbage("collect")
  director:cleanupTextures()
  print("Pause menu function    "..math.floor(collectgarbage("count")))
  
local this_level = get_level()
print("This level is "..this_level)
if this_level == "1" then
getResume_1()
print("Pause resume called in 1")
elseif this_level == "2" then
getResume_2()
elseif this_level == "3" then
getResume_3()
  elseif this_level == "4" then
getResume_4()
  elseif this_level == "5" then
getResume_5()
  elseif this_level == "6" then
getResume_6()
  elseif this_level == "7" then
getResume_7()
  elseif this_level == "8" then
getResume_8()
  elseif this_level == "9" then
getResume_9()
  elseif this_level == "10" then
getResume_10()
  elseif this_level == "11" then
getResume_11()
  elseif this_level == "12" then
getResume_12()
  elseif this_level == "13" then
getResume_13()
 elseif this_level == "14" then
getResume_14()
  elseif this_level == "15" then
getResume_15()
elseif this_level == "16" then
getResume_16()
elseif this_level == "17" then
getResume_17()
  else
    print("getResume does not exist in pause_menu")
   end 
    end
end

function button_exit:touch(event)
if event.phase == "ended" then
button_continue:removeEventListener("touch",button_continue)
button_main_menu:removeEventListener("touch", button_main_menu)
button_select_level:removeEventListener("touch", button_select_level)
button_exit:removeEventListener("touch", button_exit)
   local overlayHelp= director:createSprite( {
    x=0, y=0, 
    xScale=dWidth/800, -- stretch from original image size
		yScale=dHeight/480, -- stretch from original image size
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
      button_continue:addEventListener("touch",button_continue)
      button_main_menu:addEventListener("touch", button_main_menu)
      button_select_level:addEventListener("touch", button_select_level)
      button_exit:addEventListener("touch", button_exit)
    end
  end

button_back:addEventListener("touch", button_back)
end
end

function button_select_level:touch(event)
 if event.phase == "began" then
  print("button_select_level")
  overlay:removeFromParent()
  button_continue:removeFromParent()
 -- button_next_level:removeFromParent()
  button_select_level:removeFromParent()
  button_main_menu:removeFromParent()
  button_exit:removeFromParent()
  
  director:getCurrentScene():releaseAtlas(overlay.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(overlay.animation)
  director:getCurrentScene():releaseAtlas(button_continue.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_continue.animation)
 -- director:getCurrentScene():releaseAtlas(button_next_level.animation.usedAtlases)
 -- director:getCurrentScene():releaseAnimation(button_next_level.animation)
  director:getCurrentScene():releaseAtlas(button_select_level.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_select_level.animation)
  director:getCurrentScene():releaseAtlas(button_main_menu.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_main_menu.animation) 
  
  director:getCurrentScene():releaseAtlas(button_exit.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_exit.animation) 
  director:getCurrentScene():releaseResources()
 
  dWidth=nil
  button_exit = nil
  dHeight=nil
  overlay=nil
  button_continue=nil
  --button_next_level=nil
  button_select_level=nil
  button_main_menu=nil
  button_exit = nil
  collectgarbage("collect")
  director:cleanupTextures()
  print("Pause menu function    "..math.floor(collectgarbage("count")))
  local this_level = get_level()
  print("This level is "..this_level)
  if this_level == "1" then
  select_level_1()
  elseif this_level == "2" then
  select_level_2()
  elseif this_level == "3" then
    select_level_3()
  elseif this_level == "4" then
    select_level_4()
  elseif this_level == "5" then
    select_level_5()
  elseif this_level == "6" then
    select_level_6()
  elseif this_level == "7" then
    select_level_7()
  elseif this_level == "8" then
  select_level_8()  
  elseif this_level == "9" then
    select_level_9()
  elseif this_level == "10" then
    select_level_10()
  elseif this_level == "11" then
    select_level_11()
  elseif this_level == "12" then
    select_level_12()
  elseif this_level == "13" then
   select_level_13()
 elseif this_level == "14" then
    select_level_14()
  elseif this_level == "15" then
    select_level_15()
  elseif this_level == "16" then
    select_level_16()
   elseif this_level == "17" then
    select_level_17()
  else
    print("select level does not exist in pause_menu")
   end 
    end
end


function button_main_menu:touch(event)
  if event.phase == "began" then
  print("button_main_menu")
  overlay:removeFromParent()
  button_continue:removeFromParent()
  button_select_level:removeFromParent()
  button_main_menu:removeFromParent()
  button_exit:removeFromParent()
  
  director:getCurrentScene():releaseAtlas(overlay.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(overlay.animation)
  
  director:getCurrentScene():releaseAtlas(button_continue.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_continue.animation)
  
  director:getCurrentScene():releaseAtlas(button_select_level.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_select_level.animation)
  
  director:getCurrentScene():releaseAtlas(button_main_menu.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_main_menu.animation) 
  
  director:getCurrentScene():releaseAtlas(button_exit.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(button_exit.animation) 
  director:getCurrentScene():releaseResources()
 
  dWidth=nil
  dHeight=nil
  overlay=nil
  button_exit = nil
  button_continue=nil
 -- button_next_level=nil
  button_select_level=nil
  button_main_menu=nil
 -- background=nil
  
  collectgarbage("collect")
  director:cleanupTextures()
  print("Pause menu function    "..math.floor(collectgarbage("count")))

  director:moveToScene(main_menu,{ transitionType = "crossFade", transitionTime = 0.05 })
  physics:resume()
    
    end
end


button_continue:addEventListener("touch",button_continue)
button_main_menu:addEventListener("touch", button_main_menu)
button_select_level:addEventListener("touch", button_select_level)
button_exit:addEventListener("touch", button_exit)

end

