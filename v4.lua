--========================================================--
--====================  BLOODIX V6 ULTIMATE =============--
--==========================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

print("Bloodix: Starting initialization...")

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait(0.1)
    LocalPlayer = Players.LocalPlayer
end

local function getCamera()
    return workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera")
end

-- CONFIGURATION
local INSTITUTIONAL_MODE = true
local GUI_VISIBLE = true

-- STATE
local ESPSettings = { 
    Enabled=false, Line=false, Box=false, Box3D=false, Name=false, Health=false, Distance=false, 
    Skeleton=false, Tracer=false, Weapon=false, Time=false, MaxDistance=1000, TeamCheck=false,
    Chams=false, ChamsFill=0.5, ChamsOutline=0,
    Colors = {
        Line = Color3.new(0, 1, 0),
        Box = Color3.new(1, 0, 0),
        Name = Color3.new(1, 1, 1),
        Health = Color3.new(1, 1, 1),
        Distance = Color3.new(1, 1, 1),
        Tracer = Color3.new(0, 1, 1),
        Skeleton = Color3.new(1, 1, 1),
        Weapon = Color3.new(1, 1, 0),
        Time = Color3.new(0.5, 1, 0.5),
        Chams = Color3.fromRGB(255, 0, 0)
    }
}
local PlayerSettings = { Speed=16, JumpPower=50, SpeedOn=false, JumpOn=false, NoClip=false, Fly=false, Swim=false, GiantMode=false }
local AimSettings = { Enabled=false, FOV=120, Smooth=0.25, TargetMethod="ClosestDistance", Priority="Head", VisibleCheck=true, ShowFOV=true, TeamCheck=true, Prediction=0.15, Smoothness=8 }
local HeadSizeSettings = { Enabled=false, Size=5 }
local NewFeatures = { RainbowMode=false, AutoFarm=false, KillAura=false, AntiAFK=false, XRay=false, RainbowSpeed=0.5, FreezeAll=false, CharacterSize=1, LoopBringAll=false, RemoveTextures=false }
local InnovativeFeatures = { TimeManipulation=false, GhostMode=false, TeleportTrail=false, AutoDodge=false, ShieldBubble=false, SpeedLines=false, DoubleJump=false, WallRun=false, AirDash=false, MagnetMode=false }
local ClassicFeatures = { InfiniteJump=false, GodMode=false, RemoveFog=false, Fullbright=false, ClickTP=false, SpinBot=false, Bunnyhop=false, AutoSprint=false, NoFall=false, FastLadder=false, SwimSpeed=false, InstantRespawn=false, FreeCam=false, ThirdPerson=false }
local CombatFeatures = { AutoParry=false, AutoBlock=false, ComboAttack=false, CriticalHit=false, LifeSteal=false, Knockback=false, RapidFire=false, InfiniteAmmo=false, NoRecoil=false, AutoReload=false, ExplosiveBullets=false, Aimlock=false, SilentAim=false }
local MovementFeatures = { SuperSpeed=false, SpeedValue=100, TeleportDash=false, PhaseWalk=false, AntiGravity=false, WaterWalk=false, LavaWalk=false, ClimbAnything=false, InfiniteStamina=false, AutoParkour=false, SlideBoost=false, LongJump=false }
local UtilityFeatures = { ESPItems=false, ESPChests=false, AutoCollect=false, AutoQuest=false, AutoSell=false, AutoCraft=false, TeleportToNPC=false, SpeedHack=false, NoClipWalls=false, InfiniteZoom=false, Xray=false, Radar=false, ServerHopper=false, Rejoin=false, AntiAFK=false, LocalWear=false, WearID=0, AutoProximity=false, TeleportCollect=false, FakeMoneyValue=0, AntiVoid=false }
local TrollFeatures = { FlingPlayers=false, OrbitPlayers=false, AttachToPlayer=false, MirrorPlayer=false, InvisibleChar=false, GiantChar=false, TinyChar=false, RainbowChar=false, SpinChar=false, VibrateChar=false, FlashChar=false, GlitchChar=false, CloneChar=false, CarryPlayer=false, RidePlayer=false, AttachPlayer=false, HugPlayer=false, RideDistance=3, AttachHeight=0, SelectedPlayer="", FollowPlayer=false, FreezePlayer=false }
local GodModeConnection = nil
local Drawn = { lines={}, boxes={}, nameTexts={}, healthTexts={}, distanceTexts={}, weaponTexts={}, timeTexts={}, skeletons={}, tracers={}, fovCircle=nil, targetIndicator=nil }
local ModifiedHeads = {}

-- HELPER FUNCTIONS 
local function clamp(v,a,b) if v<a then return a elseif v>b then return b else return v end end
local function isEnemy(p) if not p or p==LocalPlayer then return false end if p.Team and LocalPlayer.Team then return p.Team~=LocalPlayer.Team end return true end

local function worldToScreen(pos) 
    local cam = getCamera()
    if not cam then return Vector2.new(0,0), false, 0 end
    local p, onScreen = cam:WorldToViewportPoint(pos) 
    return Vector2.new(p.X, p.Y), onScreen, p.Z 
end

-- NOTIFICATION SYSTEM - نظام الإشعارات المحسّن
local cachedParentGui = nil
local function getParentGui()
    if cachedParentGui then return cachedParentGui end
    
    local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
    if success and coreGui then
        local success2, hui = pcall(function() return gethui() end)
        if success2 and hui then 
            cachedParentGui = hui
            return hui 
        end
        cachedParentGui = coreGui
        return coreGui
    end
    
    cachedParentGui = LocalPlayer:WaitForChild("PlayerGui", 10)
    return cachedParentGui
end

local function showNotification(title, text, duration)
    duration = duration or 3
    
    local notif = Instance.new("ScreenGui", getParentGui())
    notif.Name = "Notification_" .. tick()
    notif.DisplayOrder = 2147483647
    notif.IgnoreGuiInset = true
    notif.ResetOnSpawn = false
    
    local frame = Instance.new("Frame", notif)
    frame.Size = UDim2.new(0, 320, 0, 90)
    frame.Position = UDim2.new(1, -340, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 12)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(100, 150, 255)
    stroke.Thickness = 2
    stroke.Transparency = 0.3
    
    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, -20, 0, 28)
    titleLabel.Position = UDim2.new(0, 10, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "🔥 " .. title
    titleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -20, 0, 45)
    textLabel.Position = UDim2.new(0, 10, 0, 38)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.new(0.95, 0.95, 0.95)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 13
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    
    frame:TweenPosition(UDim2.new(1, -340, 0, 20), "Out", "Quad", 0.4, true)
    
    task.delay(duration, function()
        frame:TweenPosition(UDim2.new(1, 20, 0, 20), "In", "Quad", 0.4, true)
        task.wait(0.5)
        notif:Destroy()
    end)
end

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
topText.Position = Vector2.new(getCamera().ViewportSize.X/2, 10)

task.spawn(function()
    while true do
        local cam = getCamera()
        if cam then
            topText.Position = Vector2.new(cam.ViewportSize.X/2, 10)
        end
        task.wait(1)
    end
end)
 
-- STARTUP PROTECTION
local success, err = pcall(function()
    print("Bloodix: Initializing UI...")
    
    --========================================================-- 
    --=======================  ESP SYSTEM ====================--
    local ScreenGui = Instance.new("ScreenGui", getParentGui())
    ScreenGui.Name = "BLOODIX_V6_GUI"
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
Title.Text = "🔥 BLOODIX V6 — Educational Panel"
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
local tabUtility = MakeTabScroll("🔧 UTILITY",12)
local tabTroll = MakeTabScroll("😈 TROLL",13)
local tabReal = MakeTabScroll("💎 REAL HACKS",14)

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
local pageUtility = MakePage()
local pageTroll = MakePage()
local pageReal = MakePage()

pageAimbot.Visible = true

local currentPage = pageAimbot
local tabMap = { [tabAimbot]=pageAimbot, [tabESP]=pageESP, [tabPlayer]=pagePlayer, [tabEmotes]=pageEmotes, [tabTP]=pageTP, [tabHack]=pageHack, [tabExtra]=pageExtra, [tabInnovative]=pageInnovative, [tabClassic]=pageClassic, [tabVisual]=pageVisual, [tabCombat]=pageCombat, [tabUtility]=pageUtility, [tabTroll]=pageTroll, [tabReal]=pageReal }
for tab,page in pairs(tabMap) do
    tab.MouseButton1Click:Connect(function() 
        if currentPage then currentPage.Visible=false end 
        page.Visible=true 
        currentPage=page 
    end)
end

local function AddPlayerList(parent, y, callback)
    local listFrame = Instance.new("ScrollingFrame", parent)
    listFrame.Size = UDim2.new(0, 440, 0, 150)
    listFrame.Position = UDim2.new(0, 10, 0, y)
    listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    listFrame.BorderSizePixel = 0
    listFrame.ScrollBarThickness = 4
    listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local corner = Instance.new("UICorner", listFrame)
    corner.CornerRadius = UDim.new(0, 6)
    
    local layout = Instance.new("UIListLayout", listFrame)
    layout.Padding = UDim.new(0, 2)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local selectedBtn = nil
    
    local function updateList()
        for _, child in pairs(listFrame:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local btn = Instance.new("TextButton", listFrame)
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
                btn.Text = player.DisplayName .. " (@" .. player.Name .. ")"
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 12
                btn.BorderSizePixel = 0
                
                local bCorner = Instance.new("UICorner", btn)
                bCorner.CornerRadius = UDim.new(0, 4)
                
                btn.MouseButton1Click:Connect(function()
                    if selectedBtn then selectedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50) end
                    selectedBtn = btn
                    btn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
                    if callback then callback(player.Name) end
                end)
            end
        end
        listFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
    end
    
    Players.PlayerAdded:Connect(updateList)
    Players.PlayerRemoving:Connect(updateList)
    updateList()
    
    return listFrame
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

local function AddButton(parent, label, y, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200, 0, 35)
    btn.Position = UDim2.new(0, 15, 0, y)
    btn.Text = label
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(120, 120, 255)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    end)
    
    return btn
end

local function AddTextBox(parent, label, y, initial, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0, 440, 0, 40)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0, 150, 0, 35)
    lbl.Text = label
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 14
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.BackgroundTransparency = 1
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0, 250, 0, 30)
    box.Position = UDim2.new(0, 160, 0, 2)
    box.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    box.Text = tostring(initial)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    box.PlaceholderText = "Type here..."
    
    local corner = Instance.new("UICorner", box)
    corner.CornerRadius = UDim.new(0, 6)
    
    box.FocusLost:Connect(function(enterPressed)
        if callback then callback(box.Text) end
    end)
    
    return box
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

local presetColors = {
    Color3.new(1, 0, 0), -- Red
    Color3.new(0, 1, 0), -- Green
    Color3.new(0, 0, 1), -- Blue
    Color3.new(1, 1, 0), -- Yellow
    Color3.new(1, 0, 1), -- Magenta
    Color3.new(0, 1, 1), -- Cyan
    Color3.new(1, 1, 1), -- White
    Color3.new(1, 0.5, 0), -- Orange
}

local function AddColorCycle(parent, label, y, initialColor, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0, 440, 0, 36)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0, 180, 0, 36)
    lbl.Text = label
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 14
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.BackgroundTransparency = 1
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 100, 0, 26)
    btn.Position = UDim2.new(0, 190, 0, 5)
    btn.BackgroundColor3 = initialColor
    btn.Text = ""
    btn.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 4)
    
    local colorIndex = 1
    for i, color in ipairs(presetColors) do
        if math.abs(color.R - initialColor.R) < 0.01 and math.abs(color.G - initialColor.G) < 0.01 and math.abs(color.B - initialColor.B) < 0.01 then
            colorIndex = i
            break
        end
    end
    
    btn.MouseButton1Click:Connect(function()
        colorIndex = colorIndex + 1
        if colorIndex > #presetColors then colorIndex = 1 end
        local newColor = presetColors[colorIndex]
        btn.BackgroundColor3 = newColor
        if callback then callback(newColor) end
    end)
    return btn
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
                    local cam = getCamera()
                if not cam then return end
                local ray = Ray.new(cam.CFrame.Position, (pos - cam.CFrame.Position).Unit * 1000)
                local hitPart = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, cam})
                    if hitPart and not hitPart:IsDescendantOf(p.Character) then
                        continue
                    end
                end
                
                if not onScreen then continue end
                
                local cam = getCamera()
                if not cam then continue end
                local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                local distanceFromCenter = (screenPos - center).Magnitude
                
                if distanceFromCenter > AimSettings.FOV then continue end
                
                if AimSettings.TargetMethod == "ClosestDistance" then
                    local d = (cam.CFrame.Position - pos).Magnitude
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
    local cam = getCamera()
    if not cam then return end
    
    local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    Drawn.fovCircle.Position = center
    Drawn.fovCircle.Radius = AimSettings.FOV
    Drawn.fovCircle.Visible = AimSettings.Enabled and AimSettings.ShowFOV
    
    if AimSettings.Enabled and aimHeld then
        local t = findAimTarget()
        if t then
            Drawn.targetIndicator.Position = t.screenPos
            Drawn.targetIndicator.Visible = true
            Drawn.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
            
            local camPos = cam.CFrame.Position
            local targetPos = t.pos
            local direction = (targetPos - camPos).Unit
            local targetCFrame = CFrame.new(camPos, camPos + direction)
            
            local smoothFactor = 1 / AimSettings.Smoothness
            cam.CFrame = cam.CFrame:Lerp(targetCFrame, smoothFactor)
        else
            Drawn.targetIndicator.Visible = false
        end
    else
        Drawn.targetIndicator.Visible = false
    end
end)

--========================================================--
--=======================  SILENT AIM SYSTEM =============--
local function getSilentTarget()
    local bestTarget = nil
    local maxDist = AimSettings.FOV
    local cam = getCamera()
    if not cam then return nil end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and isEnemy(player) then
            local head = player.Character:FindFirstChild("Head")
            local hum = player.Character:FindFirstChild("Humanoid")
            if head and hum and hum.Health > 0 then
                local screenPos, onScreen = cam:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)).Magnitude
                    if dist < maxDist then
                        bestTarget = head
                        maxDist = dist
                    end
                end
            end
        end
    end
    return bestTarget
end

-- Hooking logic for Silent Aim (Universal attempt)
task.spawn(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if CombatFeatures.SilentAim and method == "FireServer" then
            local target = getSilentTarget()
            if target then
                -- Check for common bullet remote names
                if self.Name:lower():find("hit") or self.Name:lower():find("shoot") or self.Name:lower():find("bullet") then
                    -- Modify args to point to target
                    for i, arg in pairs(args) do
                        if typeof(arg) == "Vector3" then
                            args[i] = target.Position
                        elseif typeof(arg) == "CFrame" then
                            args[i] = CFrame.new(args[i].Position, target.Position)
                        elseif typeof(arg) == "Instance" and arg:IsA("BasePart") then
                            args[i] = target
                        end
                    end
                    return oldNamecall(self, unpack(args))
                end
            end
        end
        return oldNamecall(self, ...)
    end)
end)

