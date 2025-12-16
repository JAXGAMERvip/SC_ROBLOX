--========================================================--
--====================  BLOODIX V5 EDU FINAL =============--
--==========================================================

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- CONFIGURATION
local INSTITUTIONAL_MODE = true
local GUI_VISIBLE = true

-- STATE
local ESPSettings = { Enabled=false, Line=false, Box=false, Box3D=false, Name=false, Health=false, Distance=false, Skeleton=false, Tracer=false, Weapon=false, Time=false, MaxDistance=1000 }
local PlayerSettings = { Speed=16, JumpPower=50, SpeedOn=false, JumpOn=false, NoClip=false, Fly=false, Swim=false, GiantMode=false }
local AimSettings = { Enabled=false, FOV=120, Smooth=0.25, TargetMethod="ClosestDistance", Priority="Head", VisibleCheck=true, ShowFOV=true, TeamCheck=true, Prediction=0.15, Smoothness=8 }
local HeadSizeSettings = { Enabled=false, Size=5 }
local NewFeatures = { RainbowMode=false, AutoFarm=false, KillAura=false, AntiAFK=false, XRay=false, RainbowSpeed=0.5, FreezeAll=false, CharacterSize=1, LoopBringAll=false, RemoveTextures=false }
local InnovativeFeatures = { TimeManipulation=false, GhostMode=false, TeleportTrail=false, AutoDodge=false, ShieldBubble=false, SpeedLines=false, DoubleJump=false, WallRun=false, AirDash=false, MagnetMode=false }
local ClassicFeatures = { InfiniteJump=false, GodMode=false, RemoveFog=false, Fullbright=false, ClickTP=false, SpinBot=false, Bunnyhop=false, AutoSprint=false, NoFall=false, FastLadder=false, SwimSpeed=false, InstantRespawn=false, FreeCam=false, ThirdPerson=false, FOVChanger=false, FOVValue=70 }
local CombatFeatures = { AutoParry=false, AutoBlock=false, ComboAttack=false, CriticalHit=false, LifeSteal=false, Knockback=false, RapidFire=false, InfiniteAmmo=false, NoRecoil=false, AutoReload=false, ExplosiveBullets=false, Aimlock=false, SilentAim=false }
local MovementFeatures = { SuperSpeed=false, SpeedValue=100, TeleportDash=false, PhaseWalk=false, AntiGravity=false, WaterWalk=false, LavaWalk=false, ClimbAnything=false, InfiniteStamina=false, AutoParkour=false, SlideBoost=false, LongJump=false }
local UtilityFeatures = { ESPItems=false, ESPChests=false, AutoCollect=false, AutoQuest=false, AutoSell=false, AutoCraft=false, TeleportToNPC=false, SpeedHack=false, NoClipWalls=false, InfiniteZoom=false, Xray=false, Radar=false }
local TrollFeatures = { FlingPlayers=false, OrbitPlayers=false, AttachToPlayer=false, MirrorPlayer=false, InvisibleChar=false, GiantChar=false, TinyChar=false, RainbowChar=false, SpinChar=false, VibrateChar=false, FlashChar=false, GlitchChar=false, CloneChar=false }
local GodModeConnection = nil
local Drawn = { lines={}, boxes={}, nameTexts={}, healthTexts={}, fovCircle=nil, targetIndicator=nil }
local ModifiedHeads = {}

-- HELPER FUNCTIONS 
local function clamp(v,a,b) if v<a then return a elseif v>b then return b else return v end end
local function isEnemy(p) if not p or p==LocalPlayer then return false end if p.Team and LocalPlayer.Team then return p.Team~=LocalPlayer.Team end return true end
local function worldToScreen(pos) local p,onScreen=Camera:WorldToViewportPoint(pos) return Vector2.new(p.X,p.Y),onScreen end

--========================================================--
--===============  TEXT DRAWING AT TOP  ==================--
local topText = Drawing.new("Text")
topText.Visible = true
topText.Text = "🔥 BLOODIX V6 - Press Panel"
topText.Color = Color3.new(1, 0, 0)
topText.Size = 18
topText.Center = true
topText.Outline = true
topText.OutlineColor = Color3.new(0, 0, 0)
topText.Position = Vector2.new(Camera.ViewportSize.X/2, 10)

Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    topText.Position = Vector2.new(Camera.ViewportSize.X/2, 10)
end)

