local scene = director:createScene()
scene.name = "LEVEL: 16"

dbg.print("level 16 scene has entered")
--require ("pause_menu")

local crate_1
local img_1 = "graphics/wheel.png"                         -- at number 1, object is rectangular crate
local img_2 = "graphics/wheel.png"                         -- at number 1, object is rectangular crate
local icon_1
local icon_2 
--local bodyCollision
local count = 0
local t_cloud
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local scoreHigh
local drop_limit = 300
local scoreTimerFlag=0
function scene:setUp(event)
 score=999
 local rain_drop = {}
 local crateCounter = 1                                     -- a counter for clicks to palace number of objects
 local level_complete_counter_1 = 0 
 scoreTimerFlag=0
print("Start value of level complete counter is  "..level_complete_counter_1)
--set_highScore(100)
scoreHigh=get_highScore1()
--print("Mem. at scene setup of Level1   "..math.floor(collectgarbage("count")))
dbg.print("level1 setup scene started")      --initialize objects here
                                       -- An array of rain drops
set_level(16)
set_stage(2)
 
function load_background()
      local ii
      for ii = 1,200 do
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

        physics:addNode(self.bar, {type="static"})
                                               -- as objects are also shown as icons on upper left corner, icon one is crate of img_1
        icon_1= director:createSprite({
            x=globals.icon_X, y=globals.icon_Y,
            xScale=0.4, 
            yScale=0.4, 
            source=img_1,
            alpha = 0.5,
        })
      icon_2= director:createSprite({
            x=globals.icon2_X, y=globals.icon2_Y,
            xScale=0.4, 
            yScale=0.4, 
            source=img_2,
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
   --    load_sound()
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
  -- print("SCORE CALLED")
   score=score-1
   self.label3.text="SCORE: "..score
end
  -- Ground
function remove_rain_1()
   for ii = 1,200 do
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

local bodyCollision_1 = function (event)
    if event.phase == "ended" then
      print("Collision phase started")
      if event.nodeA.name == "player" and event.nodeB.name == "fire" then
        print("fire condition comppppppppppleted")
        self.player:removeEventListener("collision", bodyCollision_1)
         level_complete_counter_1 = 200
      end
       if event.nodeA.name == "fire" and event.nodeB.name == "player" then
        print("player comppppppppppleted")
        self.player:removeEventListener("collision", bodyCollision_1)
        level_complete_counter_1 = 200
       end 
    end  
  end  
  
local rain = function (event)                                -- rain is called by timer at specific event to fire
count = event.doneIterations 

rain_drop[count].x = self.enemy.x
rain_drop[count].y = self.enemy.y
rain_drop[count].zOrder = 1
print("The value of counter at level complete is = "..level_complete_counter_1)
physics:addNode(rain_drop[count], { density=20, restitution=0.5,  type="dynamic"} )
rain_drop[count]:addEventListener("collision", bodyCollision_1)
end 


function bird_scene()
  
                                               -- Introducing bird and named as a player
      self.player = director:createSprite( {
                name = "player",
                x=600, y=100,
                xAnchor=0.5, yAnchor=0.5,
                source = "graphics/bird1.png",
                } )                                                     
      self.slope1 = director:createSprite( {
                x=110, y=252,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=45,
                } )
      self.slope2 = director:createSprite( {
                x=90+self.slope1.w, y=200,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=40,
                } )
      self.slope3 = director:createSprite( {
                x=241, y=173,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=0,
                } )
      self.slope4 = director:createSprite( {
                x=315, y=200,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=-40,
                } )
      self.slope5 = director:createSprite( {
                x=372, y=252,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=-45,
                } )
      self.slope6 = director:createSprite( {
                x=470, y=380,
                source="graphics/rectangle1Small1.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=0,
                } )
      self.slope7 = director:createSprite( {
                x=670, y=380,
                source="graphics/rectangle1Small1.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=0,
                } )
            
      self.slope8 = director:createSprite( {
                x=530, y=100,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=90,
                } )
            
            
       self.slope9 = director:createSprite( {
                x=630, y=100,
                source="graphics/rectangle1Small.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=90,
                } )
      self.slope10 = director:createSprite( {
                x=530, y=150,
                source="graphics/rectangle2Large.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation=0,
                } )
      
      
   physics:addNode(self.slope1, {type="static"})
   physics:addNode(self.slope2, {type="static"})
   physics:addNode(self.slope3, {type="static"})
   physics:addNode(self.slope4, {type="static"})
   physics:addNode(self.slope5, {type="static"})
   physics:addNode(self.slope6, {type="static"})
   physics:addNode(self.slope7, {type="static"})
   physics:addNode(self.slope8,{type="static"})
   physics:addNode(self.slope9,{type="static"})
   physics:addNode(self.slope10)
   physics:addNode(self.player)	
   self.player:addEventListener("collision", bodyCollision_1)
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
            if level_complete_counter_1 == 200 then
            print("success and level complete counter"..level_complete_counter_1)                          -- level complete counter is set to 200 as player collides with enemy, so move to level fail screen
            director:moveToScene(level_complete,{ transitionType = "progressInOut", transitionTime = 0.5 })
      --      director:setCurrentScene(nil)
            else                                           -- else level is succeded. So, goto  level complete screen
            print("lost and level complete counter"..level_complete_counter_1)  
            director:moveToScene(level_lost,{ transitionType = "progressInOut", transitionTime = 0.5 })
         --   director:setCurrentScene(nil)
               
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
       elseif crateCounter == 2 then           
       crate_2.x = event.x
       crate_2.y = event.y
      end
      elseif event.y<drop_limit then
       self.label1.text = "Can not drop below line"
       self.label1.color = color.red
      end
 
    elseif event.phase == "ended" then
       if event.y > drop_limit  then 
     if crateCounter == 1 then 
      self.label1.text = ""
      crate_1.alpha = 1
      icon_1:removeFromParent()
      icon_1 = nil
      physics:addNode(crate_1, {radius=38,  type="dynamic" } )     --  Add that node to a physics object
      self.bg:removeEventListener("touch",moveCrate)
      crateCounter = crateCounter + 1
      createCrate()
     elseif crateCounter == 2 then
      print("value of cratecounter is 2")
      self.label1:removeFromParent()
      self.label1 = nil
      crate_2.alpha = 1
      icon_2:removeFromParent()
      icon_2 = nil
      physics:addNode(crate_2, {radius=38,  type="dynamic" } )     --  Add that node to a physics object
      self.bg:removeEventListener("touch",moveCrate)
      crateCounter = crateCounter + 1
      
      
      if score > tonumber(scoreHigh) then
          set_highScore1(score)
          self.label4.text="HIGH SCORE: "..score  
      end
      self.label3:pauseTimers()
      scoreTimerFlag=100                         -- This timer flag is to tell that we dont have to resume timer after PauseResume
      move_cloud()                                        --  Function to move a cloud
      self.enemy:addTimer(rain, 0.10)                     --   a timer to create rain                  
    print("phase eneded")
  
   end
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
      elseif crateCounter == 2 then 
       crate_2 = director:createSprite({
            x=280, y=330, 
            source=img_2,
            alpha = 0.5,
          })
        self.label1.text = "Touch to move"
        self.label1.x = crate_2.x+120
        self.label1.y = crate_2.y+50
        self.bg:addEventListener("touch", moveCrate)     -- event listener to follow the touch of user on screen 
      end
end

createCrate()                                           -- whenever, user click, createCrate event function calls to crate that object on that palace

function main_menu_16()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_16()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_16()
  director:moveToScene(level_1,{ transitionType = "fadeUp", transitionTime = 0.5 })
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
function getResume_16()
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
   if crateCounter == 3 then
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
function scene:tearDown(event)
                                                             --remove objects here
print("level16 tearDown starts")
--bodyCollision_1 = nil
level_complete_counter_1 = nil
 
                                                             --Remove Physics Nodes
physics:removeNode(self.player)
physics:removeNode(self.bar)
physics:removeNode(crate_1)
physics:removeNode(crate_2)
physics:removeNode(self.slope1)
physics:removeNode(self.slope2)
physics:removeNode(self.slope3)
physics:removeNode(self.slope4)
physics:removeNode(self.slope5)
physics:removeNode(self.slope6)
physics:removeNode(self.slope7)
physics:removeNode(self.slope8)
physics:removeNode(self.slope9)
physics:removeNode(self.slope10)
                                                            --Remove variables
self.player:removeFromParent()
self.bar:removeFromParent()
self.bg:removeFromParent()

crate_1:removeFromParent()
crate_2:removeFromParent()

self.slope1:removeFromParent()
self.slope2:removeFromParent()
self.slope3:removeFromParent()
self.slope4:removeFromParent()
self.slope5:removeFromParent()
self.slope6:removeFromParent()
self.slope7:removeFromParent()
self.slope8:removeFromParent()
self.slope9:removeFromParent()
self.slope10:removeFromParent()

director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.bar.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bar.animation)


director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)
 

 
director:getCurrentScene():releaseAtlas(self.slope1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope1.animation)  