--========================================================--
--=======================  ESP SYSTEM ====================--
local function createESP(player)
    if not player or player == LocalPlayer then return end
    
    if not Drawn.lines[player] then 
        Drawn.lines[player] = Drawing.new("Line")
        Drawn.lines[player].Thickness = 2
        Drawn.lines[player].Color = ESPSettings.Colors.Line
        Drawn.lines[player].Visible = false
    end
    if not Drawn.boxes[player] then 
        Drawn.boxes[player] = Drawing.new("Square")
        Drawn.boxes[player].Filled = false
        Drawn.boxes[player].Thickness = 1
        Drawn.boxes[player].Color = ESPSettings.Colors.Box
        Drawn.boxes[player].Visible = false
    end
    if not Drawn.nameTexts[player] then 
        Drawn.nameTexts[player] = Drawing.new("Text")
        Drawn.nameTexts[player].Size = 14
        Drawn.nameTexts[player].Color = ESPSettings.Colors.Name
        Drawn.nameTexts[player].Outline = true
        Drawn.nameTexts[player].Visible = false
    end
    if not Drawn.healthTexts[player] then 
        Drawn.healthTexts[player] = Drawing.new("Text")
        Drawn.healthTexts[player].Size = 14
        Drawn.healthTexts[player].Color = ESPSettings.Colors.Health
        Drawn.healthTexts[player].Outline = true
        Drawn.healthTexts[player].Visible = false
    end
    
    if not Drawn.distanceTexts[player] then
        Drawn.distanceTexts[player] = Drawing.new("Text")
        Drawn.distanceTexts[player].Size = 13
        Drawn.distanceTexts[player].Color = ESPSettings.Colors.Distance
        Drawn.distanceTexts[player].Outline = true
        Drawn.distanceTexts[player].Visible = false
    end
    
    if not Drawn.weaponTexts[player] then
        Drawn.weaponTexts[player] = Drawing.new("Text")
        Drawn.weaponTexts[player].Size = 12
        Drawn.weaponTexts[player].Color = ESPSettings.Colors.Weapon
        Drawn.weaponTexts[player].Outline = true
        Drawn.weaponTexts[player].Visible = false
    end
    
    if not Drawn.timeTexts[player] then
        Drawn.timeTexts[player] = Drawing.new("Text")
        Drawn.timeTexts[player].Size = 12
        Drawn.timeTexts[player].Color = ESPSettings.Colors.Time
        Drawn.timeTexts[player].Outline = true
        Drawn.timeTexts[player].Visible = false
    end
    
    if not Drawn.skeletons[player] then
        Drawn.skeletons[player] = {}
        for i = 1, 15 do
            Drawn.skeletons[player][i] = Drawing.new("Line")
            Drawn.skeletons[player][i].Thickness = 1.5
            Drawn.skeletons[player][i].Color = ESPSettings.Colors.Skeleton
            Drawn.skeletons[player][i].Visible = false
        end
    end
    
    if not Drawn.tracers[player] then
        Drawn.tracers[player] = Drawing.new("Line")
        Drawn.tracers[player].Thickness = 1
        Drawn.tracers[player].Color = ESPSettings.Colors.Tracer
        Drawn.tracers[player].Visible = false
    end

    -- Chams System
    local function applyChams()
        local char = player.Character
        if char then
            local highlight = char:FindFirstChild("BloodixHighlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "BloodixHighlight"
                highlight.Parent = char
            end
            highlight.Enabled = ESPSettings.Chams and ESPSettings.Enabled
            highlight.FillColor = ESPSettings.Colors.Chams
            highlight.FillTransparency = ESPSettings.ChamsFill
            highlight.OutlineTransparency = ESPSettings.ChamsOutline
            highlight.Adornee = char
        end
    end
    
    if player.Character then applyChams() end
    player.CharacterAdded:Connect(function() task.wait(0.5); applyChams() end)
end

local function setupPlayerESP(player)
    if not player or player == LocalPlayer then return end
    
    createESP(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        createESP(player)
    end)
end

for _, player in pairs(Players:GetPlayers()) do 
    setupPlayerESP(player)
end

Players.PlayerAdded:Connect(function(player)
    setupPlayerESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if Drawn.lines[player] then Drawn.lines[player]:Remove(); Drawn.lines[player] = nil end
    if Drawn.boxes[player] then Drawn.boxes[player]:Remove(); Drawn.boxes[player] = nil end
    if Drawn.nameTexts[player] then Drawn.nameTexts[player]:Remove(); Drawn.nameTexts[player] = nil end
    if Drawn.healthTexts[player] then Drawn.healthTexts[player]:Remove(); Drawn.healthTexts[player] = nil end
    if Drawn.distanceTexts[player] then Drawn.distanceTexts[player]:Remove(); Drawn.distanceTexts[player] = nil end
    if Drawn.weaponTexts[player] then Drawn.weaponTexts[player]:Remove(); Drawn.weaponTexts[player] = nil end
    if Drawn.timeTexts[player] then Drawn.timeTexts[player]:Remove(); Drawn.timeTexts[player] = nil end
    if Drawn.tracers[player] then Drawn.tracers[player]:Remove(); Drawn.tracers[player] = nil end
    if Drawn.skeletons[player] then
        for i = 1, #Drawn.skeletons[player] do
            if Drawn.skeletons[player][i] then Drawn.skeletons[player][i]:Remove() end
        end
        Drawn.skeletons[player] = nil
    end
    ModifiedHeads[player] = nil
end)

local function updateESPForPlayer(player, drawings)
    if not player or not player.Parent or player == LocalPlayer then return end
    
    local function hideAll()
        for i, d in pairs(drawings) do
            if i == "skeleton" and typeof(d) == "table" then
                for _, sd in pairs(d) do if sd then sd.Visible = false end end
            elseif d then
                pcall(function() d.Visible = false end)
            end
        end
    end

    local success, err = pcall(function()
        local character = player.Character
        if not character or not character.Parent then hideAll() return end

        if ESPSettings.TeamCheck and player.Team == LocalPlayer.Team then
            hideAll()
            return
        end

        if not ESPSettings.Enabled then
            hideAll()
            return
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        local humanoid = character:FindFirstChild("Humanoid")
        
        if not humanoidRootPart or not head then 
            hideAll()
            return 
        end
        
        local cam = workspace.CurrentCamera
        if not cam then return end
        
        local distance = (cam.CFrame.Position - humanoidRootPart.Position).Magnitude
        if distance > ESPSettings.MaxDistance then
            hideAll()
            return
        end
        
        local screenPos, onScreen, depth = worldToScreen(humanoidRootPart.Position)
        if depth <= 0 or not onScreen then
            hideAll()
            return
        end

        -- Calculate Box Dimensions
        local headPos, headOnScreen, headDepth = worldToScreen(head.Position + Vector3.new(0, 0.5, 0))
        local legPos, legOnScreen, legDepth = worldToScreen(humanoidRootPart.Position - Vector3.new(0, 3, 0))
        
        if headDepth <= 0 or legDepth <= 0 then
            hideAll()
            return
        end

        local height = math.abs(headPos.Y - legPos.Y)
        local width = height / 2
        local boxTop = headPos.Y
        local boxBottom = legPos.Y
        local boxCenterX = screenPos.X

        -- Line ESP
        if ESPSettings.Line and drawings.line then
            drawings.line.From = Vector2.new(cam.ViewportSize.X / 2, 0)
            drawings.line.To = Vector2.new(boxCenterX, boxTop)
            drawings.line.Visible = true
            drawings.line.Color = ESPSettings.Colors.Line
        elseif drawings.line then
            drawings.line.Visible = false
        end
        
        -- Box ESP
        if ESPSettings.Box and drawings.box then
            drawings.box.Position = Vector2.new(boxCenterX - width/2, boxTop)
            drawings.box.Size = Vector2.new(width, height)
            drawings.box.Visible = true
            drawings.box.Color = ESPSettings.Colors.Box
        elseif drawings.box then
            drawings.box.Visible = false
        end
        
        -- Name ESP
        if ESPSettings.Name and drawings.name then
            drawings.name.Position = Vector2.new(boxCenterX, boxTop - 15)
            drawings.name.Text = player.Name
            drawings.name.Visible = true
            drawings.name.Center = true
            drawings.name.Color = ESPSettings.Colors.Name
        elseif drawings.name then
            drawings.name.Visible = false
        end
        
        -- Health ESP
        if ESPSettings.Health and drawings.health and humanoid then
            drawings.health.Position = Vector2.new(boxCenterX, boxTop - 30)
            drawings.health.Text = "HP: " .. math.floor(humanoid.Health)
            drawings.health.Visible = true
            drawings.health.Center = true
            drawings.health.Color = ESPSettings.Colors.Health
        elseif drawings.health then
            drawings.health.Visible = false
        end
        
        -- Distance ESP
        if ESPSettings.Distance and drawings.distance then
            drawings.distance.Position = Vector2.new(boxCenterX, boxBottom + 5)
            drawings.distance.Text = "📏 " .. math.floor(distance) .. "m"
            drawings.distance.Visible = true
            drawings.distance.Center = true
            drawings.distance.Color = ESPSettings.Colors.Distance
        elseif drawings.distance then
            drawings.distance.Visible = false
        end
        
        -- Weapon ESP
        if ESPSettings.Weapon and drawings.weapon then
            local tool = character:FindFirstChildOfClass("Tool")
            drawings.weapon.Position = Vector2.new(boxCenterX, boxBottom + 20)
            drawings.weapon.Text = "🔫 " .. (tool and tool.Name or "None")
            drawings.weapon.Visible = true
            drawings.weapon.Center = true
            drawings.weapon.Color = ESPSettings.Colors.Weapon
        elseif drawings.weapon then
            drawings.weapon.Visible = false
        end
        
        -- Time ESP
        if ESPSettings.Time and drawings.time then
            drawings.time.Position = Vector2.new(boxCenterX, boxBottom + 35)
            drawings.time.Text = "⏰ " .. player.AccountAge .. " days"
            drawings.time.Visible = true
            drawings.time.Center = true
            drawings.time.Color = ESPSettings.Colors.Time
        elseif drawings.time then
            drawings.time.Visible = false
        end
        
        -- Tracer ESP
        if ESPSettings.Tracer and drawings.tracer then
            drawings.tracer.From = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y)
            drawings.tracer.To = Vector2.new(boxCenterX, boxBottom)
            drawings.tracer.Visible = true
            drawings.tracer.Color = ESPSettings.Colors.Tracer
        elseif drawings.tracer then
            drawings.tracer.Visible = false
        end
        
        -- Skeleton ESP
        if ESPSettings.Skeleton and drawings.skeleton then
            local function getPartPos(name)
                local p = character:FindFirstChild(name)
                if p then
                    local sp, os = worldToScreen(p.Position)
                    if os then return sp end
                end
                return nil
            end

            local parts = {
                Head = getPartPos("Head"),
                Torso = getPartPos("Torso") or getPartPos("UpperTorso"),
                LShoulder = getPartPos("Left Shoulder") or getPartPos("LeftUpperArm"),
                RShoulder = getPartPos("Right Shoulder") or getPartPos("RightUpperArm"),
                LElbow = getPartPos("LeftLowerArm"),
                RElbow = getPartPos("RightLowerArm"),
                LHand = getPartPos("LeftHand"),
                RHand = getPartPos("RightHand"),
                LHip = getPartPos("Left Hip") or getPartPos("LeftUpperLeg"),
                RHip = getPartPos("Right Hip") or getPartPos("RightUpperLeg"),
                LKnee = getPartPos("LeftLowerLeg"),
                RKnee = getPartPos("RightLowerLeg"),
                LFoot = getPartPos("LeftFoot"),
                RFoot = getPartPos("RightFoot")
            }

            local connections = {
                {parts.Head, parts.Torso},
                {parts.Torso, parts.LShoulder},
                {parts.Torso, parts.RShoulder},
                {parts.LShoulder, parts.LElbow},
                {parts.RShoulder, parts.RElbow},
                {parts.LElbow, parts.LHand},
                {parts.RElbow, parts.RHand},
                {parts.Torso, parts.LHip},
                {parts.Torso, parts.RHip},
                {parts.LHip, parts.LKnee},
                {parts.RHip, parts.RKnee},
                {parts.LKnee, parts.LFoot},
                {parts.RKnee, parts.RFoot}
            }

            for i, conn in ipairs(connections) do
                if drawings.skeleton[i] then
                    if conn[1] and conn[2] then
                        drawings.skeleton[i].From = conn[1]
                        drawings.skeleton[i].To = conn[2]
                        drawings.skeleton[i].Visible = true
                        drawings.skeleton[i].Color = ESPSettings.Colors.Skeleton
                    else
                        drawings.skeleton[i].Visible = false
                    end
                end
            end
        elseif drawings.skeleton then
            for i = 1, 15 do
                if drawings.skeleton[i] then drawings.skeleton[i].Visible = false end
            end
        end
    end)
    
    if not success then
        hideAll()
    end
end

RunService.RenderStepped:Connect(function()
    for player, _ in pairs(Drawn.lines) do
        if player and player.Parent and player ~= LocalPlayer then
            local espDrawings = {
                line = Drawn.lines[player],
                box = Drawn.boxes[player],
                name = Drawn.nameTexts[player],
                health = Drawn.healthTexts[player],
                distance = Drawn.distanceTexts and Drawn.distanceTexts[player],
                weapon = Drawn.weaponTexts and Drawn.weaponTexts[player],
                time = Drawn.timeTexts and Drawn.timeTexts[player],
                skeleton = Drawn.skeletons and Drawn.skeletons[player],
                tracer = Drawn.tracers and Drawn.tracers[player]
            }
            
            pcall(updateESPForPlayer, player, espDrawings)
        end
    end
end)

--========================================================--
--==============  BIG HEADS SYSTEM FIXED ================--

local function enlargeHead(player)
    if not player or player == LocalPlayer then return false end
    if not HeadSizeSettings.Enabled then return false end
    
    local character = player.Character
    if not character then return false end
    
    local head = character:FindFirstChild("Head")
    if not head or not head:IsA("BasePart") then return false end
    
    local targetSize = HeadSizeSettings.Size
    
    -- Save original properties if not already saved
    if not ModifiedHeads[player] then
        ModifiedHeads[player] = {
            OriginalSize = head.Size,
            OriginalMassless = head.Massless,
            OriginalCanCollide = head.CanCollide,
            OriginalTransparency = head.Transparency
        }
    end
    
    -- Apply big head
    pcall(function()
        head.Size = Vector3.new(targetSize, targetSize, targetSize)
        head.Massless = true
        head.CanCollide = false
        head.Transparency = 0.5
        
        -- Scale mesh if exists
        local mesh = head:FindFirstChildOfClass("SpecialMesh")
        if mesh then
            mesh.Scale = Vector3.new(targetSize/2, targetSize/2, targetSize/2)
        end
        
        -- Scale face
        local face = head:FindFirstChild("face") or head:FindFirstChildOfClass("Decal")
        if face and face:IsA("Decal") then
            pcall(function()
                face.Transparency = 0
            end)
        end
    end)
    
    return true
end

local function resetHead(player)
    if ModifiedHeads[player] then
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            if head then
                head.Size = ModifiedHeads[player].OriginalSize
                head.Massless = ModifiedHeads[player].OriginalMassless
                
                local face = head:FindFirstChild("face") or head:FindFirstChildOfClass("Decal")
                if face and face:GetAttribute("OriginalFaceSize") then
                    face.Size = face:GetAttribute("OriginalFaceSize")
                    face:SetAttribute("OriginalFaceSize", nil)
                end
            end
        end
        
        ModifiedHeads[player] = nil
    end
end

local function applyBigHeadsToAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            enlargeHead(player)
        end
    end
end

local function resetBigHeadsForAll()
    for player, _ in pairs(ModifiedHeads) do
        resetHead(player)
    end
end

