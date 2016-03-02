--level 6--
local scene = director:createScene()
scene.name = "LEVEL: 6"

print("level 6 Started")
-- Add multiple event listeners to the same object
local level_complete_counter = 0
local crate_1
local img_1 = "graphics/crate_old.png"
local icon_1
local count = 0
local t_cloud
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local scoreHigh
local drop_limit = 300
local scoreTimerFlag=0
function scene:setUp(event)  --initialize objects here	
  scoreTimerFlag=0
  score=999
 local rain_drop = {}
 local crateCounter = 1    
dbg.print("level6 setup scene started")
scoreHigh=get_highScore6()
 set_level(6)
 set_stage(2)
  
function load_background()
      local ii
      for ii = 1,100 do
         rain_drop[ii] = director:createSprite( { 
         name = "fire",
         x = -100, y = 10 + ii*6, 
         source = "graphics/cross.png", 
         zOrder=-1,
         } ) 
       end
       self.sb = newScaleBox();
       self.bg = makeSprite(globals.xCentre, globals.yCentre, "graphics/bg.png");
       self.bg.isTouchable = true;
       
       self.bar = director:createSprite( {
          x = globals.button_bar_X, y = globals.button_bar_Y, 
          source="graphics/bottomBar.png",
          alpha = 0.7,
        } )
          self.label_limit = director:createLabel( {
                                        x=0, y=drop_limit,
                                        font = ComicSans,
                                        text="-----------------------------------------------------------------------------------------------------------------",
                                        color={ff, ff, ff},} )

       
       -- self.ground1 = director:createSprite( {
--    x=dw/4, y=dh/15,
--    source="graphics/stripLargeStatic.png",
--    xAnchor=0.5, yAnchor=0.5,
--    rotation=0,
--    } )
--self.ground2 = director:createSprite( {
--    x=dw/4 + self.ground1.w, y=dh/15,
--    source="graphics/stripLargeStatic.png",
--    xAnchor=0.5, yAnchor=0.5,
--    rotation=0,
--    } )
physics:addNode(self.bar, {type="static"})
--physics:addNode(self.ground2, {type="static"})
                                               -- as objects are also shown as icons on upper left corner, icon one is crate of img_1
        icon_1= director:createSprite({
            x=globals.icon_X, y=globals.icon_Y,
            xScale=0.4, 
            yScale=0.4, 
            source=img_1,
            alpha = 0.5,
        })
        self.button_pause = director:createSprite( {
                  name = "menu",  
                  x = globals.pause_button_X, y = globals.pause_button_Y,
                  xScale=dw/800, -- stretch from original image size
                  yScale=dh/480, -- stretch from original image size
                  zOrder = 1,
                  source="graphics/menuInnerBtn.png",
                  } )
        self.button_reply = director:createSprite( {
                  name = "replay",  
                  x= globals.replay_button_X, y= globals.replay_button_Y,
                  xScale=dw/800, -- stretch from original image size
                  yScale=dh/480, -- stretch from original image size
                  zOrder = 1,
                  source="graphics/replyBtn.png",
                  } )
     --   self.label1 = director:createLabel(globals.helpText_X , globals.helpText_Y, "Touch Crate to move on screen")
        self.label2 = director:createLabel( {
                                        x=globals.levelText_X, y=globals.levelText_Y,
                                        font = ComicSans,
                                        text=scene.name,
                                        color={000, 000, 000},} )
                                                                    --  enemy rectangle moving top of the side
      self.enemy = director:createSprite( {
                x = globals.enemy_X_start, y = globals.enemy_Y,
                source="graphics/cloud.png",
                xAnchor=0.5, yAnchor=0.5,
                zOrder=2,
                } )
 end
load_background()
self.label3 = director:createLabel( {
    x=globals.scoreText_X, y=globals.scoreText_Y,
    font = ComicSans,
    text="SCORE: 999",
    color={000, 000, 000},
    } )
local scoreHighDummy="HIGH SCORE: "..scoreHigh          
self.label4= director:createLabel( {
    x=globals.highScoreText_X, y=globals.highScoreText_Y,
    font = ComicSans,
    text=scoreHighDummy,
    color={000, 000, 000},
    } )
function scoree()
   print("SCORE CALLED")
   score=score-1
   self.label3.text="SCORE: "..score
end
  -- Ground
