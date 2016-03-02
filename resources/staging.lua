local pathS = system:getFilePath("storage", "")
                                            -- Here's the filename we'll use
local stage_f = "current_stage.txt"
local level_f = "current_level.txt"
local purchase_f = "purchase_game.txt"
local sound_f = "sound.txt"
local fake_f = "fake.txt"
local highScore1_f = "highScore1.txt"
local highScore2_f = "highScore2.txt"
local highScore3_f = "highScore3.txt"
local highScore4_f = "highScore4.txt"
local highScore5_f = "highScore5.txt"
local highScore6_f = "highScore6.txt"
local highScore7_f = "highScore7.txt"
local highScore8_f = "highScore8.txt"
local highScore9_f = "highScore9.txt"
local highScore10_f = "highScore10.txt"
local highScore11_f = "highScore11.txt"
local highScore12_f = "highScore12.txt"
local highScore13_f = "highScore13.txt"
local highScore14_f = "highScore14.txt"
local highScore15_f = "highScore15.txt"
local stage_number
local level_number
local purchase
local sound_state
local high_score
function set_level(level_number)
                                            -- Here's some data to write to a file
local fileContents = level_number
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. level_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. level_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. level_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
function get_level()
  local file
  file = io.open(pathS .. level_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. level_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    currentLevel = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. currentLevel)
    file:close()
  end
  return currentLevel