task.spawn(function()
    while true do
        task.wait(2)
        
        if HeadSizeSettings.Enabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    task.spawn(function()
                        local success, error = pcall(function()
                            enlargeHead(player)
                        end)
                        
                        if not success and player.Character then
                            task.wait(0.5)
                            pcall(function()
                                enlargeHead(player)
                            end)
                        end
                    end)
                end
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        if HeadSizeSettings.Enabled then
            task.wait(1)
            enlargeHead(player)
        end
        
        player.CharacterAdded:Connect(function()
            if HeadSizeSettings.Enabled then
                task.wait(1)
                enlargeHead(player)
            end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ModifiedHeads[player] then
        ModifiedHeads[player] = nil
    end
end)

--========================================================--
--====================  ESP TAB ========================--
AddLabel(pageESP, "👁️ ESP SETTINGS", 8)

local espToggleBtn = AddToggle(pageESP, "ESP Master", 36, false, function(s) 
    ESPSettings.Enabled = s 
    if not s then
        for _, line in pairs(Drawn.lines) do
            if line then line.Visible = false end
        end
        for _, box in pairs(Drawn.boxes) do
            if box then box.Visible = false end
        end
        for _, name in pairs(Drawn.nameTexts) do
            if name then name.Visible = false end
        end
        for _, health in pairs(Drawn.healthTexts) do
            if health then health.Visible = false end
        end
    end
end)

local espLineToggleBtn = AddToggle(pageESP, "Line ESP", 76, false, function(s) 
    ESPSettings.Line = s 
end)

local espBoxToggleBtn = AddToggle(pageESP, "Box ESP", 116, false, function(s) 
    ESPSettings.Box = s 
end)

local espNameToggleBtn = AddToggle(pageESP, "Show Names", 156, false, function(s) 
    ESPSettings.Name = s 
end)

local espHealthToggleBtn = AddToggle(pageESP, "Show Health", 196, false, function(s) 
    ESPSettings.Health = s 
end)

AddToggle(pageESP, "📏 Distance", 236, false, function(s) 
    ESPSettings.Distance = s 
end)

AddToggle(pageESP, "💀 Skeleton", 276, false, function(s) 
    ESPSettings.Skeleton = s 
end)

AddToggle(pageESP, "📍 Tracer", 316, false, function(s) 
    ESPSettings.Tracer = s 
end)

AddToggle(pageESP, "🔫 Weapon", 356, false, function(s) 
    ESPSettings.Weapon = s 
end)

AddToggle(pageESP, "⏰ Account Age", 396, false, function(s) 
    ESPSettings.Time = s 
end)

AddToggle(pageESP, "✨ Player Chams (Highlight)", 436, ESPSettings.Chams, function(s) 
    ESPSettings.Chams = s 
end)

AddSlider(pageESP, "Chams Fill", 476, 0, 1, ESPSettings.ChamsFill, function(v) 
    ESPSettings.ChamsFill = v 
end)

local espDistanceSlider = AddSlider(pageESP, "Max Distance", 516, 100, 5000, ESPSettings.MaxDistance, function(v) 
    ESPSettings.MaxDistance = v 
end)

AddToggle(pageESP, "👥 Team Check", 556, ESPSettings.TeamCheck, function(s) 
    ESPSettings.TeamCheck = s 
end)

AddLabel(pageESP, "🎨 ESP COLORS", 596)

AddColorCycle(pageESP, "Box Color", 626, ESPSettings.Colors.Box, function(c) ESPSettings.Colors.Box = c end)
AddColorCycle(pageESP, "Line Color", 666, ESPSettings.Colors.Line, function(c) ESPSettings.Colors.Line = c end)
AddColorCycle(pageESP, "Name Color", 706, ESPSettings.Colors.Name, function(c) ESPSettings.Colors.Name = c end)
AddColorCycle(pageESP, "Health Color", 746, ESPSettings.Colors.Health, function(c) ESPSettings.Colors.Health = c end)
AddColorCycle(pageESP, "Distance Color", 786, ESPSettings.Colors.Distance, function(c) ESPSettings.Colors.Distance = c end)
AddColorCycle(pageESP, "Tracer Color", 826, ESPSettings.Colors.Tracer, function(c) ESPSettings.Colors.Tracer = c end)
AddColorCycle(pageESP, "Skeleton Color", 866, ESPSettings.Colors.Skeleton, function(c) ESPSettings.Colors.Skeleton = c end)
AddColorCycle(pageESP, "Weapon Color", 906, ESPSettings.Colors.Weapon, function(c) ESPSettings.Colors.Weapon = c end)
AddColorCycle(pageESP, "Time Color", 946, ESPSettings.Colors.Time, function(c) ESPSettings.Colors.Time = c end)
AddColorCycle(pageESP, "Chams Color", 986, ESPSettings.Colors.Chams, function(c) ESPSettings.Colors.Chams = c end)

--========================================================--
--====================  PLAYER TAB =====================--
AddLabel(pagePlayer,"👤 PLAYER TOOLS",8)

local speedToggle = AddToggle(pagePlayer,"Speed Boost",36,false,function(s) 
    PlayerSettings.SpeedOn = s 
end)

local jumpToggle = AddToggle(pagePlayer,"High Jump",76,false,function(s) 
    PlayerSettings.JumpOn = s 
end)

local noclipToggle = AddToggle(pagePlayer,"NoClip",116,false,function(s) 
    PlayerSettings.NoClip = s 
end)

local flyToggle = AddToggle(pagePlayer,"Fly Mode",156,false,function(s) 
    PlayerSettings.Fly = s 
end)

-- SWIM MODE
local swimToggle = AddToggle(pagePlayer,"🏊 Swim Mode",196,false,function(s) 
    PlayerSettings.Swim = s 
end)

-- GIANT MODE (x13)
local giantToggle = AddToggle(pagePlayer,"🗿 Giant Mode (x3)",236,false,function(s) 
    PlayerSettings.GiantMode = s 
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if s then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.Size = part.Size * 2
                    end
                end
                humanoid.HipHeight = humanoid.HipHeight * 2
            else
                LocalPlayer.Character:BreakJoints()
            end
        end
    end
end)

-- BIG HEADS SYSTEM
AddLabel(pagePlayer, "👑 BIG HEADS SYSTEM", 286)

local bigHeadsToggle = AddToggle(pagePlayer, "Big Heads", 316, HeadSizeSettings.Enabled, function(s)
    HeadSizeSettings.Enabled = s
    if s then
        applyBigHeadsToAll()
    else
        resetBigHeadsForAll()
    end
end)

local headSizeSlider = AddSlider(pagePlayer, "Head Size", 366, 1, 10, HeadSizeSettings.Size, function(v)
    HeadSizeSettings.Size = v
    if HeadSizeSettings.Enabled then
        applyBigHeadsToAll()
    end
end)

local speedSlider = AddSlider(pagePlayer, "Walk Speed", 416, 8, 380, PlayerSettings.Speed, function(v) 
    PlayerSettings.Speed = v 
end)

local jumpSlider = AddSlider(pagePlayer, "Jump Power", 466, 30, 250, PlayerSettings.JumpPower, function(v) 
    PlayerSettings.JumpPower = v 
end)

--========================================================--
--==================  EMOTES TAB (رقصات) ================--
pageEmotes:ClearAllChildren()

AddLabel(pageEmotes, "💃 EMOTES SYSTEM - نظام الرقصات", 8)
AddLabel(pageEmotes, "الرقصات تظهر لجميع اللاعبين في السيرفر!", 38)

local currentEmoteTrack = nil

local AnimationPacks = {
    Stylish = {
        Idle = 616136790, Idle2 = 616138447, Idle3 = 886888594, Walk = 616146177, Run = 616140816, Jump = 616139451, Climb = 616133594, Fall = 616134815, Swim = 616143378, SwimIdle = 616144772, Weight = 9, Weight2 = 1
    },
    Zombie = {
        Idle = 616158929, Idle2 = 616160636, Idle3 = 885545458, Walk = 616168032, Run = 616163682, Jump = 616161997, Climb = 616156119, Fall = 616157476, Swim = 616165109, SwimIdle = 616166655, Weight = 9, Weight2 = 1
    },
    Robot = {
        Idle = 616088211, Idle2 = 616089559, Idle3 = 885531463, Walk = 616095330, Run = 616091570, Jump = 616090535, Climb = 616086039, Fall = 616087089, Swim = 616092998, SwimIdle = 616094091, Weight = 9, Weight2 = 1
    },
    Toy = {
        Idle = 782841498, Idle2 = 782845736, Idle3 = 980952228, Walk = 782843345, Run = 782842708, Jump = 782847020, Climb = 782843869, Fall = 782846423, Swim = 782844582, SwimIdle = 782845186, Weight = 9, Weight2 = 1
    },
    Cartoony = {
        Idle = 742637544, Idle2 = 742638445, Idle3 = 885477856, Walk = 742640026, Run = 742638842, Jump = 742637942, Climb = 742636889, Fall = 742637151, Swim = 742639220, SwimIdle = 742639812, Weight = 9, Weight2 = 1
    },
    Superhero = {
        Idle = 616111295, Idle2 = 616113536, Idle3 = 885535855, Walk = 616122287, Run = 616117076, Jump = 616115533, Climb = 616104706, Fall = 616108001, Swim = 616119360, SwimIdle = 616120861, Weight = 9, Weight2 = 1
    },
    Mage = {
        Idle = 707742142, Idle2 = 707855907, Idle3 = 885508740, Walk = 707897309, Run = 707861613, Jump = 707853694, Climb = 707826056, Fall = 707829716, Swim = 707876443, SwimIdle = 707894699, Weight = 9, Weight2 = 1
    },
    Levitation = {
        Idle = 616006778, Idle2 = 616008087, Idle3 = 886862142, Walk = 616013216, Run = 616010382, Jump = 616008936, Climb = 616003713, Fall = 616005863, Swim = 616011509, SwimIdle = 616012453, Weight = 9, Weight2 = 1
    },
    Vampire = {
        Idle = 1083445855, Idle2 = 1083450166, Idle3 = 1088037547, Walk = 1083473930, Run = 1083462077, Jump = 1083455352, Climb = 1083439238, Fall = 1083443587, Swim = 1083464683, SwimIdle = 1083467779, Weight = 9, Weight2 = 1
    },
    Elder = {
        Idle = 845397899, Idle2 = 845400520, Idle3 = 901160519, Walk = 845403856, Run = 845386501, Jump = 845398858, Climb = 845392038, Fall = 845396048, Swim = 845401742, SwimIdle = 845403127, Weight = 9, Weight2 = 1
    },
    Werewolf = {
        Idle = 1083195517, Idle2 = 1083214717, Idle3 = 1099492820, Walk = 1083178339, Run = 1083216690, Jump = 1083218792, Climb = 1083182000, Fall = 1083189019, Swim = 1083222527, SwimIdle = 1083225406, Weight = 9, Weight2 = 1
    },
    Knight = {
        Idle = 657595757, Idle2 = 657568135, Idle3 = 885499184, Walk = 657552124, Run = 657564596, Jump = 658409194, Climb = 658360781, Fall = 657600338, Swim = 657560551, SwimIdle = 657557095, Weight = 9, Weight2 = 1
    },
    Bold = {
        Idle = 16738333868, Idle2 = 16738334710, Idle3 = 16738335517, Walk = 16738340646, Run = 16738337225, Jump = 16738336650, Climb = 16738332169, Fall = 16738333171, Swim = 16738339158, SwimIdle = 16738339817, Weight = 9, Weight2 = 1
    },
    Astronaut = {
        Idle = 891621366, Idle2 = 891633237, Idle3 = 1047759695, Walk = 891667138, Run = 891636393, Jump = 891627522, Climb = 891609353, Fall = 891617961, Swim = 891639666, SwimIdle = 891663592, Weight = 9, Weight2 = 1
    },
    Bubbly = {
        Idle = 910004836, Idle2 = 910009958, Idle3 = 1018536639, Walk = 910034870, Run = 910025107, Jump = 910016857, Climb = 909997997, Fall = 910001910, Swim = 910028158, SwimIdle = 910030921, Weight = 9, Weight2 = 1
    },
    Pirate = {
        Idle = 750781874, Idle2 = 750782770, Idle3 = 885515365, Walk = 750785693, Run = 750783738, Jump = 750782230, Climb = 750779899, Fall = 750780242, Swim = 750784579, SwimIdle = 750785176, Weight = 9, Weight2 = 1
    },
    Rthro = {
        Idle = 2510196951, Idle2 = 2510197257, Idle3 = 3711062489, Walk = 2510202577, Run = 2510198475, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    Ninja = {
        Idle = 656117400, Idle2 = 656118341, Idle3 = 886742569, Walk = 656121766, Run = 656118852, Jump = 656117878, Climb = 656114359, Fall = 656115606, Swim = 656119721, SwimIdle = 656121397, Weight = 9, Weight2 = 1
    },
    Oldschool = {
        Idle = 5319828216, Idle2 = 5319831086, Idle3 = 5392107832, Walk = 5319847204, Run = 5319844329, Jump = 5319841935, Climb = 5319816685, Fall = 5319839762, Swim = 5319850266, SwimIdle = 5319852613, Weight = 9, Weight2 = 1
    },
    ["No Boundaries"] = {
        Idle = 18747067405, Idle2 = 18747063918, Idle3 = 18747063918, Walk = 18747074203, Run = 18747070484, Jump = 18747069148, Climb = 18747060903, Fall = 18747062535, Swim = 18747073181, SwimIdle = 18747071682, Weight = 9, Weight2 = 1
    },
    ["NFL Animation"] = {
        Idle = 92080889861410, Idle2 = 74451233229259, Idle3 = 80884010501210, Walk = 110358958299415, Run = 117333533048078, Jump = 119846112151352, Climb = 134630013742019, Fall = 129773241321032, Swim = 132697394189921, SwimIdle = 79090109939093, Weight = 9, Weight2 = 1
    },
    ["Adidas Sports"] = {
        Idle = 18537376492, Idle2 = 18537371272, Idle3 = 18537374150, Walk = 18537392113, Run = 18537384940, Jump = 18537380791, Climb = 18537363391, Fall = 18537367238, Swim = 18537389531, SwimIdle = 18537387180, Weight = 9, Weight2 = 1
    },
    ["Wickled Popular"] = {
        Idle = 118832222982049, Idle2 = 76049494037641, Idle3 = 138255200176080, Walk = 92072849924640, Run = 72301599441680, Jump = 104325245285198, Climb = 131326830509784, Fall = 121152442762481, Swim = 99384245425157, SwimIdle = 113199415118199, Weight = 9, Weight2 = 1
    },
    ["Catwalk Glam"] = {
        Idle = 133806214992291, Idle2 = 94970088341563, Idle3 = 87105332133518, Walk = 109168724482748, Run = 81024476153754, Jump = 116936326516985, Climb = 119377220967554, Fall = 92294537340807, Swim = 134591743181628, SwimIdle = 98854111361360, Weight = 9, Weight2 = 1
    },
    Princess = {
        Idle = 941003647, Idle2 = 941013098, Idle3 = 1159195712, Walk = 941028902, Run = 941015281, Jump = 0941008832, Climb = 940996062, Fall = 941000007, Swim = 941018893, SwimIdle = 941025398, Weight = 9, Weight2 = 1
    },
    Confident = {
        Idle = 1069977950, Idle2 = 1069987858, Idle3 = 1116160740, Walk = 1070017263, Run = 1070001516, Jump = 1069984524, Climb = 1069946257, Fall = 1069973677, Swim = 1070009914, SwimIdle = 1070012133, Weight = 9, Weight2 = 1
    },
    Popstar = {
        Idle = 1212900985, Idle2 = 1150842221, Idle3 = 1239733474, Walk = 1212980338, Run = 1212980348, Jump = 1212954642, Climb = 1213044953, Fall = 1212900995, Swim = 1212852603, SwimIdle = 1070012133, Weight = 9, Weight2 = 1
    },
    Patrol = {
        Idle = 1149612882, Idle2 = 1150842221, Idle3 = 1159573567, Walk = 1151231493, Run = 1150967949, Jump = 1150944216, Climb = 1148811837, Fall = 1148863382, Swim = 1151204998, SwimIdle = 1151221899, Weight = 9, Weight2 = 1
    },
    Sneaky = {
        Idle = 1132473842, Idle2 = 1132477671, Idle3 = "None", Walk = 1132510133, Run = 1132494274, Jump = 1132489853, Climb = 1132461372, Fall = 1132469004, Swim = 1132500520, SwimIdle = 1132506407, Weight = 9, Weight2 = 1
    },
    Cowboy = {
        Idle = 1014390418, Idle2 = 1014398616, Idle3 = 1159487651, Walk = 1014421541, Run = 1014401683, Jump = 1014394726, Climb = 1014380606, Fall = 1014384571, Swim = 1014406523, SwimIdle = 1014411816, Weight = 9, Weight2 = 1
    },
    Ghost = {
        Idle = 616006778, Idle2 = 616008087, Idle3 = 616008087, Walk = 616013216, Run = 616013216, Jump = 616008936, Climb = 0, Fall = 616005863, Swim = 616011509, SwimIdle = 616012453, Weight = 9, Weight2 = 1
    },
    ["Ghost 2"] = {
        Idle = 1151221899, Idle2 = 1151221899, Idle3 = "None", Walk = 1151221899, Run = 1151221899, Jump = 1151221899, Climb = 0, Fall = 1151221899, Swim = 16738339158, SwimIdle = 1151221899, Weight = 9, Weight2 = 1
    },
    ["Mr. Toilet"] = {
        Idle = 4417977954, Idle2 = 4417978624, Idle3 = 4441285342, Walk = 2510202577, Run = 4417979645, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    Udzal = {
        Idle = 3303162274, Idle2 = 3303162549, Idle3 = 3710161342, Walk = 3303162967, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    ["Oinan Thickhoof"] = {
        Idle = 657595757, Idle2 = 657568135, Idle3 = 885499184, Walk = 2510202577, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    Borock = {
        Idle = 3293641938, Idle2 = 3293642554, Idle3 = 3710131919, Walk = 2510202577, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    ["Blocky Mech"] = {
        Idle = 4417977954, Idle2 = 4417978624, Idle3 = 4441285342, Walk = 2510202577, Run = 4417979645, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    ["Stylized Female"] = {
        Idle = 4708191566, Idle2 = 4708192150, Idle3 = 121221, Walk = 4708193840, Run = 4708192705, Jump = 4708188025, Climb = 4708184253, Fall = 4708186162, Swim = 4708189360, SwimIdle = 4708190607, Weight = 9, Weight2 = 1
    },
    R15_Default = {
        Idle = 4211217646, Idle2 = 4211218409, Idle3 = "None", Walk = 4211223236, Run = 4211220381, Jump = 4211219390, Climb = 4211214992, Fall = 4211216152, Swim = 4211221314, SwimIdle = 4374694239, Weight = 9, Weight2 = 1
    },
    R6_Default = {
        Idle = 180435571, Idle2 = 180435571, Idle3 = "None", Walk = 180426354, Run = 180426354, Jump = 125750702, Climb = 180436334, Fall = 180436148, Swim = 180436554, SwimIdle = 180436554, Weight = 9, Weight2 = 1
    },
    Mocap = {
        Idle = 913367814, Idle2 = 913373430, Idle3 = "None", Walk = 913402848, Run = 913376220, Jump = 913370268, Climb = 913362637, Fall = 913365531, Swim = 913384386, SwimIdle = 913389285, Weight = 9, Weight2 = 1
    }
}

local function replaceAnimations(packName)
    local pack = AnimationPacks[packName]
    if not pack then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local animate = character:FindFirstChild("Animate")
    if not animate then return end
    
    local function setAnim(name, id)
        local folder = animate:FindFirstChild(name)
        if folder then
            local anim = folder:FindFirstChildOfClass("Animation")
            if anim then
                anim.AnimationId = "rbxassetid://" .. id
            end
        end
    end
    
    setAnim("idle", pack.Idle)
    if animate:FindFirstChild("idle") and animate.idle:FindFirstChild("Animation2") then
        animate.idle.Animation2.AnimationId = "rbxassetid://" .. pack.Idle2
    end
    
    setAnim("walk", pack.Walk)
    setAnim("run", pack.Run)
    setAnim("jump", pack.Jump)
    setAnim("climb", pack.Climb)
    setAnim("fall", pack.Fall)
    setAnim("swim", pack.Swim)
    setAnim("swimidle", pack.SwimIdle)
    
    -- Refresh animations
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local state = humanoid:GetState()
        humanoid:ChangeState(Enum.HumanoidStateType.None)
        task.wait(0.1)
        humanoid:ChangeState(state)
    end
end

local function isR15()
    local character = LocalPlayer.Character
    if character then
        return character:FindFirstChild("UpperTorso") ~= nil
    end
    return false
end

local EmotesListR6 = {
    {name = "Astronaut", id = 891621366},
    {name = "Bubbly", id = 910004836},
    {name = "Careless", id = 909988915},
    {name = "Confused", id = 1018894549},
    {name = "Dizzy", id = 910009958},
    {name = "Floss", id = 910025318},
    {name = "Heisman", id = 1018888561},
    {name = "Salute", id = 910034870},
    {name = "Shrug", id = 910038419},
    {name = "Tilt", id = 910042935},
    {name = "Shuffle", id = 429703734},
    {name = "Kick", id = 1018790633},
    {name = "Fall", id = 180435571},
    {name = "Spin", id = 188632011},
    {name = "Jerk", id = 1018552182},
    {name = "Robot", id = 616006778},
    {name = "Zombie", id = 616008087},
    {name = "Ninja", id = 656117878},
    {name = "Werewolf", id = 1083216690},
    {name = "Insane", id = 33796059},
    {name = "Superhero", id = 782841498},
    {name = "Oldschool", id = 5917459365},
    {name = "Stylish", id = 616136790},
    {name = "Elder", id = 845397899},
    {name = "Knight", id = 657564596},
    -- New Emotes from E Table
    {name = "Fashion", id = 3333331310},
    {name = "Baby Dance", id = 4265725525},
    {name = "Cha-Cha", id = 6862001787},
    {name = "Monkey", id = 3333499508},
    {name = "Top Rock", id = 3361276673},
    {name = "Around Town", id = 3303391864},
    {name = "Fancy Feet", id = 3333432454},
    {name = "Hype Dance", id = 3695333486},
    {name = "Bodybuilder", id = 3333387824},
    {name = "Idol", id = 4101966434},
    {name = "Curtsy", id = 4555816777},
    {name = "Happy", id = 4841405708},
    {name = "Quiet Waves", id = 7465981288},
    {name = "Sleep", id = 4686925579},
    {name = "Floss Dance", id = 5917459365},
    {name = "Shy", id = 3337978742},
    {name = "Godlike", id = 3337994105},
    {name = "Hero Landing", id = 5104344710},
    {name = "High Wave", id = 5915690960},
    {name = "Cower", id = 4940563117},
    {name = "Bored", id = 5230599789},
    {name = "Show Dem Wrists", id = 7198989668},
    {name = "Celebrate", id = 3338097973},
    {name = "Dash", id = 582855105},
    {name = "Beckon", id = 5230598276},
    {name = "Haha", id = 3337966527},
    {name = "Lasso Turn", id = 7942896991},
    {name = "Line Dance", id = 4049037604},
    {name = "Point2", id = 3344585679},
    {name = "Stadium", id = 3338055167},
    {name = "Side to Side", id = 3333136415},
    {name = "Old Town Road Dance", id = 5937560570},
    {name = "Hello", id = 3344650532},
    {name = "Dolphin Dance", id = 5918726674},
    {name = "Samba", id = 6869766175},
    {name = "Break Dance", id = 5915648917},
    {name = "Hips Poppin'", id = 6797888062},
    {name = "Wake Up Call", id = 7199000883},
    {name = "Greatest", id = 3338042785},
    {name = "On The Outside", id = 7422779536},
    {name = "Boxing Punch", id = 7202863182},
    {name = "Sad", id = 4841407203},
    {name = "Flowing Breeze", id = 7465946930},
    {name = "Twirl", id = 3334968680},
    {name = "Jumping Wave", id = 4940564896},
    {name = "HOLIDAY Dance", id = 5937558680},
    {name = "Take Me Under", id = 6797890377},
    {name = "Dizzy", id = 3361426436},
    {name = "Dancing' Shoes", id = 7404878500},
    {name = "Fashionable", id = 3333331310},
    {name = "Fast Hands", id = 4265701731},
    {name = "Tree", id = 4049551434},
    {name = "Agree", id = 4841397952},
    {name = "Power Blast", id = 4841403964},
    {name = "Swoosh", id = 3361481910},
    {name = "Jumping Cheer", id = 5895324424},
    {name = "Disagree", id = 4841401869},
    {name = "Rodeo Dance", id = 5918728267},
    {name = "It Ain't My Fault", id = 6797891807},
    {name = "Rock On", id = 5915714366},
    {name = "Block Partier", id = 6862022283},
    {name = "Dorky Dance", id = 4212455378},
    {name = "AOK", id = 7942885103},
    {name = "T", id = 3338010159},
    {name = "Cobra Arms", id = 7942890105},
    {name = "Panini Dance", id = 5915713518},
    {name = "Fishing", id = 3334832150},
    -- New Emotes from I Table
    {name = "Balloon Float", id = 148840371},
    {name = "Arm Turbine", id = 259438880},
    {name = "Floating Head", id = 121572214},
    {name = "Insane Rotation", id = 121572214},
    {name = "Scream", id = 180611870},
    {name = "Chop", id = 33169596},
    {name = "Weird Sway", id = 248336677},
    {name = "Goal!", id = 28488254},
    {name = "Rotation", id = 136801964},
    {name = "Weird Float", id = 248336459},
    {name = "Pinch Nose", id = 30235165},
    {name = "Cry", id = 180612465},
    {name = "Penguin Slide", id = 282574440},
    {name = "Zombie Arms", id = 183294396},
    {name = "Flying", id = 46196309},
    {name = "Stab", id = 66703241},
    {name = "Random", id = 48977286},
    {name = "Hmmm", id = 33855276},
    {name = "Sword", id = 35978879},
    {name = "Arms Out", id = 27432691},
    {name = "Insane Legs", id = 87986341},
    {name = "Head Detach", id = 35154961},
    {name = "Moon Walk", id = 30196114},
    {name = "Crouching", id = 287325678},
    {name = "Beat Box", id = 45504977},
    {name = "Big Guns", id = 161268368},
    {name = "Bigger Guns", id = 225975820},
    {name = "Charleston", id = 429703734},
    {name = "Moon Dance", id = 27789359},
    {name = "Roar", id = 163209885},
    {name = "Weird Pose", id = 248336163},
    {name = "Spin Dance 2", id = 186934910},
    {name = "Bow Down", id = 204292303},
    {name = "Sword Slam", id = 204295235},
    {name = "Glitch Levitate", id = 313762630},
    {name = "Full Swing", id = 218504594},
    {name = "Full Punch", id = 204062532},
    {name = "Faint", id = 181526230},
    {name = "Floor Faint", id = 181525546},
    {name = "Crouching 2", id = 182724289},
    {name = "Jumping Jacks", id = 429681631},
    {name = "Spin Dance", id = 429730430},
    {name = "Arm Detach", id = 33169583},
    {name = "Mega Insane", id = 184574340},
    {name = "Dino Walk", id = 204328711},
    {name = "Tilt Head", id = 283545583},
}

local EmotesListR15 = {
    {name = "Astronaut", id = 3823158750},
    {name = "Cower", id = 4940563117},
    {name = "Salute", id = 3360689775},
    {name = "Point", id = 3576823880},
    {name = "Wave", id = 3576686446},
    {name = "Laugh", id = 3337966527},
    {name = "Cheer", id = 3333499508},
    {name = "Dance", id = 3333432454},
    {name = "Dance2", id = 3333331310},
    {name = "Dance3", id = 3576686230},
    {name = "Tilt", id = 3360686498},
    {name = "Stadium", id = 3360686498},
    {name = "Shuffle", id = 4349242221},
    {name = "Kick", id = 1018790633},
    {name = "Jerk", id = 1018552182},
    {name = "Robot", id = 616006778},
    {name = "Zombie", id = 616008087},
    {name = "Ninja", id = 656117878},
    {name = "Werewolf", id = 1083216690},
    {name = "Insane", id = 33796059},
    {name = "Superhero", id = 782841498},
    {name = "Oldschool", id = 5917459365},
    {name = "Stylish", id = 616136790},
    {name = "Elder", id = 845397899},
    {name = "Knight", id = 657564596},
    -- New Emotes from E Table
    {name = "Fashion", id = 3333331310},
    {name = "Baby Dance", id = 4265725525},
    {name = "Cha-Cha", id = 6862001787},
    {name = "Monkey", id = 3333499508},
    {name = "Top Rock", id = 3361276673},
    {name = "Around Town", id = 3303391864},
    {name = "Fancy Feet", id = 3333432454},
    {name = "Hype Dance", id = 3695333486},
    {name = "Bodybuilder", id = 3333387824},
    {name = "Idol", id = 4101966434},
    {name = "Curtsy", id = 4555816777},
    {name = "Happy", id = 4841405708},
    {name = "Quiet Waves", id = 7465981288},
    {name = "Sleep", id = 4686925579},
    {name = "Floss Dance", id = 5917459365},
    {name = "Shy", id = 3337978742},
    {name = "Godlike", id = 3337994105},
    {name = "Hero Landing", id = 5104344710},
    {name = "High Wave", id = 5915690960},
    {name = "Cower", id = 4940563117},
    {name = "Bored", id = 5230599789},
    {name = "Show Dem Wrists", id = 7198989668},
    {name = "Celebrate", id = 3338097973},
    {name = "Dash", id = 582855105},
    {name = "Beckon", id = 5230598276},
    {name = "Haha", id = 3337966527},
    {name = "Lasso Turn", id = 7942896991},
    {name = "Line Dance", id = 4049037604},
    {name = "Shrug", id = 3334392772},
    {name = "Point2", id = 3344585679},
    {name = "Stadium", id = 3338055167},
    {name = "Side to Side", id = 3333136415},
    {name = "Old Town Road Dance", id = 5937560570},
    {name = "Hello", id = 3344650532},
    {name = "Dolphin Dance", id = 5918726674},
    {name = "Samba", id = 6869766175},
    {name = "Break Dance", id = 5915648917},
    {name = "Hips Poppin'", id = 6797888062},
    {name = "Wake Up Call", id = 7199000883},
    {name = "Greatest", id = 3338042785},
    {name = "On The Outside", id = 7422779536},
    {name = "Boxing Punch", id = 7202863182},
    {name = "Sad", id = 4841407203},
    {name = "Flowing Breeze", id = 7465946930},
    {name = "Twirl", id = 3334968680},
    {name = "Jumping Wave", id = 4940564896},
    {name = "HOLIDAY Dance", id = 5937558680},
    {name = "Take Me Under", id = 6797890377},
    {name = "Dizzy", id = 3361426436},
    {name = "Dancing' Shoes", id = 7404878500},
    {name = "Fashionable", id = 3333331310},
    {name = "Fast Hands", id = 4265701731},
    {name = "Tree", id = 4049551434},
    {name = "Agree", id = 4841397952},
    {name = "Power Blast", id = 4841403964},
    {name = "Swoosh", id = 3361481910},
    {name = "Jumping Cheer", id = 5895324424},
    {name = "Disagree", id = 4841401869},
    {name = "Rodeo Dance", id = 5918728267},
    {name = "It Ain't My Fault", id = 6797891807},
    {name = "Rock On", id = 5915714366},
    {name = "Block Partier", id = 6862022283},
    {name = "Dorky Dance", id = 4212455378},
    {name = "AOK", id = 7942885103},
    {name = "T", id = 3338010159},
    {name = "Cobra Arms", id = 7942890105},
    {name = "Panini Dance", id = 5915713518},
    {name = "Fishing", id = 3334832150},
    {name = "Dino Walk", id = 204328711},
    {name = "Tilt Head", id = 283545583},
}

local AdvancedEmotesData = {
    ['Balloon Float'] = {Speed = 1, Loop = true, Priority = 2},
    ['Arm Turbine'] = {Speed = 1.5, Loop = true, Priority = 2},
    ['Floating Head'] = {Speed = 1, Loop = true, Priority = 2},
    ['Insane Rotation'] = {Speed = 99, Loop = true, Priority = 2},
    ['Scream'] = {Speed = 1.5, Loop = true, Priority = 2},
    ['Party Time'] = {Speed = 1, Loop = true, Priority = 2},
    ['Chop'] = {Speed = 1, Loop = true, Priority = 2},
    ['Weird Sway'] = {Speed = 1, Loop = true, Priority = 2},
    ['Goal!'] = {Speed = 1, Loop = true, Priority = 2},
    ['Rotation'] = {Speed = 1, Loop = true, Priority = 2},
    ['Weird Float'] = {Speed = 1, Loop = true, Priority = 2},
    ['Pinch Nose'] = {Speed = 1, Loop = true, Priority = 2},
    ['Cry'] = {Speed = 1, Loop = true, Priority = 2},
    ['Penguin Slide'] = {Speed = 1, Loop = true, Priority = 2},
    ['Zombie Arms'] = {Speed = 1, Loop = true, Priority = 2},
    ['Flying'] = {Speed = 1, Loop = true, Priority = 2},
    ['Stab'] = {Speed = 1, Loop = true, Priority = 2},
    ['Random'] = {Speed = 1, Loop = true, Priority = 2},
    ['Hmmm'] = {Speed = 1, Loop = true, Priority = 2},
    ['Sword'] = {Speed = 1, Loop = true, Priority = 2},
    ['Arms Out'] = {Speed = 1, Loop = true, Priority = 2},
    ['Insane Legs'] = {Speed = 1, Loop = true, Priority = 2},
    ['Head Detach'] = {Speed = 1, Loop = true, Priority = 2},
    ['Moon Walk'] = {Speed = 1, Loop = true, Priority = 2},
    ['Crouching'] = {Speed = 1, Loop = true, Priority = 2},
    ['Beat Box'] = {Speed = 1, Loop = true, Priority = 2},
    ['Big Guns'] = {Speed = 1, Loop = true, Priority = 2},
    ['Bigger Guns'] = {Speed = 1, Loop = true, Priority = 2},
    ['Charleston'] = {Speed = 1, Loop = true, Priority = 2},
    ['Moon Dance'] = {Speed = 1, Loop = true, Priority = 2},
    ['Roar'] = {Speed = 1, Loop = true, Priority = 2},
    ['Weird Pose'] = {Speed = 1, Loop = true, Priority = 2},
    ['Spin Dance 2'] = {Speed = 1, Loop = true, Priority = 2},
    ['Bow Down'] = {Speed = 1, Loop = true, Priority = 2},
    ['Sword Slam'] = {Speed = 1, Loop = true, Priority = 2},
    ['Glitch Levitate'] = {Speed = 1, Loop = true, Priority = 2},
    ['Full Swing'] = {Speed = 1, Loop = true, Priority = 2},
    ['Full Punch'] = {Speed = 1, Loop = true, Priority = 2},
    ['Faint'] = {Speed = 1, Loop = true, Priority = 2},
    ['Floor Faint'] = {Speed = 1, Loop = true, Priority = 2},
    ['Crouching 2'] = {Speed = 1, Loop = true, Priority = 2},
    ['Jumping Jacks'] = {Speed = 1, Loop = true, Priority = 2},
    ['Spin Dance'] = {Speed = 1, Loop = true, Priority = 2},
    ['Arm Detach'] = {Speed = 1, Loop = true, Priority = 2},
    ['Mega Insane'] = {Speed = 1, Loop = true, Priority = 2},
    ['Dino Walk'] = {Speed = 1, Loop = true, Priority = 2},
    ['Tilt Head'] = {Speed = 1, Loop = true, Priority = 2},
}

local yPos = 70
local packNames = {"Stylish", "Zombie", "Robot", "Toy", "Cartoony", "Superhero", "Mage", "Levitation", "Vampire", "Elder", "Werewolf", "Knight", "Bold", "Astronaut", "Bubbly", "Pirate", "Rthro", "Ninja", "Oldschool", "No Boundaries", "NFL Animation", "Adidas Sports", "Wickled Popular", "Catwalk Glam", "Princess", "Confident", "Popstar", "Patrol", "Sneaky", "Cowboy", "Ghost", "Ghost 2", "Mr. Toilet", "Udzal", "Oinan Thickhoof", "Borock", "Blocky Mech", "Stylized Female", "R15_Default", "R6_Default", "Mocap"}

local function createEmoteButtons()
    pageEmotes:ClearAllChildren()
    
    AddLabel(pageEmotes, "💃 EMOTES SYSTEM - نظام الرقصات", 8)
    AddLabel(pageEmotes, "الرقصات تظهر لجميع اللاعبين في السيرفر!", 38)

    -- Quick Stop Button at the Top
    local topStopBtn = Instance.new("TextButton", pageEmotes)
    topStopBtn.Size = UDim2.new(0, 420, 0, 40)
    topStopBtn.Position = UDim2.new(0, 15, 0, 65)
    topStopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    topStopBtn.Text = "⏹️ إيقاف الرقصات - STOP EMOTES"
    topStopBtn.TextColor3 = Color3.new(1, 1, 1)
    topStopBtn.Font = Enum.Font.GothamBold
    topStopBtn.TextSize = 14
    topStopBtn.BorderSizePixel = 0
    
    local topStopCorner = Instance.new("UICorner", topStopBtn)
    topStopCorner.CornerRadius = UDim.new(0, 8)
    
    topStopBtn.MouseButton1Click:Connect(function()
        if currentEmoteTrack then
            currentEmoteTrack:Stop()
            currentEmoteTrack = nil
        end
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        track:Stop()
                    end
                end
            end
            
            -- Reset Movement Animations to Default
            if isR15() then
                replaceAnimations("R15_Default")
            else
                replaceAnimations("R6_Default")
            end
        end
        showNotification("Bloodix", "All Emotes & Movements Stopped", 2)
    end)

    -- Animation Packs Section
    AddLabel(pageEmotes, "✨ ANIMATION PACKS - حزم الحركات", 115)
    local packY = 145
    
    for i, packName in ipairs(packNames) do
        local packBtn = Instance.new("TextButton", pageEmotes)
        packBtn.Size = UDim2.new(0, 135, 0, 35)
        packBtn.Position = UDim2.new(0, ((i-1) % 3) * 145 + 15, 0, packY + math.floor((i-1) / 3) * 45)
        packBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        packBtn.Text = "✨ " .. packName
        packBtn.TextColor3 = Color3.new(1, 1, 1)
        packBtn.Font = Enum.Font.GothamBold
        packBtn.TextSize = 12
        packBtn.BorderSizePixel = 0
        
        local packCorner = Instance.new("UICorner", packBtn)
        packCorner.CornerRadius = UDim.new(0, 6)
        
        packBtn.MouseButton1Click:Connect(function()
            replaceAnimations(packName)
            showNotification("Bloodix", "Animation Pack Applied: " .. packName, 2)
        end)
    end

    local emotesYStart = packY + math.ceil(#packNames / 3) * 45 + 10
    AddLabel(pageEmotes, "🎵 EMOTES LIST - قائمة الرقصات", emotesYStart)
    
    local emotesList = isR15() and EmotesListR15 or EmotesListR6
    local emoteYOffset = emotesYStart + 30
    
    for i, emote in ipairs(emotesList) do
        local emoteBtn = Instance.new("TextButton", pageEmotes)
        emoteBtn.Size = UDim2.new(0, 200, 0, 40)
        emoteBtn.Position = UDim2.new(0, ((i-1) % 2) * 220 + 15, 0, emoteYOffset + math.floor((i-1) / 2) * 50)
        emoteBtn.BackgroundColor3 = Color3.fromRGB(80, 100, 200)
        emoteBtn.Text = "💃 " .. emote.name
        emoteBtn.TextColor3 = Color3.new(1, 1, 1)
        emoteBtn.Font = Enum.Font.GothamBold
        emoteBtn.TextSize = 14
        emoteBtn.BorderSizePixel = 0
        
        local emoteCorner = Instance.new("UICorner", emoteBtn)
        emoteCorner.CornerRadius = UDim.new(0, 8)
        
        emoteBtn.MouseEnter:Connect(function()
            emoteBtn.BackgroundColor3 = Color3.fromRGB(100, 120, 255)
        end)
        
        emoteBtn.MouseLeave:Connect(function()
            emoteBtn.BackgroundColor3 = Color3.fromRGB(80, 100, 200)
        end)
        
        emoteBtn.MouseButton1Click:Connect(function()
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local animator = humanoid:FindFirstChildOfClass("Animator")
                    if not animator then
                        animator = Instance.new("Animator", humanoid)
                    end
                    
                    if currentEmoteTrack then
                        currentEmoteTrack:Stop()
                    end
                    
                    local anim = Instance.new("Animation")
                    anim.AnimationId = "rbxassetid://" .. emote.id
                    
                    currentEmoteTrack = animator:LoadAnimation(anim)
                    
                    -- Apply Advanced Data if exists (Speed, Loop, Priority)
                    local advData = AdvancedEmotesData[emote.name]
                    if advData then
                        currentEmoteTrack.Priority = advData.Priority == 2 and Enum.AnimationPriority.Action or Enum.AnimationPriority.Movement
                        currentEmoteTrack:Play()
                        currentEmoteTrack:AdjustSpeed(advData.Speed or 1)
                        currentEmoteTrack.Looped = advData.Loop or false
                    else
                        currentEmoteTrack.Priority = Enum.AnimationPriority.Action
                        currentEmoteTrack:Play()
                        currentEmoteTrack.Looped = true
                    end
                end
            end
        end)
    end
    
    return emotesList
end

local currentEmotesList = createEmoteButtons()
local finalEmoteY = 145 + math.ceil(#packNames / 3) * 45 + 40 + math.ceil(#currentEmotesList / 2) * 50

AddLabel(pageEmotes, "Custom Emotes (رقصات مخصصة):", finalEmoteY + 15)

local customEmoteBox = Instance.new("TextBox", pageEmotes)
customEmoteBox.Size = UDim2.new(0, 300, 0, 35)
customEmoteBox.Position = UDim2.new(0, 15, 0, finalEmoteY + 45)
customEmoteBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
customEmoteBox.BorderSizePixel = 1
customEmoteBox.BorderColor3 = Color3.fromRGB(80, 120, 200)
customEmoteBox.PlaceholderText = "Enter Animation ID..."
customEmoteBox.Text = ""
customEmoteBox.TextColor3 = Color3.new(1, 1, 1)
customEmoteBox.Font = Enum.Font.Gotham
customEmoteBox.TextSize = 14

local customCorner = Instance.new("UICorner", customEmoteBox)
customCorner.CornerRadius = UDim.new(0, 6)

local playCustomBtn = Instance.new("TextButton", pageEmotes)
playCustomBtn.Size = UDim2.new(0, 110, 0, 35)
playCustomBtn.Position = UDim2.new(0, 325, 0, finalEmoteY + 45)
playCustomBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
playCustomBtn.Text = "▶️ Play"
playCustomBtn.TextColor3 = Color3.new(1, 1, 1)
playCustomBtn.Font = Enum.Font.GothamBold
playCustomBtn.TextSize = 14
playCustomBtn.BorderSizePixel = 0

local playCorner = Instance.new("UICorner", playCustomBtn)
playCorner.CornerRadius = UDim.new(0, 6)

playCustomBtn.MouseButton1Click:Connect(function()
    local animId = customEmoteBox.Text
    if animId and animId ~= "" then
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    local anim = Instance.new("Animation")
                    anim.AnimationId = "rbxassetid://" .. animId
                    local track = animator:LoadAnimation(anim)
                    track:Play()
                end
            end
        end
    end
end)

AddLabel(pageEmotes, "💡 Tips:", finalEmoteY + 90)
AddLabel(pageEmotes, "• الرقصات تعمل تلقائياً وتظهر لجميع اللاعبين", finalEmoteY + 115)
AddLabel(pageEmotes, "• يمكنك إدخال Animation ID مخصص للرقص", finalEmoteY + 135)
AddLabel(pageEmotes, "• استخدم زر Stop لإيقاف جميع الرقصات", finalEmoteY + 155)

pageEmotes.CanvasSize = UDim2.new(0, 0, 0, finalEmoteY + 200)

--========================================================--
--===========  PLAYER TOOLS UPDATE ======================--
RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        hum.WalkSpeed = PlayerSettings.SpeedOn and PlayerSettings.Speed or 16
        hum.JumpPower = PlayerSettings.JumpOn and PlayerSettings.JumpPower or 50
        
        if PlayerSettings.NoClip then 
            for _, part in pairs(char:GetChildren()) do 
                if part:IsA("BasePart") then 
                    part.CanCollide = false 
                end 
            end 
        end
        
        if PlayerSettings.Fly then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local vel = Vector3.new(0, 0, 0)
                local cam = getCamera()
                if not cam then return end
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
                hrp.Velocity = vel * PlayerSettings.Speed
            end
        end
        
        if PlayerSettings.Swim then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                local vel = Vector3.new(0, 0, 0)
                local cam = getCamera()
                if not cam then return end
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel + Vector3.new(0, -1, 0) end
                hrp.Velocity = vel * (PlayerSettings.Speed * 1.5)
            end
        end
    end
end)

--========================================================--
--====================  TELEPORT TAB ====================--
pageTP:ClearAllChildren()

AddLabel(pageTP, "📍 TELEPORT SYSTEM", 8)

AddLabel(pageTP, "🤝 SOCIAL TROLL - مقالب اجتماعية", 40)
AddLabel(pageTP, "Select Player from list:", 70)
AddPlayerList(pageTP, 100, function(v) 
    TrollFeatures.SelectedPlayer = v 
    showNotification("Bloodix", "Selected: " .. v, 2)
end)

AddButton(pageTP, "Teleport to Selected Player", 260, function()
    local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        showNotification("Bloodix", "Teleported to " .. target.Name, 2)
    else
        showNotification("Bloodix Error", "No player selected or character missing!", 2)
    end
end)

AddToggle(pageTP, "Carry Player (حمل)", 300, false, function(s) TrollFeatures.CarryPlayer = s end)
AddToggle(pageTP, "Ride on Back (ركوب)", 340, false, function(s) TrollFeatures.RidePlayer = s end)
AddToggle(pageTP, "Attach (إلتصاق)", 380, false, function(s) TrollFeatures.AttachPlayer = s end)
AddSlider(pageTP, "Attach Distance (المسافة)", 420, 1, 15, TrollFeatures.RideDistance, function(v) TrollFeatures.RideDistance = v end)
AddSlider(pageTP, "Attach Height (الارتفاع)", 460, -10, 10, TrollFeatures.AttachHeight, function(v) TrollFeatures.AttachHeight = v end)
AddToggle(pageTP, "Follow Player (لحاق)", 500, false, function(s) TrollFeatures.FollowPlayer = s end)
AddToggle(pageTP, "Freeze Player (تجميد)", 540, false, function(s) TrollFeatures.FreezePlayer = s end)
AddToggle(pageTP, "Hug (حضن)", 580, false, function(s) TrollFeatures.HugPlayer = s end)

AddLabel(pageTP, "🔍 GENERAL TELEPORT", 630)
local searchBox = Instance.new("TextBox", pageTP)
searchBox.Size = UDim2.new(0, 440, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 660)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
searchBox.BorderSizePixel = 1
searchBox.BorderColor3 = Color3.fromRGB(80, 120, 200)
searchBox.Text = "🔍 ابحث عن لاعب..."
searchBox.TextColor3 = Color3.new(0.7, 0.7, 0.7)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.ClearTextOnFocus = true

AddLabel(pageTP, "Teleport to Players:", 700)

local playersScroll = Instance.new("ScrollingFrame", pageTP)
playersScroll.Size = UDim2.new(0, 440, 0, 150)
playersScroll.Position = UDim2.new(0, 10, 0, 730)
playersScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
playersScroll.BorderSizePixel = 0
playersScroll.ScrollBarThickness = 6

AddLabel(pageTP, "_________________________________", 890)
AddLabel(pageTP, "Bloodix V6 - Final Edition", 920)
AddLabel(pageTP, "Made for Ultimate Gameplay", 950)

local function refreshPlayersList(searchTerm)
    playersScroll:ClearAllChildren()
    searchTerm = searchTerm or ""
    searchTerm = searchTerm:lower()
    
    local yPos = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (searchTerm == "" or player.Name:lower():find(searchTerm)) then
            local playerFrame = Instance.new("Frame", playersScroll)
            playerFrame.Size = UDim2.new(1, -10, 0, 45)
            playerFrame.Position = UDim2.new(0, 5, 0, yPos)
            playerFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            playerFrame.BorderSizePixel = 1
            
            local playerName = Instance.new("TextLabel", playerFrame)
            playerName.Size = UDim2.new(0, 250, 0, 20)
            playerName.Position = UDim2.new(0, 10, 0, 5)
            playerName.BackgroundTransparency = 1
            playerName.Text = player.Name
            playerName.TextColor3 = Color3.new(1, 1, 1)
            playerName.Font = Enum.Font.Gotham
            playerName.TextSize = 14
            playerName.TextXAlignment = Enum.TextXAlignment.Left
            
            local tpButton = Instance.new("TextButton", playerFrame)
            tpButton.Size = UDim2.new(0, 80, 0, 30)
            tpButton.Position = UDim2.new(1, -170, 0.5, -15)
            tpButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            tpButton.Text = "TP TO"
            tpButton.TextColor3 = Color3.new(1, 1, 1)
            tpButton.Font = Enum.Font.GothamBold
            tpButton.TextSize = 11
            
            tpButton.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = player.Character.HumanoidRootPart.CFrame
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    end
                end
            end)
            
            local bringButton = Instance.new("TextButton", playerFrame)
            bringButton.Size = UDim2.new(0, 80, 0, 30)
            bringButton.Position = UDim2.new(1, -85, 0.5, -15)
            bringButton.BackgroundColor3 = Color3.fromRGB(200, 80, 120)
            bringButton.Text = "BRING"
            bringButton.TextColor3 = Color3.new(1, 1, 1)
            bringButton.Font = Enum.Font.GothamBold
            bringButton.TextSize = 11
            
            bringButton.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                        player.Character.HumanoidRootPart.CFrame = myCFrame + Vector3.new(3, 0, 0)
                    end
                end
            end)
            
            yPos = yPos + 50
        end
    end
    
    playersScroll.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

refreshPlayersList()
Players.PlayerAdded:Connect(function() refreshPlayersList(searchBox.Text) end)
Players.PlayerRemoving:Connect(function() refreshPlayersList(searchBox.Text) end)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    if searchBox.Text ~= "🔍 ابحث عن لاعب..." then
        refreshPlayersList(searchBox.Text)
    end
end)

searchBox.Focused:Connect(function()
    if searchBox.Text == "🔍 ابحث عن لاعب..." then
        searchBox.Text = ""
        searchBox.TextColor3 = Color3.new(1, 1, 1)
    end
end)

searchBox.FocusLost:Connect(function()
    if searchBox.Text == "" then
        searchBox.Text = "🔍 ابحث عن لاعب..."
        searchBox.TextColor3 = Color3.new(0.7, 0.7, 0.7)
        refreshPlayersList()
    end
end)

--========================================================--
--=====================  HACK TAB =======================--
pageHack:ClearAllChildren()

AddLabel(pageHack, "🛠️ ADVANCED TOOLS", 8)

-- MONEY HACK SYSTEM
AddLabel(pageHack, "💰 Money/Currency Hack:", 40)

local detectedCurrencies = {}
local selectedCurrency = nil

local function detectCurrencies()
    detectedCurrencies = {}
    
    -- Method 1: Check LocalPlayer's leaderstats
    if LocalPlayer:FindFirstChild("leaderstats") then
        for _, stat in pairs(LocalPlayer.leaderstats:GetChildren()) do
            if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                table.insert(detectedCurrencies, {
                    Name = stat.Name,
                    Object = stat,
                    Value = stat.Value,
                    Type = "Leaderstats",
                    Path = "LocalPlayer.leaderstats." .. stat.Name
                })
            end
        end
    end
    
    -- Method 2: Check PlayerGui for currency displays
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        for _, gui in pairs(playerGui:GetDescendants()) do
            if gui:IsA("IntValue") or gui:IsA("NumberValue") then
                local name = gui.Name
                if name:lower():find("money") or name:lower():find("cash") or 
                   name:lower():find("coin") or name:lower():find("gold") or
                   name:lower():find("gem") or name:lower():find("credit") then
                    table.insert(detectedCurrencies, {
                        Name = name,
                        Object = gui,
                        Value = gui.Value,
                        Type = "PlayerGui",
                        Path = "PlayerGui..." .. name
                    })
                end
            end
        end
    end
    
    -- Method 3: Check Player's direct children
    for _, obj in pairs(LocalPlayer:GetChildren()) do
        if obj:IsA("IntValue") or obj:IsA("NumberValue") then
            local name = obj.Name
            if name:lower():find("money") or name:lower():find("cash") or 
               name:lower():find("coin") or name:lower():find("gold") then
                table.insert(detectedCurrencies, {
                    Name = name,
                    Object = obj,
                    Value = obj.Value,
                    Type = "Player",
                    Path = "LocalPlayer." .. name
                })
            end
        end
    end
    
    -- Method 4: Check ReplicatedStorage
    local repStorage = game:GetService("ReplicatedStorage")
    for _, obj in pairs(repStorage:GetDescendants()) do
        if obj:IsA("IntValue") or obj:IsA("NumberValue") then
            local name = obj.Name
            if name:lower():find("money") or name:lower():find("cash") or 
               name:lower():find("coin") or name:lower():find("gold") then
                table.insert(detectedCurrencies, {
                    Name = name,
                    Object = obj,
                    Value = obj.Value,
                    Type = "ReplicatedStorage",
                    Path = "ReplicatedStorage..." .. name
                })
            end
        end
    end
    
    -- Method 5: Remote Exploit Scanning (Advanced)
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            if name:find("add") or name:find("give") or name:find("reward") or 
               name:find("money") or name:find("cash") or name:find("earn") then
                table.insert(detectedCurrencies, {
                    Name = "⚠️ Remote: " .. obj.Name,
                    Object = obj,
                    Value = "Exploitable",
                    Type = "Remote",
                    Path = obj:GetFullName()
                })
            end
        end
    end
    
    return detectedCurrencies
end

local currencyStatusLabel = Instance.new("TextLabel", pageHack)
currencyStatusLabel.Size = UDim2.new(0, 420, 0, 25)
currencyStatusLabel.Position = UDim2.new(0, 10, 0, 70)
currencyStatusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
currencyStatusLabel.BorderSizePixel = 1
currencyStatusLabel.BorderColor3 = Color3.fromRGB(80, 120, 200)
currencyStatusLabel.Text = "🔍 Click 'Detect' to find currencies"
currencyStatusLabel.TextColor3 = Color3.new(1, 1, 1)
currencyStatusLabel.Font = Enum.Font.Gotham
currencyStatusLabel.TextSize = 12

local currencyCorner = Instance.new("UICorner", currencyStatusLabel)
currencyCorner.CornerRadius = UDim.new(0, 6)

local detectBtn = Instance.new("TextButton", pageHack)
detectBtn.Size = UDim2.new(0, 200, 0, 35)
detectBtn.Position = UDim2.new(0, 10, 0, 105)
detectBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
detectBtn.Text = "🔍 Detect Currencies"
detectBtn.TextColor3 = Color3.new(1, 1, 1)
detectBtn.Font = Enum.Font.GothamBold
detectBtn.TextSize = 13
detectBtn.BorderSizePixel = 0

local detectCorner = Instance.new("UICorner", detectBtn)
detectCorner.CornerRadius = UDim.new(0, 8)

-- Currency selection dropdown
local currencyDropdown = Instance.new("ScrollingFrame", pageHack)
currencyDropdown.Size = UDim2.new(0, 200, 0, 0)
currencyDropdown.Position = UDim2.new(0, 220, 0, 105)
currencyDropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
currencyDropdown.BorderSizePixel = 1
currencyDropdown.BorderColor3 = Color3.fromRGB(80, 120, 200)
currencyDropdown.ScrollBarThickness = 4
currencyDropdown.Visible = false

local dropdownCorner = Instance.new("UICorner", currencyDropdown)
dropdownCorner.CornerRadius = UDim.new(0, 6)

detectBtn.MouseButton1Click:Connect(function()
    local currencies = detectCurrencies()
    detectedCurrencies = currencies
    
    -- Clear dropdown
    
    currencyDropdown:ClearAllChildren()
    
    if #currencies > 0 then
        currencyStatusLabel.Text = "✅ Found " .. #currencies .. " currencies - Select one:"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        
        -- Show dropdown with all currencies
        currencyDropdown.Visible = true
        currencyDropdown.Size = UDim2.new(0, 200, 0, math.min(#currencies * 35, 140))
        currencyDropdown.CanvasSize = UDim2.new(0, 0, 0, #currencies * 35)
        
        for i, currency in ipairs(currencies) do
            local btn = Instance.new("TextButton", currencyDropdown)
            btn.Size = UDim2.new(1, -5, 0, 30)
            btn.Position = UDim2.new(0, 0, 0, (i-1) * 35)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            btn.Text = currency.Name .. ": " .. currency.Value
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            btn.BorderSizePixel = 0
            
            local btnCorner = Instance.new("UICorner", btn)
            btnCorner.CornerRadius = UDim.new(0, 4)
            
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            end)
            
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            end)
            
            btn.MouseButton1Click:Connect(function()
                selectedCurrency = currency
                currencyStatusLabel.Text = "✅ Selected: " .. currency.Name .. " = " .. currency.Value
                currencyDropdown.Visible = false
                showNotification("تم الاختيار", "تم اختيار " .. currency.Name, 2)
            end)
        end
        
        showNotification("Currencies Found", "Found " .. #currencies .. " currencies!", 3)
    else
        currencyStatusLabel.Text = "❌ No currencies detected in leaderstats"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        currencyDropdown.Visible = false
        showNotification("Detection Failed", "No currencies found", 3)
    end
end)

local amountBox = Instance.new("TextBox", pageHack)
amountBox.Size = UDim2.new(0, 200, 0, 35)
amountBox.Position = UDim2.new(0, 10, 0, 150)
amountBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
amountBox.BorderSizePixel = 1
amountBox.BorderColor3 = Color3.fromRGB(80, 120, 200)
amountBox.PlaceholderText = "Enter amount..."
amountBox.Text = ""
amountBox.TextColor3 = Color3.new(1, 1, 1)
amountBox.Font = Enum.Font.Gotham
amountBox.TextSize = 14

local amountCorner = Instance.new("UICorner", amountBox)
amountCorner.CornerRadius = UDim.new(0, 6)

local addMoneyBtn = Instance.new("TextButton", pageHack)
addMoneyBtn.Size = UDim2.new(0, 200, 0, 35)
addMoneyBtn.Position = UDim2.new(0, 10, 0, 195)
addMoneyBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
addMoneyBtn.Text = "💰 Add Money (إضافة)"
addMoneyBtn.TextColor3 = Color3.new(1, 1, 1)
addMoneyBtn.Font = Enum.Font.GothamBold
addMoneyBtn.TextSize = 14
addMoneyBtn.BorderSizePixel = 0

local addMoneyCorner = Instance.new("UICorner", addMoneyBtn)
addMoneyCorner.CornerRadius = UDim.new(0, 8)

addMoneyBtn.MouseButton1Click:Connect(function()
    local amount = tonumber(amountBox.Text)
    if not amount then
        showNotification("خطأ", "الرجاء إدخال رقم صحيح", 2)
        return
    end
    
    if not selectedCurrency then
        showNotification("خطأ", "الرجاء كشف العملات أولاً", 2)
        return
    end
    
    local oldValue = selectedCurrency.Object.Value
    local success, err = pcall(function()
        if selectedCurrency.Type == "Remote" then
            if selectedCurrency.Object:IsA("RemoteEvent") then
                selectedCurrency.Object:FireServer(amount)
                selectedCurrency.Object:FireServer(amount, "Money")
                selectedCurrency.Object:FireServer(LocalPlayer, amount)
            elseif selectedCurrency.Object:IsA("RemoteFunction") then
                selectedCurrency.Object:InvokeServer(amount)
            end
        elseif selectedCurrency.Object:IsA("IntValue") or selectedCurrency.Object:IsA("NumberValue") then
            selectedCurrency.Object.Value = selectedCurrency.Object.Value + amount
        end
    end)
    
    task.wait(0.1)
    local newValue = selectedCurrency.Object.Value
    
    if success and newValue ~= oldValue then
        selectedCurrency.Value = newValue
        showNotification("نجح!", "تمت إضافة " .. amount .. " | القيمة الجديدة: " .. newValue, 3)
        currencyStatusLabel.Text = "✅ " .. selectedCurrency.Name .. " = " .. newValue .. " (قديم: " .. oldValue .. ")"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif success and newValue == oldValue then
        showNotification("تحذير", "القيمة لم تتغير - اللعبة قد تحتوي على حماية", 3)
        currencyStatusLabel.Text = "⚠️ " .. selectedCurrency.Name .. " = " .. newValue .. " (لم يتغير)"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        showNotification("فشل", "حدث خطأ: " .. tostring(err), 3)
        currencyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Set Money Button (تعيين المال مباشرة)
local setMoneyBtn = Instance.new("TextButton", pageHack)
setMoneyBtn.Size = UDim2.new(0, 200, 0, 35)
setMoneyBtn.Position = UDim2.new(0, 220, 0, 195)
setMoneyBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 60)
setMoneyBtn.Text = "🎯 Set Money (تعيين)"
setMoneyBtn.TextColor3 = Color3.new(1, 1, 1)
setMoneyBtn.Font = Enum.Font.GothamBold
setMoneyBtn.TextSize = 14
setMoneyBtn.BorderSizePixel = 0

local setMoneyCorner = Instance.new("UICorner", setMoneyBtn)
setMoneyCorner.CornerRadius = UDim.new(0, 8)

setMoneyBtn.MouseButton1Click:Connect(function()
    local amount = tonumber(amountBox.Text)
    if not amount then
        showNotification("خطأ", "الرجاء إدخال رقم صحيح", 2)
        return
    end
    
    if not selectedCurrency then
        showNotification("خطأ", "الرجاء كشف العملات أولاً", 2)
        return
    end
    
    local oldValue = selectedCurrency.Object.Value
    local success, err = pcall(function()
        if selectedCurrency.Type == "Remote" then
            if selectedCurrency.Object:IsA("RemoteEvent") then
                selectedCurrency.Object:FireServer(amount)
            elseif selectedCurrency.Object:IsA("RemoteFunction") then
                selectedCurrency.Object:InvokeServer(amount)
            end
        elseif selectedCurrency.Object:IsA("IntValue") or selectedCurrency.Object:IsA("NumberValue") then
            selectedCurrency.Object.Value = amount
        end
    end)
    
    task.wait(0.1)
    local newValue = selectedCurrency.Object.Value
    
    if success and newValue == amount then
        selectedCurrency.Value = newValue
        showNotification("نجح!", "تم تعيين " .. selectedCurrency.Name .. " إلى " .. amount, 3)
        currencyStatusLabel.Text = "✅ " .. selectedCurrency.Name .. " = " .. newValue .. " (قديم: " .. oldValue .. ")"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif success and newValue ~= amount then
        showNotification("تحذير", "القيمة لم تتغير كما متوقع - حماية محتملة", 3)
        currencyStatusLabel.Text = "⚠️ " .. selectedCurrency.Name .. " = " .. newValue .. " (محاولة: " .. amount .. ")"
        currencyStatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        showNotification("فشل", "حدث خطأ: " .. tostring(err), 3)
        currencyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Infinite Money Toggle (تهكير لا نهائي)
local infiniteMoneyToggle = AddToggle(pageHack, "♾️ Infinite Money Loop", 240, false, function(s)
    if s and selectedCurrency then
        showNotification("تفعيل", "تم تفعيل المال اللانهائي", 2)
        task.spawn(function()
            while infiniteMoneyToggle and s do
                task.wait(0.5)
                if selectedCurrency and selectedCurrency.Object then
                    pcall(function()
                        if selectedCurrency.Object:IsA("IntValue") or selectedCurrency.Object:IsA("NumberValue") then
                            local targetAmount = tonumber(amountBox.Text) or 999999999
                            if selectedCurrency.Object.Value < targetAmount then
                                selectedCurrency.Object.Value = targetAmount
                            end
                        end
                    end)
                end
            end
        end)
    else
        showNotification("إيقاف", "تم إيقاف المال اللانهائي", 2)
    end
end)

AddLabel(pageHack, "⚠️ ملاحظة: بعض الألعاب لديها حماية ضد التهكير", 290)
AddLabel(pageHack, "💡 نظام التهكير المطور يحاول اختراق سيرفر اللعبة (Server-Side)", 310)
AddLabel(pageHack, "🚀 إذا ظهر 'Remote' في القائمة، فمن المحتمل أن يكون المال حقيقياً", 330)

AddLabel(pageHack, "Administration Tools:", 360)

-- Unlock All Tools Button
local unlockToolsBtn = Instance.new("TextButton", pageHack)
unlockToolsBtn.Size = UDim2.new(0, 200, 0, 35)
unlockToolsBtn.Position = UDim2.new(0, 10, 0, 390)
unlockToolsBtn.BackgroundColor3 = Color3.fromRGB(200, 160, 40)
unlockToolsBtn.Text = "🔓 Unlock All Tools (فتح الأدوات)"
unlockToolsBtn.TextColor3 = Color3.new(1, 1, 1)
unlockToolsBtn.Font = Enum.Font.GothamBold
unlockToolsBtn.TextSize = 13
unlockToolsBtn.BorderSizePixel = 0

local unlockCorner = Instance.new("UICorner", unlockToolsBtn)
unlockCorner.CornerRadius = UDim.new(0, 8)

unlockToolsBtn.MouseButton1Click:Connect(function()
    local count = 0
    local function getTools(parent)
        for _, obj in pairs(parent:GetDescendants()) do
            if obj:IsA("Tool") or obj:IsA("HopperBin") then
                local clone = obj:Clone()
                clone.Parent = LocalPlayer.Backpack
                count = count + 1
            end
        end
    end
    
    getTools(game:GetService("ReplicatedStorage"))
    getTools(game:GetService("Lighting"))
    getTools(game:GetService("StarterPack"))
    
    showNotification("نجح!", "تم الحصول على " .. count .. " أداة بنجاح!", 3)
end)

local refreshBtn = Instance.new("TextButton", pageHack)
refreshBtn.Size = UDim2.new(0, 200, 0, 35)
refreshBtn.Position = UDim2.new(0, 220, 0, 390)
refreshBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
refreshBtn.Text = "🔄 Refresh Players"
refreshBtn.TextColor3 = Color3.new(1, 1, 1)
refreshBtn.Font = Enum.Font.Gotham
refreshBtn.TextSize = 13
refreshBtn.BorderSizePixel = 0

local refreshCorner = Instance.new("UICorner", refreshBtn)
refreshCorner.CornerRadius = UDim.new(0, 8)

refreshBtn.MouseButton1Click:Connect(function()
    for player, _ in pairs(Drawn.lines) do
        if Drawn.lines[player] then Drawn.lines[player]:Remove() end
        if Drawn.boxes[player] then Drawn.boxes[player]:Remove() end
        if Drawn.nameTexts[player] then Drawn.nameTexts[player]:Remove() end
        if Drawn.healthTexts[player] then Drawn.healthTexts[player]:Remove() end
    end
    
    Drawn.lines = {}
    Drawn.boxes = {}
    Drawn.nameTexts = {}
    Drawn.healthTexts = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end
    
    if HeadSizeSettings.Enabled then
        applyBigHeadsToAll()
    end
end)

local fixESPBtn = Instance.new("TextButton", pageHack)
fixESPBtn.Size = UDim2.new(0, 200, 0, 35)
fixESPBtn.Position = UDim2.new(0, 10, 0, 435)
fixESPBtn.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
fixESPBtn.Text = "🔧 Fix ESP System"
fixESPBtn.TextColor3 = Color3.new(1, 1, 1)
fixESPBtn.Font = Enum.Font.Gotham
fixESPBtn.TextSize = 13

fixESPBtn.MouseButton1Click:Connect(function()
    for player, _ in pairs(Drawn.lines) do
        if player and player.Parent then
            local espDrawings = {
                line = Drawn.lines[player],
                box = Drawn.boxes[player],
                name = Drawn.nameTexts[player],
                health = Drawn.healthTexts[player]
            }
            updateESPForPlayer(player, espDrawings)
        end
    end
end)

local fixHeadsBtn = Instance.new("TextButton", pageHack)
fixHeadsBtn.Size = UDim2.new(0, 200, 0, 35)
fixHeadsBtn.Position = UDim2.new(0, 220, 0, 435)
fixHeadsBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 200)
fixHeadsBtn.Text = "👑 Fix Big Heads"
fixHeadsBtn.TextColor3 = Color3.new(1, 1, 1)
fixHeadsBtn.Font = Enum.Font.Gotham
fixHeadsBtn.TextSize = 13
fixHeadsBtn.BorderSizePixel = 0

local fixHeadsCorner = Instance.new("UICorner", fixHeadsBtn)
fixHeadsCorner.CornerRadius = UDim.new(0, 8)

fixHeadsBtn.MouseButton1Click:Connect(function()
    if HeadSizeSettings.Enabled then
        applyBigHeadsToAll()
    end
end)

AddLabel(pageHack, "System Information:", 470)

local infoFrame = Instance.new("Frame", pageHack)
infoFrame.Size = UDim2.new(0, 440, 0, 60)
infoFrame.Position = UDim2.new(0, 10, 0, 500)
infoFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
infoFrame.BorderSizePixel = 0

local infoFrameCorner = Instance.new("UICorner", infoFrame)
infoFrameCorner.CornerRadius = UDim.new(0, 8)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1, 0, 1, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "Loading system info..."
infoText.TextColor3 = Color3.fromRGB(180, 180, 220)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 12

task.spawn(function()
    while true do
        task.wait(1)
        local playerCount = #Players:GetPlayers()
        local espCount = 0
        for _ in pairs(Drawn.lines) do espCount = espCount + 1 end
        
        local headsCount = 0
        for _ in pairs(ModifiedHeads) do headsCount = headsCount + 1 end
        
        infoText.Text = string.format("Players: %d | ESP: %d | Big Heads: %d\nESP: %s | Big Heads: %s",
            playerCount,
            espCount,
            headsCount,
            ESPSettings.Enabled and "ON" or "OFF",
            HeadSizeSettings.Enabled and "ON" or "OFF"
        )
    end
end)

--========================================================--
--====================  TOGGLE GUI WITH P =================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.P then
        GUI_VISIBLE = not GUI_VISIBLE
        Main.Visible = GUI_VISIBLE
        
        print("Bloodix Panel: " .. (GUI_VISIBLE and "SHOWN" or "HIDDEN"))
    end
end)

Main.Visible = GUI_VISIBLE

--========================================================--
--====================  FINAL MESSAGE ====================--
print("======================================================")
print("🔥 BLOODIX V6 ULTIMATE - تم التحميل بنجاح!")
print("======================================================")
print("🎮 التحكم:")
print("   • اضغط P لفتح/إغلاق لوحة التحكم")
print("   • زر الماوس الأيمن للتصويب التلقائي")
print("")
print("✅ جميع الأنظمة تعمل:")
print("   • 🎯 نظام التصويب - كامل")
print("   • 👁️ نظام ESP - يتحدث كل 0.1 ثانية")
print("   • 👑 نظام الرؤوس الكبيرة - يتحدث كل 2 ثانية")
print("   • 👤 أدوات اللاعب - السرعة، القفز، NoClip، الطيران")
print("   • 📍 نظام الانتقال - يعمل بشكل مثالي")
print("   • 💰 نظام تهكير المال - محسّن ومطور")
print("   • 🛠️ أدوات الإدارة - أزرار التحديث والإصلاح")
print("======================================================")
print("💡 نصائح:")
print("   • نظام المال يعمل على Client-Side فقط")
print("   • استخدم زر Detect لكشف العملات في اللعبة")
print("   • يمكنك إضافة أو تعيين المال مباشرة")
print("   • ميزة Infinite Money تحافظ على المال ثابتاً")
print("======================================================")

-- Enhanced notification with Arabic support
showNotification("تم التحميل بنجاح!", "BLOODIX V6 ULTIMATE - جميع الأنظمة تعمل بشكل مثالي!", 5)

--========================================================--
--==================  EXTRA FEATURES TAB ================--
pageExtra:ClearAllChildren()

AddLabel(pageExtra, "✨ EXTRA FEATURES - ميزات إضافية", 8)

-- Rainbow Mode
local rainbowToggle = AddToggle(pageExtra, "🌈 Rainbow Mode", 40, false, function(s)
    NewFeatures.RainbowMode = s
end)

local rainbowSpeedSlider = AddSlider(pageExtra, "Rainbow Speed", 80, 0.1, 2, NewFeatures.RainbowSpeed, function(v)
    NewFeatures.RainbowSpeed = v
end)

-- Anti-AFK
local antiAFKToggle = AddToggle(pageExtra, "⏰ Anti-AFK", 130, false, function(s)
    NewFeatures.AntiAFK = s
end)

-- X-Ray Vision
local xrayToggle = AddToggle(pageExtra, "👓 X-Ray Vision", 170, false, function(s)
    NewFeatures.XRay = s
    if s then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name ~= "Terrain" then
                obj.LocalTransparencyModifier = 0.7
            end
        end
    else
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.LocalTransparencyModifier = 0
            end
        end
    end
end)

-- Auto Farm Coins
local autoFarmToggle = AddToggle(pageExtra, "💰 Auto Farm Coins", 210, false, function(s)
    NewFeatures.AutoFarm = s
end)

-- Kill Aura
local killAuraToggle = AddToggle(pageExtra, "⚔️ Kill Aura (Training)", 250, false, function(s)
    NewFeatures.KillAura = s
end)

-- Freeze All Players
local freezeAllToggle = AddToggle(pageExtra, "❄️ Freeze All Players", 290, false, function(s)
    NewFeatures.FreezeAll = s
end)

-- Character Size (Fixed to work properly and be visible to all)
AddLabel(pageExtra, "حجم الشخصية:", 330)

local sizeSlider = AddSlider(pageExtra, "Character Size", 360, 0.1, 10, 1, function(v)
    NewFeatures.CharacterSize = v
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            pcall(function()
                if humanoid:FindFirstChild("BodyDepthScale") then
                    humanoid.BodyDepthScale.Value = v
                end
                if humanoid:FindFirstChild("BodyWidthScale") then
                    humanoid.BodyWidthScale.Value = v
                end
                if humanoid:FindFirstChild("BodyHeightScale") then
                    humanoid.BodyHeightScale.Value = v
                end
                if humanoid:FindFirstChild("HeadScale") then
                    humanoid.HeadScale.Value = v
                end
            end)
        end
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                pcall(function()
                    part.Size = part.Size * v / (NewFeatures.CharacterSize or 1)
                end)
            end
        end
    end
end)

-- Loop Bring All
AddToggle(pageExtra, "� Loop Bring All", 400, false, function(s)
    NewFeatures.LoopBringAll = s
end)

AddLabel(pageExtra, "معلومات الميزات:", 520)

local infoLabel = Instance.new("TextLabel", pageExtra)
infoLabel.Size = UDim2.new(0, 440, 0, 120)
infoLabel.Position = UDim2.new(0, 10, 0, 560)
infoLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
infoLabel.BorderSizePixel = 1
infoLabel.BorderColor3 = Color3.fromRGB(60, 60, 65)
infoLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 12
infoLabel.TextWrapped = true
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.Text = [[🌈 Rainbow Mode: يغير ألوان الواجهة بشكل قوس قزح
⏰ Anti-AFK: يمنع الطرد من اللعبة
👓 X-Ray: رؤية من خلال الجدران
💰 Auto Farm: جمع العملات تلقائياً
⚔️ Kill Aura: هجوم تلقائي (تدريبي)]]

-- Rainbow Mode System
task.spawn(function()
    local hue = 0
    while true do
        task.wait(0.03)
        if NewFeatures.RainbowMode then
            hue = (hue + NewFeatures.RainbowSpeed) % 360
            local color = Color3.fromHSV(hue / 360, 1, 1)
            
            Title.BackgroundColor3 = color
            for _, tab in pairs({tabAimbot, tabESP, tabPlayer, tabTP, tabHack, tabExtra}) do
                tab.BackgroundColor3 = color
            end
        else
            Title.BackgroundColor3 = Color3.fromRGB(18,18,20)
            for _, tab in pairs({tabAimbot, tabESP, tabPlayer, tabTP, tabHack, tabExtra}) do
                tab.BackgroundColor3 = Color3.fromRGB(40,40,42)
            end
        end
    end
end)

-- Anti-AFK System
task.spawn(function()
    while true do
        task.wait(120)
        if NewFeatures.AntiAFK then
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end
end)

-- Auto Farm System
task.spawn(function()
    while true do
        task.wait(0.5)
        if NewFeatures.AutoFarm and LocalPlayer.Character then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("coin") or obj.Name:lower():find("money") or obj.Name:lower():find("cash") then
                    if obj:IsA("BasePart") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (obj.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 50 then
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj, 0)
                            task.wait(0.1)
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj, 1)
                        end
                    end
                end
            end
        end
    end
end)

-- Kill Aura System (Improved & Universal)
task.spawn(function()
    while true do
        task.wait(0.1)
        if NewFeatures.KillAura and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- 1. Target Players
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and isEnemy(player) then
                        local enemyHRP = player.Character:FindFirstChild("HumanoidRootPart")
                        local enemyHum = player.Character:FindFirstChild("Humanoid")
                        if enemyHRP and enemyHum and enemyHum.Health > 0 then
                            local distance = (hrp.Position - enemyHRP.Position).Magnitude
                            if distance < 20 then
                                -- Try multiple methods to damage
                                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                                if tool then
                                    tool:Activate()
                                    -- Fire Touch Interest on all enemy parts
                                    for _, part in pairs(player.Character:GetChildren()) do
                                        if part:IsA("BasePart") then
                                            firetouchinterest(part, tool.Handle, 0)
                                            firetouchinterest(part, tool.Handle, 1)
                                        end
                                    end
                                end
                                
                                -- Try remote events if they exist (common names)
                                pcall(function()
                                    local events = {workspace:FindFirstChild("Remote"), game.ReplicatedStorage:FindFirstChild("Remote")}
                                    for _, folder in pairs(events) do
                                        if folder then
                                            local attack = folder:FindFirstChild("Attack") or folder:FindFirstChild("Hit")
                                            if attack and attack:IsA("RemoteEvent") then
                                                attack:FireServer(player.Character)
                                            end
                                        end
                                    end
                                end)
                            end
                        end
                    end
                end
                
                -- 2. Target Mobs/NPCs (Generic detection)
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Humanoid") and obj.Parent ~= LocalPlayer.Character and not Players:GetPlayerFromCharacter(obj.Parent) then
                        local mobHRP = obj.Parent:FindFirstChild("HumanoidRootPart") or obj.Parent:FindFirstChild("Head")
                        if mobHRP and obj.Health > 0 then
                            local distance = (hrp.Position - mobHRP.Position).Magnitude
                            if distance < 20 then
                                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                                if tool then
                                    tool:Activate()
                                    if tool:FindFirstChild("Handle") then
                                        firetouchinterest(mobHRP, tool.Handle, 0)
                                        firetouchinterest(mobHRP, tool.Handle, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

--========================================================--
--===============  INNOVATIVE FEATURES TAB ==============--
pageInnovative:ClearAllChildren()
AddLabel(pageInnovative, "🚀 INNOVATIVE - ميزات مبتكرة", 8)

AddToggle(pageInnovative, "👻 Ghost Mode", 40, false, function(s) InnovativeFeatures.GhostMode = s end)
AddToggle(pageInnovative, "✨ Teleport Trail", 80, false, function(s) InnovativeFeatures.TeleportTrail = s end)
AddToggle(pageInnovative, "🛡️ Auto Dodge", 120, false, function(s) InnovativeFeatures.AutoDodge = s end)
AddToggle(pageInnovative, "🔵 Shield Bubble", 160, false, function(s) InnovativeFeatures.ShieldBubble = s end)
AddToggle(pageInnovative, "💨 Speed Lines", 200, false, function(s) InnovativeFeatures.SpeedLines = s end)
AddToggle(pageInnovative, "⬆️ Double Jump", 240, false, function(s) InnovativeFeatures.DoubleJump = s end)
AddToggle(pageInnovative, "🧗 Wall Run", 280, false, function(s) InnovativeFeatures.WallRun = s end)
AddToggle(pageInnovative, "💫 Air Dash (Q)", 320, false, function(s) InnovativeFeatures.AirDash = s end)
AddToggle(pageInnovative, "🧲 Magnet Mode", 360, false, function(s) InnovativeFeatures.MagnetMode = s end)
AddToggle(pageInnovative, "⏱️ Time Slow", 400, false, function(s) InnovativeFeatures.TimeManipulation = s end)

--========================================================--
--===============  CLASSIC FEATURES TAB =================--
pageClassic:ClearAllChildren()
AddLabel(pageClassic, "🎮 CLASSIC - ميزات كلاسيكية", 8)

AddToggle(pageClassic, "♾️ Infinite Jump", 40, false, function(s) ClassicFeatures.InfiniteJump = s end)
AddToggle(pageClassic, "🛡️ God Mode", 80, false, function(s)
    ClassicFeatures.GodMode = s
    if s then
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then
                hum.Health = hum.MaxHealth
                if GodModeConnection then GodModeConnection:Disconnect() end
                GodModeConnection = hum.HealthChanged:Connect(function(health)
                    if ClassicFeatures.GodMode and health < hum.MaxHealth then
                        task.wait()
                        hum.Health = hum.MaxHealth
                    end
                end)
            end
        end
    else
        if GodModeConnection then
            GodModeConnection:Disconnect()
            GodModeConnection = nil
        end
    end
end)
AddToggle(pageClassic, "🌫️ Remove Fog", 120, false, function(s)
    ClassicFeatures.RemoveFog = s
    Lighting.FogEnd = s and 100000 or 9999
end)
AddToggle(pageClassic, "💡 Fullbright", 160, false, function(s)
    ClassicFeatures.Fullbright = s
    if s then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)
AddToggle(pageClassic, "🖱️ Click TP", 200, false, function(s) ClassicFeatures.ClickTP = s end)
AddToggle(pageClassic, "🌀 Spin Bot", 240, false, function(s) ClassicFeatures.SpinBot = s end)
AddToggle(pageClassic, "🐰 Bunnyhop", 280, false, function(s) ClassicFeatures.Bunnyhop = s end)
AddToggle(pageClassic, "🏃 Auto Sprint", 320, false, function(s) ClassicFeatures.AutoSprint = s end)
AddToggle(pageClassic, "🪂 No Fall Damage", 360, false, function(s) ClassicFeatures.NoFall = s end)
AddToggle(pageClassic, "🪜 Fast Ladder", 400, false, function(s) ClassicFeatures.FastLadder = s end)

--========================================================--
--===============  VISUAL FEATURES TAB ==================--
pageVisual:ClearAllChildren()
AddLabel(pageVisual, "👁️ VISUAL - ميزات بصرية", 8)

AddToggle(pageVisual, "🏊 Fast Swim", 40, false, function(s) ClassicFeatures.SwimSpeed = s end)
AddToggle(pageVisual, "⚡ Instant Respawn", 80, false, function(s) ClassicFeatures.InstantRespawn = s end)
AddToggle(pageVisual, "📷 Free Cam", 120, false, function(s) ClassicFeatures.FreeCam = s end)
AddToggle(pageVisual, "👤 Third Person", 160, false, function(s)
    ClassicFeatures.ThirdPerson = s
    if s then
        LocalPlayer.CameraMaxZoomDistance = 50
        LocalPlayer.CameraMinZoomDistance = 10
    else
        LocalPlayer.CameraMaxZoomDistance = 128
        LocalPlayer.CameraMinZoomDistance = 0.5
    end
end)

--========================================================--
--============  INNOVATIVE FEATURES SYSTEMS =============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if InnovativeFeatures.GhostMode and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0.5
                    part.CanCollide = false
                end
            end
        end
    end
end)

local trailParts = {}
task.spawn(function()
    while true do
        task.wait(0.1)
        if InnovativeFeatures.TeleportTrail and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local trail = Instance.new("Part")
                trail.Size = Vector3.new(2, 2, 2)
                trail.Position = hrp.Position
                trail.Anchored = true
                trail.CanCollide = false
                trail.Material = Enum.Material.Neon
                trail.Color = Color3.fromRGB(0, 255, 255)
                trail.Transparency = 0.5
                trail.Parent = workspace
                task.delay(2, function() trail:Destroy() end)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if InnovativeFeatures.AutoDodge and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name:lower():find("projectile") or obj.Name:lower():find("bullet")) then
                        if (obj.Position - hrp.Position).Magnitude < 20 then
                            hrp.CFrame = hrp.CFrame + (hrp.Position - obj.Position).Unit * 5
                        end
                    end
                end
            end
        end
    end
end)

local shieldBubble = nil
task.spawn(function()
    while true do
        task.wait(0.1)
        if InnovativeFeatures.ShieldBubble and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not shieldBubble then
                shieldBubble = Instance.new("Part")
                shieldBubble.Shape = Enum.PartType.Ball
                shieldBubble.Size = Vector3.new(10, 10, 10)
                shieldBubble.Transparency = 0.7
                shieldBubble.Material = Enum.Material.ForceField
                shieldBubble.Color = Color3.fromRGB(0, 150, 255)
                shieldBubble.CanCollide = false
                shieldBubble.Anchored = true
                shieldBubble.Parent = workspace
            end
            if shieldBubble and hrp then shieldBubble.Position = hrp.Position end
        elseif shieldBubble then
            shieldBubble:Destroy()
            shieldBubble = nil
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if InnovativeFeatures.SpeedLines and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp.Velocity.Magnitude > 20 then
                local line = Instance.new("Part")
                line.Size = Vector3.new(0.5, 0.5, 3)
                line.Position = hrp.Position + Vector3.new(math.random(-5, 5), math.random(-2, 2), math.random(-5, 5))
                line.Anchored = true
                line.CanCollide = false
                line.Material = Enum.Material.Neon
                line.Color = Color3.fromRGB(255, 255, 0)
                line.Transparency = 0.3
                line.Parent = workspace
                task.delay(0.5, function() line:Destroy() end)
            end
        end
    end
end)

local doubleJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
    if InnovativeFeatures.DoubleJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum and hum:GetState() == Enum.HumanoidStateType.Freefall and not doubleJumpEnabled then
            doubleJumpEnabled = true
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            task.delay(0.3, function() doubleJumpEnabled = false end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if InnovativeFeatures.WallRun and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum:GetState() == Enum.HumanoidStateType.Freefall then
                local ray = Ray.new(hrp.Position, hrp.CFrame.RightVector * 3)
                local hit = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                if hit then hrp.Velocity = Vector3.new(hrp.Velocity.X, 20, hrp.Velocity.Z) end
            end
        end
    end
end)

local airDashCooldown = false
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Q and InnovativeFeatures.AirDash and not airDashCooldown and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            airDashCooldown = true
            hrp.Velocity = hrp.CFrame.LookVector * 100
            task.delay(1, function() airDashCooldown = false end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.3)
        if InnovativeFeatures.MagnetMode and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("pickup")) then
                        if (obj.Position - hrp.Position).Magnitude < 30 then
                            obj.CFrame = CFrame.new(hrp.Position)
                        end
                    end
                end
            end
        end
    end
end)

--========================================================--
--============  CLASSIC FEATURES SYSTEMS ================--
UserInputService.JumpRequest:Connect(function()
    if ClassicFeatures.InfiniteJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.GodMode and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.Health = hum.MaxHealth end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    if ClassicFeatures.GodMode then
        task.wait(1)
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.Health = hum.MaxHealth
            if GodModeConnection then GodModeConnection:Disconnect() end
            GodModeConnection = hum.HealthChanged:Connect(function(health)
                if ClassicFeatures.GodMode and health < hum.MaxHealth then
                    task.wait()
                    hum.Health = hum.MaxHealth
                end
            end)
        end
    end
end)

local mouse = LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    if ClassicFeatures.ClickTP and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and mouse.Target then
            hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.03)
        if ClassicFeatures.SpinBot and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(300), 0) end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.Bunnyhop and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.AutoSprint and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = 32 end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.NoFall and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.FastLadder and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum and hum:GetState() == Enum.HumanoidStateType.Climbing then
                hum.ClimbSpeed = 50
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if ClassicFeatures.SwimSpeed and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum and hum:GetState() == Enum.HumanoidStateType.Swimming then
                hum.WalkSpeed = 100
            end
        end
    end
end)

