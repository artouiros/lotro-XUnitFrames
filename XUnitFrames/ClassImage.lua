--[[
This class return image string based on ClassID. If it's a NPC - returns default image
]]

import "shevchuk.XUnitFrames.WindowConstructor";

--[[
A switch() function to emulate switch/case method like in java/c. It's really better than using if else if else if else
]]

function switch(t)
  t.case = function (self,x)
    local f=self[x] or self.default
    if f then
      if type(f)=="function" then
        f(x,self)
      else
        error("case "..tostring(x).." not a function")
      end
    end
  end
  return t
end
 
        classImage  = switch {
        [194] = function (x) return "shevchuk/XUnitFrames/Resources/captain.tga" end,
        }