end
--------------------------------------------------
function set_highScore1(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore1_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore1_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore1_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore1
function get_highScore1()
  local file
  file = io.open(pathS .. highScore1_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore1_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore1 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore1)
    file:close()
  else
    levelHighScore1=0
  end
  return levelHighScore1
end
---------------------------------------------------
--------------------------------------------------
function set_highScore2(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore2_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore2_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore2_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore2
function get_highScore2()
  local file
  file = io.open(pathS .. highScore2_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore2_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore2 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore2)
    file:close()
  else
    levelHighScore2=0
  end
  return levelHighScore2
end
---------------------------------------------------
--------------------------------------------------
function set_highScore3(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore3_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore3_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore3_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore3
function get_highScore3()
  local file
  file = io.open(pathS .. highScore3_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore3_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore3 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore3)
    file:close()
  else
    levelHighScore3=0
  end
  return levelHighScore3
end
---------------------------------------------------
--------------------------------------------------
function set_highScore4(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore4_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore4_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore4_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore4
function get_highScore4()
  local file
  file = io.open(pathS .. highScore4_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore4_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore4 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore4)
    file:close()
  else
    levelHighScore4=0
  end
  return levelHighScore4
end
---------------------------------------------------
--------------------------------------------------
function set_highScore5(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore5_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore5_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore5_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore5
function get_highScore5()
  local file
  file = io.open(pathS .. highScore5_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore5_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore5 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore5)
    file:close()
  else
    levelHighScore5=0
  end
  return levelHighScore5
end
---------------------------------------------------
--------------------------------------------------
function set_highScore6(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore6_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore6_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore6_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore6
function get_highScore6()
  local file
  file = io.open(pathS .. highScore6_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore6_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore6 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore6)
    file:close()
  else
    levelHighScore6=0
  end
  return levelHighScore6
end
---------------------------------------------------
--------------------------------------------------
function set_highScore7(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore7_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore7_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore7_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore7
function get_highScore7()
  local file
  file = io.open(pathS .. highScore7_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore7_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore7 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore7)
    file:close()
  else
    levelHighScore7=0
  end
  return levelHighScore7
end
---------------------------------------------------
--------------------------------------------------
function set_highScore8(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore8_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore8_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore8_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore8
function get_highScore8()
  local file
  file = io.open(pathS .. highScore8_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore8_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore8 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore8)
    file:close()
  else
    levelHighScore8=0
  end
  return levelHighScore8
end
---------------------------------------------------
--------------------------------------------------
function set_highScore9(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore9_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore9_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore9_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore9
function get_highScore9()
  local file
  file = io.open(pathS .. highScore9_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore9_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore9 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore9)
    file:close()
  else
    levelHighScore9=0
  end
  return levelHighScore9
end
---------------------------------------------------
--------------------------------------------------
function set_highScore10(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore10_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore10_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore10_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore10
function get_highScore10()
  local file
  file = io.open(pathS .. highScore10_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore10_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore10 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore10)
    file:close()
  else
    levelHighScore10=0
  end
  return levelHighScore10
end
---------------------------------------------------
--------------------------------------------------
function set_highScore11(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore11_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore11_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore11_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore11
function get_highScore11()
  local file
  file = io.open(pathS .. highScore11_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore11_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore11 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore11)
    file:close()
  else
    levelHighScore11=0
  end
  return levelHighScore11
end
---------------------------------------------------
--------------------------------------------------
function set_highScore12(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore12_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore12_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore12_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore12
function get_highScore12()
  local file
  file = io.open(pathS .. highScore12_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore12_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore12 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore12)
    file:close()
  else
    levelHighScore12=0
  end
  return levelHighScore12
end
---------------------------------------------------
--------------------------------------------------
function set_highScore13(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore13_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore13_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore13_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore13
function get_highScore13()
  local file
  file = io.open(pathS .. highScore13_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore13_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore13 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore13)
    file:close()
  else
    levelHighScore13=0
  end
  return levelHighScore13
end
---------------------------------------------------
--------------------------------------------------
function set_highScore14(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore14_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore14_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore14_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore14
function get_highScore14()
  local file
  file = io.open(pathS .. highScore14_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore14_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore14 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore14)
    file:close()
  else
    levelHighScore14=0
  end
  return levelHighScore14
end
---------------------------------------------------
--------------------------------------------------
function set_highScore15(high_score)
                                            -- Here's some data to write to a file
local fileContents = high_score
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. highScore15_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. highScore15_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. highScore15_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 -- Always remember to close the file!
end 
local levelHighScore15
function get_highScore15()
  local file
  file = io.open(pathS .. highScore15_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. highScore15_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    levelHighScore15 = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. levelHighScore15)
    file:close()
  else
    levelHighScore15=0
  end
  return levelHighScore15
end
---------------------------------------------------
function set_stage(stage_number)
                                              -- Here's some data to write to a file
local fileContents = stage_number
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. stage_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. stage_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. stage_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()                                 
end

function get_stage()
    local file
  file = io.open(pathS .. stage_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. stage_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    currentStage = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. currentStage)
    file:close()
  end
 -- currentStage = tonumber(currentStage)
  return (currentStage)
end

function set_purchase(purchase)
                                             -- Here's some data to write to a file
local fileContents = purchase
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. purchase_f)
if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. purchase_f)
else
    dbg.print("File does not exist")  
end
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. purchase_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
file:close()           
end
                                            -- get_Purchase will return 1 if game is in purchased state. else it will return 0.
function get_purchase()
  local file
  file = io.open(pathS .. purchase_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. purchase_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    currentPurchase = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. purchase_f)
    file:close()
  else
    currentPurchase = 0
  end
  return currentPurchase
end
------------------
local sound_state = 1
function get_sound()
  return sound_state 
 end
 function set_sound(param)
   sound_state = param
 end
--[[
function get_sound()
  local file
  file = io.open(pathS .. sound_f)
    if file then
                                                         -- It does, so delete it rotates back to past leel
    file = io.open(pathS .. sound_f, "r")               -- the "r" indicates we're opening the file for reading
    dbg.assert(file, "Could not open file for reading")
    sound_state = file:read("*a")                             -- the "*a" indicates we want to read the entire file contents
    dbg.print("File contents:\n" .. sound_f)
    file:close()
  else
    sound_state = 0
  end
  sound_state = tonumber (sound_state)
  return sound_state
end

local sound_set
function set_sound(sound_set)
                                             -- Here's some data to write to a file
local fileContents = sound_set
print("In sound_set is ".. sound_set)
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. sound_f)

if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. sound_f)
else
    dbg.print("File does not exist")  
end
print("sounds writing to file is "..fileContents)
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. "sound.txt", "w")      -- the "w" indicates we're opening the file for writing
print("file opened")
file:write(fileContents)
print("sounds written to file is "..fileContents)
file:close()     
end

function set_fake()
                                             -- Here's some data to write to a file
local fileContents = "1"
                                            -- Here's a file handle variable
local file
                                            -- Check if the file exists
file = io.open(pathS .. fake_f)

if file then
                                            -- It does, so delete it
    dbg.print("File exists: deleting")
    file:close()
    os.remove(pathS .. fake_f)
else
    dbg.print("File does not exist")  
end
print("sounds writing to file is "..fileContents)
                                            -- Write the string to the file
                                            -- Because we open the file for writing, if the file does not exist it will be created
file = io.open(pathS .. fake_f, "w")      -- the "w" indicates we're opening the file for writing
file:write(fileContents)
print("sounds written to file is "..fileContents)
file:close()     
end

--]]
function play_sound()
  local musicStreams =
{
	"Sounds/game.mp3"
 }
audio:playStream(musicStreams[1],true)
end

function stop_sound()
  	if audio:isStreamPlaying() then
			audio:stopStream()
    end
end