--========================================================--
--=======================  GUI SETUP  ====================--
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "BLOODIX_V5_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 2147483647
ScreenGui.IgnoreGuiInset = true

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 720, 0, 580)
Main.Position = UDim2.new(0.5, -360, 0.5, -290)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ZIndex = 100999999
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(100, 100, 255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.5

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,50)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
Title.Text = "🔥 BLOODIX V5 — Educational Panel"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 12)

local TitleGradient = Instance.new("UIGradient", Title)
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 255))
}
TitleGradient.Rotation = 45

local CloseButton = Instance.new("TextButton", Title)
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner", CloseButton)
CloseCorner.CornerRadius = UDim.new(0, 8)

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
end)

CloseButton.MouseButton1Click:Connect(function()
    Main.Visible = false
    GUI_VISIBLE = false
end)

-- TABS
local TabsFrame = Instance.new("Frame", Main)
TabsFrame.Size = UDim2.new(0,180,1,-50)
TabsFrame.Position = UDim2.new(0,0,0,50)
TabsFrame.BackgroundColor3 = Color3.fromRGB(25,25,30)
TabsFrame.BorderSizePixel = 0

local PagesFrame = Instance.new("Frame", Main)
PagesFrame.Size = UDim2.new(1,-180,1,-50)
PagesFrame.Position = UDim2.new(0,180,0,50)
PagesFrame.BackgroundColor3 = Color3.fromRGB(30,30,35)
PagesFrame.BorderSizePixel = 0

local function MakeTab(name,order)
    local b = Instance.new("TextButton", TabsFrame)
    b.Size = UDim2.new(1,0,0,40)
    b.Position = UDim2.new(0,0,0,(order-1)*40)
    b.Text = name
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(40,40,42)
    b.TextColor3 = Color3.new(1,1,1)
    return b
end

local function MakePage()
    local p = Instance.new("ScrollingFrame", PagesFrame)
    p.Size = UDim2.new(1,0,1,0)
    p.BackgroundTransparency = 1
    p.BorderSizePixel = 0
    p.ScrollBarThickness = 6
    p.CanvasSize = UDim2.new(0, 0, 0, 1200)
    p.Visible = false
    p.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 255)
    return p
end

local TabsScroll = Instance.new("ScrollingFrame", TabsFrame)
TabsScroll.Size = UDim2.new(1, 0, 1, 0)
TabsScroll.BackgroundTransparency = 1
TabsScroll.BorderSizePixel = 0
TabsScroll.ScrollBarThickness = 4
TabsScroll.CanvasSize = UDim2.new(0, 0, 0, 600)

local function MakeTabScroll(name,order)
    local b = Instance.new("TextButton", TabsScroll)
    b.Size = UDim2.new(1,-8,0,38)
    b.Position = UDim2.new(0,4,0,(order-1)*42)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.RichText = true
    b.TextScaled = false
    b.BackgroundColor3 = Color3.fromRGB(45,45,55)
    b.TextColor3 = Color3.new(0.9,0.9,0.9)
    b.BorderSizePixel = 0
    b.TextWrapped = false
    
    local corner = Instance.new("UICorner", b)
    corner.CornerRadius = UDim.new(0, 8)
    
    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
        b.TextColor3 = Color3.new(1,1,1)
    end)
    
    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = Color3.fromRGB(45,45,55)
        b.TextColor3 = Color3.new(0.9,0.9,0.9)
    end)
    
    return b
end

