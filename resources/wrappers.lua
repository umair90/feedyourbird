
if not globals then
    dofile("globals.lua");
end

--make a new group
function makeGroup()
   local group = director:createNode();
   
   globals.currentSB:addChild(group);
   
   return group;
end

--make a sprite at position 'x', 'y' from file at 'source'
function makeSprite(x, y, source)
    --documentation says odd stuff about these first two variables, so I'll leave them as 0
    local sprite = director:createSprite(0, 0, source);
    
    sprite.xAnchor=0.5;
    sprite.yAnchor=0.5;

    sprite.isTouchable = false;
    
    sprite.x = x;
    sprite.y = y;
    
    globals.currentSB:addChild(sprite);

    return sprite;
end

--make a circle at position 'x', 'y' with a radius of 'radius'
function makeCircle(x, y, radius)
    local circle = director:createCircle(0, 0, radius);

    circle.xAnchor=0.5;
    circle.yAnchor=0.5;

    circle.strokeWidth = 0;
    circle.isTouchable = false;
    
    circle.x = x;
    circle.y = y;
    
    globals.currentSB:addChild(circle);

    return circle;
end

--make a rectangle at position 'x', 'y' with a width of 'w' and a height of 'h'
function makeRectangle(x, y, w, h)
    local rect = director:createRectangle(0, 0, w, h);

    rect.xAnchor = 0.5;
    rect.yAnchor = 0.5;

    rect.strokeWidth = 0;
    rect.isTouchable = false;
    
    rect.x = x;
    rect.y = y;
    
    globals.currentSB:addChild(rect);

    return rect;
end

--Performs the specified function after the specified
--delay in seconds
function performWithDelay(delay, func)
    delay = delay or 0;
    
    return system:addTimer(func, delay, 1, 0);
end
