local scene = director:createScene()
scene.name = "buy_levels"

print("level_selector starts")

local sb
local purchase_status
local productId = "FYB_InApp1"

local statusLabel
local infoLabel
local queryButton
local purchaseButton
local restoreButton
function scene:setUp(event)
 sb = newScaleBox();
  print("getting purchase is  "..get_purchase())
  
  self.backGround = director:createSprite( 0, 0,"graphics/main_menu.png" );
	self.backGround.x = 	globals.xCentre
	self.backGround.y =  globals.yCentre
  self.backGround.xAnchor=0.5;
  self.backGround.yAnchor=0.5;
   
 statusLabel = director:createLabel( {
	x=350, y=400,
	text="status",
	color={0xf, 0xf, 0xf}
	} )
	
infoLabel = director:createLabel( {
	x=350, y=300,
	text="info",
	color={0xf, 0xf, 0xff}
	} ) 

-- Create product query button
queryButton = director:createSprite( {
		x=70, y=140,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/productInfo.png",
	} )
function queryButton:touch(event)
    if event.phase == "ended" then
		statusLabel.text = ""
		infoLabel.text = ""
		billing:queryProduct(productId)
    end
end
queryButton:addEventListener("touch", queryButton)

 -- Create product purchase button
 purchaseButton = director:createSprite( {
		x=70, y=220,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/buyFullVersion.png",
	} )
function purchaseButton:touch(event)
    if event.phase == "ended" then
		statusLabel.text = ""
		infoLabel.text = ""
		billing:purchaseProduct(productId)
    end
end
purchaseButton:addEventListener("touch", purchaseButton)

-- Create restore products button
restoreButton = director:createSprite( {
		x=70, y=290,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/restore.png",
	} )
function restoreButton:touch(event)
    if event.phase == "ended" then
		statusLabel.text = ""
		infoLabel.text = ""
		billing:restoreTransactions()
    end
end
restoreButton:addEventListener("touch", restoreButton)

  -- Called in response to a billing error
function billingError(event)
	statusLabel.text = "Error"
	infoLabel.text = event.error
end

-- Called in response to a queryProduct request
function infoAvailable(event)
	statusLabel.text = "Info"
	infoLabel.text = event.productId .. " - " .. event.price
end

-- Called in response to a purchaseProduct or restoreTransactions request
function receiptAvailable(event)
	if (event.restored) then
		statusLabel.text = "Restored"
		infoLabel.text = "productId" .. " - " .. event.productId
  --  set_purchase("bought")
	else
		statusLabel.text = "Purchased"
		infoLabel.text = "productId" .. " - " .. event.productId
   -- set_purchase("bought")
	end
	local fd = event.finaliseData
	if (billing:finishTransaction(event.finaliseData) == false) then
		statusLabel.text = "Error finalising transaction"
	end
end

-- Called in response to a a product refund (Android only)
function refundAvailable(event)
	statusLabel.text = "Refunded"
	infoLabel.text = event.productId
end

-- Called in response to a billing event
function billingEvent(event)
	if (event.type == "billingError") then
		billingError(event)
	elseif (event.type == "infoAvailable") then
		infoAvailable(event)
	elseif (event.type == "receiptAvailable") then
		receiptAvailable(event)
	elseif (event.type == "refundAvailable") then
		refundAvailable(event)
	end
end

-- Check and initialise billing if it is available
if (billing:isAvailable()) then
	statusLabel.text = "Available"
	
	if (billing:init()) then
		statusLabel.text = "Initialised"
		system:addEventListener("billing", billingEvent)
		billing:setTestMode(true)
	end
else
	statusLabel.text = "Not Available"
end

  self.button_back = director:createSprite( {
		x=40, y=40,
  	xScale=dw/800, -- stretch from original image size
		yScale=dh/480, -- stretch from original image size
		source="graphics/back.png",
	} )

  local function button_back_fn(event)
    if event.phase == "ended" then
    print("touch active on buy button")
    director:moveToScene(level_selector2,{})
    end
   end
   self.button_back:addEventListener("touch", button_back_fn)
end

  


function scene:tearDown(event)
 self.backGround:removeFromParent()
 statusLabel:removeFromParent()
 infoLabel:removeFromParent()
 queryButton:removeFromParent()
 purchaseButton:removeFromParent()
 restoreButton:removeFromParent()
 self.button_back:removeFromParent()
 
 
  director:getCurrentScene():releaseAtlas(self.backGround)
  director:getCurrentScene():releaseAnimation(self.backGround)
  
  director:getCurrentScene():releaseAtlas(statusLabel)
  director:getCurrentScene():releaseAnimation(statusLabel)
  
  director:getCurrentScene():releaseAtlas(infoLabel)
  director:getCurrentScene():releaseAnimation(infoLabel)
  
  director:getCurrentScene():releaseAtlas(queryButton)
  director:getCurrentScene():releaseAnimation(queryButton)
  
  director:getCurrentScene():releaseAtlas(purchaseButton)
  director:getCurrentScene():releaseAnimation(purchaseButton)
  
  director:getCurrentScene():releaseAtlas(restoreButton)
  director:getCurrentScene():releaseAnimation(restoreButton)
  
  
  director:getCurrentScene():releaseAtlas(self.button_back)
  director:getCurrentScene():releaseAnimation(self.button_back)
  
  self:releaseResources()
  director:getCurrentScene():releaseResources()
  
  self.backGround = nil
 statusLabel = nil
 infoLabel = nil
 queryButton = nil
 purchaseButton = nil
 restoreButton = nil
 self.button_back = nil
 
  collectgarbage("collect")
  director:cleanupTextures()
  print("Mem. at end of Buy Level    "..math.floor(collectgarbage("count")))
 
end

scene:addEventListener( { "setUp", "tearDown"}, scene)

return scene