--========================================================--
--============  FREEZE ALL PLAYERS SYSTEM ===============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if NewFeatures.FreezeAll then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = true
                    end
                end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = false
                    end
                end
            end
        end
    end
end)

--========================================================--
--============  LOOP BRING ALL SYSTEM ===================--
task.spawn(function()
    while true do
        task.wait(0.5)
        if NewFeatures.LoopBringAll and LocalPlayer.Character then
            local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = myHRP.CFrame + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
                        end
                    end
                end
            end
        end
    end
end)

--========================================================--
--============  CHARACTER SIZE SYSTEM ===================--
task.spawn(function()
    while true do
        task.wait(0.5)
        if NewFeatures.CharacterSize ~= 1 and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                pcall(function()
                    if humanoid:FindFirstChild("BodyDepthScale") then
                        humanoid.BodyDepthScale.Value = NewFeatures.CharacterSize
                    end
                    if humanoid:FindFirstChild("BodyWidthScale") then
                        humanoid.BodyWidthScale.Value = NewFeatures.CharacterSize
                    end
                    if humanoid:FindFirstChild("BodyHeightScale") then
                        humanoid.BodyHeightScale.Value = NewFeatures.CharacterSize
                    end
                    if humanoid:FindFirstChild("HeadScale") then
                        humanoid.HeadScale.Value = NewFeatures.CharacterSize
                    end
                end)
            end
        end
    end
end)

