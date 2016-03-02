local scene = director:createScene()
scene.name = "LEVEL: 11"

local level_complete_counter = 0
local crate_1
local img_1 = "graphics/crate.png" 
local icon_1
local count
local t_cloud
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local scoreHigh
local drop_limit = 300
local scoreTimerFlag=0
function scene:setUp(event)
  scoreTimerFlag=0
score=999
local rain_drop = {}
local crateCounter = 1  
set_level(11)
set_stage(3)
scoreHigh=get_highScore11()
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
       } )                                   -- Ground, angled
       self.ground1 = director:createSprite( {
          x=dw/2, y=dh/5,
          source="graphics/stripLargeStatic.png",
          xAnchor=0.5, yAnchor=0.5,
          rotation=0,
          } )
      physics:addNode(self.ground1, {type="static"})
        local slope
        local slope1
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
     --     self.label1 = director:createLabel(globals.helpText_X , globals.helpText_Y, "Touch Crate to move on screen")
          self.label2 = director:createLabel( {
                                        x=globals.levelText_X, y=globals.levelText_Y,
                                        font = ComicSans,
                                        text=scene.name,
                                        color={000, 000, 000},} )
          self.enemy = director:createSprite( {
                x=-80, y=410,
                source="graphics/cloud.png",
                xAnchor=0.5, yAnchor=0.5,
                zOrder=2,
                } )
                  self.label_limit = director:createLabel( {
                                        x=0, y=drop_limit,
                                        font = ComicSans,
                                        text="-----------------------------------------------------------------------------------------------------------------",
                                        color={ff, ff, ff},} )

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
   local strip_down = function(event)
                                                      --self.rect1 to self.rect8 are all physics strips which placed on bird
              self.rect1 = director:createSprite( {
                name = "rect1",
                x = 312, y = 135,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5, rotation =110
                } )
              self.rect2 = director:createSprite( {
                name = "rect1",
                x = 335, y = 135,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5, rotation =110
                } )
              self.rect3 = director:createSprite( {
                name = "rect1",
                x = 347, y = 175,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5,
                } )
              self.rect4 = director:createSprite( {
                name = "rect1",
                x = 367, y = 175,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5,
                } )
              self.rect5 = director:createSprite( {
                name = "rect1",
                x = 405, y = 135,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5, rotation =70
                } )
              self.rect6 = director:createSprite( {
                name = "rect1",
                x = 417, y = 135,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5, rotation =70
                } )
              self.rect7 = director:createSprite( {
                name = "rect1",
                x = 377, y = 175,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5,
                } )
              self.rect8 = director:createSprite( {
                name = "rect1",
                x = 387, y = 175,
                source="graphics/StripSmall.png",
                xAnchor=0.5, yAnchor=0.5,
                } )
            
            physics:addNode(self.rect1, {})
            physics:addNode(self.rect2, {})
            physics:addNode(self.rect3, {density =30})
            physics:addNode(self.rect4, {density =30})
            physics:addNode(self.rect5, {})
            physics:addNode(self.rect6, {})
            physics:addNode(self.rect7, {density =30})
            physics:addNode(self.rect8, {density =30})
    end
   
           self.player = director:createSprite( {
                name = "player",
                x=370, y=190,
                xAnchor=0.5, yAnchor=0.5,
                source = "graphics/bird1.png",
                } )
                                                  --  enemy rectangle moving top of the side
            
 physics:addNode(self.player)	
 self.player:addEventListener("collision", bodyCollision)    
 tween:to(self.player, { x=210, y=90, time=0.5, easing = ease.linear, onComplete = strip_down } )  

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


        


  function moveCrate(event) 
    if event.phase == "moved" then                      --  When phase is in move state
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
      self.label1 = nil
      crate_1.alpha = 1
      icon_1:removeFromParent()
      icon_1 = nil
      physics:addNode(crate_1, {restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
      crateCounter=crateCounter+1
      self.bg:removeEventListener("touch",moveCrate)
      if score > tonumber(scoreHigh) then
          set_highScore11(score)
          self.label4.text="HIGH SCORE: "..score  
      end
      self.label3:pauseTimers()
      scoreTimerFlag=100
      move_cloud()                                        --  Function to move a cloud
      self.enemy:addTimer(rain, 0.20)                     --   a timer to create rain                  
    print("phase eneded")
  
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

createCrate()                                           -- whenever, user click, createCrate event function calls to crate that object on that palace

function main_menu_1()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_11()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_11()
  director:moveToScene(level_12,{ transitionType = "fadeUp", transitionTime = 0.5 })
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
function getResume_11()
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

function scene:tearDown(event)
                                        --remove objects here
dbg.print("level2 tearDown starts")
                                        --Remove Physics Nodes
physics:removeNode(self.player)
physics:removeNode(self.ground1)
physics:removeNode(crate_1)
physics:removeNode(self.rect1)
physics:removeNode(self.rect2)
physics:removeNode(self.rect3)
physics:removeNode(self.rect4)
physics:removeNode(self.rect5)
physics:removeNode(self.rect6)
physics:removeNode(self.rect7)
physics:removeNode(self.rect8)
                                        --Remove variables
self.player:removeFromParent()
self.ground1:removeFromParent()
self.bg:removeFromParent()
self.rect1:removeFromParent()
self.rect2:removeFromParent()
self.rect3:removeFromParent()
self.rect4:removeFromParent()
self.rect5:removeFromParent()
self.rect6:removeFromParent()
self.rect7:removeFromParent()
self.rect8:removeFromParent()
crate_1:removeFromParent()
level_complete_counter = 0
--------------------------------------------
director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.ground1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.ground1.animation)

director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)

----
director:getCurrentScene():releaseAtlas(crate_1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(crate_1.animation)
-----------------


director:getCurrentScene():releaseAtlas(self.rect1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect1.animation)

director:getCurrentScene():releaseAtlas(self.rect2.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect2.animation)

director:getCurrentScene():releaseAtlas(self.rect3.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect3.animation)

director:getCurrentScene():releaseAtlas(self.rect4.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect4.animation)

director:getCurrentScene():releaseAtlas(self.rect5.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect5.animation)

director:getCurrentScene():releaseAtlas(self.rect6.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect6.animation)

director:getCurrentScene():releaseAtlas(self.rect7.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect7.animation)

director:getCurrentScene():releaseAtlas(self.rect8.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.rect8.animation)

 if self.enemy then
  self.enemy:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.enemy.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.enemy.animation)
  self.enemy = nil
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

-----------------------------------------------
                                        --put variables to nil for garbage collector
self.player = nil
self.ground1= nil
self.bg= nil
rain_drop  = nil
count = nil
crate_1 = nil
self.rect1=nil
self.rect2=nil
self.rect3=nil
self.rect4=nil
self.rect5=nil
self.rect6=nil
self.rect7=nil
self.rect8=nil
                                        --put functions to nil for garbage collector
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
print("Mem. at end of Level 11    "..math.floor(collectgarbage("count")))

end


-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
