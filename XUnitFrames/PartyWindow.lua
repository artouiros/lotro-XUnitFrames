import "Turbine.UI"; 
import "Turbine.UI.Lotro";
import "Turbine.Gameplay";
import "shevchuk.XUnitFrames.WindowConstructor";
import "shevchuk.XUnitFrames.EventHandler";
PartyPlayerFrame = {}
PartyPlayers = {}
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
	
	--------------------
		Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberRemoved = function( sender, args )
            for k in pairs (PartyPlayers) do
                PartyPlayers [k] = nil
            end
            for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
                if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for i = 1, 5 do
                if i > #PartyPlayers then
                    PartyPlayerFrame[i]:SetVisible(false)
                    end
            end



           Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for count = 1, #PartyPlayers do

                    Turbine.Shell.WriteLine(count..#PartyPlayers)
                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])
                    UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])
                    PartyPlayerFrame[count]:SetVisible(true)
                  --  Turbine.Shell.WriteLine(""..count..PartyPlayers[count]:GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

                    end



            end
end
		----------------------
		
-------------------
Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberAdded = function( sender, args )
            for k in pairs (PartyPlayers) do
                PartyPlayers [k] = nil
            end
            for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
                if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for i = 1, 5 do
                if i > #PartyPlayers then
                    PartyPlayerFrame[i]:SetVisible(false)
                    end
            end



           Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for count = 1, #PartyPlayers do

                    Turbine.Shell.WriteLine(count..#PartyPlayers)
                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])
                    UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])
                    PartyPlayerFrame[count]:SetVisible(true)
                  --  Turbine.Shell.WriteLine(""..count..PartyPlayers[count]:GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

                    end



            end
end
-------------------
	
	
       -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
        for k in pairs (PartyPlayers) do
            PartyPlayers [k] = nil
        end
        for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
            if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            for count = 1, #PartyPlayers do

                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    PartyPlayerFrame[count]:SetVisible(true)
                    Turbine.Shell.WriteLine(""..count..Party:GetMember(count):GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )
if  Turbine.Gameplay.LocalPlayer:GetInstance():GetParty() ~= nil then
    if  PartyPlayers[count] ~= nil then
        Turbine.Shell.WriteLine("hello")
        end
    end
                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

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
 Turbine.Shell.WriteLine("TADAM")

        if(Turbine.Gameplay.LocalPlayer:GetInstance():GetParty()) == nil then
            for i = 1, 5 do
                PartyPlayerFrame[i]:SetVisible(false)

            end
        else
		
		--------------------
		Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberRemoved = function( sender, args )
            for k in pairs (PartyPlayers) do
                PartyPlayers [k] = nil
            end
            for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
                if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for i = 1, 5 do
                if i > #PartyPlayers then
                    PartyPlayerFrame[i]:SetVisible(false)
                    end
            end



           Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for count = 1, #PartyPlayers do

                    Turbine.Shell.WriteLine(count..#PartyPlayers)
                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])
                    UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])
                    PartyPlayerFrame[count]:SetVisible(true)
                  --  Turbine.Shell.WriteLine(""..count..PartyPlayers[count]:GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

                    end



            end
end
		----------------------
		
-------------------
Turbine.Gameplay.LocalPlayer.GetInstance():GetParty().MemberAdded = function( sender, args )
            for k in pairs (PartyPlayers) do
                PartyPlayers [k] = nil
            end
            for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
                if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for i = 1, 5 do
                if i > #PartyPlayers then
                    PartyPlayerFrame[i]:SetVisible(false)
                    end
            end



           Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for count = 1, #PartyPlayers do

                    Turbine.Shell.WriteLine(count..#PartyPlayers)
                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])
                    UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])
                    PartyPlayerFrame[count]:SetVisible(true)
                  --  Turbine.Shell.WriteLine(""..count..PartyPlayers[count]:GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

                    end



            end
end
-------------------
            for k in pairs (PartyPlayers) do
                PartyPlayers [k] = nil
            end
            for count = 1, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMemberCount() do
                if (Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count)) ~= (Turbine.Gameplay.LocalPlayer.GetInstance()) then
                    table.insert(PartyPlayers, Turbine.Gameplay.LocalPlayer:GetInstance():GetParty():GetMember(count))
                end
            end
            -- Party = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for i = 1, 5 do
                if i > #PartyPlayers then
                    PartyPlayerFrame[i]:SetVisible(false)
                    end
            end



           Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()
            for count = 1, #PartyPlayers do

                    Turbine.Shell.WriteLine(count..#PartyPlayers)
                    PartyPlayerFrame[count].partyEntity:SetEntity(PartyPlayers[count])
                    PartyPlayerFrame[count].pPlayerName:SetText(PartyPlayers[count]:GetName())
                    PartyPlayerFrame[count].pMoraleLabel:SetText(math.floor(PartyPlayers[count]:GetMorale()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxMorale()+0.5))
                    PartyPlayerFrame[count].pMoralePercentageLabel:SetText(PartyPlayers[count]:GetMorale()*100/PartyPlayers[count]:GetMaxMorale().."%")
                    PartyPlayerFrame[count].pPowerLabel:SetText(math.floor(PartyPlayers[count]:GetPower()+0.5).."/"..math.floor(PartyPlayers[count]:GetMaxPower()+0.5))
                    PartyPlayerFrame[count].pPowerPercentageLabel:SetText(PartyPlayers[count]:GetPower()*100/PartyPlayers[count]:GetMaxPower().."%")
                    -- pPlayerName:SetText(member:GetName())
                    -- PartyPlayerFrame[count].getEntity():SetEntity(Party:GetMember(count))
                    UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])
                    UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])
                    PartyPlayerFrame[count]:SetVisible(true)
                  --  Turbine.Shell.WriteLine(""..count..PartyPlayers[count]:GetName())
                    PartyPlayers[count].MoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])


                    end

                    PartyPlayers[count].MaxMoraleChanged = function( sender, args )

                        UpdatePartyMemberMorale(PartyPlayerFrame[count], PartyPlayers[count])

                    end

                    PartyPlayers[count].PowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count],PartyPlayers[count])


                    end
                    PartyPlayers[count].MaxPowerChanged = function( sender, args )

                        UpdatePartyMemberPower(PartyPlayerFrame[count], PartyPlayers[count])

                    end



            end
        end
            end

end