local tabAimbot = MakeTabScroll("🎯 AIMBOT",1)
local tabESP = MakeTabScroll("👁️ ESP",2)
local tabPlayer = MakeTabScroll("👤 PLAYER",3)
local tabEmotes = MakeTabScroll("💃 EMOTES",4)
local tabTP = MakeTabScroll("📍 TELEPORT",5)
local tabHack = MakeTabScroll("🛠️ HACK",6)
local tabExtra = MakeTabScroll("✨ EXTRA",7)
local tabInnovative = MakeTabScroll("🚀 INNOVATIVE",8)
local tabClassic = MakeTabScroll("🎮 CLASSIC",9)
local tabVisual = MakeTabScroll("👁️ VISUAL",10)
local tabCombat = MakeTabScroll("⚔️ COMBAT",11)
local tabMovement = MakeTabScroll("🏃 MOVEMENT",12)
local tabUtility = MakeTabScroll("🔧 UTILITY",13)
local tabTroll = MakeTabScroll("😈 TROLL",14)

local pageAimbot = MakePage()
local pageESP = MakePage()
local pagePlayer = MakePage()
local pageEmotes = MakePage()
local pageTP = MakePage()
local pageHack = MakePage()
local pageExtra = MakePage()
local pageInnovative = MakePage()
local pageClassic = MakePage()
local pageVisual = MakePage()
local pageCombat = MakePage()
local pageMovement = MakePage()
local pageUtility = MakePage()
local pageTroll = MakePage()

pageAimbot.Visible = true

local currentPage = pageAimbot
local tabMap = { [tabAimbot]=pageAimbot, [tabESP]=pageESP, [tabPlayer]=pagePlayer, [tabEmotes]=pageEmotes, [tabTP]=pageTP, [tabHack]=pageHack, [tabExtra]=pageExtra, [tabInnovative]=pageInnovative, [tabClassic]=pageClassic, [tabVisual]=pageVisual, [tabCombat]=pageCombat, [tabMovement]=pageMovement, [tabUtility]=pageUtility, [tabTroll]=pageTroll }
for tab,page in pairs(tabMap) do
    tab.MouseButton1Click:Connect(function() 
        if currentPage then currentPage.Visible=false end 
        page.Visible=true 
        currentPage=page 
    end)
end

-- UI HELPERS
local function AddLabel(parent,text,y)
    local lbl=Instance.new("TextLabel",parent)
    lbl.Size=UDim2.new(0,520,0,22)
    lbl.Position=UDim2.new(0,10,0,y)
    lbl.BackgroundTransparency=1
    lbl.Text=text
    lbl.TextColor3=Color3.new(1,1,1)
    lbl.Font=Enum.Font.Gotham
    lbl.TextSize=14
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    return lbl
end

local function AddToggle(parent,label,y,initial,callback)
    local btn=Instance.new("TextButton",parent)
    btn.Size=UDim2.new(0,200,0,35)
    btn.Position=UDim2.new(0,15,0,y)
    btn.Text=label..": "..(initial and "✓ ON" or "✗ OFF")
    btn.Font=Enum.Font.GothamBold
    btn.TextSize=14
    btn.BorderSizePixel = 0
    local state=initial
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    
    local function updateButton()
        btn.Text=label..": "..(state and "✓ ON" or "✗ OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(60, 180, 80) or Color3.fromRGB(70, 70, 85)
        btn.TextColor3 = Color3.new(1,1,1)
    end
    
    btn.MouseButton1Click:Connect(function() 
        state=not state
        updateButton()
        if callback then callback(state) end 
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = state and Color3.fromRGB(70, 200, 90) or Color3.fromRGB(90, 90, 110)
    end)
    
    btn.MouseLeave:Connect(function()
        updateButton()
    end)
    
    updateButton()
    return btn
end

local function AddSlider(parent, label, y, minV, maxV, initial, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0, 440, 0, 40)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0, 180, 0, 20)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label .. ": " .. tostring(initial)
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 14
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local track = Instance.new("Frame", frame)
    track.Size = UDim2.new(0, 300, 0, 8)
    track.Position = UDim2.new(0, 0, 0, 25)
    track.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    track.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner", track)
    trackCorner.CornerRadius = UDim.new(0, 4)
    
    local fill = Instance.new("Frame", track)
    fill.Size = UDim2.new((initial - minV) / (maxV - minV), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    fill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner", fill)
    fillCorner.CornerRadius = UDim.new(0, 4)
    
    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 16, 0, 20)
    knob.Position = UDim2.new(fill.Size.X.Scale - 0.03, 0, 0, -6)
    knob.BackgroundColor3 = Color3.fromRGB(150, 150, 255)
    knob.BorderSizePixel = 0
    
    local knobCorner = Instance.new("UICorner", knob)
    knobCorner.CornerRadius = UDim.new(0, 8)
    
    local dragging = false
    local function updateSlider(x)
        local relativeX = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(relativeX, 0, 1, 0)
        knob.Position = UDim2.new(relativeX - 0.03, 0, 0, -5)
        
        local value = minV + relativeX * (maxV - minV)
        value = math.floor(value * 100) / 100
        
        lbl.Text = label .. ": " .. tostring(value)
        if callback then callback(value) end
    end
    
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    knob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(input.Position.X)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input.Position.X)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return {label = lbl, track = track, fill = fill, knob = knob}
end