--========================================================--
--==================  COMBAT TAB (13 Features) ==========--
pageCombat:ClearAllChildren()
AddLabel(pageCombat, " COMBAT FEATURES - ميزات القتال", 8)

AddToggle(pageCombat, " Auto Parry", 40, false, function(s) CombatFeatures.AutoParry = s end)
AddToggle(pageCombat, " Auto Block", 80, false, function(s) CombatFeatures.AutoBlock = s end)
AddToggle(pageCombat, " Combo Attack", 120, false, function(s) CombatFeatures.ComboAttack = s end)
AddToggle(pageCombat, " Critical Hit", 160, false, function(s) CombatFeatures.CriticalHit = s end)
AddToggle(pageCombat, " Life Steal", 200, false, function(s) CombatFeatures.LifeSteal = s end)
AddToggle(pageCombat, " Knockback Boost", 240, false, function(s) CombatFeatures.Knockback = s end)
AddToggle(pageCombat, " Rapid Fire", 280, false, function(s) CombatFeatures.RapidFire = s end)
AddToggle(pageCombat, " Infinite Ammo", 320, false, function(s) CombatFeatures.InfiniteAmmo = s end)
AddToggle(pageCombat, " No Recoil", 360, false, function(s) CombatFeatures.NoRecoil = s end)
AddToggle(pageCombat, " Auto Reload", 400, false, function(s) CombatFeatures.AutoReload = s end)
AddToggle(pageCombat, " Explosive Bullets", 440, false, function(s) CombatFeatures.ExplosiveBullets = s end)
AddToggle(pageCombat, " Aimlock", 480, false, function(s) CombatFeatures.Aimlock = s end)
AddToggle(pageCombat, " Silent Aim", 520, false, function(s) CombatFeatures.SilentAim = s end)