function remove_rain()
   for ii = 1,100 do
       physics:removeNode(rain_drop[ii])             -- a number of physics fires consumes memory and make rush over screen. so, limit fire numbers to 18
       rain_drop[ii]:removeFromParent()
       director:getCurrentScene():releaseAtlas(rain_drop[ii].animation.usedAtlases)
       director:getCurrentScene():releaseAnimation(rain_drop[ii].animation)
       director:getCurrentScene():releaseResources()
       rain_drop[ii] = nil
       print("Removing Rain Drop number "..ii)
    end
  end
                                            -- Every times, when player collides with any physics objects, this function is called and we filter fires in it

local bodyCollision = function (event)
    if event.phase == "ended" then
      print("Collision phase started")
      if event.nodeA.name == "player" and event.nodeB.name == "fire" then
        print("fire condition comppppppppppleted")
         level_complete_counter = 200
      end
       if event.nodeA.name == "fire" and event.nodeB.name == "player" then
        print("player comppppppppppleted")
        level_complete_counter = 200
       end 
    end  
  end  
  
  local rain = function (event)                                -- rain is called by timer at specific event to fire
count = event.doneIterations 

rain_drop[count].x = self.enemy.x
rain_drop[count].y = self.enemy.y
rain_drop[count].zOrder = 1

physics:addNode(rain_drop[count], { density=20, restitution=0.5,  type="dynamic"} )
 rain_drop[count]:addEventListener("collision", bodyCollision)
end 

function bird_scene()
   
             self.player = director:createSprite( {
                name = "player",
                x=365, y=90,
                xAnchor=0.5, yAnchor=0.5,
                source = "graphics/bird1.png",
                 } ) 

            self.lowerLeftCrate = director:createSprite( {
                name = "left",
                x = dw*1.5/4, y = 180,
                source="graphics/crate_old.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
              })
          
              self.lowerRightCrate = director:createSprite( {
                name = "left",
                x = dw*2.1/4, y = 100,
                source="graphics/crate_old.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
              })
          
            self.stripOnCrate = director:createSprite( {
                name = "left",
                x = dw*1.5/4, y = 150,
                source="graphics/stripLarge2.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 90,
              })      
           
    physics:addNode(self.lowerRightCrate,{type="static"})
    physics:addNode(self.stripOnCrate)
    physics:addNode(self.lowerLeftCrate,{density=5})
    physics:addNode(self.player)	
    self.player:addEventListener("collision", bodyCollision)

end
bird_scene()
self.label3:addTimer(scoree,1)
 function move_cloud()                                   -- function moves the enemy cloud from left to right
    local moveEnemy = function(event)
       --   self.enemy:removeTimer(rain, 0.20)
          self.enemy:removeFromParent()
          director:getCurrentScene():releaseAtlas(self.enemy.animation.usedAtlases)
          director:getCurrentScene():releaseAnimation(self.enemy.animation)
          director:getCurrentScene():releaseResources()
          self.enemy = nil
          collectgarbage("collect")
          director:cleanupTextures()
            if level_complete_counter == 200 then
            dbg.print("success")                          -- level complete counter is set to 200 as player collides with enemy, so move to level fail screen
            director:moveToScene(level_complete,{ transitionType = "progressInOut", transitionTime = 0.5 })
            director:setCurrentScene(nil)
            else                                           -- else level is succeded. So, goto  level complete screen
            dbg.print("lost")
            director:moveToScene(level_lost,{ transitionType = "progressInOut", transitionTime = 0.5 })
            director:setCurrentScene(nil)
               
        end  
  end
  local endPoint = 950
   
    t_cloud = tween:to(self.enemy, { x=globals.enemy_X_end, y=globals.enemy_Y, time=(endPoint-self.enemy.x)/100, easing = ease.linear, onComplete = moveEnemy } )
    
  --   self.enemy:addTimer(moveEnemy, 0.015)                 -- a timer is called after o.o1 sec which calls moveEnemy event function and changes the x-axis to move a cloud