director:getCurrentScene():releaseAtlas(self.slope2.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope2.animation)  

director:getCurrentScene():releaseAtlas(self.slope3.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope3.animation)  

director:getCurrentScene():releaseAtlas(self.slope4.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope4.animation)  

director:getCurrentScene():releaseAtlas(self.slope5.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope5.animation)  

director:getCurrentScene():releaseAtlas(self.slope6.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope6.animation)  

director:getCurrentScene():releaseAtlas(self.slope7.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope7.animation)  

director:getCurrentScene():releaseAtlas(self.slope8.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope8.animation)  

director:getCurrentScene():releaseAtlas(self.slope9.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope9.animation)  

director:getCurrentScene():releaseAtlas(self.slope10.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.slope10.animation)  

director:getCurrentScene():releaseAtlas(crate_1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(crate_1.animation)

director:getCurrentScene():releaseAtlas(crate_2.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(crate_2.animation)
 
 remove_rain_1()
 
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

if icon_2 then
  icon_2:removeFromParent()
  director:getCurrentScene():releaseAtlas(icon_2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(icon_2.animation)
  icon_2 = nil
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

self.label_limit:removeFromParent()
director:getCurrentScene():releaseFont(self.label_limit)
self.label_limit = nil

self.label4:removeFromParent()
director:getCurrentScene():releaseFont(self.label4)
self.label4 = nil
scoreHigh=nil
scoreHighDummy=nil
score=nil


director:getCurrentScene():releaseResources()
    
self.player = nil
self.bar= nil
self.bg= nil
rain_drop  = nil
count = nil
crate_1 = nil
crate_2 = nil

self.slope1 = nil
self.slope2 = nil
self.slope3 = nil
self.slope4 = nil
self.slope5 = nil
self.slope6 = nil
self.slope7 = nil
self.slope8 = nil
self.slope9 = nil
self.slope10 = nil
--bodyCollision = nil
                                                              --put functions to nil for garbage collector
rain = nil
--bodyCollision = nil
createCrate =  nil
pathS = nil
filename = nil
file = nil
fileContents = nil
self.sb:removeFromParent();
self.sb = nil;
collectgarbage("collect")                                     -- call garbage collector to free memory of removed objects
director:cleanupTextures()
--
print("GarBage Collector level 1 end"..math.floor(collectgarbage("count")))
--print("Start value of level complete counter is  "..level_complete_counter_1)
print("level1 tearDown ends" )
end


-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