--========================================================--
--=======================  AIMBOT  =======================--
AddLabel(pageAimbot,"🎯 AIMBOT SETTINGS - نظام تصويب محسّن",8)

local togAim = AddToggle(pageAimbot,"Enable Aimbot",36,false,function(s) 
    AimSettings.Enabled = s 
end)

AddToggle(pageAimbot,"Show FOV Circle",76,true,function(s) 
    AimSettings.ShowFOV = s 
    if Drawn.fovCircle then
        Drawn.fovCircle.Visible = s and AimSettings.Enabled
    end
end)

AddToggle(pageAimbot,"Team Check (أعداء فقط)",116,true,function(s) 
    AimSettings.TeamCheck = s 
end)

AddToggle(pageAimbot,"Visibility Check",156,true,function(s) 
    AimSettings.VisibleCheck = s 
end)

local sliderFOV = AddSlider(pageAimbot, "FOV Size", 196, 20, 600, AimSettings.FOV, function(v) 
    AimSettings.FOV = v 
end)

local sliderSmooth = AddSlider(pageAimbot, "Smoothness Level", 246, 1, 20, AimSettings.Smoothness, function(v) 
    AimSettings.Smoothness = v 
end)

local sliderPrediction = AddSlider(pageAimbot, "Prediction", 296, 0, 0.5, AimSettings.Prediction, function(v) 
    AimSettings.Prediction = v 
end)

AddLabel(pageAimbot,"Target Priority:",346)

