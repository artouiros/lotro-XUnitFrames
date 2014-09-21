--[[
This class contains 3 methods for generating different windows for vitals, party and target frames.

������ ����� �������� � ���� 3 ������ ��� ��������� ������ ���� ��� ������� ������, ������ � ����.
]]


import "Turbine.UI";
import "Turbine.UI.Lotro";
import "Turbine.Gameplay";
import "shevchuk.XUnitFrames.EventHandler";
import "Deusdictum.UI";
import "shevchuk.XUnitFrames.ClassImage";
VitalsWindow = class( Turbine.UI.Window );
hpDefaultSize = 222
phpDefaultSize = 155.7
lPlayer = Turbine.Gameplay.LocalPlayer.GetInstance() 
--[[
Method, that generates a Turbine.UI.Window for vitals frame.

����� ��������� ���� Turbine.UI.Window ��� ������ ������.
]]

function VitalsWindow:Constructor( )
	Turbine.UI.Window.Constructor( self );
	self:SetSize(278, 52)
	self:SetPosition( 200, 200 ); 
        self.DragBar = Deusdictum.UI.DragBar( self, "Player's Frame" );
	self.DragBar:SetBarOnTop( true );
	self:SetVisible( true );
        
        pEntity = Turbine.UI.Lotro.EntityControl();
	pEntity:SetParent(self);
        pEntity:SetPosition(0,0)
        pEntity:SetSize(self:GetSize())
        pEntity:SetMouseVisible(true)
        pEntity:SetEntity(Turbine.Gameplay.LocalPlayer.GetInstance());
       
	

--[[
A Turbine.UI.Control which draws player class image.

Turbine.UI.Control, ������� ������������ ������ ������ ���������.
]]

   

        PlayerImage = Turbine.UI.Control()
        PlayerImage:SetParent(self)
        PlayerImage:SetSize(50, 50)
        PlayerImage:SetPosition(1, 1)
        --PlayerImage:SetBackground(classImage:case(lPlayer:GetClass()))
        PlayerImage:SetBackground("shevchuk/XUnitFrames/Resources/captain.tga")
        PlayerImage:SetBlendMode(4)
        PlayerImage:SetStretchMode(2)
        PlayerImage:SetMouseVisible(false)

--[[
A Turbine.UI.Control which draws background for hp and mana panels.

Turbine.UI.Control, ������� ������������ ��� ��� ������� �� � ����.
]]
        
        PowerManaFrame = Turbine.UI.Control()
        PowerManaFrame:SetParent(self)
        PowerManaFrame:SetSize(228, 52)
        PowerManaFrame:SetPosition(51, 1)
        PowerManaFrame:SetBackground("shevchuk/XUnitFrames/Resources/border.tga")
        PowerManaFrame:SetMouseVisible(false)