--========================================================--
--==================  UTILITY TAB (12 Features) ==========--
pageUtility:ClearAllChildren()
AddLabel(pageUtility, " UTILITY FEATURES - ميزات الأدوات", 8)

AddToggle(pageUtility, " ESP Items", 40, false, function(s) UtilityFeatures.ESPItems = s end)
AddToggle(pageUtility, " ESP Chests", 80, false, function(s) UtilityFeatures.ESPChests = s end)
AddToggle(pageUtility, " Auto Collect", 120, false, function(s) UtilityFeatures.AutoCollect = s end)
AddToggle(pageUtility, " Auto Quest", 160, false, function(s) UtilityFeatures.AutoQuest = s end)
AddToggle(pageUtility, " Auto Sell", 200, false, function(s) UtilityFeatures.AutoSell = s end)
AddToggle(pageUtility, " Auto Craft", 240, false, function(s) UtilityFeatures.AutoCraft = s end)
AddToggle(pageUtility, " TP to NPC", 280, false, function(s) UtilityFeatures.TeleportToNPC = s end)
AddToggle(pageUtility, " Speed Hack", 320, false, function(s) UtilityFeatures.SpeedHack = s end)
AddToggle(pageUtility, " NoClip Walls", 360, false, function(s) UtilityFeatures.NoClipWalls = s end)
AddToggle(pageUtility, " Infinite Zoom", 400, false, function(s) UtilityFeatures.InfiniteZoom = s end)
AddToggle(pageUtility, " X-Ray Vision", 440, false, function(s) UtilityFeatures.Xray = s end)
AddToggle(pageUtility, " Radar", 480, false, function(s) UtilityFeatures.Radar = s end)
AddToggle(pageUtility, " 🛡️ Anti-AFK", 520, false, function(s) UtilityFeatures.AntiAFK = s end)
AddButton(pageUtility, " 🔄 Server Hopper", 560, function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
    local _success, result = pcall(function() return Http:JSONDecode(game:HttpGetAsync(Api)) end)
    if _success then
        for _, s in pairs(result.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TPS:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                break
            end
        end
    end
end)
AddButton(pageUtility, " 🚪 Rejoin Server", 600, function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

AddToggle(pageUtility, " 🌌 Anti-Void", 640, false, function(s) UtilityFeatures.AntiVoid = s end)
AddButton(pageUtility, " 🚀 FPS Booster", 680, function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
    showNotification("Bloodix", "FPS Boost Applied! Textures removed.", 3)
end)

--========================================================--
--==================  REAL HACKS TAB  ====================--
pageReal:ClearAllChildren()
AddLabel(pageReal, "💎 REAL HACKS - ميزات حقيقية متطورة", 8)

AddToggle(pageReal, "💰 Real Auto-Farm (TP)", 40, false, function(s) UtilityFeatures.TeleportCollect = s end)
AddToggle(pageReal, "📦 Auto Proximity Prompt", 80, false, function(s) UtilityFeatures.AutoProximity = s end)
AddToggle(pageReal, "✨ Real Auto Collect", 120, false, function(s) UtilityFeatures.AutoCollect = s end)

AddLabel(pageReal, "🛍️ ROBUX ITEMS - أغراض روبوكس (محلي)", 160)
AddTextBox(pageReal, "Asset ID:", 190, "0", function(v) UtilityFeatures.WearID = tonumber(v) or 0 end)
AddButton(pageReal, "👕 Wear Item Now", 230, function()
    if UtilityFeatures.WearID > 0 then
        local id = UtilityFeatures.WearID
        pcall(function()
            local asset = game:GetObjects("rbxassetid://" .. id)[1]
            if asset then
                asset.Parent = LocalPlayer.Character
            end
        end)
        showNotification("Item Applied", "Wearing asset ID: " .. id, 3)
    end
end)

AddLabel(pageReal, "💸 WEALTH SIMULATOR - محاكي الثراء (وهمي)", 280)
AddSlider(pageReal, "Fake Money Amount", 310, 0, 1000000, 1000, function(v)
    -- This is educational: explaining that client-side changes are visual
    UtilityFeatures.FakeMoneyValue = v
    showNotification("Visual Update", "Client-side money set to: " .. v, 2)
end)

task.spawn(function()
    while true do
        task.wait(1)
        if UtilityFeatures.FakeMoneyValue and UtilityFeatures.FakeMoneyValue > 0 then
            pcall(function()
                for _, label in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if label:IsA("TextLabel") and (label.Text:find("$") or label.Name:lower():find("money") or label.Name:lower():find("cash")) then
                        label.Text = "$" .. tostring(math.floor(UtilityFeatures.FakeMoneyValue))
                    end
                end
            end)
        end
    end
end)

--========================================================--
--==================  TROLL TAB (13 Features) ============--
pageTroll:ClearAllChildren()
AddLabel(pageTroll, " TROLL FEATURES - ميزات المقالب", 8)

AddToggle(pageTroll, " Fling Players", 40, false, function(s) TrollFeatures.FlingPlayers = s end)
AddToggle(pageTroll, " Orbit Players", 80, false, function(s) TrollFeatures.OrbitPlayers = s end)
AddToggle(pageTroll, " Attach to Player", 120, false, function(s) TrollFeatures.AttachToPlayer = s end)
AddToggle(pageTroll, " Mirror Player", 160, false, function(s) TrollFeatures.MirrorPlayer = s end)
AddToggle(pageTroll, " Invisible Char", 200, false, function(s) TrollFeatures.InvisibleChar = s end)
AddToggle(pageTroll, " Giant Character", 240, false, function(s) TrollFeatures.GiantChar = s end)
AddToggle(pageTroll, " Tiny Character", 280, false, function(s) TrollFeatures.TinyChar = s end)
AddToggle(pageTroll, " Rainbow Char", 320, false, function(s) TrollFeatures.RainbowChar = s end)
AddToggle(pageTroll, " Spin Character", 360, false, function(s) TrollFeatures.SpinChar = s end)
AddToggle(pageTroll, " Vibrate Char", 400, false, function(s) TrollFeatures.VibrateChar = s end)
AddToggle(pageTroll, " Flash Character", 440, false, function(s) TrollFeatures.FlashChar = s end)
AddToggle(pageTroll, " Glitch Effect", 480, false, function(s) TrollFeatures.GlitchChar = s end)
AddToggle(pageTroll, " Clone Character", 520, false, function(s) TrollFeatures.CloneChar = s end)

--========================================================--
--============  COMBAT FEATURES SYSTEMS =================--
task.spawn(function()
    while true do
        task.wait(0.1)
        if CombatFeatures.AutoParry and LocalPlayer.Character then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local tool = player.Character:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Handle") then
                        local myChar = LocalPlayer.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            local distance = (myChar.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if distance < 10 then
                                local myTool = myChar:FindFirstChildOfClass("Tool")
                                if myTool then myTool:Activate() end
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if CombatFeatures.RapidFire and LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end
end)

--========================================================--
--============  MOVEMENT FEATURES SYSTEMS ===============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if MovementFeatures.SuperSpeed and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = MovementFeatures.SpeedValue end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if MovementFeatures.WaterWalk and LocalPlayer.Character then
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Water" then
                    part.CanCollide = true
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if MovementFeatures.AntiGravity and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bg = hrp:FindFirstChild("AntiGravBG") or Instance.new("BodyVelocity", hrp)
                bg.Name = "AntiGravBG"
                bg.Velocity = Vector3.new(0, 50, 0)
                bg.MaxForce = Vector3.new(0, 4000, 0)
            end
        else
            if LocalPlayer.Character then
                local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and hrp:FindFirstChild("AntiGravBG") then
                    hrp.AntiGravBG:Destroy()
                end
            end
        end
    end
end)

--========================================================--
--============  UTILITY FEATURES SYSTEMS ================--
task.spawn(function()
    while true do
        task.wait(0.5)
        if UtilityFeatures.AutoCollect and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("orb")) then
                        if (obj.Position - hrp.Position).Magnitude < 50 then
                            obj.CFrame = hrp.CFrame
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if UtilityFeatures.InfiniteZoom then
            LocalPlayer.CameraMaxZoomDistance = 9999
        else
            LocalPlayer.CameraMaxZoomDistance = 128
        end
    end
end)

--========================================================--
--============  TROLL FEATURES SYSTEMS ==================--
-- Improved Powerful Fling
task.spawn(function()
    while true do
        task.wait(0.05)
        if TrollFeatures.FlingPlayers and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Store original CFrame
                local oldCF = hrp.CFrame
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local enemyHRP = player.Character:FindFirstChild("HumanoidRootPart")
                        if enemyHRP then
                            local dist = (hrp.Position - enemyHRP.Position).Magnitude
                            if dist < 15 then
                                -- Powerful Fling Method
                                hrp.CFrame = enemyHRP.CFrame
                                hrp.Velocity = Vector3.new(999999, 999999, 999999)
                                hrp.RotVelocity = Vector3.new(999999, 999999, 999999)
                                task.wait(0.1)
                            end
                        end
                    end
                end
                
                -- Reset if no target or toggle off
                if not TrollFeatures.FlingPlayers then
                    hrp.Velocity = Vector3.new(0, 0, 0)
                    hrp.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if TrollFeatures.InvisibleChar and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.03)
        if TrollFeatures.RainbowChar and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if TrollFeatures.VibrateChar and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = hrp.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if TrollFeatures.CloneChar and LocalPlayer.Character then
            local clone = LocalPlayer.Character:Clone()
            clone.Parent = workspace
            clone:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(5, 0, 0))
            task.delay(5, function() clone:Destroy() end)
            task.wait(2)
        end
    end