local btnHead = Instance.new("TextButton",pageAimbot)
btnHead.Size = UDim2.new(0,100,0,30)
btnHead.Position = UDim2.new(0,10,0,376)
btnHead.Text = "Head"
btnHead.BackgroundColor3 = Color3.fromRGB(100,100,180)
btnHead.TextColor3 = Color3.new(1,1,1)
btnHead.Font = Enum.Font.GothamBold
btnHead.TextSize = 12
local headCorner = Instance.new("UICorner", btnHead)
headCorner.CornerRadius = UDim.new(0, 6)
btnHead.MouseButton1Click:Connect(function() 
    AimSettings.Priority = "Head"
    btnHead.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnTorso.BackgroundColor3 = Color3.fromRGB(60,60,80)
    btnHRP.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local btnTorso = Instance.new("TextButton",pageAimbot)
btnTorso.Size = UDim2.new(0,100,0,30)
btnTorso.Position = UDim2.new(0,120,0,376)
btnTorso.Text = "Torso"
btnTorso.BackgroundColor3 = Color3.fromRGB(60,60,80)
btnTorso.TextColor3 = Color3.new(1,1,1)
btnTorso.Font = Enum.Font.GothamBold
btnTorso.TextSize = 12
local torsoCorner = Instance.new("UICorner", btnTorso)
torsoCorner.CornerRadius = UDim.new(0, 6)
btnTorso.MouseButton1Click:Connect(function() 
    AimSettings.Priority = "Torso"
    btnHead.BackgroundColor3 = Color3.fromRGB(60,60,80)
    btnTorso.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnHRP.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local btnHRP = Instance.new("TextButton",pageAimbot)
btnHRP.Size = UDim2.new(0,100,0,30)
btnHRP.Position = UDim2.new(0,230,0,376)
btnHRP.Text = "HRP"
btnHRP.BackgroundColor3 = Color3.fromRGB(60,60,80)
btnHRP.TextColor3 = Color3.new(1,1,1)
btnHRP.Font = Enum.Font.GothamBold
btnHRP.TextSize = 12
local hrpCorner = Instance.new("UICorner", btnHRP)
hrpCorner.CornerRadius = UDim.new(0, 6)
btnHRP.MouseButton1Click:Connect(function() 
    AimSettings.Priority = "HumanoidRootPart"
    btnHead.BackgroundColor3 = Color3.fromRGB(60,60,80)
    btnTorso.BackgroundColor3 = Color3.fromRGB(60,60,80)
    btnHRP.BackgroundColor3 = Color3.fromRGB(100,100,180)
end)

AddLabel(pageAimbot,"Target Method:",416)

local btnDist = Instance.new("TextButton",pageAimbot)
btnDist.Size = UDim2.new(0,150,0,30)
btnDist.Position = UDim2.new(0,10,0,446)
btnDist.Text = "Closest Distance"
btnDist.BackgroundColor3 = Color3.fromRGB(100,100,180)
btnDist.TextColor3 = Color3.new(1,1,1)
btnDist.Font = Enum.Font.GothamBold
btnDist.TextSize = 12
local distCorner = Instance.new("UICorner", btnDist)
distCorner.CornerRadius = UDim.new(0, 6)
btnDist.MouseButton1Click:Connect(function() 
    AimSettings.TargetMethod = "ClosestDistance" 
    btnDist.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnScreen.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local btnScreen = Instance.new("TextButton",pageAimbot)
btnScreen.Size = UDim2.new(0,150,0,30)
btnScreen.Position = UDim2.new(0,170,0,446)
btnScreen.Text = "Closest to Crosshair"
btnScreen.BackgroundColor3 = Color3.fromRGB(60,60,80)
btnScreen.TextColor3 = Color3.new(1,1,1)
btnScreen.Font = Enum.Font.GothamBold
btnScreen.TextSize = 12
local screenCorner = Instance.new("UICorner", btnScreen)
screenCorner.CornerRadius = UDim.new(0, 6)
btnScreen.MouseButton1Click:Connect(function() 
    AimSettings.TargetMethod = "ClosestScreen" 
    btnScreen.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnDist.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

AddLabel(pageAimbot,"💡 Hold Right Mouse Button to Aim",486)
AddLabel(pageAimbot,"🎯 FOV Circle shows targeting area",516)

local aimHeld = false
UserInputService.InputBegan:Connect(function(input) 
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        aimHeld = true 
    end 
end)

UserInputService.InputEnded:Connect(function(input) 
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        aimHeld = false 
    end 
end)

Drawn.fovCircle = Drawing.new("Circle")
Drawn.fovCircle.Thickness = 2
Drawn.fovCircle.NumSides = 64
Drawn.fovCircle.Radius = AimSettings.FOV
Drawn.fovCircle.Filled = false
Drawn.fovCircle.Color = Color3.fromRGB(255, 255, 255)
Drawn.fovCircle.Transparency = 0.8
Drawn.fovCircle.Visible = false
Drawn.fovCircle.ZIndex = 999

Drawn.targetIndicator = Drawing.new("Circle")
Drawn.targetIndicator.Thickness = 3
Drawn.targetIndicator.NumSides = 32
Drawn.targetIndicator.Radius = 15
Drawn.targetIndicator.Filled = false
Drawn.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
Drawn.targetIndicator.Transparency = 1
Drawn.targetIndicator.Visible = false
Drawn.targetIndicator.ZIndex = 999

local function findAimTarget()
    local best,bestScore = nil, math.huge
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character.Parent then
            if AimSettings.TeamCheck and not isEnemy(p) then
                continue
            end
            
            local primary = p.Character:FindFirstChild(AimSettings.Priority) or p.Character:FindFirstChild("HumanoidRootPart")
            if primary then
                local pos = primary.Position
                
                if AimSettings.Prediction > 0 and primary.Parent:FindFirstChild("Humanoid") then
                    local velocity = primary.Velocity
                    pos = pos + (velocity * AimSettings.Prediction)
                end
                
                local screenPos, onScreen = worldToScreen(pos)
                
                if AimSettings.VisibleCheck then
                    local ray = Ray.new(Camera.CFrame.Position, (pos - Camera.CFrame.Position).Unit * 1000)
                    local hitPart = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, Camera})
                    if hitPart and not hitPart:IsDescendantOf(p.Character) then
                        continue
                    end
                end
                
                if not onScreen then continue end
                
                local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                local distanceFromCenter = (screenPos - center).Magnitude
                
                if distanceFromCenter > AimSettings.FOV then continue end
                
                if AimSettings.TargetMethod == "ClosestDistance" then
                    local d = (Camera.CFrame.Position - pos).Magnitude
                    if d < bestScore then 
                        best = {player = p, part = primary, pos = pos, screenPos = screenPos}
                        bestScore = d 
                    end
                else
                    if distanceFromCenter < bestScore then 
                        best = {player = p, part = primary, pos = pos, screenPos = screenPos}
                        bestScore = distanceFromCenter
                    end
                end
            end
        end
    end
    return best
end

RunService.RenderStepped:Connect(function(dt)
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    Drawn.fovCircle.Position = center
    Drawn.fovCircle.Radius = AimSettings.FOV
    Drawn.fovCircle.Visible = AimSettings.Enabled and AimSettings.ShowFOV
    
    if AimSettings.Enabled and aimHeld then
        local t = findAimTarget()
        if t then
            Drawn.targetIndicator.Position = t.screenPos
            Drawn.targetIndicator.Visible = true
            Drawn.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
            
            local camPos = Camera.CFrame.Position
            local targetPos = t.pos
            local direction = (targetPos - camPos).Unit
            local targetCFrame = CFrame.new(camPos, camPos + direction)
            
            local smoothFactor = 1 / AimSettings.Smoothness
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, smoothFactor)
        else
            Drawn.targetIndicator.Visible = false
        end
    else
        Drawn.targetIndicator.Visible = false
    end
end)

--========================================================--
--=======================  ESP SYSTEM ====================--
local function createESP(player)
    if not Drawn.lines[player] then 
        Drawn.lines[player] = Drawing.new("Line")
        Drawn.lines[player].Thickness = 2
        Drawn.lines[player].Color = Color3.new(0, 1, 0)
        Drawn.lines[player].Visible = false
    end
    if not Drawn.boxes[player] then 
        Drawn.boxes[player] = Drawing.new("Square")
        Drawn.boxes[player].Filled = false
        Drawn.boxes[player].Thickness = 1
        Drawn.boxes[player].Color = Color3.new(1, 0, 0)
        Drawn.boxes[player].Visible = false
    end
    if not Drawn.nameTexts[player] then 
        Drawn.nameTexts[player] = Drawing.new("Text")
        Drawn.nameTexts[player].Size = 14
        Drawn.nameTexts[player].Color = Color3.new(1, 1, 1)
        Drawn.nameTexts[player].Outline = true
        Drawn.nameTexts[player].Visible = false
    end
    if not Drawn.healthTexts[player] then 
        Drawn.healthTexts[player] = Drawing.new("Text")
        Drawn.healthTexts[player].Size = 14
        Drawn.healthTexts[player].Color = Color3.new(1, 1, 1)
        Drawn.healthTexts[player].Outline = true
        Drawn.healthTexts[player].Visible = false
    end
    
    if not Drawn.distanceTexts then Drawn.distanceTexts = {} end
    if not Drawn.distanceTexts[player] then
        Drawn.distanceTexts[player] = Drawing.new("Text")
        Drawn.distanceTexts[player].Size = 13
        Drawn.distanceTexts[player].Color = Color3.new(0.7, 0.7, 1)
        Drawn.distanceTexts[player].Outline = true
        Drawn.distanceTexts[player].Visible = false
    end
    
    if not Drawn.weaponTexts then Drawn.weaponTexts = {} end
    if not Drawn.weaponTexts[player] then
        Drawn.weaponTexts[player] = Drawing.new("Text")
        Drawn.weaponTexts[player].Size = 12
        Drawn.weaponTexts[player].Color = Color3.new(1, 1, 0)
        Drawn.weaponTexts[player].Outline = true
        Drawn.weaponTexts[player].Visible = false
    end
    
    if not Drawn.timeTexts then Drawn.timeTexts = {} end
    if not Drawn.timeTexts[player] then
        Drawn.timeTexts[player] = Drawing.new("Text")
        Drawn.timeTexts[player].Size = 12
        Drawn.timeTexts[player].Color = Color3.new(0.5, 1, 0.5)
        Drawn.timeTexts[player].Outline = true
        Drawn.timeTexts[player].Visible = false
    end
    
    if not Drawn.skeletons then Drawn.skeletons = {} end
    if not Drawn.skeletons[player] then
        Drawn.skeletons[player] = {}
        for i = 1, 15 do
            Drawn.skeletons[player][i] = Drawing.new("Line")
            Drawn.skeletons[player][i].Thickness = 1.5
            Drawn.skeletons[player][i].Color = Color3.new(1, 1, 1)
            Drawn.skeletons[player][i].Visible = false
        end
    end
    
    if not Drawn.tracers then Drawn.tracers = {} end
    if not Drawn.tracers[player] then
        Drawn.tracers[player] = Drawing.new("Line")
        Drawn.tracers[player].Thickness = 1
        Drawn.tracers[player].Color = Color3.new(0, 1, 1)
        Drawn.tracers[player].Visible = false
    end
end

for _, player in pairs(Players:GetPlayers()) do 
    if player ~= LocalPlayer then 
        createESP(player)
    end 
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then 
        createESP(player)
        
        player.CharacterAdded:Connect(function()
            if player ~= LocalPlayer then
                task.wait(0.5)
                createESP(player)
            end
        end)
    end 
end)

