import "Turbine.UI"; 
import "Turbine.UI.Lotro";
import "Turbine.Gameplay";
import "shevchuk.XUnitFrames.WindowConstructor";
import "shevchuk.XUnitFrames.EventHandler";
PartyPlayerFrame = {}
ActualPartyMembersCount = 0
--[[
function createPartyFrame(member)   
    Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
    if(Party ~= nil) then
    for count = 1, Party:GetMemberCount() do
        if (Party:GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
    table.insert(PartyPlayerFrame, PartyPlayerWindow(Party:GetMember(count)))
    end
end
    ActualPartyMembersCount = Party:GetMemberCount()-1
    end
end
]]

function createPartyFrame()
    Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
                for i = 1, 5 do
                table.insert(PartyPlayerFrame, PartyPlayerWindow(i))
                local x,y = 0, 500
                --
                if i >1 then
                   x, y = PartyPlayerFrame[i-1]:GetPosition()
                    end
               PartyPlayerFrame[i]:SetPosition(200, y+50)
                    PartyPlayerFrame[i].DragBar:SetBarOnTop( true );
                end
                --
    if(Turbine.Gameplay.LocalPlayer:GetInstance():GetParty()) == nil then
        for i = 1, 5 do
            PartyPlayerFrame[i]:SetVisible(false)

        end
    else
        Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()

            for count = 1, Party:GetMemberCount() do
                if (Party:GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    PartyPlayerFrame[count]:SetMember(Party:GetMember(count))
                    PartyPlayerFrame[count]:SetVisible(true)
                    end
end
        end


end

function getActualPartyMembersCount()   
    return ActualPartyMembersCount
end

function getPlayerFrame(number)
    return PartyPlayerFrame[number]
end

function createPartyEventHandler()
    Turbine.Gameplay.LocalPlayer.GetInstance().PartyChanged = function( sender, args )
		UpdatePartyInfo()
            end
            if (Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()) ~= nil then
    Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberAdded = function( sender, args )
    UpdatePartyInfo()
end
    Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberRemoved = function( sender, args )
        UpdatePartyInfo()
    end
end
end