--[[
Two  Turbine.UI.Control's which draws health points and mana points panel. I used a 1x5px texture gradiend for this.

��� Turbine.UI.Control, ������� ������������ ������ ������� ���� � �������. � ����������� ����������� �������� 1x5px.
]]
        
        hp = Turbine.UI.Control()
        hp:SetParent(PowerManaFrame)
        hp:SetPosition(2.6, 3)
        hp:SetSize(222, 20)
        hp:SetBackground("shevchuk/XUnitFrames/Resources/hptexture.tga")
        hp:SetMouseVisible(false)
        
        mana = Turbine.UI.Control()
        mana:SetParent(PowerManaFrame)
        mana:SetPosition(2.6, 28)
        mana:SetSize(222, 20)
        mana:SetBackground("shevchuk/XUnitFrames/Resources/manatexture.tga")
        mana:SetMouseVisible(false)
        
                      
                
        PlayerName = Turbine.UI.Label();
        PlayerName:SetParent(PowerManaFrame);
        PlayerName:SetPosition(5, 6)
        PlayerName:SetText(lPlayer:GetName())
        PlayerName:SetMouseVisible(false)
        
        MoraleLabel = Turbine.UI.Label()
        MoraleLabel:SetParent(PowerManaFrame)
        MoraleLabel:SetPosition(0, 6)
        MoraleLabel:SetWidth(PowerManaFrame:GetWidth())
        MoraleLabel:SetText(math.floor(lPlayer:GetMorale()+0.5).."/"..math.floor(lPlayer:GetMaxMorale()+0.5))       
        MoraleLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        MoraleLabel:SetMouseVisible(false)
        
        MoralePercentageLabel = Turbine.UI.Label()
        MoralePercentageLabel:SetParent(PowerManaFrame)
        MoralePercentageLabel:SetPosition(-7, 6)
        MoralePercentageLabel:SetWidth(PowerManaFrame:GetWidth())   
        MoralePercentageLabel:SetText(lPlayer:GetMorale()*100/lPlayer:GetMaxMorale().."%")
        MoralePercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        MoralePercentageLabel:SetMouseVisible(false)
        
        lPlayer.MoraleChanged = function( sender, args )
		UpdateMorale()
	end
        lPlayer.MaxMoraleChanged = function( sender, args )
		UpdateMorale()
        end
              
        PowerLabel = Turbine.UI.Label()
        PowerLabel:SetParent(PowerManaFrame)
        PowerLabel:SetPosition(0, 32)
        PowerLabel:SetWidth(PowerManaFrame:GetWidth())
        PowerLabel:SetText(math.floor(lPlayer:GetPower()+0.5).."/"..math.floor(lPlayer:GetMaxPower()+0.5))      
        PowerLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        PowerLabel:SetMouseVisible(false)
        
        PowerPercentageLabel = Turbine.UI.Label()
        PowerPercentageLabel:SetParent(PowerManaFrame)
        PowerPercentageLabel:SetPosition(-7, 32)
        PowerPercentageLabel:SetWidth(PowerManaFrame:GetWidth())   
        PowerPercentageLabel:SetText(lPlayer:GetPower()*100/lPlayer:GetMaxPower().."%")
        PowerPercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        PowerPercentageLabel:SetMouseVisible(false)
        
        lPlayer.PowerChanged = function( sender, args )
		UpdatePower()
	end
        lPlayer.MaxPowerChanged = function( sender, args )
		UpdatePower()
        end
        
end

PartyPlayerWindow = class (Turbine.UI.Window)