end 

                                                        -- When user picks an object, it stucks to its touch finger and follow the touch untill releases. 
 function moveCrate(event) 
    if event.phase == "moved"  then                      --  When phase is in move state
    self.label1.x = crate_1.x + 120
    self.label1.y = crate_1.y + 50
    if event.y > drop_limit  then 
    self.label1.text = "Release the object to Drop"  
    self.label1.color = color.white
    event.target.moveWithFinger = true                  --  to follow the finger touch    
      if crateCounter == 1 then           
       crate_1.x = event.x
       crate_1.y = event.y
      end
      elseif event.y<drop_limit then
       self.label1.text = "Can not drop below line"
       self.label1.color = color.red
      
      end
 
    elseif event.phase == "ended" then
      if event.y > drop_limit  then 
      self.label1:removeFromParent()
      director:getCurrentScene():releaseFont(self.label1)
      self.label1 = nil
      crate_1.alpha = 1
      icon_1:removeFromParent()
      icon_1 = nil
      physics:addNode(crate_1, {restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
      self.bg:removeEventListener("touch",moveCrate)
      crateCounter = crateCounter + 1
      move_cloud()                                        --  Function to move a cloud
      self.enemy:addTimer(rain, 0.20)                     --   a timer to create rain                  
    print("phase eneded")
  
 --   end
    end 
    end 
  end  
 function createCrate()                                 -- Initiates a fade object on screen
  
      if crateCounter == 1 then                        -- object to display 
        crate_1 = director:createSprite({
            x=280, y=330, 
            source=img_1,
            alpha = 0.5,
          })
       self.label1 = director:createLabel(crate_1.x+120 , crate_1.y+50, "Touch to move")
       self.bg:addEventListener("touch", moveCrate)     -- event listener to follow the touch of user on screen  
       end  

end

createCrate() 
function main_menu_6()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_6()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_6()
  director:moveToScene(level_7,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end  
function getSuspend(event)
  if event.phase == "began" then
    self.bg.isTouchable = false;
   self.button_pause:removeEventListener("touch", getSuspend)
   self.button_reply:removeEventListener("touch", getReplay)
   print("suspend")
   physics:pause()
   self.label3:pauseTimers()
   if (t_cloud) then
   self.enemy:pauseTimers()
   tween:cancel(t_cloud)
   end
   pauseMenu()
   end
end
function getResume_6()
    self.bg.isTouchable = true;
    self.button_pause:addEventListener("touch", getSuspend)
    self.button_reply:addEventListener("touch", getReplay)
   print("Resume")
   physics:resume()
    if scoreTimerFlag == 0 then                    --resume only if timer is not 100
   self.label3:resumeTimers()
   end
   if (t_cloud) then
   self.enemy:resumeTimers()
   if crateCounter == 2 then
   move_cloud()  
   end
   end
 end
function getReplay(event)
  if event.phase == "began" then
  director:moveToScene(fake,{ transitionType = "fadeUp", transitionTime = 0.5 })
  end
 end
 self.button_pause:addEventListener("touch", getSuspend)
 self.button_reply:addEventListener("touch", getReplay)
 
end
function scene:tearDown(event) --remove objects here
dbg.print("level6 tearDown starts")
physics:removeNode(self.player)      --Removing Physics Nodes
physics:removeNode(self.bar)
physics:removeNode(crate_1)

physics:removeNode(self.lowerLeftCrate)
physics:removeNode(self.lowerRightCrate)
physics:removeNode(self.stripOnCrate)
self.player:removeFromParent()      --Removing Nodes from Parents
self.bar:removeFromParent()
self.bg:removeFromParent()
crate_1:removeFromParent()

self.lowerLeftCrate:removeFromParent()
self.lowerRightCrate:removeFromParent()
self.stripOnCrate:removeFromParent()
level_complete_counter = 0

director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.bar.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bar.animation)

--director:getCurrentScene():releaseAtlas(self.ground2.animation.usedAtlases)
--director:getCurrentScene():releaseAnimation(self.ground2.animation)

director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)

----
director:getCurrentScene():releaseAtlas(crate_1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(crate_1.animation)
  
director:getCurrentScene():releaseAtlas(self.lowerLeftCrate.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.lowerLeftCrate.animation)


director:getCurrentScene():releaseAtlas(self.lowerRightCrate.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.lowerRightCrate.animation)


director:getCurrentScene():releaseAtlas(self.stripOnCrate.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripOnCrate.animation)

 
if self.button_pause then
 self.button_pause:removeEventListener("touch", getSuspend)
 self.button_pause:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.button_pause.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_pause.animation)
  self.button_pause = nil

end 
if self.button_reply then 
 self.button_reply:removeEventListener("touch", getReplay)
  self.button_reply:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.button_reply.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_reply.animation)
  self.button_reply = nil
end

if self.label1 then
self.label1:removeFromParent()
director:getCurrentScene():releaseFont(self.label1)
self.label1 = nil
end

if icon_1 then
  icon_1:removeFromParent()
  director:getCurrentScene():releaseAtlas(icon_1.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(icon_1.animation)
  icon_1 = nil
end 
if self.enemy then
  self.enemy:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.enemy.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.enemy.animation)
  self.enemy = nil
