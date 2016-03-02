--[[
level 2 scene.
--]]

local scene = director:createScene()
scene.name = "LEVEL: 17"


local crate_1
local crate_2
local img_1 = "graphics/crate.png"                         -- at number 1, object is rectangular crate
local img_2 = "graphics/wheel.png"                         -- at number 2, object is wheel
local icon_1                                               -- as objects are also shown as icons on upper left corner, icon one is crate of img_1
local icon_2                                               -- icon_2 is also a crate
local count = 0
local t_cloud2
local scene_counter = 0
local score=999
local ComicSans = director:createFont("fonts/ComicSans24.fnt")
local scoreHigh
local drop_limit = 300
local scoreTimerFlag=0
function scene:setUp(event)
  local level_complete_counter = 0
  scoreTimerFlag=0
  score=999                                           --initialize objects here	
  scene_counter = scene_counter +1
  dbg.print("level2 SETUP SCENE CALLED TIMES"..scene_counter)
  print("Start value of level complete counter is  "..level_complete_counter)
  local rain_drop = {} 
  local crateCounter = 1                          -- a counter for clicks to palace number of objects
  scoreHigh=get_highScore2()
  set_level(17)
  set_stage(5)
 
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

      -- self.ground1 = director:createSprite( {
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
        })
        icon_2= director:createSprite({
            x=globals.icon2_X, y=globals.icon2_Y,
            xScale=0.4, 
            yScale=0.4, 
            source=img_2,
            alpha = 0.5,
        })
        self.button_pause2 = director:createSprite( {
                  name = "menu",  
                  x = globals.pause_button_X, y = globals.pause_button_Y,
                  xScale=dw/800, -- stretch from original image size
                  yScale=dh/480, -- stretch from original image size
                  zOrder = 1,
                  source="graphics/menuInnerBtn.png",
                  } )
        self.button_reply2 = director:createSprite( {
                  name = "replay",  
                  x= globals.replay_button_X, y= globals.replay_button_Y,
                  xScale=dw/800, -- stretch from original image size
                  yScale=dh/480, -- stretch from original image size
                  zOrder = 1,
                  source="graphics/replyBtn.png",
                  } )
     --   self.label1 = director:createLabel(globals.helpText_X+100 , globals.helpText_Y, "Touch Crate to move on screen")
        self.label2 = director:createLabel( {
                                        x=globals.levelText_X, y=globals.levelText_Y,
                                        font = ComicSans,
                                        text=scene.name,
                                        color={000, 000, 000},} )
                                                         --  enemy rectangle moving top of the side
        self.enemy = director:createSprite( {
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
  -- print("SCORE CALLED")
   score=score-1
   self.label3.text="SCORE: "..score
end
function remove_rain()
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

local bodyCollision = function (event)
    if event.phase == "began" then
      print("collision phase started")
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
if self.enemy then
  rain_drop[count].x = self.enemy.x
  rain_drop[count].y = self.enemy.y
  rain_drop[count].zOrder = 1
  physics:addNode(rain_drop[count], { density=20, restitution=0.5,  type="dynamic"} )
  rain_drop[count]:addEventListener("collision", bodyCollision)
end  
end 


function bird_scene()

                                                -- Introducing bird and named as a player
    self.player = director:createSprite( {
        name = "player",
        x=400, y=100,
        xAnchor=0.5, yAnchor=0.5,
        source = "graphics/bird1.png",
        } )
     physics:addNode(self.player)
     -------------------------------------------
     self.box1 = director:createSprite( {
      x=globals.trueWidth*2/4, y=globals.trueHeight*1/1.5,
      source="graphics/rectangle2Large.png",
      xAnchor=0.5, yAnchor=0.5,
    } )
    physics:addNode(self.box1)	

   self.box2 = director:createSprite( {
      x=globals.trueWidth*3/4, y=globals.trueHeight*1/1.5,
      source="graphics/rectangle1.png",
      xAnchor=0.5, yAnchor=0.5,
    } )
    physics:addNode(self.box2,{type="static"})

    self.box3 = director:createSprite( {
      x=globals.trueWidth*1/3.86, y=globals.trueHeight*1/2.0,
      source="graphics/rectangle1.png",
      xAnchor=0.5, yAnchor=0.5,
    } )
    physics:addNode(self.box3,{type="static"})	

local joint1 = physics:createRevoluteJoint(self.box1, self.box2, self.box2.x-self.box2.w/2, self.box2.y)
end
bird_scene()
self.label3:addTimer(scoree,1)
                                   -- An array of rain drops
--local rain_count = 0

                                                        -- rain is called by timer at specific event to fire
                                                          -- function moves the enemy from left to right
 function move_cloud()
    local moveEnemy = function(event)
        self.enemy.x = self.enemy.x + 1
        if self.enemy.x > (dw+60) then                    -- when cloud goes out of screen , it removes
          self.enemy:removeFromParent()
          self.enemy = nil
          collectgarbage("collect")
        if level_complete_counter == 200 then
         print("success")       -- level complete counter is set to 200 as player collides with enemy, so move to level fail screen                        
         director:moveToScene(level_complete ,{ transitionType = "progressInOut", transitionTime = 0.5 })
       --  director:setCurrentScene(nil)
        else
         print("lost")
         director:moveToScene(level_lost,{ transitionType = "progressInOut", transitionTime = 0.5 })
      --   director:setCurrentScene(nil)
        end    
        end  
 --       print("w = "..dw.." h = "..dh.."Position of cloud is X = "..enemy.x.." y = "..enemy.y)
  end
  local endPoint = 950
       t_cloud2 =  tween:to(self.enemy, { x=dw+150, y=410, time=(endPoint-self.enemy.x)/100, easing = ease.linear, onComplete = moveEnemy } )
 end 



                                                        -- When user picks an object, it stucks to its touch finger and follow the touch untill releases. 
 function moveCrate(event) 
    if event.phase == "moved" then
      
     if event.y > drop_limit  then                      --  When phase is in move state
      if crateCounter == 1 then 
       self.label1.x = crate_1.x + 120
       self.label1.y = crate_1.y + 50
       self.label1.text = "Release to Drop" 
       self.label1.color = color.white
       event.target.moveWithFinger = true                  --  to follow the finger touch  
       crate_1.x = event.x
       crate_1.y = event.y
       elseif crateCounter == 2 then
       self.label1.x = crate_2.x + 120
      self.label1.y = crate_2.y + 50
       self.label1.text = "Release to Drop" 
       self.label1.color = color.white
       event.target.moveWithFinger = true                  --  to follow the finger touch  
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
      physics:addNode(crate_1, {restitution=0.25,  type="dynamic" } )     --  Add that node to a physics object
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
          set_highScore2(score)
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

  createCrate() 

function main_menu_17()
  director:moveToScene(main_menu,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function select_level_17()
  director:moveToScene(level_selector,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end

function next_level_17()
  director:moveToScene(level_1,{ transitionType = "fadeUp", transitionTime = 0.5 })
  physics:resume()
end  
function getSuspend_17(event)
  if event.phase == "began" then
    self.bg.isTouchable = false;
   -- self.bg:removeEventListener("touch", moveCrate) 
   self.button_pause2:removeEventListener("touch", getSuspend_2)
   self.button_reply2:removeEventListener("touch", getReplay)
   --print("suspended")
   physics:pause()
   self.label3:pauseTimers()
   if (t_cloud2) then
   self.enemy:pauseTimers()
   tween:cancel(t_cloud2)
   end
   pauseMenu()
   end
end
function getResume_17()
  
    self.bg.isTouchable = true;
  --  self.bg:addEventListener("touch", moveCrate) 
    self.button_pause2:addEventListener("touch", getSuspend_17)
    self.button_reply2:addEventListener("touch", getReplay)
   print("Resume_2 is called")
   physics:resume()
    if scoreTimerFlag == 0 then                    --resume only if timer is not 100
   self.label3:resumeTimers()
   end
   if (t_cloud2) then
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
 self.button_pause2:addEventListener("touch", getSuspend_17)
 self.button_reply2:addEventListener("touch", getReplay)
end

function scene:tearDown(event)                --remove objects here
 dbg.print("level2 tearDown starts")  
 level_complete_counter = nil
                                       --Remove Physics Nodes
physics:removeNode(self.player)
physics:removeNode(self.bar)



physics:removeNode(self.box1)
physics:removeNode(self.box2)

                                             --Remove variables
self.player:removeFromParent()
self.bar:removeFromParent()
self.bg:removeFromParent()



self.sb:removeFromParent()
self.box1:removeFromParent()
self.box2:removeFromParent()

director:getCurrentScene():releaseAtlas(self.bg.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bg.animation)

director:getCurrentScene():releaseAtlas(self.player.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.player.animation)

director:getCurrentScene():releaseAtlas(self.bar.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.bar.animation)

director:getCurrentScene():releaseAtlas(self.box1.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.box1.animation)

director:getCurrentScene():releaseAtlas(self.box2.animation.usedAtlases)
director:getCurrentScene():releaseAnimation(self.box2.animation)


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
if crate_1 then
  physics:removeNode(crate_1)
  crate_1:removeFromParent()
  director:getCurrentScene():releaseAtlas(crate_1.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(crate_1.animation)
  crate_1 = nil
end

if crate_2 then
  physics:removeNode(crate_2)
  crate_2:removeFromParent()
  director:getCurrentScene():releaseAtlas(crate_2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(crate_2.animation)
  crate_2 = nil
end
if self.button_pause2 then
 self.button_pause2:removeEventListener("touch", getSuspend_2)
 self.button_pause2:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.button_pause2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_pause2.animation)
  self.button_pause2 = nil

end 
if self.button_reply2 then 
 self.button_reply2:removeEventListener("touch", getReplay)
  self.button_reply2:removeFromParent()
  director:getCurrentScene():releaseAtlas(self.button_reply2.animation.usedAtlases)
  director:getCurrentScene():releaseAnimation(self.button_reply2.animation)
  self.button_reply2 = nil
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
self.player = nil
self.bar= nil
self.bg= nil
self.box1=nil
self.box2=nil
rain_count  = nil
count = nil                                   --put functions to nil for garbage collector
--bodyCollision = nil
--createCrate =  nil
pathS = nil
filename = nil
file = nil
fileContents = nil
self.sb = nil;
collectgarbage("collect")                      -- call garbage collector to free memory of removed objects
director:cleanupTextures()
print("Mem. at end of Level2    "..math.floor(collectgarbage("count")))
end
-- Add multiple event listeners to the same object
scene:addEventListener( { "setUp", "tearDown" }, scene)

return scene
