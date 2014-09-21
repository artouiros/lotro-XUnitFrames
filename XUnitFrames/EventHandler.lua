import "shevchuk.XUnitFrames.WindowConstructor";
import "shevchuk.XUnitFrames.PartyWindow";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "Turbine.Gameplay";


function UpdatePartyMemberMorale(frame, player)
    local morale        = player:GetMorale();
    local maxMorale     = player:GetMaxMorale();
    frame.pMoraleLabel:SetText(math.floor(morale+0.5).."/"..math.floor(maxMorale+0.5))
    local moralePercentage = (math.floor(morale+0.5))*100/(math.floor(maxMorale+0.5))
   frame.php:SetWidth((phpDefaultSize/100)*moralePercentage)
    frame.pMoralePercentageLabel:SetText(math.floor(morale*100/maxMorale+0.5).."%")
end

function UpdatePartyMemberPower(frame, player)
    local power        = player:GetPower();
    local maxPower     = player:GetMaxPower();
    frame.pPowerLabel:SetText(math.floor(power+0.5).."/"..math.floor(maxPower+0.5))
    local powerPercentage = (math.floor(power+0.5))*100/(math.floor(maxPower+0.5))
    frame.pmana:SetWidth((phpDefaultSize/100)*powerPercentage)
    frame.pPowerPercentageLabel:SetText(math.floor(power*100/maxPower+0.5).."%")
end




function UpdateMorale()
	local morale        = lPlayer:GetMorale();
	local maxMorale     = lPlayer:GetMaxMorale();
	MoraleLabel:SetText(math.floor(morale+0.5).."/"..math.floor(maxMorale+0.5))
        local moralePercentage = (math.floor(morale+0.5))*100/(math.floor(maxMorale+0.5))
        hp:SetWidth((hpDefaultSize/100)*moralePercentage)
        MoralePercentageLabel:SetText(math.floor(morale*100/maxMorale+0.5).."%")
    end
    
function UpdatePower()
	local power        = lPlayer:GetPower();
	local maxPower     = lPlayer:GetMaxPower();
	PowerLabel:SetText(math.floor(power+0.5).."/"..math.floor(maxPower+0.5))
        local powerPercentage = (math.floor(power+0.5))*100/(math.floor(maxPower+0.5))
        mana:SetWidth((hpDefaultSize/100)*powerPercentage)
        PowerPercentageLabel:SetText(math.floor(power*100/maxPower+0.5).."%")
    end
 
function UpdateTarget()
	tEntity:SetEntity(lPlayer:GetTarget());
        
       --[[
       I don't know why, but when Target equals LocalPlayer, EventHandler at LocalPlayer stops working. I know this looks terrible, but I managed
       a workaround - if Target equals LocalPlayer, I'm using Target's EventHandler to update Player's hp and mana.
       ]]
       
        if (lPlayer:GetTarget()) ~= nil then
              if (lPlayer:GetTarget()) ~= (lPlayer) then
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MoraleChanged = function( sender, args )
		UpdateTargetMorale()
            end
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MaxMoraleChanged = function( sender, args )
		UpdateTargetMorale()
            end
        else
          Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MoraleChanged = function( sender, args )
		UpdateTargetMorale()
                UpdateMorale()
            end
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MaxMoraleChanged = function( sender, args )
		UpdateTargetMorale()
                UpdateMorale()
            end  
        end    
    end
    
    if (lPlayer:GetTarget()) ~= nil then
             if (lPlayer:GetTarget()) ~= (lPlayer) then
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().PowerChanged = function( sender, args )
		UpdateTargetPower()
            end
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MaxPowerChanged = function( sender, args )
		UpdateTargetPower()
            end
        else
         Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().PowerChanged = function( sender, args )
		UpdateTargetPower()
                UpdatePower()
            end
            Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget().MaxPowerChanged = function( sender, args )
		UpdateTargetPower()
                UpdatePower()
            end   
        end    
        end
        
        
        if (lPlayer:GetTarget()) ~= nil then
         
            TargetImage:SetBackground("shevchuk/XUnitFrames/Resources/captain.tga")
            TargetImage:SetBlendMode(4)
            TargetImage:SetStretchMode(2)
            TargetImage:SetMouseVisible(false)
             tPlayerName:SetText(lPlayer:GetTarget():GetName())
            UpdateTargetPower()
            UpdateTargetMorale()
            TargetFrame:SetVisible(true)
        else
       TargetFrame:SetVisible(false)
   end
        
    end
function UpdateTargetPower()
    if (lPlayer:GetTarget()) ~= nil then
	local tpower = lPlayer:GetTarget():GetPower();
	local tmaxPower = lPlayer:GetTarget():GetMaxPower();
	tPowerLabel:SetText(math.floor(tpower+0.5).."/"..math.floor(tmaxPower+0.5))
        local tpowerPercentage = (math.floor(tpower+0.5))*100/(math.floor(tmaxPower+0.5))
        tmana:SetWidth((hpDefaultSize/100)*tpowerPercentage)
        tPowerPercentageLabel:SetText(math.floor(tpower*100/tmaxPower+0.5).."%")
    end
    end
    
function UpdateTargetMorale()
     if (lPlayer:GetTarget()) ~= nil then
	local tmorale = lPlayer:GetTarget():GetMorale();
	local tmaxMorale = lPlayer:GetTarget():GetMaxMorale();
	tMoraleLabel:SetText(math.floor(tmorale+0.5).."/"..math.floor(tmaxMorale+0.5))
        local tmoralePercentage = (math.floor(tmorale+0.5))*100/(math.floor(tmaxMorale+0.5))
        thp:SetWidth((hpDefaultSize/100)*tmoralePercentage)
        tMoralePercentageLabel:SetText(math.floor(tmorale*100/tmaxMorale+0.5).."%")
    end
end


function UpdatePartyInfo()
if (Turbine.Gameplay.LocalPlayer.GetInstance():GetParty()) ~= nil then
    if #PartyPlayerFrame == 0 then
    createPartyFrame()
    else
    PPlayersNumber = Turbine.Gameplay.LocalPlayer.GetInstance():GetParty():GetMemberCount()
    PPlayersFrames = #PartyPlayerFrame


    end



end


    
end
