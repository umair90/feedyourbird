local scene = director:createScene()
scene.name = "LEVEL: 3"

dbg.print("level 3 scene has entered")

local level_complete_counter = 0
local crate_1
local img_1 = "graphics/rectangle2Large.png" 
local icon_1
local count
local t_cloud
local slope
local rect1
--local rect1
local rect2
--local rect3
--local rect4
local scoreHigh
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local drop_limit = 300
local scoreTimerFlag=0

function scene:setUp(event)         --initialize objects here	
  scoreTimerFlag=0
  score=999
dbg.print("level3 setup scene started")
 local rain_drop = {}
 local crateCounter = 1
 scoreHigh=get_highScore3()

 set_level(3)
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

       --self.ground1 = director:createSprite( {
--        x=dw/2, y=dh/15,
--        source="graphics/floor.png",
--        xAnchor=0.5, yAnchor=0.5,
--        rotation=0,
--        } )
        physics:addNode(self.bar, {type="static"})
                                               -- as objects are also shown as icons on upper left corner, icon one is crate of img_1
        icon_1= director:createSprite({
            x=globals.icon_X, y=globals.icon_Y,
            xScale=0.4, 
            yScale=0.4, 
            source=img_1,
            alpha = 0.5,
            rotation=90,
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
--
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

                                                --  enemy cloud moving top of the side
    
--            rect1 = director:createSprite( {
--                name = "rect1",
--                x = 187+(35), y = 175+(14),
--                source="graphics/StripSmallStatic.png",
--                xAnchor=0.5, yAnchor=0.5,
--                } )
--            rect2 = director:createSprite( {
--                name = "rect1",
--                x = 187+(2*35), y = 175+(2*14),
--                source="graphics/StripSmallStatic.png",
--                xAnchor=0.5, yAnchor=0.5,
--                } )
--            rect3 = director:createSprite( {
--                name = "rect1",
--                x = 187+(3*35), y = 175+(3*14),
--                source="graphics/StripSmallStatic.png",
--                xAnchor=0.5, yAnchor=0.5,
--                } )
--            
--            
          
          slope = director:createSprite( {
                name = "slope",
                x = 720, y = 180,
                source="graphics/rectangle1.png",
                xAnchor=0.5, yAnchor=0.5,
                rotation = 40,
                } )
            
 
          rect1 = director:createSprite( {
                name = "rect1",
                x = 470, y = 229,
                source="graphics/rectangle1.png",
                xAnchor=0.5, yAnchor=0.5,
                
                } )
            
            rect2 = director:createSprite( {
                name = "rect1",
                x =rect1.w+54, y = 229,
                source="graphics/rectangle1.png",
                xAnchor=0.5, yAnchor=0.5,
                
                } )
                                                            -- Introducing bird and named as a player
          self.player = director:createSprite( {
              name = "player",
              x=404, y=90,
              xAnchor=0.5, yAnchor=0.5,
              source = "graphics/bird1.png",
              } )
    
    physics:addNode(self.player)	
    physics:addNode(rect1, { type="static"})
    physics:addNode(slope, { type="static"})
 --   physics:addNode(rect1, {type="static"})
 physics:addNode(rect2, {type="static"})
--    physics:addNode(rect3, {type="static"})
--    physics:addNode(rect4, {type="static"}) 
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
      director:getCurrentScene():releaseFont(self.label1)
      self.label1 = nil
      crate_1.alpha = 1
      icon_1:removeFromParent()
      icon_1 = nil
      physics:addNode(crate_1, {restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
      self.bg:removeEventListener("touch",moveCrate)
     crateCounter = crateCounter + 1
     if score > tonumber(scoreHigh) then
          set_highScore3(score)
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
            x=280, y=530, 
            source=img_1,
            alpha = 0.5,
            rotation=90,
            
          })
        self.label1 = director:createLabel(crate_1.x+120 , crate_1.y+50, "Touch to move")
       self.bg:addEventListener("touch", moveCrate)     -- event listener to follow the touch of user on screen  
       end  

end

createCrate()                                           -- whenever, user click, createCrate event function calls to crate that object on that palace
function main_menu_3()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_3()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_3()
  director:moveToScene(level_2,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end  
function getSuspend(event)
  if event.phase == "began" then
    self.bg.isTouchable = false;
   self.button_pause:removeEventListener("touch", getSuspend)
   self.button_reply:removeEventListener("touch", getReplay)
   print("suspend in 3")
   physics:pause()
   self.label3:pauseTimers()
   if (t_cloud) then
   self.enemy:pauseTimers()
   tween:cancel(t_cloud)
   end
   pauseMenu()
   end
end
function getResume_3()
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
function scene:tearDown(event)        --remove objects here
level_complete_counter = 0
dbg.print("level3 tearDown starts")
                                      --Remove Physics Nodes
physics:removeNode(self.player)
physics:removeNode(self.bar)
physics:removeNode(crate_1)
physics:removeNode(slope)
physics:removeNode(rect1)
--physics:removeNode(rect1)
physics:removeNode(rect2)
--physics:removeNode(rect3)
--physics:removeNode(rect4)
                                      --Remove variables
self.player:removeFromParent()
self.bar:removeFromParent()
crate_1:removeFromParent()
slope:removeFromParent()
rect1:removeFromParent()
--rect1:removeFromParent()
rect2:removeFromParent()
--rect3:removeFromParent()
--rect4:removeFromParent()
self.sb:removeFromParent()
self.bg:removeFromParent()

director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.bar.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bar.animation)

director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)

director:getCurrentScene():releaseAtlas(slope.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(slope.animation)

director:getCurrentScene():releaseAtlas(rect1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(rect1.animation)

--director:getCurrentScene():releaseAtlas(rect1.animation.usedAtlases)
--director:getCurrentScene():releaseAnimation(rect1.animation)
--
director:getCurrentScene():releaseAtlas(rect2.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(rect2.animation)
--
--director:getCurrentScene():releaseAtlas(rect3.animation.usedAtlases)
--director:getCurrentScene():releaseAnimation(rect3.animation)
--
--director:getCurrentScene():releaseAtlas(rect4.animation.usedAtlases)
--director:getCurrentScene():releaseAnimation(rect4.animation)

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

                                      --put variables to nil for garbage collector
rect1=nil
rect2=nil
--rect3=nil
--rect4=nil
self.player = nil
self.bar= nil
self.bg= nil
count = nil
crate_1 = nil                       --put functions to nil for garbage collector
--bodyCollision = nil
createCrate =  nil
pathS = nil
filename = nil
file = nil
fileContents = nil
crateCounter=nil
self.sb = nil
collectgarbage("collect")                                     -- call garbage collector to free memory of removed objects
director:cleanupTextures()
print("Mem. at end of Level3    "..math.floor(collectgarbage("count")))
             -- call garbage collector to free memory of removed objects
end


                                                 -- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
