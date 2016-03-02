--[[
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
]]

if not globals then
    dofile("globals.lua");
end

--[[
This implementation is heavily coupled with the globals.lua and
wrapper.lua implementations. This is purely for convenience but
this implementation could easily be untied and used in a more
direct fasion if preffered.

anchor can be:
"centre"
"top"
"bottom"
"left"
"right"
default value is "centre"

result can be queried for:
screenRight
screenLeft
screenTop
screenBottom
screenWidth
screenHeight
screenXCentre
screenYCentre

x and y coordinates can be transformed from screen space to scalebox space
with the tx() and ty() functions
]]
function newScaleBox(anchor)
    local scaleBox = director:createNode();
    
    local scale = globals.trueWidth / globals.width;
    local checkScale = globals.height * scale;

    if checkScale > globals.trueHeight then
        scale = globals.trueHeight / globals.height;
    end
    
    scaleBox.xScale = scale;
    scaleBox.yScale = scale;
    
    scaleBox.screenHeight = globals.trueHeight / scale;
    scaleBox.screenWidth = globals.trueWidth / scale;
    
    --one or both of these should always be zero
    local xDiff = globals.trueWidth - globals.width*scale;
    local yDiff = globals.trueHeight - globals.height*scale;
    
    scaleBox.x = xDiff / 2;
    scaleBox.y = yDiff / 2;
    scaleBox.screenRight = globals.width + (xDiff / 2) / scale;
    scaleBox.screenLeft = (xDiff / 2) / scale * -1;
    scaleBox.screenTop = globals.height + (yDiff / 2) / scale;
    scaleBox.screenBottom = (yDiff / 2) / scale * -1;
    
    if anchor == "top" then
        scaleBox.y = yDiff;
        scaleBox.screenTop = globals.height;
        scaleBox.screenBottom = yDiff / scale * -1;
    elseif anchor == "bottom" then
        scaleBox.y = 0;
        scaleBox.screenTop = scaleBox.screenHeight;
        scaleBox.screenBottom = 0;
    elseif anchor == "right" then
        scaleBox.x = xDiff;
        scaleBox.screenRight = globals.width;
        scaleBox.screenLeft = xDiff / scale * -1;
    elseif anchor == "left" then
        scaleBox.x = 0;
        scaleBox.screenRight = scaleBox.screenWidth;
        scaleBox.screenLeft = 0;
    end
    
    scaleBox.screenXCentre = scaleBox.screenLeft + (scaleBox.screenRight - scaleBox.screenLeft) / 2;
    scaleBox.screenYCentre = scaleBox.screenBottom + (scaleBox.screenTop - scaleBox.screenBottom) / 2;
    
    --set it as the current scaleBox
    globals.currentSB = scaleBox;
    
    --transform a screen x coordinate to scalebox space
    function scaleBox:tx(xIn)
        return (xIn - scaleBox.x) / scale;
    end
    
    --transform a screen y coordinate to scalebox space
    function scaleBox:ty(yIn)
        return (yIn - scaleBox.y) / scale;
    end
    
    return scaleBox;
end