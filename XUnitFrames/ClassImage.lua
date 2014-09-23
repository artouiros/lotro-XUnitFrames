--[[
This class return image string based on ClassID. If it's a NPC - returns default image
]]

import "shevchuk.XUnitFrames.WindowConstructor";
image = nil
--[[
A switch() function to emulate switch/case method like in java/c. It's really better than using if else if else if else. Only problem I see - I can't
find a way to return a string, so I set image variable to a image string.
]]

function switch(t)
    t.case = function(self, x)
        local f = self[x] or self.default
        if f then
            if type(f) == "function" then
                f(x, self)
            else
                error("case " .. tostring(x) .. " not a function")
            end
        end
    end
    return t
end

classImage = switch {
    [194] = function(x) image = "shevchuk/XUnitFrames/Resources/warden.tga" end,
    [193] = function(x) image = "shevchuk/XUnitFrames/Resources/runkeeper.tga" end,
    [31] = function(x) image = "shevchuk/XUnitFrames/Resources/ministrel.tga" end,
    [185] = function(x) image = "shevchuk/XUnitFrames/Resources/loremaster.tga" end,
    [162] = function(x) image = "shevchuk/XUnitFrames/Resources/hunter.tga" end,
    [23] = function(x) image = "shevchuk/XUnitFrames/Resources/guardian.tga" end,
    [172] = function(x) image = "shevchuk/XUnitFrames/Resources/champion.tga" end,
    [24] = function(x) image = "shevchuk/XUnitFrames/Resources/captain.tga" end,
    [40] = function(x) image = "shevchuk/XUnitFrames/Resources/burglar.tga" end,
}

function getClassImage(entity)
    classImage:case(entity:GetClass())
    return image
end