function PartyPlayerWindow:Constructor(id)
        Turbine.UI.Window.Constructor( self );
	self:SetSize(196, 38)
	self:SetPosition( 200, 500 );
        --self:SetBackColor( Turbine.UI.Color( math.random(), math.random(), math.random() ) );
        self.DragBar = Deusdictum.UI.DragBar( self, "Player's Frame #".. id );
	self.DragBar:SetBarOnTop( true );
	self:SetVisible( false);
        self.partyEntity = Turbine.UI.Lotro.EntityControl();
        self.partyEntity:SetParent(self);
        self.partyEntity:SetPosition(0,0)
        self.partyEntity:SetSize(self:GetSize())
        self.partyEntity:SetMouseVisible(true)
        --partyEntity:SetEntity(member);

        self.PPlayerImage = Turbine.UI.Control()
        self.PPlayerImage:SetParent(self)
        self.PPlayerImage:SetSize(35, 35)
        self.PPlayerImage:SetPosition(1, 1)
        --PlayerImage:SetBackground(classImage:case(lPlayer:GetClass()))
        self.PPlayerImage:SetBackground("shevchuk/XUnitFrames/Resources/captain.tga")
        self.PPlayerImage:SetBlendMode(4)
        self.PPlayerImage:SetStretchMode(2)
        self.PPlayerImage:SetMouseVisible(false)

        self.PPowerManaFrame = Turbine.UI.Control()
        self.PPowerManaFrame:SetParent(self)
        self.PPowerManaFrame:SetSize(160, 37)
        self.PPowerManaFrame:SetPosition(36, 1)
        self.PPowerManaFrame:SetBackground("shevchuk/XUnitFrames/Resources/bordersmall.tga")
        self.PPowerManaFrame:SetMouseVisible(false)

        self.php = Turbine.UI.Control()
        self.php:SetParent(self.PPowerManaFrame)
        self.php:SetPosition(2.6, 3)
        self.php:SetSize(155.7, 13)
        self.php:SetBackground("shevchuk/XUnitFrames/Resources/hptexture.tga")
        self.php:SetMouseVisible(false)

        self.pmana = Turbine.UI.Control()
        self.pmana:SetParent(self.PPowerManaFrame)
        self.pmana:SetPosition(2.6, 21)
        self.pmana:SetSize(155.7, 13)
        self.pmana:SetBackground("shevchuk/XUnitFrames/Resources/manatexture.tga")
        self.pmana:SetMouseVisible(false)

        self.pPlayerName = Turbine.UI.Label();
        self.pPlayerName:SetParent(self.PPowerManaFrame);
        self.pPlayerName:SetPosition(5, 4)
        --pPlayerName:SetText(member:GetName())
        self.pPlayerName:SetMouseVisible(false)

        self.pMoraleLabel = Turbine.UI.Label()
        self.pMoraleLabel:SetParent(self.PPowerManaFrame)
        self.pMoraleLabel:SetPosition(0, 4)
        self.pMoraleLabel:SetWidth(self.PPowerManaFrame:GetWidth())
        --pMoraleLabel:SetText(math.floor(member:GetMorale()+0.5).."/"..math.floor(member:GetMaxMorale()+0.5))
        self.pMoraleLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        self.pMoraleLabel:SetMouseVisible(false)

        self.pMoralePercentageLabel = Turbine.UI.Label()
        self.pMoralePercentageLabel:SetParent(self.PPowerManaFrame)
        self.pMoralePercentageLabel:SetPosition(-7, 4)
        self.pMoralePercentageLabel:SetWidth(self.PPowerManaFrame:GetWidth())
        --pMoralePercentageLabel:SetText(member:GetMorale()*100/member:GetMaxMorale().."%")
        self.pMoralePercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        self.pMoralePercentageLabel:SetMouseVisible(false)


        self.pPowerLabel = Turbine.UI.Label()
        self.pPowerLabel:SetParent(self.PPowerManaFrame)
        self.pPowerLabel:SetPosition(0, 22)
        self.pPowerLabel:SetWidth(self.PPowerManaFrame:GetWidth())
        --pPowerLabel:SetText(math.floor(member:GetPower()+0.5).."/"..math.floor(member:GetMaxPower()+0.5))
        self.pPowerLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        self.pPowerLabel:SetMouseVisible(false)

        self.pPowerPercentageLabel = Turbine.UI.Label()
        self.pPowerPercentageLabel:SetParent(self.PPowerManaFrame)
        self.pPowerPercentageLabel:SetPosition(-7, 22)
        self.pPowerPercentageLabel:SetWidth(self.PPowerManaFrame:GetWidth())
       -- pPowerPercentageLabel:SetText(member:GetPower()*100/member:GetMaxPower().."%")
        self.pPowerPercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        self.pPowerPercentageLabel:SetMouseVisible(false)



end

TargetWindow = class (Turbine.UI.Window)