end)

local function GetPlayerByPartialName(name)
    if not name or name == "" then return nil end
    name = name:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player.Name:lower():find(name) or (player.DisplayName and player.DisplayName:lower():find(name)) then
                return player
            end
        end
    end
    return nil
end

task.spawn(function()
    local RunService = game:GetService("RunService")
    
    RunService.Heartbeat:Connect(function()
        -- Carry Logic
        if TrollFeatures.CarryPlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHRP and myHRP then
                        targetHRP.CFrame = myHRP.CFrame * CFrame.new(0, 0, -3)
                        targetHRP.Velocity = Vector3.new(0, 0, 0)
                        
                        -- Force target to stay in place if possible (Client-side simulation)
                        for _, part in pairs(target.Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Velocity = Vector3.new(0,0,0)
                                part.RotVelocity = Vector3.new(0,0,0)
                            end
                        end
                    end
                end
            end)
        end
        
        -- Ride Logic
        if TrollFeatures.RidePlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHRP and myHRP then
                        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 3, 0)
                        myHRP.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Attach Logic
        if TrollFeatures.AttachPlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHRP and myHRP then
                        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, TrollFeatures.AttachHeight, TrollFeatures.RideDistance)
                        myHRP.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Hug Logic
        if TrollFeatures.HugPlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHRP and myHRP then
                        -- Position in front (Z = -1) and rotate 180 degrees to face target
                        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, -1) * CFrame.Angles(0, math.pi, 0)
                        myHRP.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Follow Logic
        if TrollFeatures.FollowPlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    if hum and targetHRP then
                        hum:MoveTo(targetHRP.Position + Vector3.new(3, 0, 3))
                    end
                end
            end)
        end

        -- Freeze Logic
        if TrollFeatures.FreezePlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        targetHRP.Anchored = true
                        targetHRP.Velocity = Vector3.new(0,0,0)
                    end
                end
            end)
        elseif not TrollFeatures.FreezePlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        targetHRP.Anchored = false
                    end
                end
            end)
        end
        
        -- Mirror Player Logic
        if TrollFeatures.MirrorPlayer and TrollFeatures.SelectedPlayer ~= "" then
            pcall(function()
                local target = GetPlayerByPartialName(TrollFeatures.SelectedPlayer)
                if target and target.Character and LocalPlayer.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetHum = target.Character:FindFirstChild("Humanoid")
                    local myHum = LocalPlayer.Character:FindFirstChild("Humanoid")
                    
                    if targetHRP and myHRP and targetHum and myHum then
                        -- Mirror Movement direction
                        myHum:Move(targetHum.MoveDirection)
                        if targetHum.Jump then myHum.Jump = true end
                        
                        -- Look where they look
                        myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + targetHRP.CFrame.LookVector)
                    end
                end
            end)
        end
    end)