Players.PlayerRemoving:Connect(function(player)
    if Drawn.lines[player] then Drawn.lines[player]:Remove(); Drawn.lines[player] = nil end
    if Drawn.boxes[player] then Drawn.boxes[player]:Remove(); Drawn.boxes[player] = nil end
    if Drawn.nameTexts[player] then Drawn.nameTexts[player]:Remove(); Drawn.nameTexts[player] = nil end
    if Drawn.healthTexts[player] then Drawn.healthTexts[player]:Remove(); Drawn.healthTexts[player] = nil end
    ModifiedHeads[player] = nil
end)

local function updateESPForPlayer(player, drawings)
    if not player or not player.Parent or player == LocalPlayer then return end
    
    local success, err = pcall(function()
        local character = player.Character
        if not ESPSettings.Enabled or not character or not character.Parent then
            if drawings.line then drawings.line.Visible = false end
            if drawings.box then drawings.box.Visible = false end
            if drawings.name then drawings.name.Visible = false end
            if drawings.health then drawings.health.Visible = false end
            return
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        local humanoid = character:FindFirstChild("Humanoid")
        
        if not humanoidRootPart then 
            if drawings.line then drawings.line.Visible = false end
            if drawings.box then drawings.box.Visible = false end
            if drawings.name then drawings.name.Visible = false end
            if drawings.health then drawings.health.Visible = false end
            return 
        end
        
        local distance = (Camera.CFrame.Position - humanoidRootPart.Position).Magnitude
        if distance > ESPSettings.MaxDistance then
            if drawings.line then drawings.line.Visible = false end
            if drawings.box then drawings.box.Visible = false end
            if drawings.name then drawings.name.Visible = false end
            if drawings.health then drawings.health.Visible = false end
            return
        end
        
        local screenPos, onScreen = worldToScreen(humanoidRootPart.Position)
        
        if ESPSettings.Line and drawings.line then
            drawings.line.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
            drawings.line.To = Vector2.new(screenPos.X, screenPos.Y)
            drawings.line.Visible = onScreen
            drawings.line.Color = onScreen and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
            drawings.line.Transparency = 1
        elseif drawings.line then
            draw
