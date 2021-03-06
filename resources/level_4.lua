--level 4--
local scene = director:createScene()
scene.name = "LEVEL: 4"
print("level 4 Started")
-- Add multiple event listeners to the same object

local level_complete_counter = 0
local crate_1
local img_1 = "graphics/crate.png"
local icon_1
local t_cloud
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local scoreHigh
local drop_limit = 300
local scoreTimerFlag=0
function scene:setUp(event)       --initialize objects here	
  scoreTimerFlag=0
score=999
local rain_drop = {}
local crateCounter = 1                                     -- a counter for clicks to palace number of objects
scoreHigh=get_highScore4()
dbg.print("level4 setup scene started")
 
 set_level(4)
 set_stage(1)
 
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

 -- Ground, angled
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
--physics:addNode(self.ground1, {type="static"})
--physics:addNode(self.ground2, {type="static"})
physics:addNode(self.bar, {type="static"})
    icon_1= director:createSprite({
            x=30, y=430,
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
    --    self.label1 = director:createLabel(globals.helpText_X , globals.helpText_Y, "Touch Crate to move on screen")
       self.label2 = director:createLabel( {
                                        x=globals.levelText_X, y=globals.levelText_Y,
                                        font = ComicSans,
                                        text=scene.name,
                                        color={000, 000, 000},} )
  self.enemy = director:createSprite( {    --  enemy cloud moving top of the side
    x=-80, y=410,
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
  -------------------------- Upper floor----------------
      self.stripUpperLeft  = director:createSprite( {
                name = "right",                     -- Large strip on upper left level...
                x = dw*1/4, y = 280,
                source="graphics/stripLargeStatic.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } )
            self.onUpperStripWheel  = director:createSprite( {
                name = "right",                     -- wheel on strip placed on upper left level...
                x = dw*1/4, y = 330,
                source="graphics/wheel.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } )
      self.stripUpperMiddle = director:createSprite( {
                name = "main",
                x =dw*2.1/4, y = 280,
                source="graphics/stripLargeStatic.png",   -- Large strip on upper middle level...
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } ) 
      self.stripRevolve = director:createSprite( {
                name = "left",                       -- Revolving large strip on middle level...
                x = dw-50, y = 280,
                source="graphics/stripMedium.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                
                } )
          ------------------ Lower Floor----------------
          self.stripLowerLeft = director:createSprite( {
                name = "main",
                x =dw*1.1/4, y = 135,
                source="graphics/stripMediumStatic.png",       -- Medium strip on lower left level...
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } ) 
            self.onLowerStripWheel = director:createSprite( {
                name = "main",
                x =dw*1.5/4, y = 190,
                source="graphics/wheel.png",             -- Wheel on lower Strip
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } ) 
             self.stripLowerRight = director:createSprite( {
                name = "main",
                x =dw*2.12/4, y = 135,
                source="graphics/stripLargeStatic.png",  -- Large strip on lower left level
                xAnchor=0.5, yAnchor=0.5,
                rotation = 0,
                } ) 
            self.stripSlope = director:createSprite( {
                name = "right",
                x = dw*3/4, y = 160,
                source="graphics/stripMediumStatic.png",  -- Meium strip in slope
                xAnchor=0.5, yAnchor=0.5,
                rotation = -25,
                } )
            self.player = director:createSprite( {
                name = "player",
                x=290, y=90,
                xAnchor=0.5, yAnchor=0.5,
                source = "graphics/bird1.png",
                 } ) 
            physics:addNode(self.stripUpperMiddle, {type="static"})
            physics:addNode(self.stripLowerRight, {type="static"})
            physics:addNode(self.stripRevolve)
            physics:addNode(self.stripUpperLeft, {type="static"})
            physics:addNode(self.stripLowerLeft, {type="static"})
            physics:addNode(self.stripSlope, {type="static"})
            physics:addNode(self.player)
            self.player:addEventListener("collision", bodyCollision)
            physics:addNode(self.onLowerStripWheel,{radius=38,density=1})
            physics:addNode(self.onUpperStripWheel,{radius=38})
            self.stripRevolve.physics:applyAngularImpulse(7)
            local j1 = physics:createWheelJoint(self.stripUpperMiddle,self.stripRevolve, 0, 1, self.stripUpperMiddle.x+self.stripUpperMiddle.w/2 +90,            self.stripUpperMiddle.y,self.stripRevolve.x,self.stripRevolve.y)
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
    self.label1.text = "Release to Drop"  
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
      if score > tonumber(scoreHigh) then
          set_highScore4(score)
          self.label4.text="HIGH SCORE: "..score  
      end
      self.label3:pauseTimers()
      scoreTimerFlag=100
      system:addTimer(wait, 2,1)                
      print("phase eneded")
  
 --   end
    end 
    end 
  end  
  
  function wait()
    print("wait called")
    move_cloud()                                        --  Function to move a cloud
    self.enemy:addTimer(rain, 0.20)                     --   a timer to create rain  
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

createCrate()                                           -- whenever, user click, createCrate event function calls to crate that object on that palace
function main_menu_1()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_4()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_4()
  director:moveToScene(level_5,{ transitionType = "fadeUp", transitionTime = 0.5 })
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
function getResume_4()
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
print("level4 tearDown starts")
--unrequire("pause_menu")
physics:removeNode(self.player)    --Remove Physics Nodes
physics:removeNode(self.bar)
--physics:removeNode(self.ground2)
physics:removeNode(crate_1)
physics:removeNode(self.stripUpperLeft)
physics:removeNode(self.stripUpperMiddle)
physics:removeNode(self.stripRevolve)
physics:removeNode(self.stripLowerLeft)
physics:removeNode(self.onLowerStripWheel)
physics:removeNode(self.stripLowerRight)
physics:removeNode(self.stripSlope)     
physics:removeNode(self.onUpperStripWheel)
self.player:removeFromParent()     --Removing Nodes from Parent
self.bar:removeFromParent()
--self.ground2:removeFromParent()
self.bg:removeFromParent()
crate_1:removeFromParent()
self.stripUpperLeft:removeFromParent()
self.stripUpperMiddle:removeFromParent()
self.stripRevolve:removeFromParent()
self.stripLowerLeft:removeFromParent()
self.onLowerStripWheel:removeFromParent()
self.stripLowerRight:removeFromParent()
self.stripSlope:removeFromParent()
self.onUpperStripWheel:removeFromParent()

self.sb:removeFromParent()
level_complete_counter = 0

director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.bar.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bar.animation)

--director:getCurrentScene():releaseAtlas(self.ground2.animation.usedAtlases)
--director:getCurrentScene():releaseAnimation(self.ground2.animation)

director:getCurrentScene():releaseAtlas(self.stripUpperLeft.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripUpperLeft.animation)

director:getCurrentScene():releaseAtlas(self.stripUpperMiddle.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripUpperMiddle.animation)

director:getCurrentScene():releaseAtlas(self.stripRevolve.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripRevolve.animation)

director:getCurrentScene():releaseAtlas(self.stripLowerLeft.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripLowerLeft.animation)

director:getCurrentScene():releaseAtlas(self.onLowerStripWheel.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.onLowerStripWheel.animation)

director:getCurrentScene():releaseAtlas(self.stripLowerRight.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripLowerRight.animation)

director:getCurrentScene():releaseAtlas(self.stripSlope.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.stripSlope.animation)

director:getCurrentScene():releaseAtlas(self.onUpperStripWheel.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.onUpperStripWheel.animation)
----
director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)

----
director:getCurrentScene():releaseAtlas(crate_1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(crate_1.animation)

 
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

if icon_1 then
  icon_1:removeFromParent()
  director:getCurrentScene():releaseAtlas(icon_1.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(icon_1.animation)
  icon_1 = nil
end

  if self.label1 then
    self.label1:removeFromParent()
    director:getCurrentScene():releaseFont(self.label1)
    self.label1 = nil
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
self.label4:removeFromParent()
director:getCurrentScene():releaseFont(self.label4)
self.label4 = nil

self.label_limit:removeFromParent()
director:getCurrentScene():releaseFont(self.label_limit)
self.label_limit = nil

scoreHigh=nil
scoreHighDummy=nil
score=nil
remove_rain()

director:getCurrentScene():releaseResources()

self.player = nil               --Putting variables to nil for garbage collector
self.bar= nil
--self.ground2= nil
self.bg= nil
rain_drop  = nil
rain_count  = nil
count = nil
crate_1 = nil
self.stripUpperLeft=nil
self.stripUpperMiddle=nil
self.stripRevolve=nil
self.stripLowerLeft=nil
self.onLowerStripWheel=nil
self.stripLowerRight=nil
self.stripSlope=nil
rain = nil
--bodyCollision = nil
createCrate =  nil
self.onUpperStripWheel=nil
pathS = nil
filename = nil
file = nil
fileContents = nil
print("tear down level 4")

crate_1 = nil
rain = nil
createCrate =  nil
rain_drop  = nil
rain_count  = nil
count = nil
self.button_pause = nil
self.button_reply=nil
self.sb = nil
 
collectgarbage("collect")                                     -- call garbage collector to free memory of removed objects
director:cleanupTextures()
print("Mem. at end of Level4   "..math.floor(collectgarbage("count")))
end

scene:addEventListener( { "setUp", "tearDown" }, scene)
return scene