end)

--========================================================--
--============  ADVANCED REAL HACK SYSTEMS ===============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if UtilityFeatures.TeleportCollect and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not UtilityFeatures.TeleportCollect then break end
                    if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("money") or obj.Name:lower():find("gem") or obj.Name:lower():find("cash")) then
                        hrp.CFrame = obj.CFrame
                        task.wait(0.2)
                    end
                end
            end
        end
    end
end)

-- Improved Universal Auto Proximity Prompt
task.spawn(function()
    while true do
        task.wait(0.2)
        if UtilityFeatures.AutoProximity and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not UtilityFeatures.AutoProximity then break end
                    if obj:IsA("ProximityPrompt") then
                        local parent = obj.Parent
                        if parent:IsA("BasePart") then
                            local dist = (hrp.Position - parent.Position).Magnitude
                            if dist < (obj.MaxActivationDistance or 10) then
                                pcall(function() fireproximityprompt(obj) end)
                            end
                        else
                            pcall(function() fireproximityprompt(obj) end)
                        end
                    end
                end
            end
        end
    end
end)

-- Improved Universal Auto Collect
task.spawn(function()
    while true do
        task.wait(0.5)
        if UtilityFeatures.AutoCollect and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local keywords = {"coin", "money", "cash", "gold", "gem", "diamond", "treasure", "item", "drop", "loot", "reward"}
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not UtilityFeatures.AutoCollect then break end
                    if obj:IsA("BasePart") then
                        local name = obj.Name:lower()
                        local isMatch = false
                        for _, kw in pairs(keywords) do
                            if name:find(kw) then
                                isMatch = true
                                break
                            end
                        end
                        
                        if isMatch then
                            local dist = (hrp.Position - obj.Position).Magnitude
                            if dist < 50 then
                                firetouchinterest(hrp, obj, 0)
                                firetouchinterest(hrp, obj, 1)
                            end
                        end
                    elseif obj:IsA("ClickDetector") then
                        local parent = obj.Parent
                        if parent:IsA("BasePart") then
                            local dist = (hrp.Position - parent.Position).Magnitude
                            if dist < (obj.MaxActivationDistance or 20) then
                                fireclickdetector(obj)
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.5)
        if UtilityFeatures.AntiVoid and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp.Position.Y < -50 then
                hrp.Velocity = Vector3.new(0, 0, 0)
                hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z)
                showNotification("Bloodix", "Anti-Void Triggered!", 2)
            end
        end
    end
end)

-- Anti-AFK Connection
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    if UtilityFeatures.AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

--========================================================--
--============  INFINITE YIELD INSPIRED FEATURES =========--

-- WAYPOINTS SYSTEM
local Waypoints = {}
local WaypointsEnabled = false

local function saveWaypoint(name)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        Waypoints[name] = pos
        return true
    end
    return false
end

local function loadWaypoint(name)
    if Waypoints[name] and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Waypoints[name])
        return true
    end
    return false
end

local function deleteWaypoint(name)
    if Waypoints[name] then
        Waypoints[name] = nil
        return true
    end
    return false
end

-- NOTIFICATION SYSTEM
local function showNotification(title, text, duration)
    duration = duration or 3
    
    local notif = Instance.new("ScreenGui", getParentGui())
    notif.Name = "Notification"
    notif.DisplayOrder = 2147483647
    notif.IgnoreGuiInset = true
    
    local frame = Instance.new("Frame", notif)
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.Position = UDim2.new(1, -320, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(100, 100, 255)
    stroke.Thickness = 2
    
    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -20, 0, 40)
    textLabel.Position = UDim2.new(0, 10, 0, 30)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    
    frame:TweenPosition(UDim2.new(1, -320, 0, 20), "Out", "Quad", 0.5, true)
    
    task.delay(duration, function()
        frame:TweenPosition(UDim2.new(1, 20, 0, 20), "In", "Quad", 0.5, true)
        task.wait(0.5)
        notif:Destroy()
    end)
end

-- REJOIN FUNCTION
local function rejoinServer()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end

-- SERVER HOP FUNCTION
local function serverHop()
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    
    local success, result = pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        
        if servers and servers.data then
            for _, server in pairs(servers.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    return
                end
            end
        end
    end)
    
    if not success then
        rejoinServer()
    end
end

-- EXTRA TAB WITH NEW FEATURES
pageExtra:ClearAllChildren()
AddLabel(pageExtra, "✨ INFINITE YIELD INSPIRED", 8)

AddLabel(pageExtra, "🔄 Server Controls:", 40)

local rejoinBtn = Instance.new("TextButton", pageExtra)
rejoinBtn.Size = UDim2.new(0, 200, 0, 35)
rejoinBtn.Position = UDim2.new(0, 15, 0, 70)
rejoinBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
rejoinBtn.Text = "🔄 Rejoin Server"
rejoinBtn.TextColor3 = Color3.new(1, 1, 1)
rejoinBtn.Font = Enum.Font.GothamBold
rejoinBtn.TextSize = 14
rejoinBtn.BorderSizePixel = 0

local rejoinCorner = Instance.new("UICorner", rejoinBtn)
rejoinCorner.CornerRadius = UDim.new(0, 8)

rejoinBtn.MouseButton1Click:Connect(function()
    showNotification("Rejoining...", "Reconnecting to server...", 2)
    task.wait(1)
    rejoinServer()
end)

local serverHopBtn = Instance.new("TextButton", pageExtra)
serverHopBtn.Size = UDim2.new(0, 200, 0, 35)
serverHopBtn.Position = UDim2.new(0, 225, 0, 70)
serverHopBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 120)
serverHopBtn.Text = "🌐 Server Hop"
serverHopBtn.TextColor3 = Color3.new(1, 1, 1)
serverHopBtn.Font = Enum.Font.GothamBold
serverHopBtn.TextSize = 14
serverHopBtn.BorderSizePixel = 0

local hopCorner = Instance.new("UICorner", serverHopBtn)
hopCorner.CornerRadius = UDim.new(0, 8)

serverHopBtn.MouseButton1Click:Connect(function()
    showNotification("Server Hopping...", "Finding new server...", 2)
    task.wait(1)
    serverHop()
end)

AddLabel(pageExtra, "📍 Waypoints System:", 120)

local waypointNameBox = Instance.new("TextBox", pageExtra)
waypointNameBox.Size = UDim2.new(0, 250, 0, 35)
waypointNameBox.Position = UDim2.new(0, 15, 0, 150)
waypointNameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
waypointNameBox.BorderSizePixel = 1
waypointNameBox.BorderColor3 = Color3.fromRGB(80, 120, 200)
waypointNameBox.PlaceholderText = "Waypoint Name..."
waypointNameBox.Text = ""
waypointNameBox.TextColor3 = Color3.new(1, 1, 1)
waypointNameBox.Font = Enum.Font.Gotham
waypointNameBox.TextSize = 14

local waypointCorner = Instance.new("UICorner", waypointNameBox)
waypointCorner.CornerRadius = UDim.new(0, 6)

local saveWaypointBtn = Instance.new("TextButton", pageExtra)
saveWaypointBtn.Size = UDim2.new(0, 80, 0, 35)
saveWaypointBtn.Position = UDim2.new(0, 275, 0, 150)
saveWaypointBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
saveWaypointBtn.Text = "💾 Save"
saveWaypointBtn.TextColor3 = Color3.new(1, 1, 1)
saveWaypointBtn.Font = Enum.Font.GothamBold
saveWaypointBtn.TextSize = 12
saveWaypointBtn.BorderSizePixel = 0

local saveCorner = Instance.new("UICorner", saveWaypointBtn)
saveCorner.CornerRadius = UDim.new(0, 6)

saveWaypointBtn.MouseButton1Click:Connect(function()
    local name = waypointNameBox.Text
    if name ~= "" then
        if saveWaypoint(name) then
            showNotification("Waypoint Saved", "Saved: " .. name, 2)
            waypointNameBox.Text = ""
        else
            showNotification("Error", "Failed to save waypoint", 2)
        end
    end
end)

local loadWaypointBtn = Instance.new("TextButton", pageExtra)
loadWaypointBtn.Size = UDim2.new(0, 80, 0, 35)
loadWaypointBtn.Position = UDim2.new(0, 365, 0, 150)
loadWaypointBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
loadWaypointBtn.Text = "📍 Load"
loadWaypointBtn.TextColor3 = Color3.new(1, 1, 1)
loadWaypointBtn.Font = Enum.Font.GothamBold
loadWaypointBtn.TextSize = 12
loadWaypointBtn.BorderSizePixel = 0

local loadCorner = Instance.new("UICorner", loadWaypointBtn)
loadCorner.CornerRadius = UDim.new(0, 6)

loadWaypointBtn.MouseButton1Click:Connect(function()
    local name = waypointNameBox.Text
    if name ~= "" then
        if loadWaypoint(name) then
            showNotification("Teleported", "Loaded: " .. name, 2)
        else
            showNotification("Error", "Waypoint not found", 2)
        end
    end
end)

AddLabel(pageExtra, "⚡ Quick Actions:", 200)

local resetCharBtn = Instance.new("TextButton", pageExtra)
resetCharBtn.Size = UDim2.new(0, 200, 0, 35)
resetCharBtn.Position = UDim2.new(0, 15, 0, 230)
resetCharBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
resetCharBtn.Text = "💀 Reset Character"
resetCharBtn.TextColor3 = Color3.new(1, 1, 1)
resetCharBtn.Font = Enum.Font.GothamBold
resetCharBtn.TextSize = 14
resetCharBtn.BorderSizePixel = 0

local resetCorner = Instance.new("UICorner", resetCharBtn)
resetCorner.CornerRadius = UDim.new(0, 8)

resetCharBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end)

local respawnBtn = Instance.new("TextButton", pageExtra)
respawnBtn.Size = UDim2.new(0, 200, 0, 35)
respawnBtn.Position = UDim2.new(0, 225, 0, 230)
respawnBtn.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
respawnBtn.Text = "♻️ Respawn"
respawnBtn.TextColor3 = Color3.new(1, 1, 1)
respawnBtn.Font = Enum.Font.GothamBold
respawnBtn.TextSize = 14
respawnBtn.BorderSizePixel = 0

local respawnCorner = Instance.new("UICorner", respawnBtn)
respawnCorner.CornerRadius = UDim.new(0, 8)

respawnBtn.MouseButton1Click:Connect(function()
    LocalPlayer.Character:BreakJoints()
    showNotification("Respawning...", "Character will respawn", 2)
end)

AddLabel(pageExtra, "🎮 Game Info:", 280)

local infoFrame = Instance.new("Frame", pageExtra)
infoFrame.Size = UDim2.new(0, 440, 0, 100)
infoFrame.Position = UDim2.new(0, 10, 0, 310)
infoFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
infoFrame.BorderSizePixel = 0

local infoCorner = Instance.new("UICorner", infoFrame)
infoCorner.CornerRadius = UDim.new(0, 8)

local gameNameLabel = Instance.new("TextLabel", infoFrame)
gameNameLabel.Size = UDim2.new(1, -20, 0, 20)
gameNameLabel.Position = UDim2.new(0, 10, 0, 5)
gameNameLabel.BackgroundTransparency = 1
gameNameLabel.Text = "Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
gameNameLabel.TextColor3 = Color3.new(1, 1, 1)
gameNameLabel.Font = Enum.Font.Gotham
gameNameLabel.TextSize = 12
gameNameLabel.TextXAlignment = Enum.TextXAlignment.Left

local placeIdLabel = Instance.new("TextLabel", infoFrame)
placeIdLabel.Size = UDim2.new(1, -20, 0, 20)
placeIdLabel.Position = UDim2.new(0, 10, 0, 25)
placeIdLabel.BackgroundTransparency = 1
placeIdLabel.Text = "Place ID: " .. game.PlaceId
placeIdLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
placeIdLabel.Font = Enum.Font.Gotham
placeIdLabel.TextSize = 12
placeIdLabel.TextXAlignment = Enum.TextXAlignment.Left

local jobIdLabel = Instance.new("TextLabel", infoFrame)
jobIdLabel.Size = UDim2.new(1, -20, 0, 20)
jobIdLabel.Position = UDim2.new(0, 10, 0, 45)
jobIdLabel.BackgroundTransparency = 1
jobIdLabel.Text = "Job ID: " .. game.JobId
jobIdLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
jobIdLabel.Font = Enum.Font.Gotham
jobIdLabel.TextSize = 12
jobIdLabel.TextXAlignment = Enum.TextXAlignment.Left

local playersLabel = Instance.new("TextLabel", infoFrame)
playersLabel.Size = UDim2.new(1, -20, 0, 20)
playersLabel.Position = UDim2.new(0, 10, 0, 65)
playersLabel.BackgroundTransparency = 1
playersLabel.Text = "Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
playersLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
playersLabel.Font = Enum.Font.Gotham
playersLabel.TextSize = 12
playersLabel.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while true do
        task.wait(1)
        playersLabel.Text = "Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
    end
end)

-- WELCOME NOTIFICATION
showNotification("🔥 BLOODIX V6", "Loaded successfully! Press P to toggle", 5)

end)

if not success then
    warn("Bloodix: Fatal error during initialization: " .. tostring(err))
    -- Attempt to notify via alternative method if GUI failed
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Bloodix Error",
            Text = "Failed to load script. Check console (F9)",
            Duration = 10
        })
    end)
end