end 
self.label2:removeFromParent()
director:getCurrentScene():releaseFont(self.label2)
self.label2 = nil

director:getCurrentScene():releaseFont(ComicSans)
self.label3:removeFromParent()
director:getCurrentScene():releaseFont(self.label3)
self.label3 = nil
remove_rain()

self.label4:removeFromParent()
director:getCurrentScene():releaseFont(self.label4)
self.label4 = nil

self.label_limit:removeFromParent()
director:getCurrentScene():releaseFont(self.label_limit)
self.label_limit = nil

scoreHigh=nil
scoreHighDummy=nil
score=nil
director:getCurrentScene():releaseResources()

self.player = nil                   --Putting variables to nil for garbage collector
self.bar= nil
self.bg= nil
rain_drop  = nil
rain_count  = nil
count = nil
crate_1 = nil
self.lowerLeftCrate=nil
self.lowerRightCrate=nil
self.stripOnCrate=nil
rain = nil
createCrate =  nil
pathS = nil
filename = nil
file = nil
fileContents = nil
self.sb:removeFromParent();
self.sb = nil;
collectgarbage("collect")                                     -- call garbage collector to free memory of removed objects
director:cleanupTextures()
print("Mem. at end of Level6    "..math.floor(collectgarbage("count")))
end
function scene:enterPreTransition(event)
	dbg.print("level6:enterPreTransition")
  self.sb = newScaleBox();
  self.bg = makeSprite(globals.xCentre, globals.yCentre, "graphics/bg.png");
  self.bg.isTouchable = true;
 -- Ground, angled
 self.ground1 = director:createSprite( {
    x=dw/4, y=dh/15,
    source="graphics/stripLargeStatic.png",
    xAnchor=0.5, yAnchor=0.5,
    rotation=0,
    } )
self.ground2 = director:createSprite( {
    x=dw/4 + self.ground1.w, y=dh/15,
    source="graphics/stripLargeStatic.png",
    xAnchor=0.5, yAnchor=0.5,
    rotation=0,
    } )
physics:addNode(self.ground1, {type="static"})
physics:addNode(self.ground2, {type="static"})
dbg.print("level6:enterPreTransition completed")
end
function scene:enterPostTransition(event)
	dbg.print("level6:enterPostTransition")
   function bodyCollision (event)
 --   print("Body is colliding ")
    
    if event.phase == "began" then
      if event.nodeA.name == "fire" or event.nodeB.name == "fire" then
    --  print("Node a collision")
        if event.nodeA.name == "player" or event.nodeB.name == "player" then
  --       self.player.color = color.darkGreen 
        print("condition comppppppppppleted")
        level_complete_counter = 200
        end  
      end
    end  
  end  
--  enemy rectangle moving top of the side
self.enemy = director:createSprite( {
    x=-80, y=410,
    source="graphics/cloud.png",
    xAnchor=0.5, yAnchor=0.5,
    zOrder=1,
    } )
------- Upper floor-------

 self.label1 = director:createLabel(180, 430, "Touch Crate to move on screen")  
            ----------------------------------------

physics:addNode(self.player)
self.player:addEventListener("collision", bodyCollision)

local rain_drop = {}
local rain_count = 0
local count

-- rain is called by timer at specific event to fire
local rain = function (event)
count = event.doneIterations 
rain_drop[count] = director:createSprite( { 
     name = "fire",
     x = self.enemy.x, y = self.enemy.y, 
     source = "graphics/cross.png" 
     } )  
rain_drop[count]:addEventListener("collision", bodyCollision)
physics:addNode(rain_drop[count], { density=15, restitution=0.75,radius=5 } )
print("current count is "..count)
  if count > 20 then
    print("starts counting at 20  "..count)
    physics:removeNode(rain_drop[count - 18])
    rain_drop[count - 18]:removeFromParent()
    rain_drop[count - 18] = nil
    collectgarbage("collect")
  end
end 

-- Move cloud function moves the enemy from left to right
 function move_cloud()
    local moveEnemy = function(event)
        self.enemy.x = self.enemy.x + 1
        if self.enemy.x > (dw+60) then     -- when cloud goes out of screen , it removes
          self.enemy:removeFromParent()
          self.enemy = nil
          collectgarbage("collect")
         if level_complete_counter == 200 then
        
         print("orange lost")
         director:moveToScene(level_lost,{ transitionType = "progressInOut", transitionTime = 0.5 })
         director:setCurrentScene(nil)
       else
         print("orange iss saved in this level")
               director:moveToScene(level_complete,{ transitionType = "progressInOut", transitionTime = 0.5 })
               director:setCurrentScene(nil)
               
          end    
        end  
 --       print("w = "..dw.." h = "..dh.."Position of cloud is X = "..enemy.x.." y = "..enemy.y)
    end
     tween:to(self.enemy, { x=dw+150, y=410, time=15, easing = ease.linear, onComplete = moveEnemy } )
