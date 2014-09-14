import "Turbine.UI"; 
import "Turbine.UI.Lotro";
import "Turbine.Gameplay";
import "shevchuk.XUnitFrames.WindowConstructor";
import "shevchuk.XUnitFrames.PartyWindow";
Turbine.UI.Lotro.LotroUI.SetEnabled(Turbine.UI.Lotro.LotroUIElement.Vitals, false)
Turbine.UI.Lotro.LotroUI.SetEnabled(Turbine.UI.Lotro.LotroUIElement.Target, false)
--[[ Initializing vitals and target frame . They are permanent windows so I initialize them first.
]]
VitalsFrame = VitalsWindow()
TargetFrame = TargetWindow()
--[[
Initializing Party member frame. I'm doing this here, because user can load plugin when he is a member of a fellowship.
I'll have another functions in  EventHandler class for generating party frames when user joins a group or someone joins users group.
If player isn't in the party, there is a if else statement in createPartyFrame() function
]]
createPartyFrame()
--[[
Initializing EventHandler for party MemberAdded/Removed.
I'm calling a function in PartyWindow class to do this. This looks a bit strange,
but I want to keep Main class clear
]]
createPartyEventHandler()

--getPlayerFrame(1):SetVisible(false)