function TargetWindow:Constructor( )
        Turbine.UI.Window.Constructor( self );
	self:SetSize(278, 52)
	self:SetPosition( 600, 200 ); 
        self.DragBar = Deusdictum.UI.DragBar( self, "Player's Frame" );
	self.DragBar:SetBarOnTop( true );
        if (lPlayer:GetTarget()) ~= nil then
	self:SetVisible( true );
        else
        self:SetVisible( false )
        end
        tEntity = Turbine.UI.Lotro.EntityControl();
	tEntity:SetParent(self);
        tEntity:SetPosition(0,0)
        tEntity:SetSize(self:GetSize())
        tEntity:SetMouseVisible(true)
        tEntity:SetEntity(Turbine.Gameplay.LocalPlayer.GetInstance():GetTarget());
        lPlayer.TargetChanged = function( sender, args )
		UpdateTarget()
	end
        
        
        TargetImage = Turbine.UI.Control()
        TargetImage:SetParent(self)
        TargetImage:SetSize(50, 50)
        TargetImage:SetPosition(1, 1)
        if (lPlayer:GetTarget()) ~= nil then
        TargetImage:SetBackground("shevchuk/XUnitFrames/Resources/captain.tga")
        end
        TargetImage:SetBlendMode(4)
        TargetImage:SetStretchMode(2)
        TargetImage:SetMouseVisible(false)
        
        TPowerManaFrame = Turbine.UI.Control()
        TPowerManaFrame:SetParent(self)
        TPowerManaFrame:SetSize(228, 52)
        TPowerManaFrame:SetPosition(51, 1)
        TPowerManaFrame:SetBackground("shevchuk/XUnitFrames/Resources/border.tga")
        TPowerManaFrame:SetMouseVisible(false)
        
        thp = Turbine.UI.Control()
        thp:SetParent(TPowerManaFrame)
        thp:SetPosition(2.6, 3)
        thp:SetSize(222, 20)
        thp:SetBackground("shevchuk/XUnitFrames/Resources/hptexture.tga")
        thp:SetMouseVisible(false)
        
        tmana = Turbine.UI.Control()
        tmana:SetParent(TPowerManaFrame)
        tmana:SetPosition(2.6, 28)
        tmana:SetSize(222, 20)
        tmana:SetBackground("shevchuk/XUnitFrames/Resources/manatexture.tga")
        tmana:SetMouseVisible(false)
        
                      
                
        tPlayerName = Turbine.UI.Label();
        tPlayerName:SetParent(TPowerManaFrame);
        tPlayerName:SetPosition(5, 6)
        if (lPlayer:GetTarget()) ~= nil then
        tPlayerName:SetText(lPlayer:GetTarget():GetName())
    end
        tPlayerName:SetMouseVisible(false)
        
        tMoraleLabel = Turbine.UI.Label()
        tMoraleLabel:SetParent(TPowerManaFrame)
        tMoraleLabel:SetPosition(0, 6)
        tMoraleLabel:SetWidth(PowerManaFrame:GetWidth())
        if (lPlayer:GetTarget()) ~= nil then
        tMoraleLabel:SetText(math.floor(lPlayer:GetTarget():GetMorale()+0.5).."/"..math.floor(lPlayer:GetTarget():GetMaxMorale()+0.5))
    end
        tMoraleLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        tMoraleLabel:SetMouseVisible(false)
        
        tMoralePercentageLabel = Turbine.UI.Label()
        tMoralePercentageLabel:SetParent(TPowerManaFrame)
        tMoralePercentageLabel:SetPosition(-7, 6)
        tMoralePercentageLabel:SetWidth(TPowerManaFrame:GetWidth())
        if (lPlayer:GetTarget()) ~= nil then
        tMoralePercentageLabel:SetText(lPlayer:GetTarget():GetMorale()*100/lPlayer:GetTarget():GetMaxMorale().."%")
    end
        tMoralePercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        tMoralePercentageLabel:SetMouseVisible(false)
        
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
        tPowerLabel = Turbine.UI.Label()
        tPowerLabel:SetParent(TPowerManaFrame)
        tPowerLabel:SetPosition(0, 32)
        tPowerLabel:SetWidth(TPowerManaFrame:GetWidth())
        if (lPlayer:GetTarget()) ~= nil then
        tPowerLabel:SetText(math.floor(lPlayer:GetTarget():GetPower()+0.5).."/"..math.floor(lPlayer:GetTarget():GetMaxPower()+0.5))
    end
        tPowerLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        tPowerLabel:SetMouseVisible(false)
        
        tPowerPercentageLabel = Turbine.UI.Label()
        tPowerPercentageLabel:SetParent(TPowerManaFrame)
        tPowerPercentageLabel:SetPosition(-7, 32)
        tPowerPercentageLabel:SetWidth(TPowerManaFrame:GetWidth())
        if (lPlayer:GetTarget()) ~= nil then
        tPowerPercentageLabel:SetText(lPlayer:GetTarget():GetPower()*100/lPlayer:GetTarget():GetMaxPower().."%")
    end
        tPowerPercentageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.TopRight);
        tPowerPercentageLabel:SetMouseVisible(false)
        
       --[[
       I don't know why, but when Target equals LocalPlayer, EventHandler at LocalPlayer stops working. I know this looks terrible, but I managed
       a workaround - if Target equals LocalPlayer, I'm using Target's EventHandler to update Player's hp and mana.
       ]]
       
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
end