end 


--  when ever user clicks, it fires a physics crate.

        icon_1= director:createSprite({
            x=30, y=430,
            xScale=0.4, 
            yScale=0.4, 
            source=img_1,
            alpha = 0.5,
        })
        icon_2= director:createSprite({
            x=80, y=430,
            xScale=0.4, 
            yScale=0.4, 
            source=img_2,
            alpha = 0.5,
        })
        icon_3= director:createSprite({
            x=130, y=430,
            xScale=0.4, 
            yScale=0.4, 
            source=img_3,
            alpha = 0.5,
        })
                                                          -- When user picks an object, it stucks to its touch finger and follow the touch untill releases. 
 function moveCrate(event) 
    if event.phase == "moved" then                      --  When phase is in move state
     
      if crateCounter == 1 then 
       self.label1.text = "Release Crate to Drop"  
       event.target.moveWithFinger = true                  --  to follow the finger touch  
       crate_1.x = event.x
       crate_1.y = event.y
       elseif crateCounter == 2 then
       self.label1.text = "Release Wheel to Drop"  
       event.target.moveWithFinger = true                  --  to follow the finger touch  
       crate_2.x = event.x
       crate_2.y = event.y  
       elseif crateCounter == 3 then
       self.label1.text = "Release Wheel to Drop"  
       event.target.moveWithFinger = true                  --  to follow the finger touch  
       crate_3.x = event.x
       crate_3.y = event.y  
      end
 
    elseif event.phase == "ended" then
     if crateCounter == 1 then 
      self.label1.text = ""
      crate_1.alpha = 1
      icon_1:removeFromParent()
      icon_1 = nil
      physics:addNode(crate_1, {restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
      crateCounter = crateCounter + 1
      createCrate()   
      elseif crateCounter == 2 then 
      self.label1.text = ""
      crate_2.alpha = 1
      icon_2:removeFromParent()
      icon_2 = nil
      physics:addNode(crate_2, {radius=38, restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
      crateCounter = crateCounter + 1
      createCrate()   
     elseif crateCounter == 3 then
      self.label1:removeFromParent()
      self.label1 = nil
      crate_3.alpha = 1
      icon_3:removeFromParent()
      icon_3 = nil
      physics:addNode(crate_3, {  type="dynamic" } )     --  Add that node to a physics object
      if score > tonumber(scoreHigh) then
          set_highScore6(score)
          self.label4.text="HIGH SCORE: "..score  
      end
      self.label3:pauseTimers()
      scoreTimerFlag=100
      move_cloud()                                        --  Function to move a cloud
      self.enemy:addTimer(rain, 0.20)  
     end 
     
                         --   a timer to create rain                  
    print("phase eneded")
  
 --   end
    end 
  end  
 function createCrate()                                 -- Initiates a fade object on screen
  
      if crateCounter == 1 then                        -- object to display 
        crate_1 = director:createSprite({
            x=160, y=330, 
            source=img_1,
            alpha = 0.5,
            rotation = 90,
          })
        self.label1 = director:createLabel(crate_1.x+120 , crate_1.y+50, "Pick to move")
          
      elseif crateCounter == 2 then 
       self.label1.text = "Touch Wheel to move on screen"
       
       crate_2 = director:createSprite({
            x=160, y=330, 
            source=img_2,
            alpha = 0.5,
            rotation = 90,
          })
        self.label1.x = crate_2.x+120
        self.label1.y = crate_2.y +50
      elseif crateCounter == 3 then   
      self.label1.text = "Touch Crate to move on screen"
      
      crate_3 = director:createSprite({
            x=160, y=330, 
            source=img_3,
            alpha = 0.5,
            rotation = 90,
          })
        self.label1.x = crate_3.x+120
        self.label1.y = crate_3.y +50
         
      end
      self.bg:addEventListener("touch", moveCrate)     -- event listener to follow the touch of user on screen 
      
   end

createCrate() 

 
end
function scene:exitPreTransition(event)
	dbg.print("level2:exitPreTransition")
end
function scene:exitPostTransition(event)
	dbg.print("level2:exitPostTransition")


end
scene:addEventListener( { "setUp", "tearDown" }, scene)
return scene
