--[[
╔══════════════════════════════════════════════════════════╗
║          BLOODIX-VIP LUA OBFUSCATOR v2.0                ║
║           Professional Script Protection                 ║
╚══════════════════════════════════════════════════════════╝

⚠️  PROTECTED SCRIPT - BLOODIX-VIP
🔒 Protection Level: ADVANCED
📅 Protected: 2025-12-28T15:13:06.381Z
👤 Developer: BLOODIX-VIP
✅ GameGuardian Compatible
✅ Solara Executor Compatible
✅ All Lua Executors Ready

This script is protected against unauthorized access,
reverse engineering, and code theft.
All rights reserved © BLOODIX-VIP 2024
--]]

--========================================================--
--====================  BLOODIX V6 ULTIMATE =============--
--==========================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

print(string.char(66,108,111,111,100,105,120,58,32,83,116,97,114,116,105,110,103,32,105,110,105,116,105,97,108,105,122,97,116,105,111,110,46,46,46))

-- SERVICES
local Players = game:GetService(string.char(80,108,97,121,101,114,115))
local _BLX_hCACMlhl = game:GetService(string.char(95,66,76,88,95,104,67,65,67,77,108,104,108))
local _BLX_cXkduGQT = game:GetService(string.char(95,66,76,88,95,99,88,107,100,117,71,81,84))
local _BLX_MVwXMEBC = game:GetService(string.char(95,66,76,88,95,77,86,119,88,77,69,66,67))
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait(0.1)
    LocalPlayer = Players.LocalPlayer
end

local function getCamera()
    return workspace.CurrentCamera or workspace:FindFirstChildOfClass(string.char(67,97,109,101,114,97))
end

-- CONFIGURATION
local _BLX_ifxqogsz = true
local _BLX_RTftfPaF = true

-- STATE
local _BLX_UElOVpwD = { 
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
local _BLX_fiophKqK = { Speed=16, JumpPower=50, SpeedOn=false, JumpOn=false, NoClip=false, Fly=false, Swim=false, GiantMode=false }
local _BLX_uOiPEQjd = { Enabled=false, FOV=120, Smooth=0.25, TargetMethod=string.char(67,108,111,115,101,115,116,68,105,115,116,97,110,99,101), Priority=string.char(72,101,97,100), VisibleCheck=true, ShowFOV=true, TeamCheck=true, Prediction=0.15, Smoothness=8 }
local _BLX_QmNWnpmF = { Enabled=false, Size=5 }
local _BLX_rUfipTLV = { RainbowMode=false, AutoFarm=false, KillAura=false, AntiAFK=false, XRay=false, RainbowSpeed=0.5, FreezeAll=false, CharacterSize=1, LoopBringAll=false, RemoveTextures=false }
local _BLX_LQYRjBBf = { TimeManipulation=false, GhostMode=false, TeleportTrail=false, AutoDodge=false, ShieldBubble=false, SpeedLines=false, DoubleJump=false, WallRun=false, AirDash=false, MagnetMode=false }
local _BLX_MWmFXkxx = { InfiniteJump=false, GodMode=false, RemoveFog=false, Fullbright=false, ClickTP=false, SpinBot=false, Bunnyhop=false, AutoSprint=false, NoFall=false, FastLadder=false, SwimSpeed=false, InstantRespawn=false, FreeCam=false, ThirdPerson=false }
local _BLX_lndkrXnm = { AutoParry=false, AutoBlock=false, ComboAttack=false, CriticalHit=false, LifeSteal=false, Knockback=false, RapidFire=false, InfiniteAmmo=false, NoRecoil=false, AutoReload=false, ExplosiveBullets=false, Aimlock=false, SilentAim=false }
local _BLX_APrpGfYS = { SuperSpeed=false, SpeedValue=100, TeleportDash=false, PhaseWalk=false, AntiGravity=false, WaterWalk=false, LavaWalk=false, ClimbAnything=false, InfiniteStamina=false, AutoParkour=false, SlideBoost=false, LongJump=false }
local _BLX_gBpJGzUX = { ESPItems=false, ESPChests=false, AutoCollect=false, AutoQuest=false, AutoSell=false, AutoCraft=false, TeleportToNPC=false, SpeedHack=false, NoClipWalls=false, InfiniteZoom=false, Xray=false, Radar=false, ServerHopper=false, Rejoin=false, AntiAFK=false, LocalWear=false, WearID=0, AutoProximity=false, TeleportCollect=false, FakeMoneyValue=0, AntiVoid=false }
local _BLX_EcTPbsnU = { FlingPlayers=false, OrbitPlayers=false, AttachToPlayer=false, MirrorPlayer=false, InvisibleChar=false, GiantChar=false, TinyChar=false, RainbowChar=false, SpinChar=false, VibrateChar=false, FlashChar=false, GlitchChar=false, CloneChar=false, CarryPlayer=false, RidePlayer=false, AttachPlayer=false, HugPlayer=false, RideDistance=3, AttachHeight=0, SelectedPlayer="", FollowPlayer=false, FreezePlayer=false }
local _BLX_zYwMtmHS = nil
local _BLX_wrIbTgAi = { lines={}, boxes={}, nameTexts={}, healthTexts={}, distanceTexts={}, weaponTexts={}, timeTexts={}, skeletons={}, tracers={}, fovCircle=nil, targetIndicator=nil }
local _BLX_QCOrOCRV = {}

-- HELPER FUNCTIONS 
local function clamp(v,a,_BLX_GPZXEntE) if v<a then return a elseif v>_BLX_GPZXEntE then return _BLX_GPZXEntE else return v end end
local function isEnemy(_BLX_qqvgPZLt) if not _BLX_qqvgPZLt or _BLX_qqvgPZLt==LocalPlayer then return false end if _BLX_qqvgPZLt.Team and LocalPlayer.Team then return _BLX_qqvgPZLt.Team~=LocalPlayer.Team end return true end

local function worldToScreen(_BLX_trjpMtQc) 
    local _BLX_WWfcEOAT = getCamera()
    if not _BLX_WWfcEOAT then return Vector2.new(0,0), false, 0 end
    local _BLX_qqvgPZLt, onScreen = _BLX_WWfcEOAT:WorldToViewportPoint(_BLX_trjpMtQc) 
    return Vector2.new(_BLX_qqvgPZLt.X, _BLX_qqvgPZLt.Y), onScreen, _BLX_qqvgPZLt.Z 
end

-- NOTIFICATION SYSTEM - نظام الإشعارات المحسّن
local _BLX_wmUHMpco = nil
local function getParentGui()
    if _BLX_wmUHMpco then return _BLX_wmUHMpco end
    
    local success, coreGui = pcall(function() return game:GetService(string.char(67,111,114,101,71,117,105)) end)
    if success and coreGui then
        local success2, hui = pcall(function() return gethui() end)
        if success2 and hui then 
            _BLX_wmUHMpco = hui
            return hui 
        end
        _BLX_wmUHMpco = coreGui
        return coreGui
    end
    
    _BLX_wmUHMpco = LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105), 10)
    return _BLX_wmUHMpco
end

-- CENTRALIZED NOTIFICATION SYSTEM
local _BLX_fuRZiUnO = Instance.new(string.char(95,66,76,88,95,75,105,88,104,97,107,85,77))
_BLX_fuRZiUnO.Name = string.char(66,108,111,111,100,105,120,78,111,116,105,102,105,99,97,116,105,111,110,115)
_BLX_fuRZiUnO.DisplayOrder = 2147483647
_BLX_fuRZiUnO.IgnoreGuiInset = true
_BLX_fuRZiUnO.ResetOnSpawn = false
_BLX_fuRZiUnO.Parent = getParentGui()

local _BLX_PEpGymtj = Instance.new(string.char(70,114,97,109,101), _BLX_fuRZiUnO)
_BLX_PEpGymtj.Size = UDim2.new(0, 320, 1, -40)
_BLX_PEpGymtj.Position = UDim2.new(1, -330, 0, 20)
_BLX_PEpGymtj.BackgroundTransparency = 1

local _BLX_fOcbdbGb = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _BLX_PEpGymtj)
_BLX_fOcbdbGb.HorizontalAlignment = Enum.HorizontalAlignment.Right
_BLX_fOcbdbGb.VerticalAlignment = Enum.VerticalAlignment.Top
_BLX_fOcbdbGb.Padding = UDim.new(0, 10)
_BLX_fOcbdbGb.SortOrder = Enum.SortOrder.LayoutOrder

local function showNotification(title, text, duration)
    duration = duration or 3
    
    local _BLX_gODIwZnl = Instance.new(string.char(70,114,97,109,101))
    _BLX_gODIwZnl.Name = string.char(78,111,116,105,102,105,99,97,116,105,111,110)
    _BLX_gODIwZnl.Size = UDim2.new(0, 300, 0, 0) -- Start with _BLX_ZilPoyGS 0 for animation
    _BLX_gODIwZnl.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    _BLX_gODIwZnl.BorderSizePixel = 0
    _BLX_gODIwZnl.ClipsDescendants = true
    _BLX_gODIwZnl.Transparency = 1
    _BLX_gODIwZnl.Parent = _BLX_PEpGymtj
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_gODIwZnl)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 10)
    
    local _BLX_TULDnOXc = Instance.new(string.char(85,73,83,116,114,111,107,101), _BLX_gODIwZnl)
    _BLX_TULDnOXc.Color = Color3.fromRGB(100, 150, 255)
    _BLX_TULDnOXc.Thickness = 2
    _BLX_TULDnOXc.Transparency = 1
    
    local _BLX_xgYAgjQO = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_gODIwZnl)
    _BLX_xgYAgjQO.Size = UDim2.new(1, -40, 0, 25)
    _BLX_xgYAgjQO.Position = UDim2.new(0, 10, 0, 8)
    _BLX_xgYAgjQO.BackgroundTransparency = 1
    _BLX_xgYAgjQO.Text = string.char(55357,56613,32) .. title
    _BLX_xgYAgjQO.TextColor3 = Color3.fromRGB(100, 200, 255)
    _BLX_xgYAgjQO.Font = Enum.Font.GothamBold
    _BLX_xgYAgjQO.TextSize = 15
    _BLX_xgYAgjQO.TextXAlignment = Enum.TextXAlignment.Left
    _BLX_xgYAgjQO.TextTransparency = 1
    
    local _BLX_kwsxTJQh = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_gODIwZnl)
    _BLX_kwsxTJQh.Size = UDim2.new(1, -20, 0, 40)
    _BLX_kwsxTJQh.Position = UDim2.new(0, 10, 0, 32)
    _BLX_kwsxTJQh.BackgroundTransparency = 1
    _BLX_kwsxTJQh.Text = text
    _BLX_kwsxTJQh.TextColor3 = Color3.new(0.9, 0.9, 0.9)
    _BLX_kwsxTJQh.Font = Enum.Font.Gotham
    _BLX_kwsxTJQh.TextSize = 13
    _BLX_kwsxTJQh.TextXAlignment = Enum.TextXAlignment.Left
    _BLX_kwsxTJQh.TextWrapped = true
    _BLX_kwsxTJQh.TextTransparency = 1

    local _BLX_zyaqwwcO = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_gODIwZnl)
    _BLX_zyaqwwcO.Size = UDim2.new(0, 20, 0, 20)
    _BLX_zyaqwwcO.Position = UDim2.new(1, -25, 0, 8)
    _BLX_zyaqwwcO.BackgroundTransparency = 1
    _BLX_zyaqwwcO.Text = "✕"
    _BLX_zyaqwwcO.TextColor3 = Color3.new(0.5, 0.5, 0.5)
    _BLX_zyaqwwcO.Font = Enum.Font.GothamBold
    _BLX_zyaqwwcO.TextSize = 14
    _BLX_zyaqwwcO.TextTransparency = 1

    -- Animation
    local _BLX_snFObtwx = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
    local _BLX_QDVVAlwR = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    _BLX_snFObtwx:Create(_BLX_gODIwZnl, _BLX_QDVVAlwR, {Size = UDim2.new(0, 300, 0, 85), Transparency = 0}):Play()
    _BLX_snFObtwx:Create(_BLX_TULDnOXc, _BLX_QDVVAlwR, {Transparency = 0.3}):Play()
    _BLX_snFObtwx:Create(_BLX_xgYAgjQO, _BLX_QDVVAlwR, {TextTransparency = 0}):Play()
    _BLX_snFObtwx:Create(_BLX_kwsxTJQh, _BLX_QDVVAlwR, {TextTransparency = 0}):Play()
    _BLX_snFObtwx:Create(_BLX_zyaqwwcO, _BLX_QDVVAlwR, {TextTransparency = 0}):Play()

    local function hide()
        local _BLX_jaTDyXsV = _BLX_snFObtwx:Create(_BLX_gODIwZnl, _BLX_QDVVAlwR, {Size = UDim2.new(0, 300, 0, 0), Transparency = 1})
        _BLX_snFObtwx:Create(_BLX_TULDnOXc, _BLX_QDVVAlwR, {Transparency = 1}):Play()
        _BLX_snFObtwx:Create(_BLX_xgYAgjQO, _BLX_QDVVAlwR, {TextTransparency = 1}):Play()
        _BLX_snFObtwx:Create(_BLX_kwsxTJQh, _BLX_QDVVAlwR, {TextTransparency = 1}):Play()
        _BLX_snFObtwx:Create(_BLX_zyaqwwcO, _BLX_QDVVAlwR, {TextTransparency = 1}):Play()
        _BLX_jaTDyXsV:Play()
        _BLX_jaTDyXsV.Completed:Connect(function()
            _BLX_gODIwZnl:Destroy()
        end)
    end

    _BLX_zyaqwwcO.MouseButton1Click:Connect(hide)
    
    task.delay(duration, function()
        if _BLX_gODIwZnl and _BLX_gODIwZnl.Parent then
            hide()
        end
    end)
end

--========================================================--
--===============  TEXT DRAWING AT TOP  ==================--
local _BLX_dtTUwAsF = Drawing.new(string.char(84,101,120,116))
_BLX_dtTUwAsF.Visible = true
_BLX_dtTUwAsF.Text = string.char(55357,56613,32,66,76,79,79,68,73,88,32,86,54,32,45,32,80,114,101,115,115,32,80,97,110,101,108)
_BLX_dtTUwAsF.Color = Color3.new(1, 0, 0)
_BLX_dtTUwAsF.Size = 18
_BLX_dtTUwAsF.Center = true
_BLX_dtTUwAsF.Outline = true
_BLX_dtTUwAsF.OutlineColor = Color3.new(0, 0, 0)
_BLX_dtTUwAsF.Position = Vector2.new(getCamera().ViewportSize.X/2, 10)

task.spawn(function()
    while true do
        local _BLX_WWfcEOAT = getCamera()
        if _BLX_WWfcEOAT then
            _BLX_dtTUwAsF.Position = Vector2.new(_BLX_WWfcEOAT.ViewportSize.X/2, 10)
        end
        task.wait(1)
    end
end)
 
-- STARTUP PROTECTION
local success, err = pcall(function()
    print(string.char(66,108,111,111,100,105,120,58,32,73,110,105,116,105,97,108,105,122,105,110,103,32,85,73,46,46,46))
    
    --========================================================-- 
    --=======================  ESP SYSTEM ====================--
    local _BLX_KiXhakUM = Instance.new(string.char(95,66,76,88,95,75,105,88,104,97,107,85,77), getParentGui())
    _BLX_KiXhakUM.Name = string.char(66,76,79,79,68,73,88,95,86,54,95,71,85,73)
_BLX_KiXhakUM.ResetOnSpawn = false
_BLX_KiXhakUM.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_BLX_KiXhakUM.DisplayOrder = 2147483647
_BLX_KiXhakUM.IgnoreGuiInset = true

local _BLX_LXvgilJr = Instance.new(string.char(70,114,97,109,101), _BLX_KiXhakUM)
_BLX_LXvgilJr.Size = UDim2.new(0, 720, 0, 580)
_BLX_LXvgilJr.Position = UDim2.new(0.5, -360, 0.5, -290)
_BLX_LXvgilJr.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
_BLX_LXvgilJr.BorderSizePixel = 0
_BLX_LXvgilJr.Active = true
_BLX_LXvgilJr.Draggable = true
_BLX_LXvgilJr.ZIndex = 100999999
_BLX_LXvgilJr.BorderSizePixel = 0

local _BLX_ZRzuOONj = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_LXvgilJr)
_BLX_ZRzuOONj.CornerRadius = UDim.new(0, 12)

local _BLX_QyrcCCME = Instance.new(string.char(85,73,83,116,114,111,107,101), _BLX_LXvgilJr)
_BLX_QyrcCCME.Color = Color3.fromRGB(100, 100, 255)
_BLX_QyrcCCME.Thickness = 2
_BLX_QyrcCCME.Transparency = 0.5

local _BLX_byZrWMRI = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_LXvgilJr)
_BLX_byZrWMRI.Size = UDim2.new(1,0,0,50)
_BLX_byZrWMRI.Position = UDim2.new(0,0,0,0)
_BLX_byZrWMRI.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
_BLX_byZrWMRI.Text = string.char(55357,56613,32,66,76,79,79,68,73,88,32,86,54,32,8212,32,69,100,117,99,97,116,105,111,110,97,108,32,80,97,110,101,108)
_BLX_byZrWMRI.TextColor3 = Color3.new(1,1,1)
_BLX_byZrWMRI.Font = Enum.Font.GothamBold
_BLX_byZrWMRI.TextSize = 20
_BLX_byZrWMRI.BorderSizePixel = 0

local _BLX_BTtLBOqi = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_byZrWMRI)
_BLX_BTtLBOqi.CornerRadius = UDim.new(0, 12)

local _BLX_iKgSsUqM = Instance.new(string.char(85,73,71,114,97,100,105,101,110,116), _BLX_byZrWMRI)
_BLX_iKgSsUqM.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 255))
}
_BLX_iKgSsUqM.Rotation = 45

local _BLX_kSKLzjpp = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_byZrWMRI)
_BLX_kSKLzjpp.Size = UDim2.new(0, 40, 0, 40)
_BLX_kSKLzjpp.Position = UDim2.new(1, -45, 0, 5)
_BLX_kSKLzjpp.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
_BLX_kSKLzjpp.Text = "✕"
_BLX_kSKLzjpp.TextColor3 = Color3.new(1, 1, 1)
_BLX_kSKLzjpp.Font = Enum.Font.GothamBold
_BLX_kSKLzjpp.TextSize = 20
_BLX_kSKLzjpp.BorderSizePixel = 0

local _BLX_fTulmEMG = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_kSKLzjpp)
_BLX_fTulmEMG.CornerRadius = UDim.new(0, 8)

_BLX_kSKLzjpp.MouseEnter:Connect(function()
    _BLX_kSKLzjpp.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
end)

_BLX_kSKLzjpp.MouseLeave:Connect(function()
    _BLX_kSKLzjpp.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
end)

_BLX_kSKLzjpp.MouseButton1Click:Connect(function()
    _BLX_LXvgilJr.Visible = false
    _BLX_RTftfPaF = false
end)

-- TABS
local _BLX_uTDITABA = Instance.new(string.char(70,114,97,109,101), _BLX_LXvgilJr)
_BLX_uTDITABA.Size = UDim2.new(0,180,1,-50)
_BLX_uTDITABA.Position = UDim2.new(0,0,0,50)
_BLX_uTDITABA.BackgroundColor3 = Color3.fromRGB(25,25,30)
_BLX_uTDITABA.BorderSizePixel = 0

local _BLX_DVWmkDXy = Instance.new(string.char(70,114,97,109,101), _BLX_LXvgilJr)
_BLX_DVWmkDXy.Size = UDim2.new(1,-180,1,-50)
_BLX_DVWmkDXy.Position = UDim2.new(0,180,0,50)
_BLX_DVWmkDXy.BackgroundColor3 = Color3.fromRGB(30,30,35)
_BLX_DVWmkDXy.BorderSizePixel = 0

local function MakeTab(_BLX_hrNGvXbu,order)
    local _BLX_GPZXEntE = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_uTDITABA)
    _BLX_GPZXEntE.Size = UDim2.new(1,0,0,40)
    _BLX_GPZXEntE.Position = UDim2.new(0,0,0,(order-1)*40)
    _BLX_GPZXEntE.Text = _BLX_hrNGvXbu
    _BLX_GPZXEntE.Font = Enum.Font.Gotham
    _BLX_GPZXEntE.TextSize = 14
    _BLX_GPZXEntE.BackgroundColor3 = Color3.fromRGB(40,40,42)
    _BLX_GPZXEntE.TextColor3 = Color3.new(1,1,1)
    return _BLX_GPZXEntE
end

local function MakePage()
    local _BLX_qqvgPZLt = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), _BLX_DVWmkDXy)
    _BLX_qqvgPZLt.Size = UDim2.new(1,0,1,0)
    _BLX_qqvgPZLt.BackgroundTransparency = 1
    _BLX_qqvgPZLt.BorderSizePixel = 0
    _BLX_qqvgPZLt.ScrollBarThickness = 6
    _BLX_qqvgPZLt.CanvasSize = UDim2.new(0, 0, 0, 1200)
    _BLX_qqvgPZLt.Visible = false
    _BLX_qqvgPZLt.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 255)
    return _BLX_qqvgPZLt
end

local _BLX_ETxISPZi = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), _BLX_uTDITABA)
_BLX_ETxISPZi.Size = UDim2.new(1, 0, 1, 0)
_BLX_ETxISPZi.BackgroundTransparency = 1
_BLX_ETxISPZi.BorderSizePixel = 0
_BLX_ETxISPZi.ScrollBarThickness = 4
_BLX_ETxISPZi.CanvasSize = UDim2.new(0, 0, 0, 600)

local function MakeTabScroll(_BLX_hrNGvXbu,order)
    local _BLX_GPZXEntE = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ETxISPZi)
    _BLX_GPZXEntE.Size = UDim2.new(1,-8,0,38)
    _BLX_GPZXEntE.Position = UDim2.new(0,4,0,(order-1)*42)
    _BLX_GPZXEntE.Text = _BLX_hrNGvXbu
    _BLX_GPZXEntE.Font = Enum.Font.GothamBold
    _BLX_GPZXEntE.TextSize = 14
    _BLX_GPZXEntE.RichText = true
    _BLX_GPZXEntE.BackgroundColor3 = Color3.fromRGB(45,45,55)
    _BLX_GPZXEntE.TextColor3 = Color3.new(0.8,0.8,0.8)
    _BLX_GPZXEntE.BorderSizePixel = 0
    _BLX_GPZXEntE.AutoButtonColor = false
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_GPZXEntE)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 8)
    
    local _BLX_LbWjBEEr = Instance.new(string.char(70,114,97,109,101), _BLX_GPZXEntE)
    _BLX_LbWjBEEr.Size = UDim2.new(0, 4, 0, 20)
    _BLX_LbWjBEEr.Position = UDim2.new(0, 0, 0.5, -10)
    _BLX_LbWjBEEr.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    _BLX_LbWjBEEr.BorderSizePixel = 0
    _BLX_LbWjBEEr.Visible = false
    
    local _BLX_gQCFDyfZ = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_LbWjBEEr)
    _BLX_gQCFDyfZ.CornerRadius = UDim.new(1, 0)
    
    local _BLX_snFObtwx = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
    
    _BLX_GPZXEntE.MouseEnter:Connect(function()
        _BLX_snFObtwx:Create(_BLX_GPZXEntE, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 80), TextColor3 = Color3.new(1,1,1)}):Play()
    end)
    
    _BLX_GPZXEntE.MouseLeave:Connect(function()
        if _BLX_EpDOBcQF ~= _BLX_smRaqfQc[_BLX_GPZXEntE] then
            _BLX_snFObtwx:Create(_BLX_GPZXEntE, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45,45,55), TextColor3 = Color3.new(0.8,0.8,0.8)}):Play()
        end
    end)
    
    _BLX_GPZXEntE.MouseButton1Click:Connect(function()
        for tab, page in pairs(_BLX_smRaqfQc) do
            page.Visible = false
            tab.BackgroundColor3 = Color3.fromRGB(45,45,55)
            tab.TextColor3 = Color3.new(0.8,0.8,0.8)
            tab.Frame.Visible = false
        end
        
        _BLX_EpDOBcQF = _BLX_smRaqfQc[_BLX_GPZXEntE]
        _BLX_EpDOBcQF.Visible = true
        _BLX_GPZXEntE.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
        _BLX_GPZXEntE.TextColor3 = Color3.new(1,1,1)
        _BLX_LbWjBEEr.Visible = true
    end)
    
    return _BLX_GPZXEntE
end

local _BLX_GMeGwIgi = MakeTabScroll(string.char(55356,57263,32,65,73,77,66,79,84),1)
local _BLX_bGbDYhfF = MakeTabScroll(string.char(55357,56385,65039,32,69,83,80),2)
local _BLX_ELifeMhC = MakeTabScroll(string.char(55357,56420,32,80,76,65,89,69,82),3)
local _BLX_XCXjuvur = MakeTabScroll(string.char(55357,56451,32,69,77,79,84,69,83),4)
local _BLX_UWUqwstR = MakeTabScroll(string.char(55357,56525,32,84,69,76,69,80,79,82,84),5)
local _BLX_mkzNlIEv = MakeTabScroll(string.char(55357,57056,65039,32,72,65,67,75),6)
local _BLX_mxPMzWbM = MakeTabScroll(string.char(10024,32,69,88,84,82,65),7)
local _BLX_vFvGeOpz = MakeTabScroll(string.char(55357,56960,32,73,78,78,79,86,65,84,73,86,69),8)
local _BLX_NQmBcYYW = MakeTabScroll(string.char(55356,57262,32,67,76,65,83,83,73,67),9)
local _BLX_KaOxkdok = MakeTabScroll(string.char(55357,56385,65039,32,86,73,83,85,65,76),10)
local _BLX_MEqFucPD = MakeTabScroll(string.char(9876,65039,32,67,79,77,66,65,84),11)
local _BLX_JJGthnJN = MakeTabScroll(string.char(55357,56615,32,85,84,73,76,73,84,89),12)
local _BLX_fPuvBqEr = MakeTabScroll(string.char(55357,56840,32,84,82,79,76,76),13)
local _BLX_QCUQAESu = MakeTabScroll(string.char(55357,56462,32,82,69,65,76,32,72,65,67,75,83),14)

local _BLX_KaedCRMn = MakePage()
local _BLX_JVtXmTag = MakePage()
local _BLX_oUZnGIww = MakePage()
local _BLX_nkkzlcDr = MakePage()
local _BLX_yiRGMAzU = MakePage()
local _BLX_ZkiDelPV = MakePage()
local _BLX_xjNuGRWs = MakePage()
local _BLX_bbFEaggD = MakePage()
local _BLX_vYBPDdRD = MakePage()
local _BLX_KXztGTTa = MakePage()
local _BLX_KiURiXRJ = MakePage()
local _BLX_iDEEtqvw = MakePage()
local _BLX_rFIcEpgN = MakePage()
local _BLX_WkGDqNKG = MakePage()

_BLX_KaedCRMn.Visible = true

local _BLX_EpDOBcQF = _BLX_KaedCRMn
local _BLX_smRaqfQc = { [_BLX_GMeGwIgi]=_BLX_KaedCRMn, [_BLX_bGbDYhfF]=_BLX_JVtXmTag, [_BLX_ELifeMhC]=_BLX_oUZnGIww, [_BLX_XCXjuvur]=_BLX_nkkzlcDr, [_BLX_UWUqwstR]=_BLX_yiRGMAzU, [_BLX_mkzNlIEv]=_BLX_ZkiDelPV, [_BLX_mxPMzWbM]=_BLX_xjNuGRWs, [_BLX_vFvGeOpz]=_BLX_bbFEaggD, [_BLX_NQmBcYYW]=_BLX_vYBPDdRD, [_BLX_KaOxkdok]=_BLX_KXztGTTa, [_BLX_MEqFucPD]=_BLX_KiURiXRJ, [_BLX_JJGthnJN]=_BLX_iDEEtqvw, [_BLX_fPuvBqEr]=_BLX_rFIcEpgN, [_BLX_QCUQAESu]=_BLX_WkGDqNKG }
for tab,page in pairs(_BLX_smRaqfQc) do
    tab.MouseButton1Click:Connect(function() 
        if _BLX_EpDOBcQF then _BLX_EpDOBcQF.Visible=false end 
        page.Visible=true 
        _BLX_EpDOBcQF=page 
    end)
end

local function AddPlayerList(_BLX_OrLJlsHM, y, callback)
    local _BLX_QWhfrSdU = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), _BLX_OrLJlsHM)
    _BLX_QWhfrSdU.Size = UDim2.new(0, 440, 0, 150)
    _BLX_QWhfrSdU.Position = UDim2.new(0, 10, 0, y)
    _BLX_QWhfrSdU.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    _BLX_QWhfrSdU.BorderSizePixel = 0
    _BLX_QWhfrSdU.ScrollBarThickness = 4
    _BLX_QWhfrSdU.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_QWhfrSdU)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 6)
    
    local _BLX_ajLPOzAU = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _BLX_QWhfrSdU)
    _BLX_ajLPOzAU.Padding = UDim.new(0, 2)
    _BLX_ajLPOzAU.SortOrder = Enum.SortOrder.LayoutOrder
    
    local _BLX_RKQTieVP = nil
    
    local function updateList()
        for _, child in pairs(_BLX_QWhfrSdU:GetChildren()) do
            if child:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) then child:Destroy() end
        end
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local _BLX_ukMzgDeq = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_QWhfrSdU)
                _BLX_ukMzgDeq.Size = UDim2.new(1, -10, 0, 30)
                _BLX_ukMzgDeq.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
                _BLX_ukMzgDeq.Text = player.DisplayName .. string.char(32,40,64) .. player.Name .. ")"
                _BLX_ukMzgDeq.TextColor3 = Color3.new(1, 1, 1)
                _BLX_ukMzgDeq.Font = Enum.Font.Gotham
                _BLX_ukMzgDeq.TextSize = 12
                _BLX_ukMzgDeq.BorderSizePixel = 0
                
                local _BLX_mCTElOeM = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ukMzgDeq)
                _BLX_mCTElOeM.CornerRadius = UDim.new(0, 4)
                
                _BLX_ukMzgDeq.MouseButton1Click:Connect(function()
                    if _BLX_RKQTieVP then _BLX_RKQTieVP.BackgroundColor3 = Color3.fromRGB(45, 45, 50) end
                    _BLX_RKQTieVP = _BLX_ukMzgDeq
                    _BLX_ukMzgDeq.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
                    if callback then callback(player.Name) end
                end)
            end
        end
        _BLX_QWhfrSdU.CanvasSize = UDim2.new(0, 0, 0, _BLX_ajLPOzAU.AbsoluteContentSize.Y)
    end
    
    Players.PlayerAdded:Connect(updateList)
    Players.PlayerRemoving:Connect(updateList)
    updateList()
    
    return _BLX_QWhfrSdU
end

-- UI HELPERS
local _BLX_liKREXWb = {
    _BLX_LXvgilJr = Color3.fromRGB(25, 25, 30),
    Accent = Color3.fromRGB(100, 150, 255),
    Success = Color3.fromRGB(60, 180, 80),
    Text = Color3.new(1, 1, 1),
    TextDim = Color3.new(0.8, 0.8, 0.8),
    Secondary = Color3.fromRGB(45, 45, 55),
    Hover = Color3.fromRGB(60, 60, 80)
}

local function isArabic(text)
    return text:match(string.char(91,92,50,49,54,45,92,50,49,57,93)) ~= nil
end

local function AddLabel(_BLX_OrLJlsHM,text,y)
    local _BLX_yMvOJRoI=Instance.new(string.char(84,101,120,116,76,97,98,101,108),_BLX_OrLJlsHM)
    _BLX_yMvOJRoI.Size=UDim2.new(1,-20,0,22)
    _BLX_yMvOJRoI.Position=UDim2.new(0,10,0,y)
    _BLX_yMvOJRoI.BackgroundTransparency=1
    _BLX_yMvOJRoI.Text=text
    _BLX_yMvOJRoI.TextColor3=_BLX_liKREXWb.Text
    _BLX_yMvOJRoI.Font=Enum.Font.GothamMedium
    _BLX_yMvOJRoI.TextSize=14
    _BLX_yMvOJRoI.TextXAlignment = isArabic(text) and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    _BLX_yMvOJRoI.RichText = true
    return _BLX_yMvOJRoI
end

local function AddToggle(_BLX_OrLJlsHM,label,y,initial,callback)
    local _BLX_ukMzgDeq=Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_OrLJlsHM)
    _BLX_ukMzgDeq.Size=UDim2.new(0,220,0,38)
    _BLX_ukMzgDeq.Position=UDim2.new(0,15,0,y)
    _BLX_ukMzgDeq.Text = ""
    _BLX_ukMzgDeq.BackgroundColor3 = _BLX_liKREXWb.Secondary
    _BLX_ukMzgDeq.BorderSizePixel = 0
    _BLX_ukMzgDeq.AutoButtonColor = false
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ukMzgDeq)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 10)
    
    local _BLX_CrZXYEDv = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_ukMzgDeq)
    _BLX_CrZXYEDv.Size = UDim2.new(1, -60, 1, 0)
    _BLX_CrZXYEDv.Position = UDim2.new(0, 12, 0, 0)
    _BLX_CrZXYEDv.BackgroundTransparency = 1
    _BLX_CrZXYEDv.Text = label
    _BLX_CrZXYEDv.TextColor3 = _BLX_liKREXWb.TextDim
    _BLX_CrZXYEDv.Font = Enum.Font.GothamMedium
    _BLX_CrZXYEDv.TextSize = 13
    _BLX_CrZXYEDv.TextXAlignment = isArabic(label) and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    
    local _BLX_cLTAcqcZ = Instance.new(string.char(70,114,97,109,101), _BLX_ukMzgDeq)
    _BLX_cLTAcqcZ.Size = UDim2.new(0, 40, 0, 20)
    _BLX_cLTAcqcZ.Position = UDim2.new(1, -50, 0.5, -10)
    _BLX_cLTAcqcZ.BackgroundColor3 = initial and _BLX_liKREXWb.Success or Color3.fromRGB(80, 80, 90)
    
    local _BLX_qVrBRgxk = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_cLTAcqcZ)
    _BLX_qVrBRgxk.CornerRadius = UDim.new(1, 0)
    
    local _BLX_rwTWRyKz = Instance.new(string.char(70,114,97,109,101), _BLX_cLTAcqcZ)
    _BLX_rwTWRyKz.Size = UDim2.new(0, 16, 0, 16)
    _BLX_rwTWRyKz.Position = UDim2.new(initial and 1 or 0, initial and -18 or 2, 0.5, -8)
    _BLX_rwTWRyKz.BackgroundColor3 = Color3.new(1, 1, 1)
    
    local _BLX_YPaWxZnt = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_rwTWRyKz)
    _BLX_YPaWxZnt.CornerRadius = UDim.new(1, 0)
    
    local _BLX_XyWhhufA = initial
    local _BLX_snFObtwx = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
    
    local function updateUI()
        local _BLX_QDVVAlwR = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        _BLX_snFObtwx:Create(_BLX_cLTAcqcZ, _BLX_QDVVAlwR, {BackgroundColor3 = _BLX_XyWhhufA and _BLX_liKREXWb.Success or Color3.fromRGB(80, 80, 90)}):Play()
        _BLX_snFObtwx:Create(_BLX_rwTWRyKz, _BLX_QDVVAlwR, {Position = UDim2.new(_BLX_XyWhhufA and 1 or 0, _BLX_XyWhhufA and -18 or 2, 0.5, -8)}):Play()
        _BLX_snFObtwx:Create(_BLX_CrZXYEDv, _BLX_QDVVAlwR, {TextColor3 = _BLX_XyWhhufA and _BLX_liKREXWb.Text or _BLX_liKREXWb.TextDim}):Play()
    end
    
    _BLX_ukMzgDeq.MouseButton1Click:Connect(function()
        _BLX_XyWhhufA = not _BLX_XyWhhufA
        updateUI()
        if callback then callback(_BLX_XyWhhufA) end
    end)
    
    _BLX_ukMzgDeq.MouseEnter:Connect(function()
        _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.2), {BackgroundColor3 = _BLX_liKREXWb.Hover}):Play()
    end)
    
    _BLX_ukMzgDeq.MouseLeave:Connect(function()
        _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.2), {BackgroundColor3 = _BLX_liKREXWb.Secondary}):Play()
    end)
    
    return _BLX_ukMzgDeq
end

local function AddButton(_BLX_OrLJlsHM, label, y, callback)
    local _BLX_ukMzgDeq = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_OrLJlsHM)
    _BLX_ukMzgDeq.Size = UDim2.new(0, 220, 0, 38)
    _BLX_ukMzgDeq.Position = UDim2.new(0, 15, 0, y)
    _BLX_ukMzgDeq.Text = label
    _BLX_ukMzgDeq.Font = Enum.Font.GothamBold
    _BLX_ukMzgDeq.TextSize = 14
    _BLX_ukMzgDeq.BackgroundColor3 = _BLX_liKREXWb.Accent
    _BLX_ukMzgDeq.TextColor3 = Color3.new(1, 1, 1)
    _BLX_ukMzgDeq.BorderSizePixel = 0
    _BLX_ukMzgDeq.AutoButtonColor = false
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ukMzgDeq)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 10)
    
    local _BLX_TULDnOXc = Instance.new(string.char(85,73,83,116,114,111,107,101), _BLX_ukMzgDeq)
    _BLX_TULDnOXc.Color = Color3.new(1, 1, 1)
    _BLX_TULDnOXc.Transparency = 0.8
    _BLX_TULDnOXc.Thickness = 1
    
    local _BLX_snFObtwx = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
    
    _BLX_ukMzgDeq.MouseButton1Click:Connect(function()
        local _BLX_pHVJrLvf = _BLX_ukMzgDeq.Size
        _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.1), {Size = UDim2.new(0, 210, 0, 35)}):Play()
        task.delay(0.1, function()
            _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.1), {Size = _BLX_pHVJrLvf}):Play()
        end)
        if callback then callback() end
    end)
    
    _BLX_ukMzgDeq.MouseEnter:Connect(function()
        _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.2), {BackgroundColor3 = _BLX_liKREXWb.Accent:Lerp(Color3.new(1,1,1), 0.2)}):Play()
        _BLX_snFObtwx:Create(_BLX_TULDnOXc, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
    end)
    
    _BLX_ukMzgDeq.MouseLeave:Connect(function()
        _BLX_snFObtwx:Create(_BLX_ukMzgDeq, TweenInfo.new(0.2), {BackgroundColor3 = _BLX_liKREXWb.Accent}):Play()
        _BLX_snFObtwx:Create(_BLX_TULDnOXc, TweenInfo.new(0.2), {Transparency = 0.8}):Play()
    end)
    
    return _BLX_ukMzgDeq
end

local function AddTextBox(_BLX_OrLJlsHM, label, y, initial, callback)
    local _BLX_gODIwZnl = Instance.new(string.char(70,114,97,109,101), _BLX_OrLJlsHM)
    _BLX_gODIwZnl.Size = UDim2.new(0, 440, 0, 40)
    _BLX_gODIwZnl.Position = UDim2.new(0, 10, 0, y)
    _BLX_gODIwZnl.BackgroundTransparency = 1
    
    local _BLX_yMvOJRoI = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_gODIwZnl)
    _BLX_yMvOJRoI.Size = UDim2.new(0, 150, 0, 35)
    _BLX_yMvOJRoI.Text = label
    _BLX_yMvOJRoI.Font = Enum.Font.Gotham
    _BLX_yMvOJRoI.TextSize = 14
    _BLX_yMvOJRoI.TextColor3 = Color3.new(1, 1, 1)
    _BLX_yMvOJRoI.BackgroundTransparency = 1
    _BLX_yMvOJRoI.TextXAlignment = Enum.TextXAlignment.Left
    
    local _BLX_rWXkUhCK = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_gODIwZnl)
    _BLX_rWXkUhCK.Size = UDim2.new(0, 250, 0, 30)
    _BLX_rWXkUhCK.Position = UDim2.new(0, 160, 0, 2)
    _BLX_rWXkUhCK.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    _BLX_rWXkUhCK.Text = tostring(initial)
    _BLX_rWXkUhCK.TextColor3 = Color3.new(1, 1, 1)
    _BLX_rWXkUhCK.Font = Enum.Font.Gotham
    _BLX_rWXkUhCK.TextSize = 14
    _BLX_rWXkUhCK.PlaceholderText = string.char(84,121,112,101,32,104,101,114,101,46,46,46)
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_rWXkUhCK)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 6)
    
    _BLX_rWXkUhCK.FocusLost:Connect(function(enterPressed)
        if callback then callback(_BLX_rWXkUhCK.Text) end
    end)
    
    return _BLX_rWXkUhCK
end

local function AddSlider(_BLX_OrLJlsHM, label, y, minV, maxV, initial, callback)
    local _BLX_gODIwZnl = Instance.new(string.char(70,114,97,109,101), _BLX_OrLJlsHM)
    _BLX_gODIwZnl.Size = UDim2.new(0, 440, 0, 40)
    _BLX_gODIwZnl.Position = UDim2.new(0, 10, 0, y)
    _BLX_gODIwZnl.BackgroundTransparency = 1
    
    local _BLX_yMvOJRoI = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_gODIwZnl)
    _BLX_yMvOJRoI.Size = UDim2.new(0, 180, 0, 20)
    _BLX_yMvOJRoI.Position = UDim2.new(0, 0, 0, 0)
    _BLX_yMvOJRoI.BackgroundTransparency = 1
    _BLX_yMvOJRoI.Text = label .. ": " .. tostring(initial)
    _BLX_yMvOJRoI.TextColor3 = Color3.new(1, 1, 1)
    _BLX_yMvOJRoI.Font = Enum.Font.Gotham
    _BLX_yMvOJRoI.TextSize = 14
    _BLX_yMvOJRoI.TextXAlignment = Enum.TextXAlignment.Left
    
    local _BLX_AWhLRhuh = Instance.new(string.char(70,114,97,109,101), _BLX_gODIwZnl)
    _BLX_AWhLRhuh.Size = UDim2.new(0, 300, 0, 8)
    _BLX_AWhLRhuh.Position = UDim2.new(0, 0, 0, 25)
    _BLX_AWhLRhuh.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    _BLX_AWhLRhuh.BorderSizePixel = 0
    
    local _BLX_SFnkXdBs = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_AWhLRhuh)
    _BLX_SFnkXdBs.CornerRadius = UDim.new(0, 4)
    
    local _BLX_zXesnSzu = Instance.new(string.char(70,114,97,109,101), _BLX_AWhLRhuh)
    _BLX_zXesnSzu.Size = UDim2.new((initial - minV) / (maxV - minV), 0, 1, 0)
    _BLX_zXesnSzu.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    _BLX_zXesnSzu.BorderSizePixel = 0
    
    local _BLX_YEuHTcgg = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_zXesnSzu)
    _BLX_YEuHTcgg.CornerRadius = UDim.new(0, 4)
    
    local _BLX_rwTWRyKz = Instance.new(string.char(70,114,97,109,101), _BLX_AWhLRhuh)
    _BLX_rwTWRyKz.Size = UDim2.new(0, 16, 0, 20)
    _BLX_rwTWRyKz.Position = UDim2.new(_BLX_zXesnSzu.Size.X.Scale - 0.03, 0, 0, -6)
    _BLX_rwTWRyKz.BackgroundColor3 = Color3.fromRGB(150, 150, 255)
    _BLX_rwTWRyKz.BorderSizePixel = 0
    
    local _BLX_YPaWxZnt = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_rwTWRyKz)
    _BLX_YPaWxZnt.CornerRadius = UDim.new(0, 8)
    
    local _BLX_jWnQTaCS = false
    local function updateSlider(x)
        local _BLX_kMKWHSYP = math.clamp((x - _BLX_AWhLRhuh.AbsolutePosition.X) / _BLX_AWhLRhuh.AbsoluteSize.X, 0, 1)
        _BLX_zXesnSzu.Size = UDim2.new(_BLX_kMKWHSYP, 0, 1, 0)
        _BLX_rwTWRyKz.Position = UDim2.new(_BLX_kMKWHSYP - 0.03, 0, 0, -5)
        
        local _BLX_MLqYHRFD = minV + _BLX_kMKWHSYP * (maxV - minV)
        _BLX_MLqYHRFD = math.floor(_BLX_MLqYHRFD * 100) / 100
        
        _BLX_yMvOJRoI.Text = label .. ": " .. tostring(_BLX_MLqYHRFD)
        if callback then callback(_BLX_MLqYHRFD) end
    end
    
    _BLX_rwTWRyKz.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            _BLX_jWnQTaCS = true
        end
    end)
    
    _BLX_rwTWRyKz.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            _BLX_jWnQTaCS = false
        end
    end)
    
    _BLX_AWhLRhuh.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            _BLX_jWnQTaCS = true
            updateSlider(input.Position.X)
        end
    end)
    
    _BLX_cXkduGQT.InputChanged:Connect(function(input)
        if _BLX_jWnQTaCS and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input.Position.X)
        end
    end)
    
    _BLX_cXkduGQT.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            _BLX_jWnQTaCS = false
        end
    end)
    
    return {label = _BLX_yMvOJRoI, _BLX_AWhLRhuh = _BLX_AWhLRhuh, _BLX_zXesnSzu = _BLX_zXesnSzu, _BLX_rwTWRyKz = _BLX_rwTWRyKz}
end

local _BLX_QqQdDOqZ = {
    Color3.new(1, 0, 0), -- Red
    Color3.new(0, 1, 0), -- Green
    Color3.new(0, 0, 1), -- Blue
    Color3.new(1, 1, 0), -- Yellow
    Color3.new(1, 0, 1), -- Magenta
    Color3.new(0, 1, 1), -- Cyan
    Color3.new(1, 1, 1), -- White
    Color3.new(1, 0.5, 0), -- Orange
}

local function AddColorCycle(_BLX_OrLJlsHM, label, y, initialColor, callback)
    local _BLX_gODIwZnl = Instance.new(string.char(70,114,97,109,101), _BLX_OrLJlsHM)
    _BLX_gODIwZnl.Size = UDim2.new(0, 440, 0, 36)
    _BLX_gODIwZnl.Position = UDim2.new(0, 10, 0, y)
    _BLX_gODIwZnl.BackgroundTransparency = 1
    
    local _BLX_yMvOJRoI = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_gODIwZnl)
    _BLX_yMvOJRoI.Size = UDim2.new(0, 180, 0, 36)
    _BLX_yMvOJRoI.Text = label
    _BLX_yMvOJRoI.Font = Enum.Font.Gotham
    _BLX_yMvOJRoI.TextSize = 14
    _BLX_yMvOJRoI.TextColor3 = Color3.new(1, 1, 1)
    _BLX_yMvOJRoI.BackgroundTransparency = 1
    _BLX_yMvOJRoI.TextXAlignment = Enum.TextXAlignment.Left
    
    local _BLX_ukMzgDeq = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_gODIwZnl)
    _BLX_ukMzgDeq.Size = UDim2.new(0, 100, 0, 26)
    _BLX_ukMzgDeq.Position = UDim2.new(0, 190, 0, 5)
    _BLX_ukMzgDeq.BackgroundColor3 = initialColor
    _BLX_ukMzgDeq.Text = ""
    _BLX_ukMzgDeq.BorderSizePixel = 0
    
    local _BLX_TCmOmQXh = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ukMzgDeq)
    _BLX_TCmOmQXh.CornerRadius = UDim.new(0, 4)
    
    local _BLX_PcoeEbyO = 1
    for i, _BLX_ULDdCxje in ipairs(_BLX_QqQdDOqZ) do
        if math.abs(_BLX_ULDdCxje.R - initialColor.R) < 0.01 and math.abs(_BLX_ULDdCxje.G - initialColor.G) < 0.01 and math.abs(_BLX_ULDdCxje.B - initialColor.B) < 0.01 then
            _BLX_PcoeEbyO = i
            break
        end
    end
    
    _BLX_ukMzgDeq.MouseButton1Click:Connect(function()
        _BLX_PcoeEbyO = _BLX_PcoeEbyO + 1
        if _BLX_PcoeEbyO > #_BLX_QqQdDOqZ then _BLX_PcoeEbyO = 1 end
        local _BLX_XmSsnMLE = _BLX_QqQdDOqZ[_BLX_PcoeEbyO]
        _BLX_ukMzgDeq.BackgroundColor3 = _BLX_XmSsnMLE
        if callback then callback(_BLX_XmSsnMLE) end
    end)
    return _BLX_ukMzgDeq
end

--========================================================--
--=======================  AIMBOT  =======================--
AddLabel(_BLX_KaedCRMn,string.char(55356,57263,32,65,73,77,66,79,84,32,83,69,84,84,73,78,71,83,32,45,32,1606,1592,1575,1605,32,1578,1589,1608,1610,1576,32,1605,1581,1587,1617,1606),8)

local _BLX_BqWrFbeU = AddToggle(_BLX_KaedCRMn,string.char(69,110,97,98,108,101,32,65,105,109,98,111,116),36,false,function(s) 
    _BLX_uOiPEQjd.Enabled = s 
end)

AddToggle(_BLX_KaedCRMn,string.char(83,104,111,119,32,70,79,86,32,67,105,114,99,108,101),76,true,function(s) 
    _BLX_uOiPEQjd.ShowFOV = s 
    if _BLX_wrIbTgAi.fovCircle then
        _BLX_wrIbTgAi.fovCircle.Visible = s and _BLX_uOiPEQjd.Enabled
    end
end)

AddToggle(_BLX_KaedCRMn,string.char(84,101,97,109,32,67,104,101,99,107,32,40,1571,1593,1583,1575,1569,32,1601,1602,1591,41),116,true,function(s) 
    _BLX_uOiPEQjd.TeamCheck = s 
end)

AddToggle(_BLX_KaedCRMn,string.char(86,105,115,105,98,105,108,105,116,121,32,67,104,101,99,107),156,true,function(s) 
    _BLX_uOiPEQjd.VisibleCheck = s 
end)

local _BLX_dkwYzdgD = AddSlider(_BLX_KaedCRMn, string.char(70,79,86,32,83,105,122,101), 196, 20, 600, _BLX_uOiPEQjd.FOV, function(v) 
    _BLX_uOiPEQjd.FOV = v 
end)

local _BLX_CoMFPFlB = AddSlider(_BLX_KaedCRMn, string.char(83,109,111,111,116,104,110,101,115,115,32,76,101,118,101,108), 246, 1, 20, _BLX_uOiPEQjd.Smoothness, function(v) 
    _BLX_uOiPEQjd.Smoothness = v 
end)

local _BLX_EGBCASUS = AddSlider(_BLX_KaedCRMn, string.char(80,114,101,100,105,99,116,105,111,110), 296, 0, 0.5, _BLX_uOiPEQjd.Prediction, function(v) 
    _BLX_uOiPEQjd.Prediction = v 
end)

AddLabel(_BLX_KaedCRMn,string.char(84,97,114,103,101,116,32,80,114,105,111,114,105,116,121,58),346)

local _BLX_vbPNWaJz = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_KaedCRMn)
_BLX_vbPNWaJz.Size = UDim2.new(0,100,0,30)
_BLX_vbPNWaJz.Position = UDim2.new(0,10,0,376)
_BLX_vbPNWaJz.Text = string.char(72,101,97,100)
_BLX_vbPNWaJz.BackgroundColor3 = Color3.fromRGB(100,100,180)
_BLX_vbPNWaJz.TextColor3 = Color3.new(1,1,1)
_BLX_vbPNWaJz.Font = Enum.Font.GothamBold
_BLX_vbPNWaJz.TextSize = 12
local _BLX_LxfGemQr = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_vbPNWaJz)
_BLX_LxfGemQr.CornerRadius = UDim.new(0, 6)
_BLX_vbPNWaJz.MouseButton1Click:Connect(function() 
    _BLX_uOiPEQjd.Priority = string.char(72,101,97,100)
    _BLX_vbPNWaJz.BackgroundColor3 = Color3.fromRGB(100,100,180)
    _BLX_ffVUIlFe.BackgroundColor3 = Color3.fromRGB(60,60,80)
    _BLX_NGwzfoiH.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local _BLX_ffVUIlFe = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_KaedCRMn)
_BLX_ffVUIlFe.Size = UDim2.new(0,100,0,30)
_BLX_ffVUIlFe.Position = UDim2.new(0,120,0,376)
_BLX_ffVUIlFe.Text = string.char(84,111,114,115,111)
_BLX_ffVUIlFe.BackgroundColor3 = Color3.fromRGB(60,60,80)
_BLX_ffVUIlFe.TextColor3 = Color3.new(1,1,1)
_BLX_ffVUIlFe.Font = Enum.Font.GothamBold
_BLX_ffVUIlFe.TextSize = 12
local _BLX_TcVQNMsl = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ffVUIlFe)
_BLX_TcVQNMsl.CornerRadius = UDim.new(0, 6)
_BLX_ffVUIlFe.MouseButton1Click:Connect(function() 
    _BLX_uOiPEQjd.Priority = string.char(84,111,114,115,111)
    _BLX_vbPNWaJz.BackgroundColor3 = Color3.fromRGB(60,60,80)
    _BLX_ffVUIlFe.BackgroundColor3 = Color3.fromRGB(100,100,180)
    _BLX_NGwzfoiH.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local _BLX_NGwzfoiH = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_KaedCRMn)
_BLX_NGwzfoiH.Size = UDim2.new(0,100,0,30)
_BLX_NGwzfoiH.Position = UDim2.new(0,230,0,376)
_BLX_NGwzfoiH.Text = string.char(72,82,80)
_BLX_NGwzfoiH.BackgroundColor3 = Color3.fromRGB(60,60,80)
_BLX_NGwzfoiH.TextColor3 = Color3.new(1,1,1)
_BLX_NGwzfoiH.Font = Enum.Font.GothamBold
_BLX_NGwzfoiH.TextSize = 12
local _BLX_HlBtewLO = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_NGwzfoiH)
_BLX_HlBtewLO.CornerRadius = UDim.new(0, 6)
_BLX_NGwzfoiH.MouseButton1Click:Connect(function() 
    _BLX_uOiPEQjd.Priority = string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)
    _BLX_vbPNWaJz.BackgroundColor3 = Color3.fromRGB(60,60,80)
    _BLX_ffVUIlFe.BackgroundColor3 = Color3.fromRGB(60,60,80)
    _BLX_NGwzfoiH.BackgroundColor3 = Color3.fromRGB(100,100,180)
end)

AddLabel(_BLX_KaedCRMn,string.char(84,97,114,103,101,116,32,77,101,116,104,111,100,58),416)

local _BLX_NNNQkUjZ = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_KaedCRMn)
_BLX_NNNQkUjZ.Size = UDim2.new(0,150,0,30)
_BLX_NNNQkUjZ.Position = UDim2.new(0,10,0,446)
_BLX_NNNQkUjZ.Text = string.char(67,108,111,115,101,115,116,32,68,105,115,116,97,110,99,101)
_BLX_NNNQkUjZ.BackgroundColor3 = Color3.fromRGB(100,100,180)
_BLX_NNNQkUjZ.TextColor3 = Color3.new(1,1,1)
_BLX_NNNQkUjZ.Font = Enum.Font.GothamBold
_BLX_NNNQkUjZ.TextSize = 12
local _BLX_AIXojhpg = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_NNNQkUjZ)
_BLX_AIXojhpg.CornerRadius = UDim.new(0, 6)
_BLX_NNNQkUjZ.MouseButton1Click:Connect(function() 
    _BLX_uOiPEQjd.TargetMethod = string.char(67,108,111,115,101,115,116,68,105,115,116,97,110,99,101) 
    _BLX_NNNQkUjZ.BackgroundColor3 = Color3.fromRGB(100,100,180)
    _BLX_bdHtuxJT.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

local _BLX_bdHtuxJT = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110),_BLX_KaedCRMn)
_BLX_bdHtuxJT.Size = UDim2.new(0,150,0,30)
_BLX_bdHtuxJT.Position = UDim2.new(0,170,0,446)
_BLX_bdHtuxJT.Text = string.char(67,108,111,115,101,115,116,32,116,111,32,67,114,111,115,115,104,97,105,114)
_BLX_bdHtuxJT.BackgroundColor3 = Color3.fromRGB(60,60,80)
_BLX_bdHtuxJT.TextColor3 = Color3.new(1,1,1)
_BLX_bdHtuxJT.Font = Enum.Font.GothamBold
_BLX_bdHtuxJT.TextSize = 12
local _BLX_EbpguARI = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_bdHtuxJT)
_BLX_EbpguARI.CornerRadius = UDim.new(0, 6)
_BLX_bdHtuxJT.MouseButton1Click:Connect(function() 
    _BLX_uOiPEQjd.TargetMethod = string.char(67,108,111,115,101,115,116,83,99,114,101,101,110) 
    _BLX_bdHtuxJT.BackgroundColor3 = Color3.fromRGB(100,100,180)
    _BLX_NNNQkUjZ.BackgroundColor3 = Color3.fromRGB(60,60,80)
end)

AddLabel(_BLX_KaedCRMn,string.char(55357,56481,32,72,111,108,100,32,82,105,103,104,116,32,77,111,117,115,101,32,66,117,116,116,111,110,32,116,111,32,65,105,109),486)
AddLabel(_BLX_KaedCRMn,string.char(55356,57263,32,70,79,86,32,67,105,114,99,108,101,32,115,104,111,119,115,32,116,97,114,103,101,116,105,110,103,32,97,114,101,97),516)

local _BLX_LagFBMFv = false
_BLX_cXkduGQT.InputBegan:Connect(function(input) 
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        _BLX_LagFBMFv = true 
    end 
end)

_BLX_cXkduGQT.InputEnded:Connect(function(input) 
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        _BLX_LagFBMFv = false 
    end 
end)

_BLX_wrIbTgAi.fovCircle = Drawing.new(string.char(67,105,114,99,108,101))
_BLX_wrIbTgAi.fovCircle.Thickness = 2
_BLX_wrIbTgAi.fovCircle.NumSides = 64
_BLX_wrIbTgAi.fovCircle.Radius = _BLX_uOiPEQjd.FOV
_BLX_wrIbTgAi.fovCircle.Filled = false
_BLX_wrIbTgAi.fovCircle.Color = Color3.fromRGB(255, 255, 255)
_BLX_wrIbTgAi.fovCircle.Transparency = 0.8
_BLX_wrIbTgAi.fovCircle.Visible = false
_BLX_wrIbTgAi.fovCircle.ZIndex = 999

_BLX_wrIbTgAi.targetIndicator = Drawing.new(string.char(67,105,114,99,108,101))
_BLX_wrIbTgAi.targetIndicator.Thickness = 3
_BLX_wrIbTgAi.targetIndicator.NumSides = 32
_BLX_wrIbTgAi.targetIndicator.Radius = 15
_BLX_wrIbTgAi.targetIndicator.Filled = false
_BLX_wrIbTgAi.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
_BLX_wrIbTgAi.targetIndicator.Transparency = 1
_BLX_wrIbTgAi.targetIndicator.Visible = false
_BLX_wrIbTgAi.targetIndicator.ZIndex = 999

local function findAimTarget()
    local best,bestScore = nil, math.huge
    for _,_BLX_qqvgPZLt in pairs(Players:GetPlayers()) do
        if _BLX_qqvgPZLt ~= LocalPlayer and _BLX_qqvgPZLt.Character and _BLX_qqvgPZLt.Character.Parent then
            if _BLX_uOiPEQjd.TeamCheck and not isEnemy(_BLX_qqvgPZLt) then
                continue
            end
            
            local _BLX_IyigvvbU = _BLX_qqvgPZLt.Character:FindFirstChild(_BLX_uOiPEQjd.Priority) or _BLX_qqvgPZLt.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_IyigvvbU then
                local _BLX_trjpMtQc = _BLX_IyigvvbU.Position
                
                if _BLX_uOiPEQjd.Prediction > 0 and _BLX_IyigvvbU.Parent:FindFirstChild(string.char(72,117,109,97,110,111,105,100)) then
                    local _BLX_VsvSNoRo = _BLX_IyigvvbU.Velocity
                    _BLX_trjpMtQc = _BLX_trjpMtQc + (_BLX_VsvSNoRo * _BLX_uOiPEQjd.Prediction)
                end
                
                local screenPos, onScreen = worldToScreen(_BLX_trjpMtQc)
                
                if _BLX_uOiPEQjd.VisibleCheck then
                    local _BLX_WWfcEOAT = getCamera()
                if not _BLX_WWfcEOAT then return end
                local _BLX_hCSBBJNj = Ray.new(_BLX_WWfcEOAT.CFrame.Position, (_BLX_trjpMtQc - _BLX_WWfcEOAT.CFrame.Position).Unit * 1000)
                local _BLX_beyHnMZu = workspace:FindPartOnRayWithIgnoreList(_BLX_hCSBBJNj, {LocalPlayer.Character, _BLX_WWfcEOAT})
                    if _BLX_beyHnMZu and not _BLX_beyHnMZu:IsDescendantOf(_BLX_qqvgPZLt.Character) then
                        continue
                    end
                end
                
                if not onScreen then continue end
                
                local _BLX_WWfcEOAT = getCamera()
                if not _BLX_WWfcEOAT then continue end
                local _BLX_LUKOGVNS = Vector2.new(_BLX_WWfcEOAT.ViewportSize.X/2, _BLX_WWfcEOAT.ViewportSize.Y/2)
                local _BLX_qAHruZvK = (screenPos - _BLX_LUKOGVNS).Magnitude
                
                if _BLX_qAHruZvK > _BLX_uOiPEQjd.FOV then continue end
                
                if _BLX_uOiPEQjd.TargetMethod == string.char(67,108,111,115,101,115,116,68,105,115,116,97,110,99,101) then
                    local _BLX_rIKMcJih = (_BLX_WWfcEOAT.CFrame.Position - _BLX_trjpMtQc).Magnitude
                    if _BLX_rIKMcJih < bestScore then 
                        best = {player = _BLX_qqvgPZLt, part = _BLX_IyigvvbU, _BLX_trjpMtQc = _BLX_trjpMtQc, screenPos = screenPos}
                        bestScore = _BLX_rIKMcJih 
                    end
                else
                    if _BLX_qAHruZvK < bestScore then 
                        best = {player = _BLX_qqvgPZLt, part = _BLX_IyigvvbU, _BLX_trjpMtQc = _BLX_trjpMtQc, screenPos = screenPos}
                        bestScore = _BLX_qAHruZvK
                    end
                end
            end
        end
    end
    return best
end

_BLX_hCACMlhl.RenderStepped:Connect(function(dt)
    local _BLX_WWfcEOAT = getCamera()
    if not _BLX_WWfcEOAT then return end
    
    local _BLX_LUKOGVNS = Vector2.new(_BLX_WWfcEOAT.ViewportSize.X/2, _BLX_WWfcEOAT.ViewportSize.Y/2)
    _BLX_wrIbTgAi.fovCircle.Position = _BLX_LUKOGVNS
    _BLX_wrIbTgAi.fovCircle.Radius = _BLX_uOiPEQjd.FOV
    _BLX_wrIbTgAi.fovCircle.Visible = _BLX_uOiPEQjd.Enabled and _BLX_uOiPEQjd.ShowFOV
    
    if _BLX_uOiPEQjd.Enabled and _BLX_LagFBMFv then
        local _BLX_sbSUqfUW = findAimTarget()
        if _BLX_sbSUqfUW then
            _BLX_wrIbTgAi.targetIndicator.Position = _BLX_sbSUqfUW.screenPos
            _BLX_wrIbTgAi.targetIndicator.Visible = true
            _BLX_wrIbTgAi.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
            
            local _BLX_MwTzCSkU = _BLX_WWfcEOAT.CFrame.Position
            local _BLX_gowcegCy = _BLX_sbSUqfUW._BLX_trjpMtQc
            local _BLX_RzUdrlEb = (_BLX_gowcegCy - _BLX_MwTzCSkU).Unit
            local _BLX_qquNYRRI = CFrame.new(_BLX_MwTzCSkU, _BLX_MwTzCSkU + _BLX_RzUdrlEb)
            
            local _BLX_RrVZAMFj = 1 / _BLX_uOiPEQjd.Smoothness
            _BLX_WWfcEOAT.CFrame = _BLX_WWfcEOAT.CFrame:Lerp(_BLX_qquNYRRI, _BLX_RrVZAMFj)
        else
            _BLX_wrIbTgAi.targetIndicator.Visible = false
        end
    else
        _BLX_wrIbTgAi.targetIndicator.Visible = false
    end
end)

--========================================================--
--=======================  SILENT AIM SYSTEM =============--
local function getSilentTarget()
    local _BLX_scCzldvF = nil
    local _BLX_enMppfUO = _BLX_uOiPEQjd.FOV
    local _BLX_WWfcEOAT = getCamera()
    if not _BLX_WWfcEOAT then return nil end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and isEnemy(player) then
            local _BLX_KfmGusjz = player.Character:FindFirstChild(string.char(72,101,97,100))
            local _BLX_PmRmVbmR = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_KfmGusjz and _BLX_PmRmVbmR and _BLX_PmRmVbmR.Health > 0 then
                local screenPos, onScreen = _BLX_WWfcEOAT:WorldToViewportPoint(_BLX_KfmGusjz.Position)
                if onScreen then
                    local _BLX_CWkRoFlO = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(_BLX_WWfcEOAT.ViewportSize.X/2, _BLX_WWfcEOAT.ViewportSize.Y/2)).Magnitude
                    if _BLX_CWkRoFlO < _BLX_enMppfUO then
                        _BLX_scCzldvF = _BLX_KfmGusjz
                        _BLX_enMppfUO = _BLX_CWkRoFlO
                    end
                end
            end
        end
    end
    return _BLX_scCzldvF
end

-- Hooking logic for Silent Aim (Universal attempt)
task.spawn(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, string.char(95,95,110,97,109,101,99,97,108,108), function(self, ...)
        local _BLX_fnqYamkb = getnamecallmethod()
        local _BLX_bzvIHAQq = {...}
        
        if _BLX_lndkrXnm.SilentAim and _BLX_fnqYamkb == string.char(70,105,114,101,83,101,114,118,101,114) then
            local _BLX_YzIHWHGa = getSilentTarget()
            if _BLX_YzIHWHGa then
                -- Check for common bullet remote names
                if self.Name:lower():find(string.char(95,66,76,88,95,108,89,107,108,121,118,113,109)) or self.Name:lower():find(string.char(115,104,111,111,116)) or self.Name:lower():find(string.char(98,117,108,108,101,116)) then
                    -- Modify _BLX_bzvIHAQq to point to _BLX_YzIHWHGa
                    for i, arg in pairs(_BLX_bzvIHAQq) do
                        if typeof(arg) == string.char(86,101,99,116,111,114,51) then
                            _BLX_bzvIHAQq[i] = _BLX_YzIHWHGa.Position
                        elseif typeof(arg) == string.char(67,70,114,97,109,101) then
                            _BLX_bzvIHAQq[i] = CFrame.new(_BLX_bzvIHAQq[i].Position, _BLX_YzIHWHGa.Position)
                        elseif typeof(arg) == string.char(73,110,115,116,97,110,99,101) and arg:IsA(string.char(66,97,115,101,80,97,114,116)) then
                            _BLX_bzvIHAQq[i] = _BLX_YzIHWHGa
                        end
                    end
                    return oldNamecall(self, unpack(_BLX_bzvIHAQq))
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
    
    if not _BLX_wrIbTgAi.lines[player] then 
        _BLX_wrIbTgAi.lines[player] = Drawing.new(string.char(76,105,110,101))
        _BLX_wrIbTgAi.lines[player].Thickness = 2
        _BLX_wrIbTgAi.lines[player].Color = _BLX_UElOVpwD.Colors.Line
        _BLX_wrIbTgAi.lines[player].Visible = false
    end
    if not _BLX_wrIbTgAi.boxes[player] then 
        _BLX_wrIbTgAi.boxes[player] = Drawing.new(string.char(83,113,117,97,114,101))
        _BLX_wrIbTgAi.boxes[player].Filled = false
        _BLX_wrIbTgAi.boxes[player].Thickness = 1
        _BLX_wrIbTgAi.boxes[player].Color = _BLX_UElOVpwD.Colors.Box
        _BLX_wrIbTgAi.boxes[player].Visible = false
    end
    if not _BLX_wrIbTgAi.nameTexts[player] then 
        _BLX_wrIbTgAi.nameTexts[player] = Drawing.new(string.char(84,101,120,116))
        _BLX_wrIbTgAi.nameTexts[player].Size = 14
        _BLX_wrIbTgAi.nameTexts[player].Color = _BLX_UElOVpwD.Colors.Name
        _BLX_wrIbTgAi.nameTexts[player].Outline = true
        _BLX_wrIbTgAi.nameTexts[player].Visible = false
    end
    if not _BLX_wrIbTgAi.healthTexts[player] then 
        _BLX_wrIbTgAi.healthTexts[player] = Drawing.new(string.char(84,101,120,116))
        _BLX_wrIbTgAi.healthTexts[player].Size = 14
        _BLX_wrIbTgAi.healthTexts[player].Color = _BLX_UElOVpwD.Colors.Health
        _BLX_wrIbTgAi.healthTexts[player].Outline = true
        _BLX_wrIbTgAi.healthTexts[player].Visible = false
    end
    
    if not _BLX_wrIbTgAi.distanceTexts[player] then
        _BLX_wrIbTgAi.distanceTexts[player] = Drawing.new(string.char(84,101,120,116))
        _BLX_wrIbTgAi.distanceTexts[player].Size = 13
        _BLX_wrIbTgAi.distanceTexts[player].Color = _BLX_UElOVpwD.Colors.Distance
        _BLX_wrIbTgAi.distanceTexts[player].Outline = true
        _BLX_wrIbTgAi.distanceTexts[player].Visible = false
    end
    
    if not _BLX_wrIbTgAi.weaponTexts[player] then
        _BLX_wrIbTgAi.weaponTexts[player] = Drawing.new(string.char(84,101,120,116))
        _BLX_wrIbTgAi.weaponTexts[player].Size = 12
        _BLX_wrIbTgAi.weaponTexts[player].Color = _BLX_UElOVpwD.Colors.Weapon
        _BLX_wrIbTgAi.weaponTexts[player].Outline = true
        _BLX_wrIbTgAi.weaponTexts[player].Visible = false
    end
    
    if not _BLX_wrIbTgAi.timeTexts[player] then
        _BLX_wrIbTgAi.timeTexts[player] = Drawing.new(string.char(84,101,120,116))
        _BLX_wrIbTgAi.timeTexts[player].Size = 12
        _BLX_wrIbTgAi.timeTexts[player].Color = _BLX_UElOVpwD.Colors.Time
        _BLX_wrIbTgAi.timeTexts[player].Outline = true
        _BLX_wrIbTgAi.timeTexts[player].Visible = false
    end
    
    if not _BLX_wrIbTgAi.skeletons[player] then
        _BLX_wrIbTgAi.skeletons[player] = {}
        for i = 1, 15 do
            _BLX_wrIbTgAi.skeletons[player][i] = Drawing.new(string.char(76,105,110,101))
            _BLX_wrIbTgAi.skeletons[player][i].Thickness = 1.5
            _BLX_wrIbTgAi.skeletons[player][i].Color = _BLX_UElOVpwD.Colors.Skeleton
            _BLX_wrIbTgAi.skeletons[player][i].Visible = false
        end
    end
    
    if not _BLX_wrIbTgAi.tracers[player] then
        _BLX_wrIbTgAi.tracers[player] = Drawing.new(string.char(76,105,110,101))
        _BLX_wrIbTgAi.tracers[player].Thickness = 1
        _BLX_wrIbTgAi.tracers[player].Color = _BLX_UElOVpwD.Colors.Tracer
        _BLX_wrIbTgAi.tracers[player].Visible = false
    end

    -- Chams System
    local function applyChams()
        local _BLX_rPAogzWw = player.Character
        if _BLX_rPAogzWw then
            local _BLX_mIcFgeju = _BLX_rPAogzWw:FindFirstChild(string.char(66,108,111,111,100,105,120,72,105,103,104,108,105,103,104,116))
            if not _BLX_mIcFgeju then
                _BLX_mIcFgeju = Instance.new(string.char(72,105,103,104,108,105,103,104,116))
                _BLX_mIcFgeju.Name = string.char(66,108,111,111,100,105,120,72,105,103,104,108,105,103,104,116)
                _BLX_mIcFgeju.Parent = _BLX_rPAogzWw
            end
            _BLX_mIcFgeju.Enabled = _BLX_UElOVpwD.Chams and _BLX_UElOVpwD.Enabled
            _BLX_mIcFgeju.FillColor = _BLX_UElOVpwD.Colors.Chams
            _BLX_mIcFgeju.FillTransparency = _BLX_UElOVpwD.ChamsFill
            _BLX_mIcFgeju.OutlineTransparency = _BLX_UElOVpwD.ChamsOutline
            _BLX_mIcFgeju.Adornee = _BLX_rPAogzWw
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
    if _BLX_wrIbTgAi.lines[player] then _BLX_wrIbTgAi.lines[player]:Remove(); _BLX_wrIbTgAi.lines[player] = nil end
    if _BLX_wrIbTgAi.boxes[player] then _BLX_wrIbTgAi.boxes[player]:Remove(); _BLX_wrIbTgAi.boxes[player] = nil end
    if _BLX_wrIbTgAi.nameTexts[player] then _BLX_wrIbTgAi.nameTexts[player]:Remove(); _BLX_wrIbTgAi.nameTexts[player] = nil end
    if _BLX_wrIbTgAi.healthTexts[player] then _BLX_wrIbTgAi.healthTexts[player]:Remove(); _BLX_wrIbTgAi.healthTexts[player] = nil end
    if _BLX_wrIbTgAi.distanceTexts[player] then _BLX_wrIbTgAi.distanceTexts[player]:Remove(); _BLX_wrIbTgAi.distanceTexts[player] = nil end
    if _BLX_wrIbTgAi.weaponTexts[player] then _BLX_wrIbTgAi.weaponTexts[player]:Remove(); _BLX_wrIbTgAi.weaponTexts[player] = nil end
    if _BLX_wrIbTgAi.timeTexts[player] then _BLX_wrIbTgAi.timeTexts[player]:Remove(); _BLX_wrIbTgAi.timeTexts[player] = nil end
    if _BLX_wrIbTgAi.tracers[player] then _BLX_wrIbTgAi.tracers[player]:Remove(); _BLX_wrIbTgAi.tracers[player] = nil end
    if _BLX_wrIbTgAi.skeletons[player] then
        for i = 1, #_BLX_wrIbTgAi.skeletons[player] do
            if _BLX_wrIbTgAi.skeletons[player][i] then _BLX_wrIbTgAi.skeletons[player][i]:Remove() end
        end
        _BLX_wrIbTgAi.skeletons[player] = nil
    end
    _BLX_QCOrOCRV[player] = nil
end)

local function updateESPForPlayer(player, drawings)
    if not player or not player.Parent or player == LocalPlayer then return end
    
    local function hideAll()
        for i, _BLX_rIKMcJih in pairs(drawings) do
            if i == string.char(115,107,101,108,101,116,111,110) and typeof(_BLX_rIKMcJih) == string.char(116,97,98,108,101) then
                for _, sd in pairs(_BLX_rIKMcJih) do if sd then sd.Visible = false end end
            elseif _BLX_rIKMcJih then
                pcall(function() _BLX_rIKMcJih.Visible = false end)
            end
        end
    end

    local success, err = pcall(function()
        local _BLX_nulgJRUm = player.Character
        if not _BLX_nulgJRUm or not _BLX_nulgJRUm.Parent then hideAll() return end

        if _BLX_UElOVpwD.TeamCheck and player.Team == LocalPlayer.Team then
            hideAll()
            return
        end

        if not _BLX_UElOVpwD.Enabled then
            hideAll()
            return
        end
        
        local _BLX_bMuqYqnR = _BLX_nulgJRUm:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
        local _BLX_KfmGusjz = _BLX_nulgJRUm:FindFirstChild(string.char(72,101,97,100))
        local _BLX_XACpKUYP = _BLX_nulgJRUm:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
        
        if not _BLX_bMuqYqnR or not _BLX_KfmGusjz then 
            hideAll()
            return 
        end
        
        local _BLX_WWfcEOAT = workspace.CurrentCamera
        if not _BLX_WWfcEOAT then return end
        
        local _BLX_iFPUYseT = (_BLX_WWfcEOAT.CFrame.Position - _BLX_bMuqYqnR.Position).Magnitude
        if _BLX_iFPUYseT > _BLX_UElOVpwD.MaxDistance then
            hideAll()
            return
        end
        
        local screenPos, onScreen, depth = worldToScreen(_BLX_bMuqYqnR.Position)
        if depth <= 0 or not onScreen then
            hideAll()
            return
        end

        -- Calculate Box Dimensions
        local headPos, headOnScreen, headDepth = worldToScreen(_BLX_KfmGusjz.Position + Vector3.new(0, 0.5, 0))
        local legPos, legOnScreen, legDepth = worldToScreen(_BLX_bMuqYqnR.Position - Vector3.new(0, 3, 0))
        
        if headDepth <= 0 or legDepth <= 0 then
            hideAll()
            return
        end

        local _BLX_ZilPoyGS = math.abs(headPos.Y - legPos.Y)
        local _BLX_cMnvbSGP = _BLX_ZilPoyGS / 2
        local _BLX_SDifJwRf = headPos.Y
        local _BLX_urMfJXwB = legPos.Y
        local _BLX_xSkGywhl = screenPos.X

        -- Line ESP
        if _BLX_UElOVpwD.Line and drawings._BLX_TVRKnbmc then
            drawings._BLX_TVRKnbmc.From = Vector2.new(_BLX_WWfcEOAT.ViewportSize.X / 2, 0)
            drawings._BLX_TVRKnbmc.To = Vector2.new(_BLX_xSkGywhl, _BLX_SDifJwRf)
            drawings._BLX_TVRKnbmc.Visible = true
            drawings._BLX_TVRKnbmc.Color = _BLX_UElOVpwD.Colors.Line
        elseif drawings._BLX_TVRKnbmc then
            drawings._BLX_TVRKnbmc.Visible = false
        end
        
        -- Box ESP
        if _BLX_UElOVpwD.Box and drawings._BLX_rWXkUhCK then
            drawings._BLX_rWXkUhCK.Position = Vector2.new(_BLX_xSkGywhl - _BLX_cMnvbSGP/2, _BLX_SDifJwRf)
            drawings._BLX_rWXkUhCK.Size = Vector2.new(_BLX_cMnvbSGP, _BLX_ZilPoyGS)
            drawings._BLX_rWXkUhCK.Visible = true
            drawings._BLX_rWXkUhCK.Color = _BLX_UElOVpwD.Colors.Box
        elseif drawings._BLX_rWXkUhCK then
            drawings._BLX_rWXkUhCK.Visible = false
        end
        
        -- Name ESP
        if _BLX_UElOVpwD.Name and drawings._BLX_hrNGvXbu then
            drawings._BLX_hrNGvXbu.Position = Vector2.new(_BLX_xSkGywhl, _BLX_SDifJwRf - 15)
            drawings._BLX_hrNGvXbu.Text = player.Name
            drawings._BLX_hrNGvXbu.Visible = true
            drawings._BLX_hrNGvXbu.Center = true
            drawings._BLX_hrNGvXbu.Color = _BLX_UElOVpwD.Colors.Name
        elseif drawings._BLX_hrNGvXbu then
            drawings._BLX_hrNGvXbu.Visible = false
        end
        
        -- Health ESP
        if _BLX_UElOVpwD.Health and drawings.health and _BLX_XACpKUYP then
            drawings.health.Position = Vector2.new(_BLX_xSkGywhl, _BLX_SDifJwRf - 30)
            drawings.health.Text = string.char(72,80,58,32) .. math.floor(_BLX_XACpKUYP.Health)
            drawings.health.Visible = true
            drawings.health.Center = true
            drawings.health.Color = _BLX_UElOVpwD.Colors.Health
        elseif drawings.health then
            drawings.health.Visible = false
        end
        
        -- Distance ESP
        if _BLX_UElOVpwD.Distance and drawings._BLX_iFPUYseT then
            drawings._BLX_iFPUYseT.Position = Vector2.new(_BLX_xSkGywhl, _BLX_urMfJXwB + 5)
            drawings._BLX_iFPUYseT.Text = string.char(55357,56527,32) .. math.floor(_BLX_iFPUYseT) .. "m"
            drawings._BLX_iFPUYseT.Visible = true
            drawings._BLX_iFPUYseT.Center = true
            drawings._BLX_iFPUYseT.Color = _BLX_UElOVpwD.Colors.Distance
        elseif drawings._BLX_iFPUYseT then
            drawings._BLX_iFPUYseT.Visible = false
        end
        
        -- Weapon ESP
        if _BLX_UElOVpwD.Weapon and drawings.weapon then
            local _BLX_BoDnfwpv = _BLX_nulgJRUm:FindFirstChildOfClass(string.char(84,111,111,108))
            drawings.weapon.Position = Vector2.new(_BLX_xSkGywhl, _BLX_urMfJXwB + 20)
            drawings.weapon.Text = string.char(55357,56619,32) .. (_BLX_BoDnfwpv and _BLX_BoDnfwpv.Name or string.char(78,111,110,101))
            drawings.weapon.Visible = true
            drawings.weapon.Center = true
            drawings.weapon.Color = _BLX_UElOVpwD.Colors.Weapon
        elseif drawings.weapon then
            drawings.weapon.Visible = false
        end
        
        -- Time ESP
        if _BLX_UElOVpwD.Time and drawings.time then
            drawings.time.Position = Vector2.new(_BLX_xSkGywhl, _BLX_urMfJXwB + 35)
            drawings.time.Text = "⏰ " .. player.AccountAge .. string.char(32,100,97,121,115)
            drawings.time.Visible = true
            drawings.time.Center = true
            drawings.time.Color = _BLX_UElOVpwD.Colors.Time
        elseif drawings.time then
            drawings.time.Visible = false
        end
        
        -- Tracer ESP
        if _BLX_UElOVpwD.Tracer and drawings.tracer then
            drawings.tracer.From = Vector2.new(_BLX_WWfcEOAT.ViewportSize.X / 2, _BLX_WWfcEOAT.ViewportSize.Y)
            drawings.tracer.To = Vector2.new(_BLX_xSkGywhl, _BLX_urMfJXwB)
            drawings.tracer.Visible = true
            drawings.tracer.Color = _BLX_UElOVpwD.Colors.Tracer
        elseif drawings.tracer then
            drawings.tracer.Visible = false
        end
        
        -- Skeleton ESP
        if _BLX_UElOVpwD.Skeleton and drawings.skeleton then
            local function getPartPos(_BLX_hrNGvXbu)
                local _BLX_qqvgPZLt = _BLX_nulgJRUm:FindFirstChild(_BLX_hrNGvXbu)
                if _BLX_qqvgPZLt then
                    local sp, os = worldToScreen(_BLX_qqvgPZLt.Position)
                    if os then return sp end
                end
                return nil
            end

            local _BLX_mReVcVQX = {
                Head = getPartPos(string.char(72,101,97,100)),
                Torso = getPartPos(string.char(84,111,114,115,111)) or getPartPos(string.char(85,112,112,101,114,84,111,114,115,111)),
                LShoulder = getPartPos(string.char(76,101,102,116,32,83,104,111,117,108,100,101,114)) or getPartPos(string.char(76,101,102,116,85,112,112,101,114,65,114,109)),
                RShoulder = getPartPos(string.char(82,105,103,104,116,32,83,104,111,117,108,100,101,114)) or getPartPos(string.char(82,105,103,104,116,85,112,112,101,114,65,114,109)),
                LElbow = getPartPos(string.char(76,101,102,116,76,111,119,101,114,65,114,109)),
                RElbow = getPartPos(string.char(82,105,103,104,116,76,111,119,101,114,65,114,109)),
                LHand = getPartPos(string.char(76,101,102,116,72,97,110,100)),
                RHand = getPartPos(string.char(82,105,103,104,116,72,97,110,100)),
                LHip = getPartPos(string.char(76,101,102,116,32,72,105,112)) or getPartPos(string.char(76,101,102,116,85,112,112,101,114,76,101,103)),
                RHip = getPartPos(string.char(82,105,103,104,116,32,72,105,112)) or getPartPos(string.char(82,105,103,104,116,85,112,112,101,114,76,101,103)),
                LKnee = getPartPos(string.char(76,101,102,116,76,111,119,101,114,76,101,103)),
                RKnee = getPartPos(string.char(82,105,103,104,116,76,111,119,101,114,76,101,103)),
                LFoot = getPartPos(string.char(76,101,102,116,70,111,111,116)),
                RFoot = getPartPos(string.char(82,105,103,104,116,70,111,111,116))
            }

            local _BLX_jAFpkYpt = {
                {_BLX_mReVcVQX.Head, _BLX_mReVcVQX.Torso},
                {_BLX_mReVcVQX.Torso, _BLX_mReVcVQX.LShoulder},
                {_BLX_mReVcVQX.Torso, _BLX_mReVcVQX.RShoulder},
                {_BLX_mReVcVQX.LShoulder, _BLX_mReVcVQX.LElbow},
                {_BLX_mReVcVQX.RShoulder, _BLX_mReVcVQX.RElbow},
                {_BLX_mReVcVQX.LElbow, _BLX_mReVcVQX.LHand},
                {_BLX_mReVcVQX.RElbow, _BLX_mReVcVQX.RHand},
                {_BLX_mReVcVQX.Torso, _BLX_mReVcVQX.LHip},
                {_BLX_mReVcVQX.Torso, _BLX_mReVcVQX.RHip},
                {_BLX_mReVcVQX.LHip, _BLX_mReVcVQX.LKnee},
                {_BLX_mReVcVQX.RHip, _BLX_mReVcVQX.RKnee},
                {_BLX_mReVcVQX.LKnee, _BLX_mReVcVQX.LFoot},
                {_BLX_mReVcVQX.RKnee, _BLX_mReVcVQX.RFoot}
            }

            for i, conn in ipairs(_BLX_jAFpkYpt) do
                if drawings.skeleton[i] then
                    if conn[1] and conn[2] then
                        drawings.skeleton[i].From = conn[1]
                        drawings.skeleton[i].To = conn[2]
                        drawings.skeleton[i].Visible = true
                        drawings.skeleton[i].Color = _BLX_UElOVpwD.Colors.Skeleton
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

_BLX_hCACMlhl.RenderStepped:Connect(function()
    for player, _ in pairs(_BLX_wrIbTgAi.lines) do
        if player and player.Parent and player ~= LocalPlayer then
            local _BLX_BZwhIJnx = {
                _BLX_TVRKnbmc = _BLX_wrIbTgAi.lines[player],
                _BLX_rWXkUhCK = _BLX_wrIbTgAi.boxes[player],
                _BLX_hrNGvXbu = _BLX_wrIbTgAi.nameTexts[player],
                health = _BLX_wrIbTgAi.healthTexts[player],
                _BLX_iFPUYseT = _BLX_wrIbTgAi.distanceTexts and _BLX_wrIbTgAi.distanceTexts[player],
                weapon = _BLX_wrIbTgAi.weaponTexts and _BLX_wrIbTgAi.weaponTexts[player],
                time = _BLX_wrIbTgAi.timeTexts and _BLX_wrIbTgAi.timeTexts[player],
                skeleton = _BLX_wrIbTgAi.skeletons and _BLX_wrIbTgAi.skeletons[player],
                tracer = _BLX_wrIbTgAi.tracers and _BLX_wrIbTgAi.tracers[player]
            }
            
            pcall(updateESPForPlayer, player, _BLX_BZwhIJnx)
        end
    end
end)

--========================================================--
--==============  BIG HEADS SYSTEM FIXED ================--

local function enlargeHead(player)
    if not player or player == LocalPlayer then return false end
    if not _BLX_QmNWnpmF.Enabled then return false end
    
    local _BLX_nulgJRUm = player.Character
    if not _BLX_nulgJRUm then return false end
    
    local _BLX_KfmGusjz = _BLX_nulgJRUm:FindFirstChild(string.char(72,101,97,100))
    if not _BLX_KfmGusjz or not _BLX_KfmGusjz:IsA(string.char(66,97,115,101,80,97,114,116)) then return false end
    
    local _BLX_IkSvsbYh = _BLX_QmNWnpmF.Size
    
    -- Save original properties if not already saved
    if not _BLX_QCOrOCRV[player] then
        _BLX_QCOrOCRV[player] = {
            OriginalSize = _BLX_KfmGusjz.Size,
            OriginalMassless = _BLX_KfmGusjz.Massless,
            OriginalCanCollide = _BLX_KfmGusjz.CanCollide,
            OriginalTransparency = _BLX_KfmGusjz.Transparency
        }
    end
    
    -- Apply big _BLX_KfmGusjz
    pcall(function()
        _BLX_KfmGusjz.Size = Vector3.new(_BLX_IkSvsbYh, _BLX_IkSvsbYh, _BLX_IkSvsbYh)
        _BLX_KfmGusjz.Massless = true
        _BLX_KfmGusjz.CanCollide = false
        _BLX_KfmGusjz.Transparency = 0.5
        
        -- Scale _BLX_ieGFnpLg if exists
        local _BLX_ieGFnpLg = _BLX_KfmGusjz:FindFirstChildOfClass(string.char(83,112,101,99,105,97,108,77,101,115,104))
        if _BLX_ieGFnpLg then
            _BLX_ieGFnpLg.Scale = Vector3.new(_BLX_IkSvsbYh/2, _BLX_IkSvsbYh/2, _BLX_IkSvsbYh/2)
        end
        
        -- Scale _BLX_bpZMRXPk
        local _BLX_bpZMRXPk = _BLX_KfmGusjz:FindFirstChild(string.char(95,66,76,88,95,98,112,90,77,82,88,80,107)) or _BLX_KfmGusjz:FindFirstChildOfClass(string.char(68,101,99,97,108))
        if _BLX_bpZMRXPk and _BLX_bpZMRXPk:IsA(string.char(68,101,99,97,108)) then
            pcall(function()
                _BLX_bpZMRXPk.Transparency = 0
            end)
        end
    end)
    
    return true
end

local function resetHead(player)
    if _BLX_QCOrOCRV[player] then
        local _BLX_nulgJRUm = player.Character
        if _BLX_nulgJRUm then
            local _BLX_KfmGusjz = _BLX_nulgJRUm:FindFirstChild(string.char(72,101,97,100))
            if _BLX_KfmGusjz then
                _BLX_KfmGusjz.Size = _BLX_QCOrOCRV[player].OriginalSize
                _BLX_KfmGusjz.Massless = _BLX_QCOrOCRV[player].OriginalMassless
                
                local _BLX_bpZMRXPk = _BLX_KfmGusjz:FindFirstChild(string.char(95,66,76,88,95,98,112,90,77,82,88,80,107)) or _BLX_KfmGusjz:FindFirstChildOfClass(string.char(68,101,99,97,108))
                if _BLX_bpZMRXPk and _BLX_bpZMRXPk:GetAttribute(string.char(79,114,105,103,105,110,97,108,70,97,99,101,83,105,122,101)) then
                    _BLX_bpZMRXPk.Size = _BLX_bpZMRXPk:GetAttribute(string.char(79,114,105,103,105,110,97,108,70,97,99,101,83,105,122,101))
                    _BLX_bpZMRXPk:SetAttribute(string.char(79,114,105,103,105,110,97,108,70,97,99,101,83,105,122,101), nil)
                end
            end
        end
        
        _BLX_QCOrOCRV[player] = nil
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
    for player, _ in pairs(_BLX_QCOrOCRV) do
        resetHead(player)
    end
end

task.spawn(function()
    while true do
        task.wait(2)
        
        if _BLX_QmNWnpmF.Enabled then
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
        if _BLX_QmNWnpmF.Enabled then
            task.wait(1)
            enlargeHead(player)
        end
        
        player.CharacterAdded:Connect(function()
            if _BLX_QmNWnpmF.Enabled then
                task.wait(1)
                enlargeHead(player)
            end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if _BLX_QCOrOCRV[player] then
        _BLX_QCOrOCRV[player] = nil
    end
end)

--========================================================--
--====================  ESP TAB ========================--
AddLabel(_BLX_JVtXmTag, string.char(55357,56385,65039,32,69,83,80,32,83,69,84,84,73,78,71,83), 8)

local _BLX_kLtxVjOt = AddToggle(_BLX_JVtXmTag, string.char(69,83,80,32,77,97,115,116,101,114), 36, false, function(s) 
    _BLX_UElOVpwD.Enabled = s 
    if not s then
        for _, _BLX_TVRKnbmc in pairs(_BLX_wrIbTgAi.lines) do
            if _BLX_TVRKnbmc then _BLX_TVRKnbmc.Visible = false end
        end
        for _, _BLX_rWXkUhCK in pairs(_BLX_wrIbTgAi.boxes) do
            if _BLX_rWXkUhCK then _BLX_rWXkUhCK.Visible = false end
        end
        for _, _BLX_hrNGvXbu in pairs(_BLX_wrIbTgAi.nameTexts) do
            if _BLX_hrNGvXbu then _BLX_hrNGvXbu.Visible = false end
        end
        for _, health in pairs(_BLX_wrIbTgAi.healthTexts) do
            if health then health.Visible = false end
        end
    end
end)

local _BLX_WaRoMBLQ = AddToggle(_BLX_JVtXmTag, string.char(76,105,110,101,32,69,83,80), 76, false, function(s) 
    _BLX_UElOVpwD.Line = s 
end)

local _BLX_xCDlBjXG = AddToggle(_BLX_JVtXmTag, string.char(66,111,120,32,69,83,80), 116, false, function(s) 
    _BLX_UElOVpwD.Box = s 
end)

local _BLX_UBrcUqUk = AddToggle(_BLX_JVtXmTag, string.char(83,104,111,119,32,78,97,109,101,115), 156, false, function(s) 
    _BLX_UElOVpwD.Name = s 
end)

local _BLX_gJVYsGrW = AddToggle(_BLX_JVtXmTag, string.char(83,104,111,119,32,72,101,97,108,116,104), 196, false, function(s) 
    _BLX_UElOVpwD.Health = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(55357,56527,32,68,105,115,116,97,110,99,101), 236, false, function(s) 
    _BLX_UElOVpwD.Distance = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(55357,56448,32,83,107,101,108,101,116,111,110), 276, false, function(s) 
    _BLX_UElOVpwD.Skeleton = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(55357,56525,32,84,114,97,99,101,114), 316, false, function(s) 
    _BLX_UElOVpwD.Tracer = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(55357,56619,32,87,101,97,112,111,110), 356, false, function(s) 
    _BLX_UElOVpwD.Weapon = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(9200,32,65,99,99,111,117,110,116,32,65,103,101), 396, false, function(s) 
    _BLX_UElOVpwD.Time = s 
end)

AddToggle(_BLX_JVtXmTag, string.char(10024,32,80,108,97,121,101,114,32,67,104,97,109,115,32,40,72,105,103,104,108,105,103,104,116,41), 436, _BLX_UElOVpwD.Chams, function(s) 
    _BLX_UElOVpwD.Chams = s 
end)

AddSlider(_BLX_JVtXmTag, string.char(67,104,97,109,115,32,70,105,108,108), 476, 0, 1, _BLX_UElOVpwD.ChamsFill, function(v) 
    _BLX_UElOVpwD.ChamsFill = v 
end)

local _BLX_UDmEFYzc = AddSlider(_BLX_JVtXmTag, string.char(77,97,120,32,68,105,115,116,97,110,99,101), 516, 100, 5000, _BLX_UElOVpwD.MaxDistance, function(v) 
    _BLX_UElOVpwD.MaxDistance = v 
end)

AddToggle(_BLX_JVtXmTag, string.char(55357,56421,32,84,101,97,109,32,67,104,101,99,107), 556, _BLX_UElOVpwD.TeamCheck, function(s) 
    _BLX_UElOVpwD.TeamCheck = s 
end)

AddLabel(_BLX_JVtXmTag, string.char(55356,57256,32,69,83,80,32,67,79,76,79,82,83), 596)

AddColorCycle(_BLX_JVtXmTag, string.char(66,111,120,32,67,111,108,111,114), 626, _BLX_UElOVpwD.Colors.Box, function(c) _BLX_UElOVpwD.Colors.Box = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(76,105,110,101,32,67,111,108,111,114), 666, _BLX_UElOVpwD.Colors.Line, function(c) _BLX_UElOVpwD.Colors.Line = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(78,97,109,101,32,67,111,108,111,114), 706, _BLX_UElOVpwD.Colors.Name, function(c) _BLX_UElOVpwD.Colors.Name = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(72,101,97,108,116,104,32,67,111,108,111,114), 746, _BLX_UElOVpwD.Colors.Health, function(c) _BLX_UElOVpwD.Colors.Health = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(68,105,115,116,97,110,99,101,32,67,111,108,111,114), 786, _BLX_UElOVpwD.Colors.Distance, function(c) _BLX_UElOVpwD.Colors.Distance = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(84,114,97,99,101,114,32,67,111,108,111,114), 826, _BLX_UElOVpwD.Colors.Tracer, function(c) _BLX_UElOVpwD.Colors.Tracer = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(83,107,101,108,101,116,111,110,32,67,111,108,111,114), 866, _BLX_UElOVpwD.Colors.Skeleton, function(c) _BLX_UElOVpwD.Colors.Skeleton = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(87,101,97,112,111,110,32,67,111,108,111,114), 906, _BLX_UElOVpwD.Colors.Weapon, function(c) _BLX_UElOVpwD.Colors.Weapon = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(84,105,109,101,32,67,111,108,111,114), 946, _BLX_UElOVpwD.Colors.Time, function(c) _BLX_UElOVpwD.Colors.Time = c end)
AddColorCycle(_BLX_JVtXmTag, string.char(67,104,97,109,115,32,67,111,108,111,114), 986, _BLX_UElOVpwD.Colors.Chams, function(c) _BLX_UElOVpwD.Colors.Chams = c end)

--========================================================--
--====================  PLAYER TAB =====================--
AddLabel(_BLX_oUZnGIww,string.char(55357,56420,32,80,76,65,89,69,82,32,84,79,79,76,83),8)

local _BLX_wWKOMnzH = AddToggle(_BLX_oUZnGIww,string.char(83,112,101,101,100,32,66,111,111,115,116),36,false,function(s) 
    _BLX_fiophKqK.SpeedOn = s 
end)

local _BLX_vSFWTsaW = AddToggle(_BLX_oUZnGIww,string.char(72,105,103,104,32,74,117,109,112),76,false,function(s) 
    _BLX_fiophKqK.JumpOn = s 
end)

local _BLX_rTUPIlDm = AddToggle(_BLX_oUZnGIww,string.char(78,111,67,108,105,112),116,false,function(s) 
    _BLX_fiophKqK.NoClip = s 
end)

local _BLX_RKhSnoqw = AddToggle(_BLX_oUZnGIww,string.char(70,108,121,32,77,111,100,101),156,false,function(s) 
    _BLX_fiophKqK.Fly = s 
end)

-- SWIM MODE
local _BLX_tkdSBvEW = AddToggle(_BLX_oUZnGIww,string.char(55356,57290,32,83,119,105,109,32,77,111,100,101),196,false,function(s) 
    _BLX_fiophKqK.Swim = s 
end)

-- GIANT MODE (x13)
local _BLX_UluAWesx = AddToggle(_BLX_oUZnGIww,string.char(55357,56831,32,71,105,97,110,116,32,77,111,100,101,32,40,120,51,41),236,false,function(s) 
    _BLX_fiophKqK.GiantMode = s 
    local _BLX_rPAogzWw = LocalPlayer.Character
    if _BLX_rPAogzWw then
        local _BLX_XACpKUYP = _BLX_rPAogzWw:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
        if _BLX_XACpKUYP then
            if s then
                for _, part in pairs(_BLX_rPAogzWw:GetDescendants()) do
                    if part:IsA(string.char(66,97,115,101,80,97,114,116)) and part.Name ~= string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116) then
                        part.Size = part.Size * 2
                    end
                end
                _BLX_XACpKUYP.HipHeight = _BLX_XACpKUYP.HipHeight * 2
            else
                LocalPlayer.Character:BreakJoints()
            end
        end
    end
end)

-- BIG HEADS SYSTEM
AddLabel(_BLX_oUZnGIww, string.char(55357,56401,32,66,73,71,32,72,69,65,68,83,32,83,89,83,84,69,77), 286)

local _BLX_JqLIvvDB = AddToggle(_BLX_oUZnGIww, string.char(66,105,103,32,72,101,97,100,115), 316, _BLX_QmNWnpmF.Enabled, function(s)
    _BLX_QmNWnpmF.Enabled = s
    if s then
        applyBigHeadsToAll()
    else
        resetBigHeadsForAll()
    end
end)

local _BLX_MVUZZcRc = AddSlider(_BLX_oUZnGIww, string.char(72,101,97,100,32,83,105,122,101), 366, 1, 10, _BLX_QmNWnpmF.Size, function(v)
    _BLX_QmNWnpmF.Size = v
    if _BLX_QmNWnpmF.Enabled then
        applyBigHeadsToAll()
    end
end)

local _BLX_NgojIMJr = AddSlider(_BLX_oUZnGIww, string.char(87,97,108,107,32,83,112,101,101,100), 416, 8, 380, _BLX_fiophKqK.Speed, function(v) 
    _BLX_fiophKqK.Speed = v 
end)

local _BLX_ezhDhHWO = AddSlider(_BLX_oUZnGIww, string.char(74,117,109,112,32,80,111,119,101,114), 466, 30, 250, _BLX_fiophKqK.JumpPower, function(v) 
    _BLX_fiophKqK.JumpPower = v 
end)

--========================================================--
--==================  EMOTES TAB (رقصات) ================--
_BLX_nkkzlcDr:ClearAllChildren()

AddLabel(_BLX_nkkzlcDr, string.char(55357,56451,32,69,77,79,84,69,83,32,83,89,83,84,69,77,32,45,32,1606,1592,1575,1605,32,1575,1604,1585,1602,1589,1575,1578), 8)
AddLabel(_BLX_nkkzlcDr, string.char(1575,1604,1585,1602,1589,1575,1578,32,1578,1592,1607,1585,32,1604,1580,1605,1610,1593,32,1575,1604,1604,1575,1593,1576,1610,1606,32,1601,1610,32,1575,1604,1587,1610,1585,1601,1585,33), 38)

local _BLX_hvZZtLty = nil

local _BLX_brgXIlxh = {
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
    [string.char(78,111,32,66,111,117,110,100,97,114,105,101,115)] = {
        Idle = 18747067405, Idle2 = 18747063918, Idle3 = 18747063918, Walk = 18747074203, Run = 18747070484, Jump = 18747069148, Climb = 18747060903, Fall = 18747062535, Swim = 18747073181, SwimIdle = 18747071682, Weight = 9, Weight2 = 1
    },
    [string.char(78,70,76,32,65,110,105,109,97,116,105,111,110)] = {
        Idle = 92080889861410, Idle2 = 74451233229259, Idle3 = 80884010501210, Walk = 110358958299415, Run = 117333533048078, Jump = 119846112151352, Climb = 134630013742019, Fall = 129773241321032, Swim = 132697394189921, SwimIdle = 79090109939093, Weight = 9, Weight2 = 1
    },
    [string.char(65,100,105,100,97,115,32,83,112,111,114,116,115)] = {
        Idle = 18537376492, Idle2 = 18537371272, Idle3 = 18537374150, Walk = 18537392113, Run = 18537384940, Jump = 18537380791, Climb = 18537363391, Fall = 18537367238, Swim = 18537389531, SwimIdle = 18537387180, Weight = 9, Weight2 = 1
    },
    [string.char(87,105,99,107,108,101,100,32,80,111,112,117,108,97,114)] = {
        Idle = 118832222982049, Idle2 = 76049494037641, Idle3 = 138255200176080, Walk = 92072849924640, Run = 72301599441680, Jump = 104325245285198, Climb = 131326830509784, Fall = 121152442762481, Swim = 99384245425157, SwimIdle = 113199415118199, Weight = 9, Weight2 = 1
    },
    [string.char(67,97,116,119,97,108,107,32,71,108,97,109)] = {
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
        Idle = 1132473842, Idle2 = 1132477671, Idle3 = string.char(78,111,110,101), Walk = 1132510133, Run = 1132494274, Jump = 1132489853, Climb = 1132461372, Fall = 1132469004, Swim = 1132500520, SwimIdle = 1132506407, Weight = 9, Weight2 = 1
    },
    Cowboy = {
        Idle = 1014390418, Idle2 = 1014398616, Idle3 = 1159487651, Walk = 1014421541, Run = 1014401683, Jump = 1014394726, Climb = 1014380606, Fall = 1014384571, Swim = 1014406523, SwimIdle = 1014411816, Weight = 9, Weight2 = 1
    },
    Ghost = {
        Idle = 616006778, Idle2 = 616008087, Idle3 = 616008087, Walk = 616013216, Run = 616013216, Jump = 616008936, Climb = 0, Fall = 616005863, Swim = 616011509, SwimIdle = 616012453, Weight = 9, Weight2 = 1
    },
    [string.char(71,104,111,115,116,32,50)] = {
        Idle = 1151221899, Idle2 = 1151221899, Idle3 = string.char(78,111,110,101), Walk = 1151221899, Run = 1151221899, Jump = 1151221899, Climb = 0, Fall = 1151221899, Swim = 16738339158, SwimIdle = 1151221899, Weight = 9, Weight2 = 1
    },
    [string.char(77,114,46,32,84,111,105,108,101,116)] = {
        Idle = 4417977954, Idle2 = 4417978624, Idle3 = 4441285342, Walk = 2510202577, Run = 4417979645, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    Udzal = {
        Idle = 3303162274, Idle2 = 3303162549, Idle3 = 3710161342, Walk = 3303162967, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    [string.char(79,105,110,97,110,32,84,104,105,99,107,104,111,111,102)] = {
        Idle = 657595757, Idle2 = 657568135, Idle3 = 885499184, Walk = 2510202577, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    Borock = {
        Idle = 3293641938, Idle2 = 3293642554, Idle3 = 3710131919, Walk = 2510202577, Run = 3236836670, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    [string.char(66,108,111,99,107,121,32,77,101,99,104)] = {
        Idle = 4417977954, Idle2 = 4417978624, Idle3 = 4441285342, Walk = 2510202577, Run = 4417979645, Jump = 2510197830, Climb = 2510192778, Fall = 2510195892, Swim = 2510199791, SwimIdle = 2510201162, Weight = 9, Weight2 = 1
    },
    [string.char(83,116,121,108,105,122,101,100,32,70,101,109,97,108,101)] = {
        Idle = 4708191566, Idle2 = 4708192150, Idle3 = 121221, Walk = 4708193840, Run = 4708192705, Jump = 4708188025, Climb = 4708184253, Fall = 4708186162, Swim = 4708189360, SwimIdle = 4708190607, Weight = 9, Weight2 = 1
    },
    R15_Default = {
        Idle = 4211217646, Idle2 = 4211218409, Idle3 = string.char(78,111,110,101), Walk = 4211223236, Run = 4211220381, Jump = 4211219390, Climb = 4211214992, Fall = 4211216152, Swim = 4211221314, SwimIdle = 4374694239, Weight = 9, Weight2 = 1
    },
    R6_Default = {
        Idle = 180435571, Idle2 = 180435571, Idle3 = string.char(78,111,110,101), Walk = 180426354, Run = 180426354, Jump = 125750702, Climb = 180436334, Fall = 180436148, Swim = 180436554, SwimIdle = 180436554, Weight = 9, Weight2 = 1
    },
    Mocap = {
        Idle = 913367814, Idle2 = 913373430, Idle3 = string.char(78,111,110,101), Walk = 913402848, Run = 913376220, Jump = 913370268, Climb = 913362637, Fall = 913365531, Swim = 913384386, SwimIdle = 913389285, Weight = 9, Weight2 = 1
    }
}

local function replaceAnimations(packName)
    local _BLX_cbCaIRhW = _BLX_brgXIlxh[packName]
    if not _BLX_cbCaIRhW then return end
    
    local _BLX_nulgJRUm = LocalPlayer.Character
    if not _BLX_nulgJRUm then return end
    
    local _BLX_ntSHVkqs = _BLX_nulgJRUm:FindFirstChild(string.char(65,110,105,109,97,116,101))
    if not _BLX_ntSHVkqs then return end
    
    local function setAnim(_BLX_hrNGvXbu, _BLX_YSislNZr)
        local _BLX_XevnErqQ = _BLX_ntSHVkqs:FindFirstChild(_BLX_hrNGvXbu)
        if _BLX_XevnErqQ then
            local _BLX_uJlXfCHn = _BLX_XevnErqQ:FindFirstChildOfClass(string.char(65,110,105,109,97,116,105,111,110))
            if _BLX_uJlXfCHn then
                _BLX_uJlXfCHn.AnimationId = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47) .. _BLX_YSislNZr
            end
        end
    end
    
    setAnim(string.char(105,100,108,101), _BLX_cbCaIRhW.Idle)
    if _BLX_ntSHVkqs:FindFirstChild(string.char(105,100,108,101)) and _BLX_ntSHVkqs.idle:FindFirstChild(string.char(65,110,105,109,97,116,105,111,110,50)) then
        _BLX_ntSHVkqs.idle.Animation2.AnimationId = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47) .. _BLX_cbCaIRhW.Idle2
    end
    
    setAnim(string.char(119,97,108,107), _BLX_cbCaIRhW.Walk)
    setAnim(string.char(114,117,110), _BLX_cbCaIRhW.Run)
    setAnim(string.char(106,117,109,112), _BLX_cbCaIRhW.Jump)
    setAnim(string.char(99,108,105,109,98), _BLX_cbCaIRhW.Climb)
    setAnim(string.char(102,97,108,108), _BLX_cbCaIRhW.Fall)
    setAnim(string.char(115,119,105,109), _BLX_cbCaIRhW.Swim)
    setAnim(string.char(115,119,105,109,105,100,108,101), _BLX_cbCaIRhW.SwimIdle)
    
    -- Refresh animations
    local _BLX_XACpKUYP = _BLX_nulgJRUm:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
    if _BLX_XACpKUYP then
        local _BLX_XyWhhufA = _BLX_XACpKUYP:GetState()
        _BLX_XACpKUYP:ChangeState(Enum.HumanoidStateType.None)
        task.wait(0.1)
        _BLX_XACpKUYP:ChangeState(_BLX_XyWhhufA)
    end
end

local function isR15()
    local _BLX_nulgJRUm = LocalPlayer.Character
    if _BLX_nulgJRUm then
        return _BLX_nulgJRUm:FindFirstChild(string.char(85,112,112,101,114,84,111,114,115,111)) ~= nil
    end
    return false
end

local _BLX_CBxutTGc = {
    {_BLX_hrNGvXbu = string.char(65,115,116,114,111,110,97,117,116), _BLX_YSislNZr = 891621366},
    {_BLX_hrNGvXbu = string.char(66,117,98,98,108,121), _BLX_YSislNZr = 910004836},
    {_BLX_hrNGvXbu = string.char(67,97,114,101,108,101,115,115), _BLX_YSislNZr = 909988915},
    {_BLX_hrNGvXbu = string.char(67,111,110,102,117,115,101,100), _BLX_YSislNZr = 1018894549},
    {_BLX_hrNGvXbu = string.char(68,105,122,122,121), _BLX_YSislNZr = 910009958},
    {_BLX_hrNGvXbu = string.char(70,108,111,115,115), _BLX_YSislNZr = 910025318},
    {_BLX_hrNGvXbu = string.char(72,101,105,115,109,97,110), _BLX_YSislNZr = 1018888561},
    {_BLX_hrNGvXbu = string.char(83,97,108,117,116,101), _BLX_YSislNZr = 910034870},
    {_BLX_hrNGvXbu = string.char(83,104,114,117,103), _BLX_YSislNZr = 910038419},
    {_BLX_hrNGvXbu = string.char(84,105,108,116), _BLX_YSislNZr = 910042935},
    {_BLX_hrNGvXbu = string.char(83,104,117,102,102,108,101), _BLX_YSislNZr = 429703734},
    {_BLX_hrNGvXbu = string.char(75,105,99,107), _BLX_YSislNZr = 1018790633},
    {_BLX_hrNGvXbu = string.char(70,97,108,108), _BLX_YSislNZr = 180435571},
    {_BLX_hrNGvXbu = string.char(83,112,105,110), _BLX_YSislNZr = 188632011},
    {_BLX_hrNGvXbu = string.char(74,101,114,107), _BLX_YSislNZr = 1018552182},
    {_BLX_hrNGvXbu = string.char(82,111,98,111,116), _BLX_YSislNZr = 616006778},
    {_BLX_hrNGvXbu = string.char(90,111,109,98,105,101), _BLX_YSislNZr = 616008087},
    {_BLX_hrNGvXbu = string.char(78,105,110,106,97), _BLX_YSislNZr = 656117878},
    {_BLX_hrNGvXbu = string.char(87,101,114,101,119,111,108,102), _BLX_YSislNZr = 1083216690},
    {_BLX_hrNGvXbu = string.char(73,110,115,97,110,101), _BLX_YSislNZr = 33796059},
    {_BLX_hrNGvXbu = string.char(83,117,112,101,114,104,101,114,111), _BLX_YSislNZr = 782841498},
    {_BLX_hrNGvXbu = string.char(79,108,100,115,99,104,111,111,108), _BLX_YSislNZr = 5917459365},
    {_BLX_hrNGvXbu = string.char(83,116,121,108,105,115,104), _BLX_YSislNZr = 616136790},
    {_BLX_hrNGvXbu = string.char(69,108,100,101,114), _BLX_YSislNZr = 845397899},
    {_BLX_hrNGvXbu = string.char(75,110,105,103,104,116), _BLX_YSislNZr = 657564596},
    -- New Emotes from E Table
    {_BLX_hrNGvXbu = string.char(70,97,115,104,105,111,110), _BLX_YSislNZr = 3333331310},
    {_BLX_hrNGvXbu = string.char(66,97,98,121,32,68,97,110,99,101), _BLX_YSislNZr = 4265725525},
    {_BLX_hrNGvXbu = string.char(67,104,97,45,67,104,97), _BLX_YSislNZr = 6862001787},
    {_BLX_hrNGvXbu = string.char(77,111,110,107,101,121), _BLX_YSislNZr = 3333499508},
    {_BLX_hrNGvXbu = string.char(84,111,112,32,82,111,99,107), _BLX_YSislNZr = 3361276673},
    {_BLX_hrNGvXbu = string.char(65,114,111,117,110,100,32,84,111,119,110), _BLX_YSislNZr = 3303391864},
    {_BLX_hrNGvXbu = string.char(70,97,110,99,121,32,70,101,101,116), _BLX_YSislNZr = 3333432454},
    {_BLX_hrNGvXbu = string.char(72,121,112,101,32,68,97,110,99,101), _BLX_YSislNZr = 3695333486},
    {_BLX_hrNGvXbu = string.char(66,111,100,121,98,117,105,108,100,101,114), _BLX_YSislNZr = 3333387824},
    {_BLX_hrNGvXbu = string.char(73,100,111,108), _BLX_YSislNZr = 4101966434},
    {_BLX_hrNGvXbu = string.char(67,117,114,116,115,121), _BLX_YSislNZr = 4555816777},
    {_BLX_hrNGvXbu = string.char(72,97,112,112,121), _BLX_YSislNZr = 4841405708},
    {_BLX_hrNGvXbu = string.char(81,117,105,101,116,32,87,97,118,101,115), _BLX_YSislNZr = 7465981288},
    {_BLX_hrNGvXbu = string.char(83,108,101,101,112), _BLX_YSislNZr = 4686925579},
    {_BLX_hrNGvXbu = string.char(70,108,111,115,115,32,68,97,110,99,101), _BLX_YSislNZr = 5917459365},
    {_BLX_hrNGvXbu = string.char(83,104,121), _BLX_YSislNZr = 3337978742},
    {_BLX_hrNGvXbu = string.char(71,111,100,108,105,107,101), _BLX_YSislNZr = 3337994105},
    {_BLX_hrNGvXbu = string.char(72,101,114,111,32,76,97,110,100,105,110,103), _BLX_YSislNZr = 5104344710},
    {_BLX_hrNGvXbu = string.char(72,105,103,104,32,87,97,118,101), _BLX_YSislNZr = 5915690960},
    {_BLX_hrNGvXbu = string.char(67,111,119,101,114), _BLX_YSislNZr = 4940563117},
    {_BLX_hrNGvXbu = string.char(66,111,114,101,100), _BLX_YSislNZr = 5230599789},
    {_BLX_hrNGvXbu = string.char(83,104,111,119,32,68,101,109,32,87,114,105,115,116,115), _BLX_YSislNZr = 7198989668},
    {_BLX_hrNGvXbu = string.char(67,101,108,101,98,114,97,116,101), _BLX_YSislNZr = 3338097973},
    {_BLX_hrNGvXbu = string.char(68,97,115,104), _BLX_YSislNZr = 582855105},
    {_BLX_hrNGvXbu = string.char(66,101,99,107,111,110), _BLX_YSislNZr = 5230598276},
    {_BLX_hrNGvXbu = string.char(72,97,104,97), _BLX_YSislNZr = 3337966527},
    {_BLX_hrNGvXbu = string.char(76,97,115,115,111,32,84,117,114,110), _BLX_YSislNZr = 7942896991},
    {_BLX_hrNGvXbu = string.char(76,105,110,101,32,68,97,110,99,101), _BLX_YSislNZr = 4049037604},
    {_BLX_hrNGvXbu = string.char(80,111,105,110,116,50), _BLX_YSislNZr = 3344585679},
    {_BLX_hrNGvXbu = string.char(83,116,97,100,105,117,109), _BLX_YSislNZr = 3338055167},
    {_BLX_hrNGvXbu = string.char(83,105,100,101,32,116,111,32,83,105,100,101), _BLX_YSislNZr = 3333136415},
    {_BLX_hrNGvXbu = string.char(79,108,100,32,84,111,119,110,32,82,111,97,100,32,68,97,110,99,101), _BLX_YSislNZr = 5937560570},
    {_BLX_hrNGvXbu = string.char(72,101,108,108,111), _BLX_YSislNZr = 3344650532},
    {_BLX_hrNGvXbu = string.char(68,111,108,112,104,105,110,32,68,97,110,99,101), _BLX_YSislNZr = 5918726674},
    {_BLX_hrNGvXbu = string.char(83,97,109,98,97), _BLX_YSislNZr = 6869766175},
    {_BLX_hrNGvXbu = string.char(66,114,101,97,107,32,68,97,110,99,101), _BLX_YSislNZr = 5915648917},
    {_BLX_hrNGvXbu = string.char(72,105,112,115,32,80,111,112,112,105,110,39), _BLX_YSislNZr = 6797888062},
    {_BLX_hrNGvXbu = string.char(87,97,107,101,32,85,112,32,67,97,108,108), _BLX_YSislNZr = 7199000883},
    {_BLX_hrNGvXbu = string.char(71,114,101,97,116,101,115,116), _BLX_YSislNZr = 3338042785},
    {_BLX_hrNGvXbu = string.char(79,110,32,84,104,101,32,79,117,116,115,105,100,101), _BLX_YSislNZr = 7422779536},
    {_BLX_hrNGvXbu = string.char(66,111,120,105,110,103,32,80,117,110,99,104), _BLX_YSislNZr = 7202863182},
    {_BLX_hrNGvXbu = string.char(83,97,100), _BLX_YSislNZr = 4841407203},
    {_BLX_hrNGvXbu = string.char(70,108,111,119,105,110,103,32,66,114,101,101,122,101), _BLX_YSislNZr = 7465946930},
    {_BLX_hrNGvXbu = string.char(84,119,105,114,108), _BLX_YSislNZr = 3334968680},
    {_BLX_hrNGvXbu = string.char(74,117,109,112,105,110,103,32,87,97,118,101), _BLX_YSislNZr = 4940564896},
    {_BLX_hrNGvXbu = string.char(72,79,76,73,68,65,89,32,68,97,110,99,101), _BLX_YSislNZr = 5937558680},
    {_BLX_hrNGvXbu = string.char(84,97,107,101,32,77,101,32,85,110,100,101,114), _BLX_YSislNZr = 6797890377},
    {_BLX_hrNGvXbu = string.char(68,105,122,122,121), _BLX_YSislNZr = 3361426436},
    {_BLX_hrNGvXbu = string.char(68,97,110,99,105,110,103,39,32,83,104,111,101,115), _BLX_YSislNZr = 7404878500},
    {_BLX_hrNGvXbu = string.char(70,97,115,104,105,111,110,97,98,108,101), _BLX_YSislNZr = 3333331310},
    {_BLX_hrNGvXbu = string.char(70,97,115,116,32,72,97,110,100,115), _BLX_YSislNZr = 4265701731},
    {_BLX_hrNGvXbu = string.char(84,114,101,101), _BLX_YSislNZr = 4049551434},
    {_BLX_hrNGvXbu = string.char(65,103,114,101,101), _BLX_YSislNZr = 4841397952},
    {_BLX_hrNGvXbu = string.char(80,111,119,101,114,32,66,108,97,115,116), _BLX_YSislNZr = 4841403964},
    {_BLX_hrNGvXbu = string.char(83,119,111,111,115,104), _BLX_YSislNZr = 3361481910},
    {_BLX_hrNGvXbu = string.char(74,117,109,112,105,110,103,32,67,104,101,101,114), _BLX_YSislNZr = 5895324424},
    {_BLX_hrNGvXbu = string.char(68,105,115,97,103,114,101,101), _BLX_YSislNZr = 4841401869},
    {_BLX_hrNGvXbu = string.char(82,111,100,101,111,32,68,97,110,99,101), _BLX_YSislNZr = 5918728267},
    {_BLX_hrNGvXbu = string.char(73,116,32,65,105,110,39,95,66,76,88,95,115,98,83,85,113,102,85,87,32,77,121,32,70,97,117,108,116), _BLX_YSislNZr = 6797891807},
    {_BLX_hrNGvXbu = string.char(82,111,99,107,32,79,110), _BLX_YSislNZr = 5915714366},
    {_BLX_hrNGvXbu = string.char(66,108,111,99,107,32,80,97,114,116,105,101,114), _BLX_YSislNZr = 6862022283},
    {_BLX_hrNGvXbu = string.char(68,111,114,107,121,32,68,97,110,99,101), _BLX_YSislNZr = 4212455378},
    {_BLX_hrNGvXbu = string.char(65,79,75), _BLX_YSislNZr = 7942885103},
    {_BLX_hrNGvXbu = "T", _BLX_YSislNZr = 3338010159},
    {_BLX_hrNGvXbu = string.char(67,111,98,114,97,32,65,114,109,115), _BLX_YSislNZr = 7942890105},
    {_BLX_hrNGvXbu = string.char(80,97,110,105,110,105,32,68,97,110,99,101), _BLX_YSislNZr = 5915713518},
    {_BLX_hrNGvXbu = string.char(70,105,115,104,105,110,103), _BLX_YSislNZr = 3334832150},
    -- New Emotes from I Table
    {_BLX_hrNGvXbu = string.char(66,97,108,108,111,111,110,32,70,108,111,97,116), _BLX_YSislNZr = 148840371},
    {_BLX_hrNGvXbu = string.char(65,114,109,32,84,117,114,98,105,110,101), _BLX_YSislNZr = 259438880},
    {_BLX_hrNGvXbu = string.char(70,108,111,97,116,105,110,103,32,72,101,97,100), _BLX_YSislNZr = 121572214},
    {_BLX_hrNGvXbu = string.char(73,110,115,97,110,101,32,82,111,116,97,116,105,111,110), _BLX_YSislNZr = 121572214},
    {_BLX_hrNGvXbu = string.char(83,99,114,101,97,109), _BLX_YSislNZr = 180611870},
    {_BLX_hrNGvXbu = string.char(67,104,111,112), _BLX_YSislNZr = 33169596},
    {_BLX_hrNGvXbu = string.char(87,101,105,114,100,32,83,119,97,121), _BLX_YSislNZr = 248336677},
    {_BLX_hrNGvXbu = string.char(71,111,97,108,33), _BLX_YSislNZr = 28488254},
    {_BLX_hrNGvXbu = string.char(82,111,116,97,116,105,111,110), _BLX_YSislNZr = 136801964},
    {_BLX_hrNGvXbu = string.char(87,101,105,114,100,32,70,108,111,97,116), _BLX_YSislNZr = 248336459},
    {_BLX_hrNGvXbu = string.char(80,105,110,99,104,32,78,111,115,101), _BLX_YSislNZr = 30235165},
    {_BLX_hrNGvXbu = string.char(67,114,121), _BLX_YSislNZr = 180612465},
    {_BLX_hrNGvXbu = string.char(80,101,110,103,117,105,110,32,83,108,105,100,101), _BLX_YSislNZr = 282574440},
    {_BLX_hrNGvXbu = string.char(90,111,109,98,105,101,32,65,114,109,115), _BLX_YSislNZr = 183294396},
    {_BLX_hrNGvXbu = string.char(70,108,121,105,110,103), _BLX_YSislNZr = 46196309},
    {_BLX_hrNGvXbu = string.char(83,116,97,98), _BLX_YSislNZr = 66703241},
    {_BLX_hrNGvXbu = string.char(82,97,110,100,111,109), _BLX_YSislNZr = 48977286},
    {_BLX_hrNGvXbu = string.char(72,109,109,109), _BLX_YSislNZr = 33855276},
    {_BLX_hrNGvXbu = string.char(83,119,111,114,100), _BLX_YSislNZr = 35978879},
    {_BLX_hrNGvXbu = string.char(65,114,109,115,32,79,117,116), _BLX_YSislNZr = 27432691},
    {_BLX_hrNGvXbu = string.char(73,110,115,97,110,101,32,76,101,103,115), _BLX_YSislNZr = 87986341},
    {_BLX_hrNGvXbu = string.char(72,101,97,100,32,68,101,116,97,99,104), _BLX_YSislNZr = 35154961},
    {_BLX_hrNGvXbu = string.char(77,111,111,110,32,87,97,108,107), _BLX_YSislNZr = 30196114},
    {_BLX_hrNGvXbu = string.char(67,114,111,117,99,104,105,110,103), _BLX_YSislNZr = 287325678},
    {_BLX_hrNGvXbu = string.char(66,101,97,116,32,66,111,120), _BLX_YSislNZr = 45504977},
    {_BLX_hrNGvXbu = string.char(66,105,103,32,71,117,110,115), _BLX_YSislNZr = 161268368},
    {_BLX_hrNGvXbu = string.char(66,105,103,103,101,114,32,71,117,110,115), _BLX_YSislNZr = 225975820},
    {_BLX_hrNGvXbu = string.char(67,104,97,114,108,101,115,116,111,110), _BLX_YSislNZr = 429703734},
    {_BLX_hrNGvXbu = string.char(77,111,111,110,32,68,97,110,99,101), _BLX_YSislNZr = 27789359},
    {_BLX_hrNGvXbu = string.char(82,111,97,114), _BLX_YSislNZr = 163209885},
    {_BLX_hrNGvXbu = string.char(87,101,105,114,100,32,80,111,115,101), _BLX_YSislNZr = 248336163},
    {_BLX_hrNGvXbu = string.char(83,112,105,110,32,68,97,110,99,101,32,50), _BLX_YSislNZr = 186934910},
    {_BLX_hrNGvXbu = string.char(66,111,119,32,68,111,119,110), _BLX_YSislNZr = 204292303},
    {_BLX_hrNGvXbu = string.char(83,119,111,114,100,32,83,108,97,109), _BLX_YSislNZr = 204295235},
    {_BLX_hrNGvXbu = string.char(71,108,105,116,99,104,32,76,101,118,105,116,97,116,101), _BLX_YSislNZr = 313762630},
    {_BLX_hrNGvXbu = string.char(70,117,108,108,32,83,119,105,110,103), _BLX_YSislNZr = 218504594},
    {_BLX_hrNGvXbu = string.char(70,117,108,108,32,80,117,110,99,104), _BLX_YSislNZr = 204062532},
    {_BLX_hrNGvXbu = string.char(70,97,105,110,116), _BLX_YSislNZr = 181526230},
    {_BLX_hrNGvXbu = string.char(70,108,111,111,114,32,70,97,105,110,116), _BLX_YSislNZr = 181525546},
    {_BLX_hrNGvXbu = string.char(67,114,111,117,99,104,105,110,103,32,50), _BLX_YSislNZr = 182724289},
    {_BLX_hrNGvXbu = string.char(74,117,109,112,105,110,103,32,74,97,99,107,115), _BLX_YSislNZr = 429681631},
    {_BLX_hrNGvXbu = string.char(83,112,105,110,32,68,97,110,99,101), _BLX_YSislNZr = 429730430},
    {_BLX_hrNGvXbu = string.char(65,114,109,32,68,101,116,97,99,104), _BLX_YSislNZr = 33169583},
    {_BLX_hrNGvXbu = string.char(77,101,103,97,32,73,110,115,97,110,101), _BLX_YSislNZr = 184574340},
    {_BLX_hrNGvXbu = string.char(68,105,110,111,32,87,97,108,107), _BLX_YSislNZr = 204328711},
    {_BLX_hrNGvXbu = string.char(84,105,108,116,32,72,101,97,100), _BLX_YSislNZr = 283545583},
}

local _BLX_OxsRugDB = {
    {_BLX_hrNGvXbu = string.char(65,115,116,114,111,110,97,117,116), _BLX_YSislNZr = 3823158750},
    {_BLX_hrNGvXbu = string.char(67,111,119,101,114), _BLX_YSislNZr = 4940563117},
    {_BLX_hrNGvXbu = string.char(83,97,108,117,116,101), _BLX_YSislNZr = 3360689775},
    {_BLX_hrNGvXbu = string.char(80,111,105,110,116), _BLX_YSislNZr = 3576823880},
    {_BLX_hrNGvXbu = string.char(87,97,118,101), _BLX_YSislNZr = 3576686446},
    {_BLX_hrNGvXbu = string.char(76,97,117,103,104), _BLX_YSislNZr = 3337966527},
    {_BLX_hrNGvXbu = string.char(67,104,101,101,114), _BLX_YSislNZr = 3333499508},
    {_BLX_hrNGvXbu = string.char(68,97,110,99,101), _BLX_YSislNZr = 3333432454},
    {_BLX_hrNGvXbu = string.char(68,97,110,99,101,50), _BLX_YSislNZr = 3333331310},
    {_BLX_hrNGvXbu = string.char(68,97,110,99,101,51), _BLX_YSislNZr = 3576686230},
    {_BLX_hrNGvXbu = string.char(84,105,108,116), _BLX_YSislNZr = 3360686498},
    {_BLX_hrNGvXbu = string.char(83,116,97,100,105,117,109), _BLX_YSislNZr = 3360686498},
    {_BLX_hrNGvXbu = string.char(83,104,117,102,102,108,101), _BLX_YSislNZr = 4349242221},
    {_BLX_hrNGvXbu = string.char(75,105,99,107), _BLX_YSislNZr = 1018790633},
    {_BLX_hrNGvXbu = string.char(74,101,114,107), _BLX_YSislNZr = 1018552182},
    {_BLX_hrNGvXbu = string.char(82,111,98,111,116), _BLX_YSislNZr = 616006778},
    {_BLX_hrNGvXbu = string.char(90,111,109,98,105,101), _BLX_YSislNZr = 616008087},
    {_BLX_hrNGvXbu = string.char(78,105,110,106,97), _BLX_YSislNZr = 656117878},
    {_BLX_hrNGvXbu = string.char(87,101,114,101,119,111,108,102), _BLX_YSislNZr = 1083216690},
    {_BLX_hrNGvXbu = string.char(73,110,115,97,110,101), _BLX_YSislNZr = 33796059},
    {_BLX_hrNGvXbu = string.char(83,117,112,101,114,104,101,114,111), _BLX_YSislNZr = 782841498},
    {_BLX_hrNGvXbu = string.char(79,108,100,115,99,104,111,111,108), _BLX_YSislNZr = 5917459365},
    {_BLX_hrNGvXbu = string.char(83,116,121,108,105,115,104), _BLX_YSislNZr = 616136790},
    {_BLX_hrNGvXbu = string.char(69,108,100,101,114), _BLX_YSislNZr = 845397899},
    {_BLX_hrNGvXbu = string.char(75,110,105,103,104,116), _BLX_YSislNZr = 657564596},
    -- New Emotes from E Table
    {_BLX_hrNGvXbu = string.char(70,97,115,104,105,111,110), _BLX_YSislNZr = 3333331310},
    {_BLX_hrNGvXbu = string.char(66,97,98,121,32,68,97,110,99,101), _BLX_YSislNZr = 4265725525},
    {_BLX_hrNGvXbu = string.char(67,104,97,45,67,104,97), _BLX_YSislNZr = 6862001787},
    {_BLX_hrNGvXbu = string.char(77,111,110,107,101,121), _BLX_YSislNZr = 3333499508},
    {_BLX_hrNGvXbu = string.char(84,111,112,32,82,111,99,107), _BLX_YSislNZr = 3361276673},
    {_BLX_hrNGvXbu = string.char(65,114,111,117,110,100,32,84,111,119,110), _BLX_YSislNZr = 3303391864},
    {_BLX_hrNGvXbu = string.char(70,97,110,99,121,32,70,101,101,116), _BLX_YSislNZr = 3333432454},
    {_BLX_hrNGvXbu = string.char(72,121,112,101,32,68,97,110,99,101), _BLX_YSislNZr = 3695333486},
    {_BLX_hrNGvXbu = string.char(66,111,100,121,98,117,105,108,100,101,114), _BLX_YSislNZr = 3333387824},
    {_BLX_hrNGvXbu = string.char(73,100,111,108), _BLX_YSislNZr = 4101966434},
    {_BLX_hrNGvXbu = string.char(67,117,114,116,115,121), _BLX_YSislNZr = 4555816777},
    {_BLX_hrNGvXbu = string.char(72,97,112,112,121), _BLX_YSislNZr = 4841405708},
    {_BLX_hrNGvXbu = string.char(81,117,105,101,116,32,87,97,118,101,115), _BLX_YSislNZr = 7465981288},
    {_BLX_hrNGvXbu = string.char(83,108,101,101,112), _BLX_YSislNZr = 4686925579},
    {_BLX_hrNGvXbu = string.char(70,108,111,115,115,32,68,97,110,99,101), _BLX_YSislNZr = 5917459365},
    {_BLX_hrNGvXbu = string.char(83,104,121), _BLX_YSislNZr = 3337978742},
    {_BLX_hrNGvXbu = string.char(71,111,100,108,105,107,101), _BLX_YSislNZr = 3337994105},
    {_BLX_hrNGvXbu = string.char(72,101,114,111,32,76,97,110,100,105,110,103), _BLX_YSislNZr = 5104344710},
    {_BLX_hrNGvXbu = string.char(72,105,103,104,32,87,97,118,101), _BLX_YSislNZr = 5915690960},
    {_BLX_hrNGvXbu = string.char(67,111,119,101,114), _BLX_YSislNZr = 4940563117},
    {_BLX_hrNGvXbu = string.char(66,111,114,101,100), _BLX_YSislNZr = 5230599789},
    {_BLX_hrNGvXbu = string.char(83,104,111,119,32,68,101,109,32,87,114,105,115,116,115), _BLX_YSislNZr = 7198989668},
    {_BLX_hrNGvXbu = string.char(67,101,108,101,98,114,97,116,101), _BLX_YSislNZr = 3338097973},
    {_BLX_hrNGvXbu = string.char(68,97,115,104), _BLX_YSislNZr = 582855105},
    {_BLX_hrNGvXbu = string.char(66,101,99,107,111,110), _BLX_YSislNZr = 5230598276},
    {_BLX_hrNGvXbu = string.char(72,97,104,97), _BLX_YSislNZr = 3337966527},
    {_BLX_hrNGvXbu = string.char(76,97,115,115,111,32,84,117,114,110), _BLX_YSislNZr = 7942896991},
    {_BLX_hrNGvXbu = string.char(76,105,110,101,32,68,97,110,99,101), _BLX_YSislNZr = 4049037604},
    {_BLX_hrNGvXbu = string.char(83,104,114,117,103), _BLX_YSislNZr = 3334392772},
    {_BLX_hrNGvXbu = string.char(80,111,105,110,116,50), _BLX_YSislNZr = 3344585679},
    {_BLX_hrNGvXbu = string.char(83,116,97,100,105,117,109), _BLX_YSislNZr = 3338055167},
    {_BLX_hrNGvXbu = string.char(83,105,100,101,32,116,111,32,83,105,100,101), _BLX_YSislNZr = 3333136415},
    {_BLX_hrNGvXbu = string.char(79,108,100,32,84,111,119,110,32,82,111,97,100,32,68,97,110,99,101), _BLX_YSislNZr = 5937560570},
    {_BLX_hrNGvXbu = string.char(72,101,108,108,111), _BLX_YSislNZr = 3344650532},
    {_BLX_hrNGvXbu = string.char(68,111,108,112,104,105,110,32,68,97,110,99,101), _BLX_YSislNZr = 5918726674},
    {_BLX_hrNGvXbu = string.char(83,97,109,98,97), _BLX_YSislNZr = 6869766175},
    {_BLX_hrNGvXbu = string.char(66,114,101,97,107,32,68,97,110,99,101), _BLX_YSislNZr = 5915648917},
    {_BLX_hrNGvXbu = string.char(72,105,112,115,32,80,111,112,112,105,110,39), _BLX_YSislNZr = 6797888062},
    {_BLX_hrNGvXbu = string.char(87,97,107,101,32,85,112,32,67,97,108,108), _BLX_YSislNZr = 7199000883},
    {_BLX_hrNGvXbu = string.char(71,114,101,97,116,101,115,116), _BLX_YSislNZr = 3338042785},
    {_BLX_hrNGvXbu = string.char(79,110,32,84,104,101,32,79,117,116,115,105,100,101), _BLX_YSislNZr = 7422779536},
    {_BLX_hrNGvXbu = string.char(66,111,120,105,110,103,32,80,117,110,99,104), _BLX_YSislNZr = 7202863182},
    {_BLX_hrNGvXbu = string.char(83,97,100), _BLX_YSislNZr = 4841407203},
    {_BLX_hrNGvXbu = string.char(70,108,111,119,105,110,103,32,66,114,101,101,122,101), _BLX_YSislNZr = 7465946930},
    {_BLX_hrNGvXbu = string.char(84,119,105,114,108), _BLX_YSislNZr = 3334968680},
    {_BLX_hrNGvXbu = string.char(74,117,109,112,105,110,103,32,87,97,118,101), _BLX_YSislNZr = 4940564896},
    {_BLX_hrNGvXbu = string.char(72,79,76,73,68,65,89,32,68,97,110,99,101), _BLX_YSislNZr = 5937558680},
    {_BLX_hrNGvXbu = string.char(84,97,107,101,32,77,101,32,85,110,100,101,114), _BLX_YSislNZr = 6797890377},
    {_BLX_hrNGvXbu = string.char(68,105,122,122,121), _BLX_YSislNZr = 3361426436},
    {_BLX_hrNGvXbu = string.char(68,97,110,99,105,110,103,39,32,83,104,111,101,115), _BLX_YSislNZr = 7404878500},
    {_BLX_hrNGvXbu = string.char(70,97,115,104,105,111,110,97,98,108,101), _BLX_YSislNZr = 3333331310},
    {_BLX_hrNGvXbu = string.char(70,97,115,116,32,72,97,110,100,115), _BLX_YSislNZr = 4265701731},
    {_BLX_hrNGvXbu = string.char(84,114,101,101), _BLX_YSislNZr = 4049551434},
    {_BLX_hrNGvXbu = string.char(65,103,114,101,101), _BLX_YSislNZr = 4841397952},
    {_BLX_hrNGvXbu = string.char(80,111,119,101,114,32,66,108,97,115,116), _BLX_YSislNZr = 4841403964},
    {_BLX_hrNGvXbu = string.char(83,119,111,111,115,104), _BLX_YSislNZr = 3361481910},
    {_BLX_hrNGvXbu = string.char(74,117,109,112,105,110,103,32,67,104,101,101,114), _BLX_YSislNZr = 5895324424},
    {_BLX_hrNGvXbu = string.char(68,105,115,97,103,114,101,101), _BLX_YSislNZr = 4841401869},
    {_BLX_hrNGvXbu = string.char(82,111,100,101,111,32,68,97,110,99,101), _BLX_YSislNZr = 5918728267},
    {_BLX_hrNGvXbu = string.char(73,116,32,65,105,110,39,95,66,76,88,95,115,98,83,85,113,102,85,87,32,77,121,32,70,97,117,108,116), _BLX_YSislNZr = 6797891807},
    {_BLX_hrNGvXbu = string.char(82,111,99,107,32,79,110), _BLX_YSislNZr = 5915714366},
    {_BLX_hrNGvXbu = string.char(66,108,111,99,107,32,80,97,114,116,105,101,114), _BLX_YSislNZr = 6862022283},
    {_BLX_hrNGvXbu = string.char(68,111,114,107,121,32,68,97,110,99,101), _BLX_YSislNZr = 4212455378},
    {_BLX_hrNGvXbu = string.char(65,79,75), _BLX_YSislNZr = 7942885103},
    {_BLX_hrNGvXbu = "T", _BLX_YSislNZr = 3338010159},
    {_BLX_hrNGvXbu = string.char(67,111,98,114,97,32,65,114,109,115), _BLX_YSislNZr = 7942890105},
    {_BLX_hrNGvXbu = string.char(80,97,110,105,110,105,32,68,97,110,99,101), _BLX_YSislNZr = 5915713518},
    {_BLX_hrNGvXbu = string.char(70,105,115,104,105,110,103), _BLX_YSislNZr = 3334832150},
    {_BLX_hrNGvXbu = string.char(68,105,110,111,32,87,97,108,107), _BLX_YSislNZr = 204328711},
    {_BLX_hrNGvXbu = string.char(84,105,108,116,32,72,101,97,100), _BLX_YSislNZr = 283545583},
    
}

local _BLX_UxzPASNh = {
    [string.char(66,97,108,108,111,111,110,32,70,108,111,97,116)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(65,114,109,32,84,117,114,98,105,110,101)] = {Speed = 1.5, Loop = true, Priority = 2},
    [string.char(70,108,111,97,116,105,110,103,32,72,101,97,100)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(73,110,115,97,110,101,32,82,111,116,97,116,105,111,110)] = {Speed = 99, Loop = true, Priority = 2},
    [string.char(83,99,114,101,97,109)] = {Speed = 1.5, Loop = true, Priority = 2},
    [string.char(80,97,114,116,121,32,84,105,109,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(67,104,111,112)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(87,101,105,114,100,32,83,119,97,121)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(71,111,97,108,33)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(82,111,116,97,116,105,111,110)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(87,101,105,114,100,32,70,108,111,97,116)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(80,105,110,99,104,32,78,111,115,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(67,114,121)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(80,101,110,103,117,105,110,32,83,108,105,100,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(90,111,109,98,105,101,32,65,114,109,115)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(70,108,121,105,110,103)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(83,116,97,98)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(82,97,110,100,111,109)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(72,109,109,109)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(83,119,111,114,100)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(65,114,109,115,32,79,117,116)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(73,110,115,97,110,101,32,76,101,103,115)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(72,101,97,100,32,68,101,116,97,99,104)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(77,111,111,110,32,87,97,108,107)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(67,114,111,117,99,104,105,110,103)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(66,101,97,116,32,66,111,120)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(66,105,103,32,71,117,110,115)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(66,105,103,103,101,114,32,71,117,110,115)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(67,104,97,114,108,101,115,116,111,110)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(77,111,111,110,32,68,97,110,99,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(82,111,97,114)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(87,101,105,114,100,32,80,111,115,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(83,112,105,110,32,68,97,110,99,101,32,50)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(66,111,119,32,68,111,119,110)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(83,119,111,114,100,32,83,108,97,109)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(71,108,105,116,99,104,32,76,101,118,105,116,97,116,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(70,117,108,108,32,83,119,105,110,103)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(70,117,108,108,32,80,117,110,99,104)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(70,97,105,110,116)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(70,108,111,111,114,32,70,97,105,110,116)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(67,114,111,117,99,104,105,110,103,32,50)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(74,117,109,112,105,110,103,32,74,97,99,107,115)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(83,112,105,110,32,68,97,110,99,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(65,114,109,32,68,101,116,97,99,104)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(77,101,103,97,32,73,110,115,97,110,101)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(68,105,110,111,32,87,97,108,107)] = {Speed = 1, Loop = true, Priority = 2},
    [string.char(84,105,108,116,32,72,101,97,100)] = {Speed = 1, Loop = true, Priority = 2},
}

local _BLX_OBiZADuu = 70
local _BLX_ZUBdLIlR = {string.char(83,116,121,108,105,115,104), string.char(90,111,109,98,105,101), string.char(82,111,98,111,116), string.char(84,111,121), string.char(67,97,114,116,111,111,110,121), string.char(83,117,112,101,114,104,101,114,111), string.char(77,97,103,101), string.char(76,101,118,105,116,97,116,105,111,110), string.char(86,97,109,112,105,114,101), string.char(69,108,100,101,114), string.char(87,101,114,101,119,111,108,102), string.char(75,110,105,103,104,116), string.char(66,111,108,100), string.char(65,115,116,114,111,110,97,117,116), string.char(66,117,98,98,108,121), string.char(80,105,114,97,116,101), string.char(82,116,104,114,111), string.char(78,105,110,106,97), string.char(79,108,100,115,99,104,111,111,108), string.char(78,111,32,66,111,117,110,100,97,114,105,101,115), string.char(78,70,76,32,65,110,105,109,97,116,105,111,110), string.char(65,100,105,100,97,115,32,83,112,111,114,116,115), string.char(87,105,99,107,108,101,100,32,80,111,112,117,108,97,114), string.char(67,97,116,119,97,108,107,32,71,108,97,109), string.char(80,114,105,110,99,101,115,115), string.char(67,111,110,102,105,100,101,110,116), string.char(80,111,112,115,116,97,114), string.char(80,97,116,114,111,108), string.char(83,110,101,97,107,121), string.char(67,111,119,98,111,121), string.char(71,104,111,115,116), string.char(71,104,111,115,116,32,50), string.char(77,114,46,32,84,111,105,108,101,116), string.char(85,100,122,97,108), string.char(79,105,110,97,110,32,84,104,105,99,107,104,111,111,102), string.char(66,111,114,111,99,107), string.char(66,108,111,99,107,121,32,77,101,99,104), string.char(83,116,121,108,105,122,101,100,32,70,101,109,97,108,101), string.char(82,49,53,95,68,101,102,97,117,108,116), string.char(82,54,95,68,101,102,97,117,108,116), string.char(77,111,99,97,112)}

local function createEmoteButtons()
    _BLX_nkkzlcDr:ClearAllChildren()
    
    AddLabel(_BLX_nkkzlcDr, string.char(55357,56451,32,69,77,79,84,69,83,32,83,89,83,84,69,77,32,45,32,1606,1592,1575,1605,32,1575,1604,1585,1602,1589,1575,1578), 8)
    AddLabel(_BLX_nkkzlcDr, string.char(1575,1604,1585,1602,1589,1575,1578,32,1578,1592,1607,1585,32,1604,1580,1605,1610,1593,32,1575,1604,1604,1575,1593,1576,1610,1606,32,1601,1610,32,1575,1604,1587,1610,1585,1601,1585,33), 38)

    -- Search Bar
    local _BLX_CEyScRFs = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_nkkzlcDr)
    _BLX_CEyScRFs.Size = UDim2.new(0, 260, 0, 40)
    _BLX_CEyScRFs.Position = UDim2.new(0, 15, 0, 65)
    _BLX_CEyScRFs.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    _BLX_CEyScRFs.PlaceholderText = string.char(55357,56589,32,83,101,97,114,99,104,32,69,109,111,116,101,115,46,46,46,32,40,1576,1581,1579,41)
    _BLX_CEyScRFs.Text = ""
    _BLX_CEyScRFs.TextColor3 = Color3.new(1, 1, 1)
    _BLX_CEyScRFs.Font = Enum.Font.Gotham
    _BLX_CEyScRFs.TextSize = 14
    _BLX_CEyScRFs.BorderSizePixel = 0
    
    local _BLX_AVRVYvba = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_CEyScRFs)
    _BLX_AVRVYvba.CornerRadius = UDim.new(0, 8)
    
    local _BLX_gsDhtfVe = Instance.new(string.char(85,73,83,116,114,111,107,101), _BLX_CEyScRFs)
    _BLX_gsDhtfVe.Color = Color3.fromRGB(100, 100, 255)
    _BLX_gsDhtfVe.Thickness = 1
    _BLX_gsDhtfVe.Transparency = 0.5

    -- Quick Stop Button
    local _BLX_qtMqbFko = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_nkkzlcDr)
    _BLX_qtMqbFko.Size = UDim2.new(0, 150, 0, 40)
    _BLX_qtMqbFko.Position = UDim2.new(0, 285, 0, 65)
    _BLX_qtMqbFko.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    _BLX_qtMqbFko.Text = string.char(55357,57041,32,1573,1610,1602,1575,1601,32,45,32,83,84,79,80)
    _BLX_qtMqbFko.TextColor3 = Color3.new(1, 1, 1)
    _BLX_qtMqbFko.Font = Enum.Font.GothamBold
    _BLX_qtMqbFko.TextSize = 14
    _BLX_qtMqbFko.BorderSizePixel = 0
    
    local _BLX_IkRIpGqM = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_qtMqbFko)
    _BLX_IkRIpGqM.CornerRadius = UDim.new(0, 8)
    
    _BLX_qtMqbFko.MouseButton1Click:Connect(function()
        if _BLX_hvZZtLty then
            _BLX_hvZZtLty:Stop()
            _BLX_hvZZtLty = nil
        end
        local _BLX_nulgJRUm = LocalPlayer.Character
        if _BLX_nulgJRUm then
            local _BLX_XACpKUYP = _BLX_nulgJRUm:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
            if _BLX_XACpKUYP then
                local _BLX_OZtWaZxj = _BLX_XACpKUYP:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114))
                if _BLX_OZtWaZxj then
                    for _, _BLX_AWhLRhuh in pairs(_BLX_OZtWaZxj:GetPlayingAnimationTracks()) do
                        _BLX_AWhLRhuh:Stop()
                    end
                end
            end
            if isR15() then replaceAnimations(string.char(82,49,53,95,68,101,102,97,117,108,116)) else replaceAnimations(string.char(82,54,95,68,101,102,97,117,108,116)) end
        end
        showNotification(string.char(66,108,111,111,100,105,120), string.char(65,108,108,32,69,109,111,116,101,115,32,83,116,111,112,112,101,100), 2)
    end)

    -- Animation Packs Section
    AddLabel(_BLX_nkkzlcDr, string.char(10024,32,65,78,73,77,65,84,73,79,78,32,80,65,67,75,83,32,45,32,1581,1586,1605,32,1575,1604,1581,1585,1603,1575,1578), 115)
    local _BLX_GacaOVOj = 145
    
    for i, packName in ipairs(_BLX_ZUBdLIlR) do
        local _BLX_smRyjGxX = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_nkkzlcDr)
        _BLX_smRyjGxX.Size = UDim2.new(0, 135, 0, 35)
        _BLX_smRyjGxX.Position = UDim2.new(0, ((i-1) % 3) * 145 + 15, 0, _BLX_GacaOVOj + math.floor((i-1) / 3) * 45)
        _BLX_smRyjGxX.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        _BLX_smRyjGxX.Text = "✨ " .. packName
        _BLX_smRyjGxX.TextColor3 = Color3.new(1, 1, 1)
        _BLX_smRyjGxX.Font = Enum.Font.GothamBold
        _BLX_smRyjGxX.TextSize = 12
        _BLX_smRyjGxX.BorderSizePixel = 0
        
        local _BLX_pZtciQxc = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_smRyjGxX)
        _BLX_pZtciQxc.CornerRadius = UDim.new(0, 6)
        
        _BLX_smRyjGxX.MouseButton1Click:Connect(function()
            replaceAnimations(packName)
            showNotification(string.char(66,108,111,111,100,105,120), string.char(65,110,105,109,97,116,105,111,110,32,80,97,99,107,32,65,112,112,108,105,101,100,58,32) .. packName, 2)
        end)
    end

    local _BLX_QKMtWWtG = _BLX_GacaOVOj + math.ceil(#_BLX_ZUBdLIlR / 3) * 45 + 10
    local _BLX_nuBdEiBB = AddLabel(_BLX_nkkzlcDr, string.char(55356,57269,32,69,77,79,84,69,83,32,76,73,83,84,32,45,32,1602,1575,1574,1605,1577,32,1575,1604,1585,1602,1589,1575,1578), _BLX_QKMtWWtG)
    
    local _BLX_NosoPdBW = isR15() and _BLX_OxsRugDB or _BLX_CBxutTGc
    local _BLX_LOkCWmyf = _BLX_QKMtWWtG + 35
    
    local _BLX_sbGEduaX = {}
    
    for i, emote in ipairs(_BLX_NosoPdBW) do
        local _BLX_aydmIrpL = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_nkkzlcDr)
        _BLX_aydmIrpL.Size = UDim2.new(0, 200, 0, 40)
        _BLX_aydmIrpL.BackgroundColor3 = Color3.fromRGB(50, 60, 90)
        _BLX_aydmIrpL.Text = string.char(55357,56451,32) .. emote._BLX_hrNGvXbu
        _BLX_aydmIrpL.TextColor3 = Color3.new(0.9, 0.9, 0.9)
        _BLX_aydmIrpL.Font = Enum.Font.GothamBold
        _BLX_aydmIrpL.TextSize = 13
        _BLX_aydmIrpL.BorderSizePixel = 0
        
        local _BLX_cYEHeYgB = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_aydmIrpL)
        _BLX_cYEHeYgB.CornerRadius = UDim.new(0, 8)
        
        _BLX_aydmIrpL.MouseEnter:Connect(function()
            game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101)):Create(_BLX_aydmIrpL, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 100, 200), TextColor3 = Color3.new(1,1,1)}):Play()
        end)
        
        _BLX_aydmIrpL.MouseLeave:Connect(function()
            game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101)):Create(_BLX_aydmIrpL, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 60, 90), TextColor3 = Color3.new(0.9,0.9,0.9)}):Play()
        end)
        
        _BLX_aydmIrpL.MouseButton1Click:Connect(function()
            local _BLX_nulgJRUm = LocalPlayer.Character
            if _BLX_nulgJRUm then
                local _BLX_XACpKUYP = _BLX_nulgJRUm:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
                if _BLX_XACpKUYP then
                    local _BLX_OZtWaZxj = _BLX_XACpKUYP:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114))
                    if not _BLX_OZtWaZxj then _BLX_OZtWaZxj = Instance.new(string.char(65,110,105,109,97,116,111,114), _BLX_XACpKUYP) end
                    if _BLX_hvZZtLty then _BLX_hvZZtLty:Stop() end
                    local _BLX_uJlXfCHn = Instance.new(string.char(65,110,105,109,97,116,105,111,110))
                    _BLX_uJlXfCHn.AnimationId = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47) .. emote._BLX_YSislNZr
                    _BLX_hvZZtLty = _BLX_OZtWaZxj:LoadAnimation(_BLX_uJlXfCHn)
                    local _BLX_ExkdEjIT = _BLX_UxzPASNh[emote._BLX_hrNGvXbu]
                    if _BLX_ExkdEjIT then
                        _BLX_hvZZtLty.Priority = _BLX_ExkdEjIT.Priority == 2 and Enum.AnimationPriority.Action or Enum.AnimationPriority.Movement
                        _BLX_hvZZtLty:Play()
                        _BLX_hvZZtLty:AdjustSpeed(_BLX_ExkdEjIT.Speed or 1)
                        _BLX_hvZZtLty.Looped = _BLX_ExkdEjIT.Loop or false
                    else
                        _BLX_hvZZtLty.Priority = Enum.AnimationPriority.Action
                        _BLX_hvZZtLty:Play()
                        _BLX_hvZZtLty.Looped = true
                    end
                end
            end
        end)
        
        table.insert(_BLX_sbGEduaX, {_BLX_ukMzgDeq = _BLX_aydmIrpL, _BLX_hrNGvXbu = emote._BLX_hrNGvXbu:lower()})
    end
    
    local function updateLayout()
        local _BLX_YyHLZeQE = 0
        for _, data in ipairs(_BLX_sbGEduaX) do
            if data._BLX_ukMzgDeq.Visible then
                data._BLX_ukMzgDeq.Position = UDim2.new(0, (_BLX_YyHLZeQE % 2) * 220 + 15, 0, _BLX_LOkCWmyf + math.floor(_BLX_YyHLZeQE / 2) * 45)
                _BLX_YyHLZeQE = _BLX_YyHLZeQE + 1
            end
        end
        local _BLX_pFfQqrST = _BLX_LOkCWmyf + math.ceil(_BLX_YyHLZeQE / 2) * 45 + 50
        _BLX_nkkzlcDr.CanvasSize = UDim2.new(0, 0, 0, _BLX_pFfQqrST + 400)
    end
    
    _BLX_CEyScRFs:GetPropertyChangedSignal(string.char(84,101,120,116)):Connect(function()
        local _BLX_qEVezNCV = _BLX_CEyScRFs.Text:lower()
        for _, data in ipairs(_BLX_sbGEduaX) do
            data._BLX_ukMzgDeq.Visible = data._BLX_hrNGvXbu:find(_BLX_qEVezNCV) ~= nil
        end
        updateLayout()
    end)
    
    updateLayout()
    return _BLX_NosoPdBW
end

local _BLX_zoXdzKbS = createEmoteButtons()
local _BLX_nibmMuVJ = 145 + math.ceil(#_BLX_ZUBdLIlR / 3) * 45 + 40 + math.ceil(#_BLX_zoXdzKbS / 2) * 50

AddLabel(_BLX_nkkzlcDr, string.char(67,117,115,116,111,109,32,69,109,111,116,101,115,32,40,1585,1602,1589,1575,1578,32,1605,1582,1589,1589,1577,41,58), _BLX_nibmMuVJ + 15)

local _BLX_RMEcCnMi = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_nkkzlcDr)
_BLX_RMEcCnMi.Size = UDim2.new(0, 300, 0, 35)
_BLX_RMEcCnMi.Position = UDim2.new(0, 15, 0, _BLX_nibmMuVJ + 45)
_BLX_RMEcCnMi.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
_BLX_RMEcCnMi.BorderSizePixel = 1
_BLX_RMEcCnMi.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_RMEcCnMi.PlaceholderText = string.char(69,110,116,101,114,32,65,110,105,109,97,116,105,111,110,32,73,68,46,46,46)
_BLX_RMEcCnMi.Text = ""
_BLX_RMEcCnMi.TextColor3 = Color3.new(1, 1, 1)
_BLX_RMEcCnMi.Font = Enum.Font.Gotham
_BLX_RMEcCnMi.TextSize = 14

local _BLX_BlqVbpEC = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_RMEcCnMi)
_BLX_BlqVbpEC.CornerRadius = UDim.new(0, 6)

local _BLX_yaOoAxAC = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_nkkzlcDr)
_BLX_yaOoAxAC.Size = UDim2.new(0, 110, 0, 35)
_BLX_yaOoAxAC.Position = UDim2.new(0, 325, 0, _BLX_nibmMuVJ + 45)
_BLX_yaOoAxAC.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
_BLX_yaOoAxAC.Text = string.char(9654,65039,32,80,108,97,121)
_BLX_yaOoAxAC.TextColor3 = Color3.new(1, 1, 1)
_BLX_yaOoAxAC.Font = Enum.Font.GothamBold
_BLX_yaOoAxAC.TextSize = 14
_BLX_yaOoAxAC.BorderSizePixel = 0

local _BLX_XToskCfk = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_yaOoAxAC)
_BLX_XToskCfk.CornerRadius = UDim.new(0, 6)

_BLX_yaOoAxAC.MouseButton1Click:Connect(function()
    local _BLX_KBzygFRh = _BLX_RMEcCnMi.Text
    if _BLX_KBzygFRh and _BLX_KBzygFRh ~= "" then
        local _BLX_nulgJRUm = LocalPlayer.Character
        if _BLX_nulgJRUm then
            local _BLX_XACpKUYP = _BLX_nulgJRUm:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
            if _BLX_XACpKUYP then
                local _BLX_OZtWaZxj = _BLX_XACpKUYP:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114))
                if _BLX_OZtWaZxj then
                    local _BLX_uJlXfCHn = Instance.new(string.char(65,110,105,109,97,116,105,111,110))
                    _BLX_uJlXfCHn.AnimationId = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47) .. _BLX_KBzygFRh
                    local _BLX_AWhLRhuh = _BLX_OZtWaZxj:LoadAnimation(_BLX_uJlXfCHn)
                    _BLX_AWhLRhuh:Play()
                end
            end
        end
    end
end)

AddLabel(_BLX_nkkzlcDr, string.char(55357,56481,32,84,105,112,115,58), _BLX_nibmMuVJ + 90)
AddLabel(_BLX_nkkzlcDr, string.char(8226,32,1575,1604,1585,1602,1589,1575,1578,32,1578,1593,1605,1604,32,1578,1604,1602,1575,1574,1610,1575,1611,32,1608,1578,1592,1607,1585,32,1604,1580,1605,1610,1593,32,1575,1604,1604,1575,1593,1576,1610,1606), _BLX_nibmMuVJ + 115)
AddLabel(_BLX_nkkzlcDr, string.char(8226,32,1610,1605,1603,1606,1603,32,1573,1583,1582,1575,1604,32,65,110,105,109,97,116,105,111,110,32,73,68,32,1605,1582,1589,1589,32,1604,1604,1585,1602,1589), _BLX_nibmMuVJ + 135)
AddLabel(_BLX_nkkzlcDr, string.char(8226,32,1575,1587,1578,1582,1583,1605,32,1586,1585,32,83,116,111,112,32,1604,1573,1610,1602,1575,1601,32,1580,1605,1610,1593,32,1575,1604,1585,1602,1589,1575,1578), _BLX_nibmMuVJ + 155)

_BLX_nkkzlcDr.CanvasSize = UDim2.new(0, 0, 0, _BLX_nibmMuVJ + 200)

--========================================================--
--===========  PLAYER TOOLS UPDATE ======================--
_BLX_hCACMlhl.Stepped:Connect(function()
    local _BLX_rPAogzWw = LocalPlayer.Character
    if _BLX_rPAogzWw and _BLX_rPAogzWw:FindFirstChild(string.char(72,117,109,97,110,111,105,100)) then
        local _BLX_PmRmVbmR = _BLX_rPAogzWw.Humanoid
        _BLX_PmRmVbmR.WalkSpeed = _BLX_fiophKqK.SpeedOn and _BLX_fiophKqK.Speed or 16
        _BLX_PmRmVbmR.JumpPower = _BLX_fiophKqK.JumpOn and _BLX_fiophKqK.JumpPower or 50
        
        if _BLX_fiophKqK.NoClip then 
            for _, part in pairs(_BLX_rPAogzWw:GetChildren()) do 
                if part:IsA(string.char(66,97,115,101,80,97,114,116)) then 
                    part.CanCollide = false 
                end 
            end 
        end
        
        if _BLX_fiophKqK.Fly then
            local _BLX_lBajZbZj = _BLX_rPAogzWw:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                local _BLX_QdAIqYIc = Vector3.new(0, 0, 0)
                local _BLX_WWfcEOAT = getCamera()
                if not _BLX_WWfcEOAT then return end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.W) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + _BLX_WWfcEOAT.CFrame.LookVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.S) then _BLX_QdAIqYIc = _BLX_QdAIqYIc - _BLX_WWfcEOAT.CFrame.LookVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.A) then _BLX_QdAIqYIc = _BLX_QdAIqYIc - _BLX_WWfcEOAT.CFrame.RightVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.D) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + _BLX_WWfcEOAT.CFrame.RightVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.Space) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + Vector3.new(0, 1, 0) end
                _BLX_lBajZbZj.Velocity = _BLX_QdAIqYIc * _BLX_fiophKqK.Speed
            end
        end
        
        if _BLX_fiophKqK.Swim then
            local _BLX_lBajZbZj = _BLX_rPAogzWw:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                _BLX_PmRmVbmR:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                local _BLX_QdAIqYIc = Vector3.new(0, 0, 0)
                local _BLX_WWfcEOAT = getCamera()
                if not _BLX_WWfcEOAT then return end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.W) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + _BLX_WWfcEOAT.CFrame.LookVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.S) then _BLX_QdAIqYIc = _BLX_QdAIqYIc - _BLX_WWfcEOAT.CFrame.LookVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.A) then _BLX_QdAIqYIc = _BLX_QdAIqYIc - _BLX_WWfcEOAT.CFrame.RightVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.D) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + _BLX_WWfcEOAT.CFrame.RightVector end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.Space) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + Vector3.new(0, 1, 0) end
                if _BLX_cXkduGQT:IsKeyDown(Enum.KeyCode.LeftShift) then _BLX_QdAIqYIc = _BLX_QdAIqYIc + Vector3.new(0, -1, 0) end
                _BLX_lBajZbZj.Velocity = _BLX_QdAIqYIc * (_BLX_fiophKqK.Speed * 1.5)
            end
        end
    end
end)

--========================================================--
--====================  TELEPORT TAB ====================--
_BLX_yiRGMAzU:ClearAllChildren()

AddLabel(_BLX_yiRGMAzU, string.char(55357,56525,32,84,69,76,69,80,79,82,84,32,83,89,83,84,69,77), 8)

AddLabel(_BLX_yiRGMAzU, string.char(55358,56605,32,83,79,67,73,65,76,32,84,82,79,76,76,32,45,32,1605,1602,1575,1604,1576,32,1575,1580,1578,1605,1575,1593,1610,1577), 40)
AddLabel(_BLX_yiRGMAzU, string.char(83,101,108,101,99,116,32,80,108,97,121,101,114,32,102,114,111,109,32,108,105,115,116,58), 70)
AddPlayerList(_BLX_yiRGMAzU, 100, function(v) 
    _BLX_EcTPbsnU.SelectedPlayer = v 
    showNotification(string.char(66,108,111,111,100,105,120), string.char(83,101,108,101,99,116,101,100,58,32) .. v, 2)
end)

AddButton(_BLX_yiRGMAzU, string.char(84,101,108,101,112,111,114,116,32,116,111,32,83,101,108,101,99,116,101,100,32,80,108,97,121,101,114), 260, function()
    local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
    if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character and _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = _BLX_YzIHWHGa.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        showNotification(string.char(66,108,111,111,100,105,120), string.char(84,101,108,101,112,111,114,116,101,100,32,116,111,32) .. _BLX_YzIHWHGa.Name, 2)
    else
        showNotification(string.char(66,108,111,111,100,105,120,32,69,114,114,111,114), string.char(78,111,32,112,108,97,121,101,114,32,115,101,108,101,99,116,101,100,32,111,114,32,95,66,76,88,95,110,117,108,103,74,82,85,109,32,109,105,115,115,105,110,103,33), 2)
    end
end)

AddToggle(_BLX_yiRGMAzU, string.char(67,97,114,114,121,32,80,108,97,121,101,114,32,40,1581,1605,1604,41), 300, false, function(s) _BLX_EcTPbsnU.CarryPlayer = s end)
AddToggle(_BLX_yiRGMAzU, string.char(82,105,100,101,32,111,110,32,66,97,99,107,32,40,1585,1603,1608,1576,41), 340, false, function(s) _BLX_EcTPbsnU.RidePlayer = s end)
AddToggle(_BLX_yiRGMAzU, string.char(65,116,116,97,99,104,32,40,1573,1604,1578,1589,1575,1602,41), 380, false, function(s) _BLX_EcTPbsnU.AttachPlayer = s end)
AddSlider(_BLX_yiRGMAzU, string.char(65,116,116,97,99,104,32,68,105,115,116,97,110,99,101,32,40,1575,1604,1605,1587,1575,1601,1577,41), 420, 1, 15, _BLX_EcTPbsnU.RideDistance, function(v) _BLX_EcTPbsnU.RideDistance = v end)
AddSlider(_BLX_yiRGMAzU, string.char(65,116,116,97,99,104,32,72,101,105,103,104,116,32,40,1575,1604,1575,1585,1578,1601,1575,1593,41), 460, -10, 10, _BLX_EcTPbsnU.AttachHeight, function(v) _BLX_EcTPbsnU.AttachHeight = v end)
AddToggle(_BLX_yiRGMAzU, string.char(70,111,108,108,111,119,32,80,108,97,121,101,114,32,40,1604,1581,1575,1602,41), 500, false, function(s) _BLX_EcTPbsnU.FollowPlayer = s end)
AddToggle(_BLX_yiRGMAzU, string.char(70,114,101,101,122,101,32,80,108,97,121,101,114,32,40,1578,1580,1605,1610,1583,41), 540, false, function(s) _BLX_EcTPbsnU.FreezePlayer = s end)
AddToggle(_BLX_yiRGMAzU, string.char(72,117,103,32,40,1581,1590,1606,41), 580, false, function(s) _BLX_EcTPbsnU.HugPlayer = s end)

AddLabel(_BLX_yiRGMAzU, string.char(55357,56589,32,71,69,78,69,82,65,76,32,84,69,76,69,80,79,82,84), 630)
local _BLX_CEyScRFs = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_yiRGMAzU)
_BLX_CEyScRFs.Size = UDim2.new(0, 440, 0, 30)
_BLX_CEyScRFs.Position = UDim2.new(0, 10, 0, 660)
_BLX_CEyScRFs.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
_BLX_CEyScRFs.BorderSizePixel = 1
_BLX_CEyScRFs.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_CEyScRFs.Text = string.char(55357,56589,32,1575,1576,1581,1579,32,1593,1606,32,1604,1575,1593,1576,46,46,46)
_BLX_CEyScRFs.TextColor3 = Color3.new(0.7, 0.7, 0.7)
_BLX_CEyScRFs.Font = Enum.Font.Gotham
_BLX_CEyScRFs.TextSize = 14
_BLX_CEyScRFs.ClearTextOnFocus = true

AddLabel(_BLX_yiRGMAzU, string.char(84,101,108,101,112,111,114,116,32,116,111,32,80,108,97,121,101,114,115,58), 700)

local _BLX_eJYfkGEx = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), _BLX_yiRGMAzU)
_BLX_eJYfkGEx.Size = UDim2.new(0, 440, 0, 150)
_BLX_eJYfkGEx.Position = UDim2.new(0, 10, 0, 730)
_BLX_eJYfkGEx.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
_BLX_eJYfkGEx.BorderSizePixel = 0
_BLX_eJYfkGEx.ScrollBarThickness = 6

AddLabel(_BLX_yiRGMAzU, string.char(95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95), 890)
AddLabel(_BLX_yiRGMAzU, string.char(66,108,111,111,100,105,120,32,86,54,32,45,32,70,105,110,97,108,32,69,100,105,116,105,111,110), 920)
AddLabel(_BLX_yiRGMAzU, string.char(77,97,100,101,32,102,111,114,32,85,108,116,105,109,97,116,101,32,71,97,109,101,112,108,97,121), 950)

local function refreshPlayersList(searchTerm)
    _BLX_eJYfkGEx:ClearAllChildren()
    searchTerm = searchTerm or ""
    searchTerm = searchTerm:lower()
    
    local _BLX_OBiZADuu = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (searchTerm == "" or player.Name:lower():find(searchTerm)) then
            local _BLX_hwOCkybH = Instance.new(string.char(70,114,97,109,101), _BLX_eJYfkGEx)
            _BLX_hwOCkybH.Size = UDim2.new(1, -10, 0, 45)
            _BLX_hwOCkybH.Position = UDim2.new(0, 5, 0, _BLX_OBiZADuu)
            _BLX_hwOCkybH.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            _BLX_hwOCkybH.BorderSizePixel = 1
            
            local _BLX_dTBkhfBX = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_hwOCkybH)
            _BLX_dTBkhfBX.Size = UDim2.new(0, 250, 0, 20)
            _BLX_dTBkhfBX.Position = UDim2.new(0, 10, 0, 5)
            _BLX_dTBkhfBX.BackgroundTransparency = 1
            _BLX_dTBkhfBX.Text = player.Name
            _BLX_dTBkhfBX.TextColor3 = Color3.new(1, 1, 1)
            _BLX_dTBkhfBX.Font = Enum.Font.Gotham
            _BLX_dTBkhfBX.TextSize = 14
            _BLX_dTBkhfBX.TextXAlignment = Enum.TextXAlignment.Left
            
            local _BLX_awoyKqwB = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_hwOCkybH)
            _BLX_awoyKqwB.Size = UDim2.new(0, 80, 0, 30)
            _BLX_awoyKqwB.Position = UDim2.new(1, -170, 0.5, -15)
            _BLX_awoyKqwB.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            _BLX_awoyKqwB.Text = string.char(84,80,32,84,79)
            _BLX_awoyKqwB.TextColor3 = Color3.new(1, 1, 1)
            _BLX_awoyKqwB.Font = Enum.Font.GothamBold
            _BLX_awoyKqwB.TextSize = 11
            
            _BLX_awoyKqwB.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                    local _BLX_qquNYRRI = player.Character.HumanoidRootPart.CFrame
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = _BLX_qquNYRRI + Vector3.new(0, 3, 0)
                    end
                end
            end)
            
            local _BLX_ThPWrKxN = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_hwOCkybH)
            _BLX_ThPWrKxN.Size = UDim2.new(0, 80, 0, 30)
            _BLX_ThPWrKxN.Position = UDim2.new(1, -85, 0.5, -15)
            _BLX_ThPWrKxN.BackgroundColor3 = Color3.fromRGB(200, 80, 120)
            _BLX_ThPWrKxN.Text = string.char(66,82,73,78,71)
            _BLX_ThPWrKxN.TextColor3 = Color3.new(1, 1, 1)
            _BLX_ThPWrKxN.Font = Enum.Font.GothamBold
            _BLX_ThPWrKxN.TextSize = 11
            
            _BLX_ThPWrKxN.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                        local _BLX_dMlpSlgy = LocalPlayer.Character.HumanoidRootPart.CFrame
                        player.Character.HumanoidRootPart.CFrame = _BLX_dMlpSlgy + Vector3.new(3, 0, 0)
                    end
                end
            end)
            
            _BLX_OBiZADuu = _BLX_OBiZADuu + 50
        end
    end
    
    _BLX_eJYfkGEx.CanvasSize = UDim2.new(0, 0, 0, _BLX_OBiZADuu)
end

refreshPlayersList()
Players.PlayerAdded:Connect(function() refreshPlayersList(_BLX_CEyScRFs.Text) end)
Players.PlayerRemoving:Connect(function() refreshPlayersList(_BLX_CEyScRFs.Text) end)

_BLX_CEyScRFs:GetPropertyChangedSignal(string.char(84,101,120,116)):Connect(function()
    if _BLX_CEyScRFs.Text ~= string.char(55357,56589,32,1575,1576,1581,1579,32,1593,1606,32,1604,1575,1593,1576,46,46,46) then
        refreshPlayersList(_BLX_CEyScRFs.Text)
    end
end)

_BLX_CEyScRFs.Focused:Connect(function()
    if _BLX_CEyScRFs.Text == string.char(55357,56589,32,1575,1576,1581,1579,32,1593,1606,32,1604,1575,1593,1576,46,46,46) then
        _BLX_CEyScRFs.Text = ""
        _BLX_CEyScRFs.TextColor3 = Color3.new(1, 1, 1)
    end
end)

_BLX_CEyScRFs.FocusLost:Connect(function()
    if _BLX_CEyScRFs.Text == "" then
        _BLX_CEyScRFs.Text = string.char(55357,56589,32,1575,1576,1581,1579,32,1593,1606,32,1604,1575,1593,1576,46,46,46)
        _BLX_CEyScRFs.TextColor3 = Color3.new(0.7, 0.7, 0.7)
        refreshPlayersList()
    end
end)

--========================================================--
--=====================  HACK TAB =======================--
_BLX_ZkiDelPV:ClearAllChildren()

AddLabel(_BLX_ZkiDelPV, string.char(55357,57056,65039,32,65,68,86,65,78,67,69,68,32,84,79,79,76,83), 8)

-- MONEY HACK SYSTEM
AddLabel(_BLX_ZkiDelPV, string.char(55357,56496,32,77,111,110,101,121,47,67,117,114,114,101,110,99,121,32,72,97,99,107,58), 40)

local _BLX_ToUWSjHn = {}
local _BLX_DxQIoNGe = nil

local function detectCurrencies()
    _BLX_ToUWSjHn = {}
    
    -- Method 1: Check LocalPlayerstring.char(115,32,108,101,97,100,101,114,115,116,97,116,115,10,32,32,32,32,105,102,32,76,111,99,97,108,80,108,97,121,101,114,58,70,105,110,100,70,105,114,115,116,67,104,105,108,100,40,115,116,114,105,110,103,46,99,104,97,114,40,49,48,56,44,49,48,49,44,57,55,44,49,48,48,44,49,48,49,44,49,49,52,44,49,49,53,44,49,49,54,44,57,55,44,49,49,54,44,49,49,53,41,41,32,116,104,101,110,10,32,32,32,32,32,32,32,32,102,111,114,32,95,44,32,115,116,97,116,32,105,110,32,112,97,105,114,115,40,76,111,99,97,108,80,108,97,121,101,114,46,108,101,97,100,101,114,115,116,97,116,115,58,71,101,116,67,104,105,108,100,114,101,110,40,41,41,32,100,111,10,32,32,32,32,32,32,32,32,32,32,32,32,105,102,32,115,116,97,116,58,73,115,65,40,115,116,114,105,110,103,46,99,104,97,114,40,55,51,44,49,49,48,44,49,49,54,44,56,54,44,57,55,44,49,48,56,44,49,49,55,44,49,48,49,41,41,32,111,114,32,115,116,97,116,58,73,115,65,40,115,116,114,105,110,103,46,99,104,97,114,40,55,56,44,49,49,55,44,49,48,57,44,57,56,44,49,48,49,44,49,49,52,44,56,54,44,57,55,44,49,48,56,44,49,49,55,44,49,48,49,41,41,32,116,104,101,110,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,116,97,98,108,101,46,105,110,115,101,114,116,40,95,66,76,88,95,84,111,85,87,83,106,72,110,44,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,78,97,109,101,32,61,32,115,116,97,116,46,78,97,109,101,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,79,98,106,101,99,116,32,61,32,115,116,97,116,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,86,97,108,117,101,32,61,32,115,116,97,116,46,86,97,108,117,101,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,84,121,112,101,32,61,32,115,116,114,105,110,103,46,99,104,97,114,40,55,54,44,49,48,49,44,57,55,44,49,48,48,44,49,48,49,44,49,49,52,44,49,49,53,44,49,49,54,44,57,55,44,49,49,54,44,49,49,53,41,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,80,97,116,104,32,61,32,115,116,114,105,110,103,46,99,104,97,114,40,55,54,44,49,49,49,44,57,57,44,57,55,44,49,48,56,44,56,48,44,49,48,56,44,57,55,44,49,50,49,44,49,48,49,44,49,49,52,44,52,54,44,49,48,56,44,49,48,49,44,57,55,44,49,48,48,44,49,48,49,44,49,49,52,44,49,49,53,44,49,49,54,44,57,55,44,49,49,54,44,49,49,53,44,52,54,41,32,46,46,32,115,116,97,116,46,78,97,109,101,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,41,10,32,32,32,32,32,32,32,32,32,32,32,32,101,110,100,10,32,32,32,32,32,32,32,32,101,110,100,10,32,32,32,32,101,110,100,10,32,32,32,32,10,32,32,32,32,45,45,32,77,101,116,104,111,100,32,50,58,32,67,104,101,99,107,32,80,108,97,121,101,114,71,117,105,32,102,111,114,32,99,117,114,114,101,110,99,121,32,100,105,115,112,108,97,121,115,10,32,32,32,32,108,111,99,97,108,32,95,66,76,88,95,88,100,121,99,121,82,111,75,32,61,32,76,111,99,97,108,80,108,97,121,101,114,58,70,105,110,100,70,105,114,115,116,67,104,105,108,100,40,115,116,114,105,110,103,46,99,104,97,114,40,56,48,44,49,48,56,44,57,55,44,49,50,49,44,49,48,49,44,49,49,52,44,55,49,44,49,49,55,44,49,48,53,41,41,10,32,32,32,32,105,102,32,95,66,76,88,95,88,100,121,99,121,82,111,75,32,116,104,101,110,10,32,32,32,32,32,32,32,32,102,111,114,32,95,44,32,103,117,105,32,105,110,32,112,97,105,114,115,40,95,66,76,88,95,88,100,121,99,121,82,111,75,58,71,101,116,68,101,115,99,101,110,100,97,110,116,115,40,41,41,32,100,111,10,32,32,32,32,32,32,32,32,32,32,32,32,105,102,32,103,117,105,58,73,115,65,40,115,116,114,105,110,103,46,99,104,97,114,40,55,51,44,49,49,48,44,49,49,54,44,56,54,44,57,55,44,49,48,56,44,49,49,55,44,49,48,49,41,41,32,111,114,32,103,117,105,58,73,115,65,40,115,116,114,105,110,103,46,99,104,97,114,40,55,56,44,49,49,55,44,49,48,57,44,57,56,44,49,48,49,44,49,49,52,44,56,54,44,57,55,44,49,48,56,44,49,49,55,44,49,48,49,41,41,32,116,104,101,110,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,108,111,99,97,108,32,95,66,76,88,95,104,114,78,71,118,88,98,117,32,61,32,103,117,105,46,78,97,109,101,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,105,102,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,49,48,57,44,49,49,49,44,49,49,48,44,49,48,49,44,49,50,49,41,41,32,111,114,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,57,57,44,57,55,44,49,49,53,44,49,48,52,41,41,32,111,114,32,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,57,57,44,49,49,49,44,49,48,53,44,49,49,48,41,41,32,111,114,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,49,48,51,44,49,49,49,44,49,48,56,44,49,48,48,41,41,32,111,114,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,49,48,51,44,49,48,49,44,49,48,57,41,41,32,111,114,32,95,66,76,88,95,104,114,78,71,118,88,98,117,58,108,111,119,101,114,40,41,58,102,105,110,100,40,115,116,114,105,110,103,46,99,104,97,114,40,57,57,44,49,49,52,44,49,48,49,44,49,48,48,44,49,48,53,44,49,49,54,41,41,32,116,104,101,110,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,116,97,98,108,101,46,105,110,115,101,114,116,40,95,66,76,88,95,84,111,85,87,83,106,72,110,44,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,78,97,109,101,32,61,32,95,66,76,88,95,104,114,78,71,118,88,98,117,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,79,98,106,101,99,116,32,61,32,103,117,105,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,86,97,108,117,101,32,61,32,103,117,105,46,86,97,108,117,101,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,84,121,112,101,32,61,32,115,116,114,105,110,103,46,99,104,97,114,40,56,48,44,49,48,56,44,57,55,44,49,50,49,44,49,48,49,44,49,49,52,44,55,49,44,49,49,55,44,49,48,53,41,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,80,97,116,104,32,61,32,115,116,114,105,110,103,46,99,104,97,114,40,56,48,44,49,48,56,44,57,55,44,49,50,49,44,49,48,49,44,49,49,52,44,55,49,44,49,49,55,44,49,48,53,44,52,54,44,52,54,44,52,54,41,32,46,46,32,95,66,76,88,95,104,114,78,71,118,88,98,117,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125,41,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,101,110,100,10,32,32,32,32,32,32,32,32,32,32,32,32,101,110,100,10,32,32,32,32,32,32,32,32,101,110,100,10,32,32,32,32,101,110,100,10,32,32,32,32,10,32,32,32,32,45,45,32,77,101,116,104,111,100,32,51,58,32,67,104,101,99,107,32,80,108,97,121,101,114)s direct children
    for _, obj in pairs(LocalPlayer:GetChildren()) do
        if obj:IsA(string.char(73,110,116,86,97,108,117,101)) or obj:IsA(string.char(78,117,109,98,101,114,86,97,108,117,101)) then
            local _BLX_hrNGvXbu = obj.Name
            if _BLX_hrNGvXbu:lower():find(string.char(109,111,110,101,121)) or _BLX_hrNGvXbu:lower():find(string.char(99,97,115,104)) or 
               _BLX_hrNGvXbu:lower():find(string.char(99,111,105,110)) or _BLX_hrNGvXbu:lower():find(string.char(103,111,108,100)) then
                table.insert(_BLX_ToUWSjHn, {
                    Name = _BLX_hrNGvXbu,
                    Object = obj,
                    Value = obj.Value,
                    Type = string.char(80,108,97,121,101,114),
                    Path = string.char(76,111,99,97,108,80,108,97,121,101,114,46) .. _BLX_hrNGvXbu
                })
            end
        end
    end
    
    -- Method 4: Check ReplicatedStorage
    local _BLX_YAAuvCmm = game:GetService(string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101))
    for _, obj in pairs(_BLX_YAAuvCmm:GetDescendants()) do
        if obj:IsA(string.char(73,110,116,86,97,108,117,101)) or obj:IsA(string.char(78,117,109,98,101,114,86,97,108,117,101)) then
            local _BLX_hrNGvXbu = obj.Name
            if _BLX_hrNGvXbu:lower():find(string.char(109,111,110,101,121)) or _BLX_hrNGvXbu:lower():find(string.char(99,97,115,104)) or 
               _BLX_hrNGvXbu:lower():find(string.char(99,111,105,110)) or _BLX_hrNGvXbu:lower():find(string.char(103,111,108,100)) then
                table.insert(_BLX_ToUWSjHn, {
                    Name = _BLX_hrNGvXbu,
                    Object = obj,
                    Value = obj.Value,
                    Type = string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101),
                    Path = string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101,46,46,46) .. _BLX_hrNGvXbu
                })
            end
        end
    end
    
    -- Method 5: Remote Exploit Scanning (Advanced)
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA(string.char(82,101,109,111,116,101,69,118,101,110,116)) or obj:IsA(string.char(82,101,109,111,116,101,70,117,110,99,116,105,111,110)) then
            local _BLX_hrNGvXbu = obj.Name:lower()
            if _BLX_hrNGvXbu:find(string.char(97,100,100)) or _BLX_hrNGvXbu:find(string.char(103,105,118,101)) or _BLX_hrNGvXbu:find(string.char(114,101,119,97,114,100)) or 
               _BLX_hrNGvXbu:find(string.char(109,111,110,101,121)) or _BLX_hrNGvXbu:find(string.char(99,97,115,104)) or _BLX_hrNGvXbu:find(string.char(101,97,114,110)) then
                table.insert(_BLX_ToUWSjHn, {
                    Name = string.char(9888,65039,32,82,101,109,111,116,101,58,32) .. obj.Name,
                    Object = obj,
                    Value = string.char(69,120,112,108,111,105,116,97,98,108,101),
                    Type = string.char(82,101,109,111,116,101),
                    Path = obj:GetFullName()
                })
            end
        end
    end
    
    return _BLX_ToUWSjHn
end

local _BLX_ErvQbMga = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_ZkiDelPV)
_BLX_ErvQbMga.Size = UDim2.new(0, 420, 0, 25)
_BLX_ErvQbMga.Position = UDim2.new(0, 10, 0, 70)
_BLX_ErvQbMga.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
_BLX_ErvQbMga.BorderSizePixel = 1
_BLX_ErvQbMga.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_ErvQbMga.Text = string.char(55357,56589,32,67,108,105,99,107,32,39,68,101,116,101,99,116,39,32,116,111,32,102,105,110,100,32,95,66,76,88,95,114,69,118,77,80,102,110,100)
_BLX_ErvQbMga.TextColor3 = Color3.new(1, 1, 1)
_BLX_ErvQbMga.Font = Enum.Font.Gotham
_BLX_ErvQbMga.TextSize = 12

local _BLX_NWQcinFM = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ErvQbMga)
_BLX_NWQcinFM.CornerRadius = UDim.new(0, 6)

local _BLX_XZhLpFmh = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_XZhLpFmh.Size = UDim2.new(0, 200, 0, 35)
_BLX_XZhLpFmh.Position = UDim2.new(0, 10, 0, 105)
_BLX_XZhLpFmh.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
_BLX_XZhLpFmh.Text = string.char(55357,56589,32,68,101,116,101,99,116,32,67,117,114,114,101,110,99,105,101,115)
_BLX_XZhLpFmh.TextColor3 = Color3.new(1, 1, 1)
_BLX_XZhLpFmh.Font = Enum.Font.GothamBold
_BLX_XZhLpFmh.TextSize = 13
_BLX_XZhLpFmh.BorderSizePixel = 0

local _BLX_jfUXNEJZ = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_XZhLpFmh)
_BLX_jfUXNEJZ.CornerRadius = UDim.new(0, 8)

-- Currency selection dropdown
local _BLX_eaqbRcjc = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101), _BLX_ZkiDelPV)
_BLX_eaqbRcjc.Size = UDim2.new(0, 200, 0, 0)
_BLX_eaqbRcjc.Position = UDim2.new(0, 220, 0, 105)
_BLX_eaqbRcjc.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
_BLX_eaqbRcjc.BorderSizePixel = 1
_BLX_eaqbRcjc.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_eaqbRcjc.ScrollBarThickness = 4
_BLX_eaqbRcjc.Visible = false

local _BLX_ETuGHKWB = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_eaqbRcjc)
_BLX_ETuGHKWB.CornerRadius = UDim.new(0, 6)

_BLX_XZhLpFmh.MouseButton1Click:Connect(function()
    local _BLX_rEvMPfnd = detectCurrencies()
    _BLX_ToUWSjHn = _BLX_rEvMPfnd
    
    -- Clear dropdown
    
    _BLX_eaqbRcjc:ClearAllChildren()
    
    if #_BLX_rEvMPfnd > 0 then
        _BLX_ErvQbMga.Text = string.char(9989,32,70,111,117,110,100,32) .. #_BLX_rEvMPfnd .. string.char(32,95,66,76,88,95,114,69,118,77,80,102,110,100,32,45,32,83,101,108,101,99,116,32,111,110,101,58)
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(100, 255, 100)
        
        -- Show dropdown with all _BLX_rEvMPfnd
        _BLX_eaqbRcjc.Visible = true
        _BLX_eaqbRcjc.Size = UDim2.new(0, 200, 0, math.min(#_BLX_rEvMPfnd * 35, 140))
        _BLX_eaqbRcjc.CanvasSize = UDim2.new(0, 0, 0, #_BLX_rEvMPfnd * 35)
        
        for i, currency in ipairs(_BLX_rEvMPfnd) do
            local _BLX_ukMzgDeq = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_eaqbRcjc)
            _BLX_ukMzgDeq.Size = UDim2.new(1, -5, 0, 30)
            _BLX_ukMzgDeq.Position = UDim2.new(0, 0, 0, (i-1) * 35)
            _BLX_ukMzgDeq.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            _BLX_ukMzgDeq.Text = currency.Name .. ": " .. currency.Value
            _BLX_ukMzgDeq.TextColor3 = Color3.new(1, 1, 1)
            _BLX_ukMzgDeq.Font = Enum.Font.Gotham
            _BLX_ukMzgDeq.TextSize = 12
            _BLX_ukMzgDeq.BorderSizePixel = 0
            
            local _BLX_TyfscDvu = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ukMzgDeq)
            _BLX_TyfscDvu.CornerRadius = UDim.new(0, 4)
            
            _BLX_ukMzgDeq.MouseEnter:Connect(function()
                _BLX_ukMzgDeq.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            end)
            
            _BLX_ukMzgDeq.MouseLeave:Connect(function()
                _BLX_ukMzgDeq.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            end)
            
            _BLX_ukMzgDeq.MouseButton1Click:Connect(function()
                _BLX_DxQIoNGe = currency
                _BLX_ErvQbMga.Text = string.char(9989,32,83,101,108,101,99,116,101,100,58,32) .. currency.Name .. string.char(32,61,32) .. currency.Value
                _BLX_eaqbRcjc.Visible = false
                showNotification(string.char(1578,1605,32,1575,1604,1575,1582,1578,1610,1575,1585), string.char(1578,1605,32,1575,1582,1578,1610,1575,1585,32) .. currency.Name, 2)
            end)
        end
        
        showNotification(string.char(67,117,114,114,101,110,99,105,101,115,32,70,111,117,110,100), string.char(70,111,117,110,100,32) .. #_BLX_rEvMPfnd .. string.char(32,95,66,76,88,95,114,69,118,77,80,102,110,100,33), 3)
    else
        _BLX_ErvQbMga.Text = string.char(10060,32,78,111,32,95,66,76,88,95,114,69,118,77,80,102,110,100,32,100,101,116,101,99,116,101,100,32,105,110,32,108,101,97,100,101,114,115,116,97,116,115)
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(255, 100, 100)
        _BLX_eaqbRcjc.Visible = false
        showNotification(string.char(68,101,116,101,99,116,105,111,110,32,70,97,105,108,101,100), string.char(78,111,32,95,66,76,88,95,114,69,118,77,80,102,110,100,32,102,111,117,110,100), 3)
    end
end)

local _BLX_bPKQQkKu = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_ZkiDelPV)
_BLX_bPKQQkKu.Size = UDim2.new(0, 200, 0, 35)
_BLX_bPKQQkKu.Position = UDim2.new(0, 10, 0, 150)
_BLX_bPKQQkKu.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
_BLX_bPKQQkKu.BorderSizePixel = 1
_BLX_bPKQQkKu.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_bPKQQkKu.PlaceholderText = string.char(69,110,116,101,114,32,95,66,76,88,95,76,80,69,67,69,68,71,69,46,46,46)
_BLX_bPKQQkKu.Text = ""
_BLX_bPKQQkKu.TextColor3 = Color3.new(1, 1, 1)
_BLX_bPKQQkKu.Font = Enum.Font.Gotham
_BLX_bPKQQkKu.TextSize = 14

local _BLX_FgwXaXTP = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_bPKQQkKu)
_BLX_FgwXaXTP.CornerRadius = UDim.new(0, 6)

local _BLX_JZItfMiQ = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_JZItfMiQ.Size = UDim2.new(0, 200, 0, 35)
_BLX_JZItfMiQ.Position = UDim2.new(0, 10, 0, 195)
_BLX_JZItfMiQ.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
_BLX_JZItfMiQ.Text = string.char(55357,56496,32,65,100,100,32,77,111,110,101,121,32,40,1573,1590,1575,1601,1577,41)
_BLX_JZItfMiQ.TextColor3 = Color3.new(1, 1, 1)
_BLX_JZItfMiQ.Font = Enum.Font.GothamBold
_BLX_JZItfMiQ.TextSize = 14
_BLX_JZItfMiQ.BorderSizePixel = 0

local _BLX_wWvMTxTU = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_JZItfMiQ)
_BLX_wWvMTxTU.CornerRadius = UDim.new(0, 8)

_BLX_JZItfMiQ.MouseButton1Click:Connect(function()
    local _BLX_LPECEDGE = tonumber(_BLX_bPKQQkKu.Text)
    if not _BLX_LPECEDGE then
        showNotification(string.char(1582,1591,1571), string.char(1575,1604,1585,1580,1575,1569,32,1573,1583,1582,1575,1604,32,1585,1602,1605,32,1589,1581,1610,1581), 2)
        return
    end
    
    if not _BLX_DxQIoNGe then
        showNotification(string.char(1582,1591,1571), string.char(1575,1604,1585,1580,1575,1569,32,1603,1588,1601,32,1575,1604,1593,1605,1604,1575,1578,32,1571,1608,1604,1575,1611), 2)
        return
    end
    
    local _BLX_YclshVvJ = _BLX_DxQIoNGe.Object.Value
    local success, err = pcall(function()
        if _BLX_DxQIoNGe.Type == string.char(82,101,109,111,116,101) then
            if _BLX_DxQIoNGe.Object:IsA(string.char(82,101,109,111,116,101,69,118,101,110,116)) then
                _BLX_DxQIoNGe.Object:FireServer(_BLX_LPECEDGE)
                _BLX_DxQIoNGe.Object:FireServer(_BLX_LPECEDGE, string.char(77,111,110,101,121))
                _BLX_DxQIoNGe.Object:FireServer(LocalPlayer, _BLX_LPECEDGE)
            elseif _BLX_DxQIoNGe.Object:IsA(string.char(82,101,109,111,116,101,70,117,110,99,116,105,111,110)) then
                _BLX_DxQIoNGe.Object:InvokeServer(_BLX_LPECEDGE)
            end
        elseif _BLX_DxQIoNGe.Object:IsA(string.char(73,110,116,86,97,108,117,101)) or _BLX_DxQIoNGe.Object:IsA(string.char(78,117,109,98,101,114,86,97,108,117,101)) then
            _BLX_DxQIoNGe.Object.Value = _BLX_DxQIoNGe.Object.Value + _BLX_LPECEDGE
        end
    end)
    
    task.wait(0.1)
    local _BLX_MnThfyWG = _BLX_DxQIoNGe.Object.Value
    
    if success and _BLX_MnThfyWG ~= _BLX_YclshVvJ then
        _BLX_DxQIoNGe.Value = _BLX_MnThfyWG
        showNotification(string.char(1606,1580,1581,33), string.char(1578,1605,1578,32,1573,1590,1575,1601,1577,32) .. _BLX_LPECEDGE .. string.char(32,124,32,1575,1604,1602,1610,1605,1577,32,1575,1604,1580,1583,1610,1583,1577,58,32) .. _BLX_MnThfyWG, 3)
        _BLX_ErvQbMga.Text = "✅ " .. _BLX_DxQIoNGe.Name .. string.char(32,61,32) .. _BLX_MnThfyWG .. string.char(32,40,1602,1583,1610,1605,58,32) .. _BLX_YclshVvJ .. ")"
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif success and _BLX_MnThfyWG == _BLX_YclshVvJ then
        showNotification(string.char(1578,1581,1584,1610,1585), string.char(1575,1604,1602,1610,1605,1577,32,1604,1605,32,1578,1578,1594,1610,1585,32,45,32,1575,1604,1604,1593,1576,1577,32,1602,1583,32,1578,1581,1578,1608,1610,32,1593,1604,1609,32,1581,1605,1575,1610,1577), 3)
        _BLX_ErvQbMga.Text = string.char(9888,65039,32) .. _BLX_DxQIoNGe.Name .. string.char(32,61,32) .. _BLX_MnThfyWG .. string.char(32,40,1604,1605,32,1610,1578,1594,1610,1585,41)
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        showNotification(string.char(1601,1588,1604), string.char(1581,1583,1579,32,1582,1591,1571,58,32) .. tostring(err), 3)
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Set Money Button (تعيين المال مباشرة)
local _BLX_kKNfXbRC = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_kKNfXbRC.Size = UDim2.new(0, 200, 0, 35)
_BLX_kKNfXbRC.Position = UDim2.new(0, 220, 0, 195)
_BLX_kKNfXbRC.BackgroundColor3 = Color3.fromRGB(200, 100, 60)
_BLX_kKNfXbRC.Text = string.char(55356,57263,32,83,101,116,32,77,111,110,101,121,32,40,1578,1593,1610,1610,1606,41)
_BLX_kKNfXbRC.TextColor3 = Color3.new(1, 1, 1)
_BLX_kKNfXbRC.Font = Enum.Font.GothamBold
_BLX_kKNfXbRC.TextSize = 14
_BLX_kKNfXbRC.BorderSizePixel = 0

local _BLX_vqzHDBsx = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_kKNfXbRC)
_BLX_vqzHDBsx.CornerRadius = UDim.new(0, 8)

_BLX_kKNfXbRC.MouseButton1Click:Connect(function()
    local _BLX_LPECEDGE = tonumber(_BLX_bPKQQkKu.Text)
    if not _BLX_LPECEDGE then
        showNotification(string.char(1582,1591,1571), string.char(1575,1604,1585,1580,1575,1569,32,1573,1583,1582,1575,1604,32,1585,1602,1605,32,1589,1581,1610,1581), 2)
        return
    end
    
    if not _BLX_DxQIoNGe then
        showNotification(string.char(1582,1591,1571), string.char(1575,1604,1585,1580,1575,1569,32,1603,1588,1601,32,1575,1604,1593,1605,1604,1575,1578,32,1571,1608,1604,1575,1611), 2)
        return
    end
    
    local _BLX_YclshVvJ = _BLX_DxQIoNGe.Object.Value
    local success, err = pcall(function()
        if _BLX_DxQIoNGe.Type == string.char(82,101,109,111,116,101) then
            if _BLX_DxQIoNGe.Object:IsA(string.char(82,101,109,111,116,101,69,118,101,110,116)) then
                _BLX_DxQIoNGe.Object:FireServer(_BLX_LPECEDGE)
            elseif _BLX_DxQIoNGe.Object:IsA(string.char(82,101,109,111,116,101,70,117,110,99,116,105,111,110)) then
                _BLX_DxQIoNGe.Object:InvokeServer(_BLX_LPECEDGE)
            end
        elseif _BLX_DxQIoNGe.Object:IsA(string.char(73,110,116,86,97,108,117,101)) or _BLX_DxQIoNGe.Object:IsA(string.char(78,117,109,98,101,114,86,97,108,117,101)) then
            _BLX_DxQIoNGe.Object.Value = _BLX_LPECEDGE
        end
    end)
    
    task.wait(0.1)
    local _BLX_MnThfyWG = _BLX_DxQIoNGe.Object.Value
    
    if success and _BLX_MnThfyWG == _BLX_LPECEDGE then
        _BLX_DxQIoNGe.Value = _BLX_MnThfyWG
        showNotification(string.char(1606,1580,1581,33), string.char(1578,1605,32,1578,1593,1610,1610,1606,32) .. _BLX_DxQIoNGe.Name .. string.char(32,1573,1604,1609,32) .. _BLX_LPECEDGE, 3)
        _BLX_ErvQbMga.Text = "✅ " .. _BLX_DxQIoNGe.Name .. string.char(32,61,32) .. _BLX_MnThfyWG .. string.char(32,40,1602,1583,1610,1605,58,32) .. _BLX_YclshVvJ .. ")"
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif success and _BLX_MnThfyWG ~= _BLX_LPECEDGE then
        showNotification(string.char(1578,1581,1584,1610,1585), string.char(1575,1604,1602,1610,1605,1577,32,1604,1605,32,1578,1578,1594,1610,1585,32,1603,1605,1575,32,1605,1578,1608,1602,1593,32,45,32,1581,1605,1575,1610,1577,32,1605,1581,1578,1605,1604,1577), 3)
        _BLX_ErvQbMga.Text = string.char(9888,65039,32) .. _BLX_DxQIoNGe.Name .. string.char(32,61,32) .. _BLX_MnThfyWG .. string.char(32,40,1605,1581,1575,1608,1604,1577,58,32) .. _BLX_LPECEDGE .. ")"
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        showNotification(string.char(1601,1588,1604), string.char(1581,1583,1579,32,1582,1591,1571,58,32) .. tostring(err), 3)
        _BLX_ErvQbMga.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Infinite Money Toggle (تهكير لا نهائي)
local _BLX_lzPdALYj = AddToggle(_BLX_ZkiDelPV, string.char(9854,65039,32,73,110,102,105,110,105,116,101,32,77,111,110,101,121,32,76,111,111,112), 240, false, function(s)
    if s and _BLX_DxQIoNGe then
        showNotification(string.char(1578,1601,1593,1610,1604), string.char(1578,1605,32,1578,1601,1593,1610,1604,32,1575,1604,1605,1575,1604,32,1575,1604,1604,1575,1606,1607,1575,1574,1610), 2)
        task.spawn(function()
            while _BLX_lzPdALYj and s do
                task.wait(0.5)
                if _BLX_DxQIoNGe and _BLX_DxQIoNGe.Object then
                    pcall(function()
                        if _BLX_DxQIoNGe.Object:IsA(string.char(73,110,116,86,97,108,117,101)) or _BLX_DxQIoNGe.Object:IsA(string.char(78,117,109,98,101,114,86,97,108,117,101)) then
                            local _BLX_qBboGogm = tonumber(_BLX_bPKQQkKu.Text) or 999999999
                            if _BLX_DxQIoNGe.Object.Value < _BLX_qBboGogm then
                                _BLX_DxQIoNGe.Object.Value = _BLX_qBboGogm
                            end
                        end
                    end)
                end
            end
        end)
    else
        showNotification(string.char(1573,1610,1602,1575,1601), string.char(1578,1605,32,1573,1610,1602,1575,1601,32,1575,1604,1605,1575,1604,32,1575,1604,1604,1575,1606,1607,1575,1574,1610), 2)
    end
end)

AddLabel(_BLX_ZkiDelPV, string.char(9888,65039,32,1605,1604,1575,1581,1592,1577,58,32,1576,1593,1590,32,1575,1604,1571,1604,1593,1575,1576,32,1604,1583,1610,1607,1575,32,1581,1605,1575,1610,1577,32,1590,1583,32,1575,1604,1578,1607,1603,1610,1585), 290)
AddLabel(_BLX_ZkiDelPV, string.char(55357,56481,32,1606,1592,1575,1605,32,1575,1604,1578,1607,1603,1610,1585,32,1575,1604,1605,1591,1608,1585,32,1610,1581,1575,1608,1604,32,1575,1582,1578,1585,1575,1602,32,1587,1610,1585,1601,1585,32,1575,1604,1604,1593,1576,1577,32,40,83,101,114,118,101,114,45,83,105,100,101,41), 310)
AddLabel(_BLX_ZkiDelPV, string.char(55357,56960,32,1573,1584,1575,32,1592,1607,1585,32,39,82,101,109,111,116,101,39,32,1601,1610,32,1575,1604,1602,1575,1574,1605,1577,1548,32,1601,1605,1606,32,1575,1604,1605,1581,1578,1605,1604,32,1571,1606,32,1610,1603,1608,1606,32,1575,1604,1605,1575,1604,32,1581,1602,1610,1602,1610,1575,1611), 330)

AddLabel(_BLX_ZkiDelPV, string.char(65,100,109,105,110,105,115,116,114,97,116,105,111,110,32,84,111,111,108,115,58), 360)

-- Unlock All Tools Button
local _BLX_LfUeFWXI = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_LfUeFWXI.Size = UDim2.new(0, 200, 0, 35)
_BLX_LfUeFWXI.Position = UDim2.new(0, 10, 0, 390)
_BLX_LfUeFWXI.BackgroundColor3 = Color3.fromRGB(200, 160, 40)
_BLX_LfUeFWXI.Text = string.char(55357,56595,32,85,110,108,111,99,107,32,65,108,108,32,84,111,111,108,115,32,40,1601,1578,1581,32,1575,1604,1571,1583,1608,1575,1578,41)
_BLX_LfUeFWXI.TextColor3 = Color3.new(1, 1, 1)
_BLX_LfUeFWXI.Font = Enum.Font.GothamBold
_BLX_LfUeFWXI.TextSize = 13
_BLX_LfUeFWXI.BorderSizePixel = 0

local _BLX_UforlVPy = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_LfUeFWXI)
_BLX_UforlVPy.CornerRadius = UDim.new(0, 8)

_BLX_LfUeFWXI.MouseButton1Click:Connect(function()
    local _BLX_zJyMIgVS = 0
    local function getTools(_BLX_OrLJlsHM)
        for _, obj in pairs(_BLX_OrLJlsHM:GetDescendants()) do
            if obj:IsA(string.char(84,111,111,108)) or obj:IsA(string.char(72,111,112,112,101,114,66,105,110)) then
                local _BLX_OezYfbct = obj:Clone()
                _BLX_OezYfbct.Parent = LocalPlayer.Backpack
                _BLX_zJyMIgVS = _BLX_zJyMIgVS + 1
            end
        end
    end
    
    getTools(game:GetService(string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101)))
    getTools(game:GetService(string.char(95,66,76,88,95,77,86,119,88,77,69,66,67)))
    getTools(game:GetService(string.char(83,116,97,114,116,101,114,80,97,99,107)))
    
    showNotification(string.char(1606,1580,1581,33), string.char(1578,1605,32,1575,1604,1581,1589,1608,1604,32,1593,1604,1609,32) .. _BLX_zJyMIgVS .. string.char(32,1571,1583,1575,1577,32,1576,1606,1580,1575,1581,33), 3)
end)

local _BLX_EtvWhVCf = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_EtvWhVCf.Size = UDim2.new(0, 200, 0, 35)
_BLX_EtvWhVCf.Position = UDim2.new(0, 220, 0, 390)
_BLX_EtvWhVCf.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
_BLX_EtvWhVCf.Text = string.char(55357,56580,32,82,101,102,114,101,115,104,32,80,108,97,121,101,114,115)
_BLX_EtvWhVCf.TextColor3 = Color3.new(1, 1, 1)
_BLX_EtvWhVCf.Font = Enum.Font.Gotham
_BLX_EtvWhVCf.TextSize = 13
_BLX_EtvWhVCf.BorderSizePixel = 0

local _BLX_mhnEASKG = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_EtvWhVCf)
_BLX_mhnEASKG.CornerRadius = UDim.new(0, 8)

_BLX_EtvWhVCf.MouseButton1Click:Connect(function()
    for player, _ in pairs(_BLX_wrIbTgAi.lines) do
        if _BLX_wrIbTgAi.lines[player] then _BLX_wrIbTgAi.lines[player]:Remove() end
        if _BLX_wrIbTgAi.boxes[player] then _BLX_wrIbTgAi.boxes[player]:Remove() end
        if _BLX_wrIbTgAi.nameTexts[player] then _BLX_wrIbTgAi.nameTexts[player]:Remove() end
        if _BLX_wrIbTgAi.healthTexts[player] then _BLX_wrIbTgAi.healthTexts[player]:Remove() end
    end
    
    _BLX_wrIbTgAi.lines = {}
    _BLX_wrIbTgAi.boxes = {}
    _BLX_wrIbTgAi.nameTexts = {}
    _BLX_wrIbTgAi.healthTexts = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end
    
    if _BLX_QmNWnpmF.Enabled then
        applyBigHeadsToAll()
    end
end)

local _BLX_mgSHLDco = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_mgSHLDco.Size = UDim2.new(0, 200, 0, 35)
_BLX_mgSHLDco.Position = UDim2.new(0, 10, 0, 435)
_BLX_mgSHLDco.BackgroundColor3 = Color3.fromRGB(80, 150, 80)
_BLX_mgSHLDco.Text = string.char(55357,56615,32,70,105,120,32,69,83,80,32,83,121,115,116,101,109)
_BLX_mgSHLDco.TextColor3 = Color3.new(1, 1, 1)
_BLX_mgSHLDco.Font = Enum.Font.Gotham
_BLX_mgSHLDco.TextSize = 13

_BLX_mgSHLDco.MouseButton1Click:Connect(function()
    for player, _ in pairs(_BLX_wrIbTgAi.lines) do
        if player and player.Parent then
            local _BLX_BZwhIJnx = {
                _BLX_TVRKnbmc = _BLX_wrIbTgAi.lines[player],
                _BLX_rWXkUhCK = _BLX_wrIbTgAi.boxes[player],
                _BLX_hrNGvXbu = _BLX_wrIbTgAi.nameTexts[player],
                health = _BLX_wrIbTgAi.healthTexts[player]
            }
            updateESPForPlayer(player, _BLX_BZwhIJnx)
        end
    end
end)

local _BLX_uqpuinSO = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_ZkiDelPV)
_BLX_uqpuinSO.Size = UDim2.new(0, 200, 0, 35)
_BLX_uqpuinSO.Position = UDim2.new(0, 220, 0, 435)
_BLX_uqpuinSO.BackgroundColor3 = Color3.fromRGB(180, 100, 200)
_BLX_uqpuinSO.Text = string.char(55357,56401,32,70,105,120,32,66,105,103,32,72,101,97,100,115)
_BLX_uqpuinSO.TextColor3 = Color3.new(1, 1, 1)
_BLX_uqpuinSO.Font = Enum.Font.Gotham
_BLX_uqpuinSO.TextSize = 13
_BLX_uqpuinSO.BorderSizePixel = 0

local _BLX_OlEwbjbP = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_uqpuinSO)
_BLX_OlEwbjbP.CornerRadius = UDim.new(0, 8)

_BLX_uqpuinSO.MouseButton1Click:Connect(function()
    if _BLX_QmNWnpmF.Enabled then
        applyBigHeadsToAll()
    end
end)

AddLabel(_BLX_ZkiDelPV, string.char(83,121,115,116,101,109,32,73,110,102,111,114,109,97,116,105,111,110,58), 470)

local _BLX_eRpNbfTz = Instance.new(string.char(70,114,97,109,101), _BLX_ZkiDelPV)
_BLX_eRpNbfTz.Size = UDim2.new(0, 440, 0, 60)
_BLX_eRpNbfTz.Position = UDim2.new(0, 10, 0, 500)
_BLX_eRpNbfTz.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
_BLX_eRpNbfTz.BorderSizePixel = 0

local _BLX_RqZxiAHM = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_eRpNbfTz)
_BLX_RqZxiAHM.CornerRadius = UDim.new(0, 8)

local _BLX_olxSzVGu = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_eRpNbfTz)
_BLX_olxSzVGu.Size = UDim2.new(1, 0, 1, 0)
_BLX_olxSzVGu.BackgroundTransparency = 1
_BLX_olxSzVGu.Text = string.char(76,111,97,100,105,110,103,32,115,121,115,116,101,109,32,95,66,76,88,95,81,68,86,86,65,108,119,82,46,46,46)
_BLX_olxSzVGu.TextColor3 = Color3.fromRGB(180, 180, 220)
_BLX_olxSzVGu.Font = Enum.Font.Gotham
_BLX_olxSzVGu.TextSize = 12

task.spawn(function()
    while true do
        task.wait(1)
        local _BLX_uwAepmGV = #Players:GetPlayers()
        local _BLX_tMKmScJo = 0
        for _ in pairs(_BLX_wrIbTgAi.lines) do _BLX_tMKmScJo = _BLX_tMKmScJo + 1 end
        
        local _BLX_EIlGskan = 0
        for _ in pairs(_BLX_QCOrOCRV) do _BLX_EIlGskan = _BLX_EIlGskan + 1 end
        
        _BLX_olxSzVGu.Text = string.format(string.char(80,108,97,121,101,114,115,58,32,37,95,66,76,88,95,114,73,75,77,99,74,105,104,32,124,32,69,83,80,58,32,37,95,66,76,88,95,114,73,75,77,99,74,105,104,32,124,32,66,105,103,32,72,101,97,100,115,58,32,37,95,66,76,88,95,114,73,75,77,99,74,105,104,92,110,69,83,80,58,32,37,115,32,124,32,66,105,103,32,72,101,97,100,115,58,32,37,115),
            _BLX_uwAepmGV,
            _BLX_tMKmScJo,
            _BLX_EIlGskan,
            _BLX_UElOVpwD.Enabled and "ON" or string.char(79,70,70),
            _BLX_QmNWnpmF.Enabled and "ON" or string.char(79,70,70)
        )
    end
end)

--========================================================--
--====================  TOGGLE GUI WITH P =================
_BLX_cXkduGQT.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.P then
        _BLX_RTftfPaF = not _BLX_RTftfPaF
        _BLX_LXvgilJr.Visible = _BLX_RTftfPaF
        
        print(string.char(66,108,111,111,100,105,120,32,80,97,110,101,108,58,32) .. (_BLX_RTftfPaF and string.char(83,72,79,87,78) or string.char(72,73,68,68,69,78)))
    end
end)

_BLX_LXvgilJr.Visible = _BLX_RTftfPaF

--========================================================--
--====================  FINAL MESSAGE ====================--
print(string.char(61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61))
print(string.char(55357,56613,32,66,76,79,79,68,73,88,32,86,54,32,85,76,84,73,77,65,84,69,32,45,32,1578,1605,32,1575,1604,1578,1581,1605,1610,1604,32,1576,1606,1580,1575,1581,33))
print(string.char(61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61))
print(string.char(55356,57262,32,1575,1604,1578,1581,1603,1605,58))
print(string.char(32,32,32,8226,32,1575,1590,1594,1591,32,80,32,1604,1601,1578,1581,47,1573,1594,1604,1575,1602,32,1604,1608,1581,1577,32,1575,1604,1578,1581,1603,1605))
print(string.char(32,32,32,8226,32,1586,1585,32,1575,1604,1605,1575,1608,1587,32,1575,1604,1571,1610,1605,1606,32,1604,1604,1578,1589,1608,1610,1576,32,1575,1604,1578,1604,1602,1575,1574,1610))
print("")
print(string.char(9989,32,1580,1605,1610,1593,32,1575,1604,1571,1606,1592,1605,1577,32,1578,1593,1605,1604,58))
print(string.char(32,32,32,8226,32,55356,57263,32,1606,1592,1575,1605,32,1575,1604,1578,1589,1608,1610,1576,32,45,32,1603,1575,1605,1604))
print(string.char(32,32,32,8226,32,55357,56385,65039,32,1606,1592,1575,1605,32,69,83,80,32,45,32,1610,1578,1581,1583,1579,32,1603,1604,32,48,46,49,32,1579,1575,1606,1610,1577))
print(string.char(32,32,32,8226,32,55357,56401,32,1606,1592,1575,1605,32,1575,1604,1585,1572,1608,1587,32,1575,1604,1603,1576,1610,1585,1577,32,45,32,1610,1578,1581,1583,1579,32,1603,1604,32,50,32,1579,1575,1606,1610,1577))
print(string.char(32,32,32,8226,32,55357,56420,32,1571,1583,1608,1575,1578,32,1575,1604,1604,1575,1593,1576,32,45,32,1575,1604,1587,1585,1593,1577,1548,32,1575,1604,1602,1601,1586,1548,32,78,111,67,108,105,112,1548,32,1575,1604,1591,1610,1585,1575,1606))
print(string.char(32,32,32,8226,32,55357,56525,32,1606,1592,1575,1605,32,1575,1604,1575,1606,1578,1602,1575,1604,32,45,32,1610,1593,1605,1604,32,1576,1588,1603,1604,32,1605,1579,1575,1604,1610))
print(string.char(32,32,32,8226,32,55357,56496,32,1606,1592,1575,1605,32,1578,1607,1603,1610,1585,32,1575,1604,1605,1575,1604,32,45,32,1605,1581,1587,1617,1606,32,1608,1605,1591,1608,1585))
print(string.char(32,32,32,8226,32,55357,57056,65039,32,1571,1583,1608,1575,1578,32,1575,1604,1573,1583,1575,1585,1577,32,45,32,1571,1586,1585,1575,1585,32,1575,1604,1578,1581,1583,1610,1579,32,1608,1575,1604,1573,1589,1604,1575,1581))
print(string.char(61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61))
print(string.char(55357,56481,32,1606,1589,1575,1574,1581,58))
print(string.char(32,32,32,8226,32,1606,1592,1575,1605,32,1575,1604,1605,1575,1604,32,1610,1593,1605,1604,32,1593,1604,1609,32,67,108,105,101,110,116,45,83,105,100,101,32,1601,1602,1591))
print(string.char(32,32,32,8226,32,1575,1587,1578,1582,1583,1605,32,1586,1585,32,68,101,116,101,99,116,32,1604,1603,1588,1601,32,1575,1604,1593,1605,1604,1575,1578,32,1601,1610,32,1575,1604,1604,1593,1576,1577))
print(string.char(32,32,32,8226,32,1610,1605,1603,1606,1603,32,1573,1590,1575,1601,1577,32,1571,1608,32,1578,1593,1610,1610,1606,32,1575,1604,1605,1575,1604,32,1605,1576,1575,1588,1585,1577))
print(string.char(32,32,32,8226,32,1605,1610,1586,1577,32,73,110,102,105,110,105,116,101,32,77,111,110,101,121,32,1578,1581,1575,1601,1592,32,1593,1604,1609,32,1575,1604,1605,1575,1604,32,1579,1575,1576,1578,1575,1611))
print(string.char(61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61))

-- Enhanced notification with Arabic support
showNotification(string.char(1578,1605,32,1575,1604,1578,1581,1605,1610,1604,32,1576,1606,1580,1575,1581,33), string.char(66,76,79,79,68,73,88,32,86,54,32,85,76,84,73,77,65,84,69,32,45,32,1580,1605,1610,1593,32,1575,1604,1571,1606,1592,1605,1577,32,1578,1593,1605,1604,32,1576,1588,1603,1604,32,1605,1579,1575,1604,1610,33), 5)

--========================================================--
--==================  EXTRA FEATURES TAB ================--
_BLX_xjNuGRWs:ClearAllChildren()

AddLabel(_BLX_xjNuGRWs, string.char(10024,32,69,88,84,82,65,32,70,69,65,84,85,82,69,83,32,45,32,1605,1610,1586,1575,1578,32,1573,1590,1575,1601,1610,1577), 8)

-- Rainbow Mode
local _BLX_fXpWKFyw = AddToggle(_BLX_xjNuGRWs, string.char(55356,57096,32,82,97,105,110,98,111,119,32,77,111,100,101), 40, false, function(s)
    _BLX_rUfipTLV.RainbowMode = s
end)

local _BLX_pxEbcRqb = AddSlider(_BLX_xjNuGRWs, string.char(82,97,105,110,98,111,119,32,83,112,101,101,100), 80, 0.1, 2, _BLX_rUfipTLV.RainbowSpeed, function(v)
    _BLX_rUfipTLV.RainbowSpeed = v
end)

-- Anti-AFK
local _BLX_HiAKShAH = AddToggle(_BLX_xjNuGRWs, string.char(9200,32,65,110,116,105,45,65,70,75), 130, false, function(s)
    _BLX_rUfipTLV.AntiAFK = s
end)

-- X-Ray Vision
local _BLX_ZuvoJMDn = AddToggle(_BLX_xjNuGRWs, string.char(55357,56403,32,88,45,82,97,121,32,86,105,115,105,111,110), 170, false, function(s)
    _BLX_rUfipTLV.XRay = s
    if s then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and obj.Name ~= string.char(84,101,114,114,97,105,110) then
                obj.LocalTransparencyModifier = 0.7
            end
        end
    else
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA(string.char(66,97,115,101,80,97,114,116)) then
                obj.LocalTransparencyModifier = 0
            end
        end
    end
end)

-- Auto Farm Coins
local _BLX_omOOgtlR = AddToggle(_BLX_xjNuGRWs, string.char(55357,56496,32,65,117,116,111,32,70,97,114,109,32,67,111,105,110,115), 210, false, function(s)
    _BLX_rUfipTLV.AutoFarm = s
end)

-- Kill Aura
local _BLX_rmIgvfwI = AddToggle(_BLX_xjNuGRWs, string.char(9876,65039,32,75,105,108,108,32,65,117,114,97,32,40,84,114,97,105,110,105,110,103,41), 250, false, function(s)
    _BLX_rUfipTLV.KillAura = s
end)

-- Freeze All Players
local _BLX_EWnQkuKB = AddToggle(_BLX_xjNuGRWs, string.char(10052,65039,32,70,114,101,101,122,101,32,65,108,108,32,80,108,97,121,101,114,115), 290, false, function(s)
    _BLX_rUfipTLV.FreezeAll = s
end)

-- Character Size (Fixed to work properly and be visible to all)
AddLabel(_BLX_xjNuGRWs, string.char(1581,1580,1605,32,1575,1604,1588,1582,1589,1610,1577,58), 330)

local _BLX_pHCGPTya = AddSlider(_BLX_xjNuGRWs, string.char(67,104,97,114,97,99,116,101,114,32,83,105,122,101), 360, 0.1, 10, 1, function(v)
    _BLX_rUfipTLV.CharacterSize = v
    local _BLX_rPAogzWw = LocalPlayer.Character
    if _BLX_rPAogzWw then
        local _BLX_XACpKUYP = _BLX_rPAogzWw:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
        if _BLX_XACpKUYP then
            pcall(function()
                if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,68,101,112,116,104,83,99,97,108,101)) then
                    _BLX_XACpKUYP.BodyDepthScale.Value = v
                end
                if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,87,105,100,116,104,83,99,97,108,101)) then
                    _BLX_XACpKUYP.BodyWidthScale.Value = v
                end
                if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,72,101,105,103,104,116,83,99,97,108,101)) then
                    _BLX_XACpKUYP.BodyHeightScale.Value = v
                end
                if _BLX_XACpKUYP:FindFirstChild(string.char(72,101,97,100,83,99,97,108,101)) then
                    _BLX_XACpKUYP.HeadScale.Value = v
                end
            end)
        end
        for _, part in pairs(_BLX_rPAogzWw:GetDescendants()) do
            if part:IsA(string.char(66,97,115,101,80,97,114,116)) and part.Name ~= string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116) then
                pcall(function()
                    part.Size = part.Size * v / (_BLX_rUfipTLV.CharacterSize or 1)
                end)
            end
        end
    end
end)

-- Loop Bring All
AddToggle(_BLX_xjNuGRWs, string.char(65533,32,76,111,111,112,32,66,114,105,110,103,32,65,108,108), 400, false, function(s)
    _BLX_rUfipTLV.LoopBringAll = s
end)

AddLabel(_BLX_xjNuGRWs, string.char(1605,1593,1604,1608,1605,1575,1578,32,1575,1604,1605,1610,1586,1575,1578,58), 520)

local _BLX_VPsWwzwD = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_xjNuGRWs)
_BLX_VPsWwzwD.Size = UDim2.new(0, 440, 0, 120)
_BLX_VPsWwzwD.Position = UDim2.new(0, 10, 0, 560)
_BLX_VPsWwzwD.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
_BLX_VPsWwzwD.BorderSizePixel = 1
_BLX_VPsWwzwD.BorderColor3 = Color3.fromRGB(60, 60, 65)
_BLX_VPsWwzwD.TextColor3 = Color3.fromRGB(200, 200, 220)
_BLX_VPsWwzwD.Font = Enum.Font.Gotham
_BLX_VPsWwzwD.TextSize = 12
_BLX_VPsWwzwD.TextWrapped = true
_BLX_VPsWwzwD.TextYAlignment = Enum.TextYAlignment.Top
_BLX_VPsWwzwD.Text = [[🌈 Rainbow Mode: يغير ألوان الواجهة بشكل قوس قزح
⏰ Anti-AFK: يمنع الطرد من اللعبة
👓 X-Ray: رؤية من خلال الجدران
💰 Auto Farm: جمع العملات تلقائياً
⚔️ Kill Aura: هجوم تلقائي (تدريبي)]]

-- Rainbow Mode System
task.spawn(function()
    local _BLX_GMAWBihd = 0
    while true do
        task.wait(0.03)
        if _BLX_rUfipTLV.RainbowMode then
            _BLX_GMAWBihd = (_BLX_GMAWBihd + _BLX_rUfipTLV.RainbowSpeed) % 360
            local _BLX_ULDdCxje = Color3.fromHSV(_BLX_GMAWBihd / 360, 1, 1)
            
            _BLX_byZrWMRI.BackgroundColor3 = _BLX_ULDdCxje
            for _, tab in pairs({_BLX_GMeGwIgi, _BLX_bGbDYhfF, _BLX_ELifeMhC, _BLX_UWUqwstR, _BLX_mkzNlIEv, _BLX_mxPMzWbM}) do
                tab.BackgroundColor3 = _BLX_ULDdCxje
            end
        else
            _BLX_byZrWMRI.BackgroundColor3 = Color3.fromRGB(18,18,20)
            for _, tab in pairs({_BLX_GMeGwIgi, _BLX_bGbDYhfF, _BLX_ELifeMhC, _BLX_UWUqwstR, _BLX_mkzNlIEv, _BLX_mxPMzWbM}) do
                tab.BackgroundColor3 = Color3.fromRGB(40,40,42)
            end
        end
    end
end)

-- Anti-AFK System (Enhanced)
task.spawn(function()
    while true do
        task.wait(60)
        if _BLX_rUfipTLV.AntiAFK or _BLX_gBpJGzUX.AntiAFK then
            pcall(function()
                local _BLX_AKCbYkFs = game:GetService(string.char(95,66,76,88,95,65,75,67,98,89,107,70,115))
                _BLX_AKCbYkFs:CaptureController()
                _BLX_AKCbYkFs:ClickButton2(Vector2.new())
                _BLX_AKCbYkFs:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                _BLX_AKCbYkFs:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)

-- Auto Farm System
task.spawn(function()
    while true do
        task.wait(0.5)
        if _BLX_rUfipTLV.AutoFarm and LocalPlayer.Character then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find(string.char(99,111,105,110)) or obj.Name:lower():find(string.char(109,111,110,101,121)) or obj.Name:lower():find(string.char(99,97,115,104)) then
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                        local _BLX_iFPUYseT = (obj.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if _BLX_iFPUYseT < 50 then
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
        if _BLX_rUfipTLV.KillAura and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                -- 1. Target Players
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and isEnemy(player) then
                        local _BLX_kXTTIXcG = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                        local _BLX_QqsHlKub = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
                        if _BLX_kXTTIXcG and _BLX_QqsHlKub and _BLX_QqsHlKub.Health > 0 then
                            local _BLX_iFPUYseT = (_BLX_lBajZbZj.Position - _BLX_kXTTIXcG.Position).Magnitude
                            if _BLX_iFPUYseT < 20 then
                                -- Try multiple methods to damage
                                local _BLX_BoDnfwpv = LocalPlayer.Character:FindFirstChildOfClass(string.char(84,111,111,108))
                                if _BLX_BoDnfwpv then
                                    _BLX_BoDnfwpv:Activate()
                                    -- Fire Touch Interest on all enemy _BLX_mReVcVQX
                                    for _, part in pairs(player.Character:GetChildren()) do
                                        if part:IsA(string.char(66,97,115,101,80,97,114,116)) then
                                            firetouchinterest(part, _BLX_BoDnfwpv.Handle, 0)
                                            firetouchinterest(part, _BLX_BoDnfwpv.Handle, 1)
                                        end
                                    end
                                end
                                
                                -- Try remote _BLX_ASMmNXUn if they exist (common names)
                                pcall(function()
                                    local _BLX_ASMmNXUn = {workspace:FindFirstChild(string.char(82,101,109,111,116,101)), game.ReplicatedStorage:FindFirstChild(string.char(82,101,109,111,116,101))}
                                    for _, _BLX_XevnErqQ in pairs(_BLX_ASMmNXUn) do
                                        if _BLX_XevnErqQ then
                                            local _BLX_yfYJfEpZ = _BLX_XevnErqQ:FindFirstChild(string.char(65,116,116,97,99,107)) or _BLX_XevnErqQ:FindFirstChild(string.char(72,105,116))
                                            if _BLX_yfYJfEpZ and _BLX_yfYJfEpZ:IsA(string.char(82,101,109,111,116,101,69,118,101,110,116)) then
                                                _BLX_yfYJfEpZ:FireServer(player.Character)
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
                    if obj:IsA(string.char(72,117,109,97,110,111,105,100)) and obj.Parent ~= LocalPlayer.Character and not Players:GetPlayerFromCharacter(obj.Parent) then
                        local _BLX_tqvhGeqY = obj.Parent:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) or obj.Parent:FindFirstChild(string.char(72,101,97,100))
                        if _BLX_tqvhGeqY and obj.Health > 0 then
                            local _BLX_iFPUYseT = (_BLX_lBajZbZj.Position - _BLX_tqvhGeqY.Position).Magnitude
                            if _BLX_iFPUYseT < 20 then
                                local _BLX_BoDnfwpv = LocalPlayer.Character:FindFirstChildOfClass(string.char(84,111,111,108))
                                if _BLX_BoDnfwpv then
                                    _BLX_BoDnfwpv:Activate()
                                    if _BLX_BoDnfwpv:FindFirstChild(string.char(72,97,110,100,108,101)) then
                                        firetouchinterest(_BLX_tqvhGeqY, _BLX_BoDnfwpv.Handle, 0)
                                        firetouchinterest(_BLX_tqvhGeqY, _BLX_BoDnfwpv.Handle, 1)
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
_BLX_bbFEaggD:ClearAllChildren()
AddLabel(_BLX_bbFEaggD, string.char(55357,56960,32,73,78,78,79,86,65,84,73,86,69,32,45,32,1605,1610,1586,1575,1578,32,1605,1576,1578,1603,1585,1577), 8)

AddToggle(_BLX_bbFEaggD, string.char(55357,56443,32,71,104,111,115,116,32,77,111,100,101), 40, false, function(s) _BLX_LQYRjBBf.GhostMode = s end)
AddToggle(_BLX_bbFEaggD, string.char(10024,32,84,101,108,101,112,111,114,116,32,84,114,97,105,108), 80, false, function(s) _BLX_LQYRjBBf.TeleportTrail = s end)
AddToggle(_BLX_bbFEaggD, string.char(55357,57057,65039,32,65,117,116,111,32,68,111,100,103,101), 120, false, function(s) _BLX_LQYRjBBf.AutoDodge = s end)
AddToggle(_BLX_bbFEaggD, string.char(55357,56629,32,83,104,105,101,108,100,32,66,117,98,98,108,101), 160, false, function(s) _BLX_LQYRjBBf.ShieldBubble = s end)
AddToggle(_BLX_bbFEaggD, string.char(55357,56488,32,83,112,101,101,100,32,76,105,110,101,115), 200, false, function(s) _BLX_LQYRjBBf.SpeedLines = s end)
AddToggle(_BLX_bbFEaggD, string.char(11014,65039,32,68,111,117,98,108,101,32,74,117,109,112), 240, false, function(s) _BLX_LQYRjBBf.DoubleJump = s end)
AddToggle(_BLX_bbFEaggD, string.char(55358,56791,32,87,97,108,108,32,82,117,110), 280, false, function(s) _BLX_LQYRjBBf.WallRun = s end)
AddToggle(_BLX_bbFEaggD, string.char(55357,56491,32,65,105,114,32,68,97,115,104,32,40,81,41), 320, false, function(s) _BLX_LQYRjBBf.AirDash = s end)
AddToggle(_BLX_bbFEaggD, string.char(55358,56818,32,77,97,103,110,101,116,32,77,111,100,101), 360, false, function(s) _BLX_LQYRjBBf.MagnetMode = s end)
AddToggle(_BLX_bbFEaggD, string.char(9201,65039,32,84,105,109,101,32,83,108,111,119), 400, false, function(s) _BLX_LQYRjBBf.TimeManipulation = s end)

--========================================================--
--===============  CLASSIC FEATURES TAB =================--
_BLX_vYBPDdRD:ClearAllChildren()
AddLabel(_BLX_vYBPDdRD, string.char(55356,57262,32,67,76,65,83,83,73,67,32,45,32,1605,1610,1586,1575,1578,32,1603,1604,1575,1587,1610,1603,1610,1577), 8)

AddToggle(_BLX_vYBPDdRD, string.char(9854,65039,32,73,110,102,105,110,105,116,101,32,74,117,109,112), 40, false, function(s) _BLX_MWmFXkxx.InfiniteJump = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55357,57057,65039,32,71,111,100,32,77,111,100,101), 80, false, function(s)
    _BLX_MWmFXkxx.GodMode = s
    if s then
        if LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR then
                _BLX_PmRmVbmR.Health = _BLX_PmRmVbmR.MaxHealth
                if _BLX_zYwMtmHS then _BLX_zYwMtmHS:Disconnect() end
                _BLX_zYwMtmHS = _BLX_PmRmVbmR.HealthChanged:Connect(function(health)
                    if _BLX_MWmFXkxx.GodMode and health < _BLX_PmRmVbmR.MaxHealth then
                        task.wait()
                        _BLX_PmRmVbmR.Health = _BLX_PmRmVbmR.MaxHealth
                    end
                end)
            end
        end
    else
        if _BLX_zYwMtmHS then
            _BLX_zYwMtmHS:Disconnect()
            _BLX_zYwMtmHS = nil
        end
    end
end)
AddToggle(_BLX_vYBPDdRD, string.char(55356,57131,65039,32,82,101,109,111,118,101,32,70,111,103), 120, false, function(s)
    _BLX_MWmFXkxx.RemoveFog = s
    _BLX_MVwXMEBC.FogEnd = s and 100000 or 9999
end)
AddToggle(_BLX_vYBPDdRD, string.char(55357,56481,32,70,117,108,108,98,114,105,103,104,116), 160, false, function(s)
    _BLX_MWmFXkxx.Fullbright = s
    if s then
        _BLX_MVwXMEBC.Brightness = 2
        _BLX_MVwXMEBC.ClockTime = 14
        _BLX_MVwXMEBC.GlobalShadows = false
        _BLX_MVwXMEBC.OutdoorAmbient = Color3.new(1, 1, 1)
    else
        _BLX_MVwXMEBC.Brightness = 1
        _BLX_MVwXMEBC.GlobalShadows = true
    end
end)
AddToggle(_BLX_vYBPDdRD, string.char(55357,56753,65039,32,67,108,105,99,107,32,84,80), 200, false, function(s) _BLX_MWmFXkxx.ClickTP = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55356,57088,32,83,112,105,110,32,66,111,116), 240, false, function(s) _BLX_MWmFXkxx.SpinBot = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55357,56368,32,66,117,110,110,121,104,111,112), 280, false, function(s) _BLX_MWmFXkxx.Bunnyhop = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55356,57283,32,65,117,116,111,32,83,112,114,105,110,116), 320, false, function(s) _BLX_MWmFXkxx.AutoSprint = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55358,56962,32,78,111,32,70,97,108,108,32,68,97,109,97,103,101), 360, false, function(s) _BLX_MWmFXkxx.NoFall = s end)
AddToggle(_BLX_vYBPDdRD, string.char(55358,56988,32,70,97,115,116,32,76,97,100,100,101,114), 400, false, function(s) _BLX_MWmFXkxx.FastLadder = s end)

--========================================================--
--===============  VISUAL FEATURES TAB ==================--
_BLX_KXztGTTa:ClearAllChildren()
AddLabel(_BLX_KXztGTTa, string.char(55357,56385,65039,32,86,73,83,85,65,76,32,45,32,1605,1610,1586,1575,1578,32,1576,1589,1585,1610,1577), 8)

AddToggle(_BLX_KXztGTTa, string.char(55356,57290,32,70,97,115,116,32,83,119,105,109), 40, false, function(s) _BLX_MWmFXkxx.SwimSpeed = s end)
AddToggle(_BLX_KXztGTTa, string.char(9889,32,73,110,115,116,97,110,116,32,82,101,115,112,97,119,110), 80, false, function(s) _BLX_MWmFXkxx.InstantRespawn = s end)
AddToggle(_BLX_KXztGTTa, string.char(55357,56567,32,70,114,101,101,32,67,97,109), 120, false, function(s) _BLX_MWmFXkxx.FreeCam = s end)
AddToggle(_BLX_KXztGTTa, string.char(55357,56420,32,84,104,105,114,100,32,80,101,114,115,111,110), 160, false, function(s)
    _BLX_MWmFXkxx.ThirdPerson = s
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
        if _BLX_LQYRjBBf.GhostMode and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA(string.char(66,97,115,101,80,97,114,116)) then
                    part.Transparency = 0.5
                    part.CanCollide = false
                end
            end
        end
    end
end)

local _BLX_zfNDvIuu = {}
task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_LQYRjBBf.TeleportTrail and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                local _BLX_kUPjEMDf = Instance.new(string.char(80,97,114,116))
                _BLX_kUPjEMDf.Size = Vector3.new(2, 2, 2)
                _BLX_kUPjEMDf.Position = _BLX_lBajZbZj.Position
                _BLX_kUPjEMDf.Anchored = true
                _BLX_kUPjEMDf.CanCollide = false
                _BLX_kUPjEMDf.Material = Enum.Material.Neon
                _BLX_kUPjEMDf.Color = Color3.fromRGB(0, 255, 255)
                _BLX_kUPjEMDf.Transparency = 0.5
                _BLX_kUPjEMDf.Parent = workspace
                task.delay(2, function() _BLX_kUPjEMDf:Destroy() end)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if _BLX_LQYRjBBf.AutoDodge and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and (obj.Name:lower():find(string.char(112,114,111,106,101,99,116,105,108,101)) or obj.Name:lower():find(string.char(98,117,108,108,101,116))) then
                        if (obj.Position - _BLX_lBajZbZj.Position).Magnitude < 20 then
                            _BLX_lBajZbZj.CFrame = _BLX_lBajZbZj.CFrame + (_BLX_lBajZbZj.Position - obj.Position).Unit * 5
                        end
                    end
                end
            end
        end
    end
end)

local _BLX_YXqVPpFO = nil
task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_LQYRjBBf.ShieldBubble and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj and not _BLX_YXqVPpFO then
                _BLX_YXqVPpFO = Instance.new(string.char(80,97,114,116))
                _BLX_YXqVPpFO.Shape = Enum.PartType.Ball
                _BLX_YXqVPpFO.Size = Vector3.new(10, 10, 10)
                _BLX_YXqVPpFO.Transparency = 0.7
                _BLX_YXqVPpFO.Material = Enum.Material.ForceField
                _BLX_YXqVPpFO.Color = Color3.fromRGB(0, 150, 255)
                _BLX_YXqVPpFO.CanCollide = false
                _BLX_YXqVPpFO.Anchored = true
                _BLX_YXqVPpFO.Parent = workspace
            end
            if _BLX_YXqVPpFO and _BLX_lBajZbZj then _BLX_YXqVPpFO.Position = _BLX_lBajZbZj.Position end
        elseif _BLX_YXqVPpFO then
            _BLX_YXqVPpFO:Destroy()
            _BLX_YXqVPpFO = nil
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if _BLX_LQYRjBBf.SpeedLines and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj and _BLX_lBajZbZj.Velocity.Magnitude > 20 then
                local _BLX_TVRKnbmc = Instance.new(string.char(80,97,114,116))
                _BLX_TVRKnbmc.Size = Vector3.new(0.5, 0.5, 3)
                _BLX_TVRKnbmc.Position = _BLX_lBajZbZj.Position + Vector3.new(math.random(-5, 5), math.random(-2, 2), math.random(-5, 5))
                _BLX_TVRKnbmc.Anchored = true
                _BLX_TVRKnbmc.CanCollide = false
                _BLX_TVRKnbmc.Material = Enum.Material.Neon
                _BLX_TVRKnbmc.Color = Color3.fromRGB(255, 255, 0)
                _BLX_TVRKnbmc.Transparency = 0.3
                _BLX_TVRKnbmc.Parent = workspace
                task.delay(0.5, function() _BLX_TVRKnbmc:Destroy() end)
            end
        end
    end
end)

local _BLX_IXrghWfa = false
_BLX_cXkduGQT.JumpRequest:Connect(function()
    if _BLX_LQYRjBBf.DoubleJump and LocalPlayer.Character then
        local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
        if _BLX_PmRmVbmR and _BLX_PmRmVbmR:GetState() == Enum.HumanoidStateType.Freefall and not _BLX_IXrghWfa then
            _BLX_IXrghWfa = true
            _BLX_PmRmVbmR:ChangeState(Enum.HumanoidStateType.Jumping)
            task.delay(0.3, function() _BLX_IXrghWfa = false end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if _BLX_LQYRjBBf.WallRun and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_lBajZbZj and _BLX_PmRmVbmR and _BLX_PmRmVbmR:GetState() == Enum.HumanoidStateType.Freefall then
                local _BLX_hCSBBJNj = Ray.new(_BLX_lBajZbZj.Position, _BLX_lBajZbZj.CFrame.RightVector * 3)
                local _BLX_lYklyvqm = workspace:FindPartOnRay(_BLX_hCSBBJNj, LocalPlayer.Character)
                if _BLX_lYklyvqm then _BLX_lBajZbZj.Velocity = Vector3.new(_BLX_lBajZbZj.Velocity.X, 20, _BLX_lBajZbZj.Velocity.Z) end
            end
        end
    end
end)

local _BLX_hMxMBxAO = false
_BLX_cXkduGQT.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Q and _BLX_LQYRjBBf.AirDash and not _BLX_hMxMBxAO and LocalPlayer.Character then
        local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
        if _BLX_lBajZbZj then
            _BLX_hMxMBxAO = true
            _BLX_lBajZbZj.Velocity = _BLX_lBajZbZj.CFrame.LookVector * 100
            task.delay(1, function() _BLX_hMxMBxAO = false end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.3)
        if _BLX_LQYRjBBf.MagnetMode and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and (obj.Name:lower():find(string.char(99,111,105,110)) or obj.Name:lower():find(string.char(103,101,109)) or obj.Name:lower():find(string.char(112,105,99,107,117,112))) then
                        if (obj.Position - _BLX_lBajZbZj.Position).Magnitude < 30 then
                            obj.CFrame = CFrame.new(_BLX_lBajZbZj.Position)
                        end
                    end
                end
            end
        end
    end
end)

--========================================================--
--============  CLASSIC FEATURES SYSTEMS ================--
_BLX_cXkduGQT.JumpRequest:Connect(function()
    if _BLX_MWmFXkxx.InfiniteJump and LocalPlayer.Character then
        local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
        if _BLX_PmRmVbmR then _BLX_PmRmVbmR:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.GodMode and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR then _BLX_PmRmVbmR.Health = _BLX_PmRmVbmR.MaxHealth end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(_BLX_rPAogzWw)
    if _BLX_MWmFXkxx.GodMode then
        task.wait(1)
        local _BLX_PmRmVbmR = _BLX_rPAogzWw:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
        if _BLX_PmRmVbmR then
            _BLX_PmRmVbmR.Health = _BLX_PmRmVbmR.MaxHealth
            if _BLX_zYwMtmHS then _BLX_zYwMtmHS:Disconnect() end
            _BLX_zYwMtmHS = _BLX_PmRmVbmR.HealthChanged:Connect(function(health)
                if _BLX_MWmFXkxx.GodMode and health < _BLX_PmRmVbmR.MaxHealth then
                    task.wait()
                    _BLX_PmRmVbmR.Health = _BLX_PmRmVbmR.MaxHealth
                end
            end)
        end
    end
end)

local _BLX_zrNGfqaf = LocalPlayer:GetMouse()
_BLX_zrNGfqaf.Button1Down:Connect(function()
    if _BLX_MWmFXkxx.ClickTP and LocalPlayer.Character then
        local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
        if _BLX_lBajZbZj and _BLX_zrNGfqaf.Target then
            _BLX_lBajZbZj.CFrame = CFrame.new(_BLX_zrNGfqaf.Hit.Position + Vector3.new(0, 3, 0))
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.03)
        if _BLX_MWmFXkxx.SpinBot and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then _BLX_lBajZbZj.CFrame = _BLX_lBajZbZj.CFrame * CFrame.Angles(0, math.rad(300), 0) end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.Bunnyhop and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR and _BLX_PmRmVbmR.MoveDirection.Magnitude > 0 then
                _BLX_PmRmVbmR:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.AutoSprint and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR then _BLX_PmRmVbmR.WalkSpeed = 32 end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.NoFall and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR then
                _BLX_PmRmVbmR:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                _BLX_PmRmVbmR:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.FastLadder and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR and _BLX_PmRmVbmR:GetState() == Enum.HumanoidStateType.Climbing then
                _BLX_PmRmVbmR.ClimbSpeed = 50
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_MWmFXkxx.SwimSpeed and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR and _BLX_PmRmVbmR:GetState() == Enum.HumanoidStateType.Swimming then
                _BLX_PmRmVbmR.WalkSpeed = 100
            end
        end
    end
end)

--========================================================--
--============  FREEZE ALL PLAYERS SYSTEM ===============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_rUfipTLV.FreezeAll then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local _BLX_lBajZbZj = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    if _BLX_lBajZbZj then
                        _BLX_lBajZbZj.Anchored = true
                    end
                end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local _BLX_lBajZbZj = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    if _BLX_lBajZbZj then
                        _BLX_lBajZbZj.Anchored = false
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
        if _BLX_rUfipTLV.LoopBringAll and LocalPlayer.Character then
            local _BLX_MSahkfuG = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_MSahkfuG then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local _BLX_lBajZbZj = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                        if _BLX_lBajZbZj then
                            _BLX_lBajZbZj.CFrame = _BLX_MSahkfuG.CFrame + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
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
        if _BLX_rUfipTLV.CharacterSize ~= 1 and LocalPlayer.Character then
            local _BLX_XACpKUYP = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_XACpKUYP then
                pcall(function()
                    if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,68,101,112,116,104,83,99,97,108,101)) then
                        _BLX_XACpKUYP.BodyDepthScale.Value = _BLX_rUfipTLV.CharacterSize
                    end
                    if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,87,105,100,116,104,83,99,97,108,101)) then
                        _BLX_XACpKUYP.BodyWidthScale.Value = _BLX_rUfipTLV.CharacterSize
                    end
                    if _BLX_XACpKUYP:FindFirstChild(string.char(66,111,100,121,72,101,105,103,104,116,83,99,97,108,101)) then
                        _BLX_XACpKUYP.BodyHeightScale.Value = _BLX_rUfipTLV.CharacterSize
                    end
                    if _BLX_XACpKUYP:FindFirstChild(string.char(72,101,97,100,83,99,97,108,101)) then
                        _BLX_XACpKUYP.HeadScale.Value = _BLX_rUfipTLV.CharacterSize
                    end
                end)
            end
        end
    end
end)

--========================================================--
--==================  COMBAT TAB (13 Features) ==========--
_BLX_KiURiXRJ:ClearAllChildren()
AddLabel(_BLX_KiURiXRJ, string.char(32,67,79,77,66,65,84,32,70,69,65,84,85,82,69,83,32,45,32,1605,1610,1586,1575,1578,32,1575,1604,1602,1578,1575,1604), 8)

AddToggle(_BLX_KiURiXRJ, string.char(32,65,117,116,111,32,80,97,114,114,121), 40, false, function(s) _BLX_lndkrXnm.AutoParry = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,65,117,116,111,32,66,108,111,99,107), 80, false, function(s) _BLX_lndkrXnm.AutoBlock = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,67,111,109,98,111,32,65,116,116,97,99,107), 120, false, function(s) _BLX_lndkrXnm.ComboAttack = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,67,114,105,116,105,99,97,108,32,72,105,116), 160, false, function(s) _BLX_lndkrXnm.CriticalHit = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,76,105,102,101,32,83,116,101,97,108), 200, false, function(s) _BLX_lndkrXnm.LifeSteal = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,75,110,111,99,107,98,97,99,107,32,66,111,111,115,116), 240, false, function(s) _BLX_lndkrXnm.Knockback = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,82,97,112,105,100,32,70,105,114,101), 280, false, function(s) _BLX_lndkrXnm.RapidFire = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,73,110,102,105,110,105,116,101,32,65,109,109,111), 320, false, function(s) _BLX_lndkrXnm.InfiniteAmmo = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,78,111,32,82,101,99,111,105,108), 360, false, function(s) _BLX_lndkrXnm.NoRecoil = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,65,117,116,111,32,82,101,108,111,97,100), 400, false, function(s) _BLX_lndkrXnm.AutoReload = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,69,120,112,108,111,115,105,118,101,32,66,117,108,108,101,116,115), 440, false, function(s) _BLX_lndkrXnm.ExplosiveBullets = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,65,105,109,108,111,99,107), 480, false, function(s) _BLX_lndkrXnm.Aimlock = s end)
AddToggle(_BLX_KiURiXRJ, string.char(32,83,105,108,101,110,116,32,65,105,109), 520, false, function(s) _BLX_lndkrXnm.SilentAim = s end)

--========================================================--
--==================  UTILITY TAB (12 Features) ==========--
_BLX_iDEEtqvw:ClearAllChildren()
AddLabel(_BLX_iDEEtqvw, string.char(32,85,84,73,76,73,84,89,32,70,69,65,84,85,82,69,83,32,45,32,1605,1610,1586,1575,1578,32,1575,1604,1571,1583,1608,1575,1578), 8)

AddToggle(_BLX_iDEEtqvw, string.char(32,69,83,80,32,73,116,101,109,115), 40, false, function(s) _BLX_gBpJGzUX.ESPItems = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,69,83,80,32,67,104,101,115,116,115), 80, false, function(s) _BLX_gBpJGzUX.ESPChests = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,65,117,116,111,32,67,111,108,108,101,99,116), 120, false, function(s) _BLX_gBpJGzUX.AutoCollect = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,65,117,116,111,32,81,117,101,115,116), 160, false, function(s) _BLX_gBpJGzUX.AutoQuest = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,65,117,116,111,32,83,101,108,108), 200, false, function(s) _BLX_gBpJGzUX.AutoSell = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,65,117,116,111,32,67,114,97,102,116), 240, false, function(s) _BLX_gBpJGzUX.AutoCraft = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,84,80,32,116,111,32,78,80,67), 280, false, function(s) _BLX_gBpJGzUX.TeleportToNPC = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,83,112,101,101,100,32,72,97,99,107), 320, false, function(s) _BLX_gBpJGzUX.SpeedHack = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,78,111,67,108,105,112,32,87,97,108,108,115), 360, false, function(s) _BLX_gBpJGzUX.NoClipWalls = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,73,110,102,105,110,105,116,101,32,90,111,111,109), 400, false, function(s) _BLX_gBpJGzUX.InfiniteZoom = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,88,45,82,97,121,32,86,105,115,105,111,110), 440, false, function(s) _BLX_gBpJGzUX.Xray = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,82,97,100,97,114), 480, false, function(s) _BLX_gBpJGzUX.Radar = s end)
AddToggle(_BLX_iDEEtqvw, string.char(32,55357,57057,65039,32,65,110,116,105,45,65,70,75), 520, false, function(s) _BLX_gBpJGzUX.AntiAFK = s end)
AddButton(_BLX_iDEEtqvw, string.char(32,55357,56580,32,83,101,114,118,101,114,32,72,111,112,112,101,114), 560, function()
    local _BLX_GXvmXdQd = game:GetService(string.char(95,66,76,88,95,116,90,71,102,122,82,117,115))
    local _BLX_FWTTjKvM = game:GetService(string.char(95,66,76,88,95,99,113,75,86,82,100,83,112))
    local _BLX_FijzniGg = string.char(104,116,116,112,115,58,47,47,103,97,109,101,115,46,114,111,98,108,111,120,46,99,111,109,47,118,49,47,103,97,109,101,115,47) .. game.PlaceId .. string.char(47,95,66,76,88,95,103,90,70,79,90,107,90,104,47,80,117,98,108,105,99,63,115,111,114,116,79,114,100,101,114,61,68,101,115,99,38,108,105,109,105,116,61,49,48,48)
    local _success, result = pcall(function() return _BLX_GXvmXdQd:JSONDecode(game:HttpGetAsync(_BLX_FijzniGg)) end)
    if _success then
        for _, s in pairs(result.data) do
            if s.playing < s.maxPlayers and s._BLX_YSislNZr ~= game.JobId then
                _BLX_FWTTjKvM:TeleportToPlaceInstance(game.PlaceId, s._BLX_YSislNZr, LocalPlayer)
                break
            end
        end
    end
end)
AddButton(_BLX_iDEEtqvw, string.char(32,55357,57002,32,82,101,106,111,105,110,32,83,101,114,118,101,114), 600, function()
    game:GetService(string.char(95,66,76,88,95,99,113,75,86,82,100,83,112)):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

AddToggle(_BLX_iDEEtqvw, string.char(32,55356,57100,32,65,110,116,105,45,86,111,105,100), 640, false, function(s) _BLX_gBpJGzUX.AntiVoid = s end)
AddButton(_BLX_iDEEtqvw, string.char(32,55357,56960,32,70,80,83,32,66,111,111,115,116,101,114), 680, function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA(string.char(66,97,115,101,80,97,114,116)) and not v:IsA(string.char(77,101,115,104,80,97,114,116)) then
            v.Material = Enum.Material.SmoothPlastic
        end
        if v:IsA(string.char(68,101,99,97,108)) or v:IsA(string.char(84,101,120,116,117,114,101)) then
            v:Destroy()
        end
    end
    showNotification(string.char(66,108,111,111,100,105,120), string.char(70,80,83,32,66,111,111,115,116,32,65,112,112,108,105,101,100,33,32,84,101,120,116,117,114,101,115,32,114,101,109,111,118,101,100,46), 3)
end)

--========================================================--
--==================  REAL HACKS TAB  ====================--
_BLX_WkGDqNKG:ClearAllChildren()
AddLabel(_BLX_WkGDqNKG, string.char(55357,56462,32,82,69,65,76,32,72,65,67,75,83,32,45,32,1605,1610,1586,1575,1578,32,1581,1602,1610,1602,1610,1577,32,1605,1578,1591,1608,1585,1577), 8)

AddToggle(_BLX_WkGDqNKG, string.char(55357,56496,32,82,101,97,108,32,65,117,116,111,45,70,97,114,109,32,40,84,80,41), 40, false, function(s) _BLX_gBpJGzUX.TeleportCollect = s end)
AddToggle(_BLX_WkGDqNKG, string.char(55357,56550,32,65,117,116,111,32,80,114,111,120,105,109,105,116,121,32,80,114,111,109,112,116), 80, false, function(s) _BLX_gBpJGzUX.AutoProximity = s end)
AddToggle(_BLX_WkGDqNKG, string.char(10024,32,82,101,97,108,32,65,117,116,111,32,67,111,108,108,101,99,116), 120, false, function(s) _BLX_gBpJGzUX.AutoCollect = s end)

AddLabel(_BLX_WkGDqNKG, string.char(55357,57037,65039,32,82,79,66,85,88,32,73,84,69,77,83,32,45,32,1571,1594,1585,1575,1590,32,1585,1608,1576,1608,1603,1587,32,40,1605,1581,1604,1610,41), 160)
AddTextBox(_BLX_WkGDqNKG, string.char(65,115,115,101,116,32,73,68,58), 190, "0", function(v) _BLX_gBpJGzUX.WearID = tonumber(v) or 0 end)
AddButton(_BLX_WkGDqNKG, string.char(55357,56405,32,87,101,97,114,32,73,116,101,109,32,78,111,119), 230, function()
    if _BLX_gBpJGzUX.WearID > 0 then
        local _BLX_YSislNZr = _BLX_gBpJGzUX.WearID
        pcall(function()
            local _BLX_aaKkCjzj = game:GetObjects(string.char(114,98,120,97,115,115,101,116,105,100,58,47,47) .. _BLX_YSislNZr)[1]
            if _BLX_aaKkCjzj then
                _BLX_aaKkCjzj.Parent = LocalPlayer.Character
            end
        end)
        showNotification(string.char(73,116,101,109,32,65,112,112,108,105,101,100), string.char(87,101,97,114,105,110,103,32,95,66,76,88,95,97,97,75,107,67,106,122,106,32,73,68,58,32) .. _BLX_YSislNZr, 3)
    end
end)

AddLabel(_BLX_WkGDqNKG, string.char(55357,56504,32,87,69,65,76,84,72,32,83,73,77,85,76,65,84,79,82,32,45,32,1605,1581,1575,1603,1610,32,1575,1604,1579,1585,1575,1569,32,40,1608,1607,1605,1610,41), 280)
AddSlider(_BLX_WkGDqNKG, string.char(70,97,107,101,32,77,111,110,101,121,32,65,109,111,117,110,116), 310, 0, 1000000, 1000, function(v)
    -- This is educational: explaining that client-side changes are visual
    _BLX_gBpJGzUX.FakeMoneyValue = v
    showNotification(string.char(86,105,115,117,97,108,32,85,112,100,97,116,101), string.char(67,108,105,101,110,116,45,115,105,100,101,32,109,111,110,101,121,32,115,101,116,32,116,111,58,32) .. v, 2)
end)

task.spawn(function()
    while true do
        task.wait(1)
        if _BLX_gBpJGzUX.FakeMoneyValue and _BLX_gBpJGzUX.FakeMoneyValue > 0 then
            pcall(function()
                for _, label in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if label:IsA(string.char(84,101,120,116,76,97,98,101,108)) and (label.Text:find("$") or label.Name:lower():find(string.char(109,111,110,101,121)) or label.Name:lower():find(string.char(99,97,115,104))) then
                        label.Text = "$" .. tostring(math.floor(_BLX_gBpJGzUX.FakeMoneyValue))
                    end
                end
            end)
        end
    end
end)

--========================================================--
--==================  TROLL TAB (13 Features) ============--
_BLX_rFIcEpgN:ClearAllChildren()
AddLabel(_BLX_rFIcEpgN, string.char(32,84,82,79,76,76,32,70,69,65,84,85,82,69,83,32,45,32,1605,1610,1586,1575,1578,32,1575,1604,1605,1602,1575,1604,1576), 8)

AddToggle(_BLX_rFIcEpgN, string.char(32,70,108,105,110,103,32,80,108,97,121,101,114,115), 40, false, function(s) _BLX_EcTPbsnU.FlingPlayers = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,79,114,98,105,116,32,80,108,97,121,101,114,115), 80, false, function(s) _BLX_EcTPbsnU.OrbitPlayers = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,65,116,116,97,99,104,32,116,111,32,80,108,97,121,101,114), 120, false, function(s) _BLX_EcTPbsnU.AttachToPlayer = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,77,105,114,114,111,114,32,80,108,97,121,101,114), 160, false, function(s) _BLX_EcTPbsnU.MirrorPlayer = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,73,110,118,105,115,105,98,108,101,32,67,104,97,114), 200, false, function(s) _BLX_EcTPbsnU.InvisibleChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,71,105,97,110,116,32,67,104,97,114,97,99,116,101,114), 240, false, function(s) _BLX_EcTPbsnU.GiantChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,84,105,110,121,32,67,104,97,114,97,99,116,101,114), 280, false, function(s) _BLX_EcTPbsnU.TinyChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,82,97,105,110,98,111,119,32,67,104,97,114), 320, false, function(s) _BLX_EcTPbsnU.RainbowChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,83,112,105,110,32,67,104,97,114,97,99,116,101,114), 360, false, function(s) _BLX_EcTPbsnU.SpinChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,86,105,98,114,97,116,101,32,67,104,97,114), 400, false, function(s) _BLX_EcTPbsnU.VibrateChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,70,108,97,115,104,32,67,104,97,114,97,99,116,101,114), 440, false, function(s) _BLX_EcTPbsnU.FlashChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,71,108,105,116,99,104,32,69,102,102,101,99,116), 480, false, function(s) _BLX_EcTPbsnU.GlitchChar = s end)
AddToggle(_BLX_rFIcEpgN, string.char(32,67,108,111,110,101,32,67,104,97,114,97,99,116,101,114), 520, false, function(s) _BLX_EcTPbsnU.CloneChar = s end)

--========================================================--
--============  COMBAT FEATURES SYSTEMS =================--
task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_lndkrXnm.AutoParry and LocalPlayer.Character then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local _BLX_BoDnfwpv = player.Character:FindFirstChildOfClass(string.char(84,111,111,108))
                    if _BLX_BoDnfwpv and _BLX_BoDnfwpv:FindFirstChild(string.char(72,97,110,100,108,101)) then
                        local _BLX_mVzvNymX = LocalPlayer.Character
                        if _BLX_mVzvNymX and _BLX_mVzvNymX:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
                            local _BLX_iFPUYseT = (_BLX_mVzvNymX.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if _BLX_iFPUYseT < 10 then
                                local _BLX_NUxycgof = _BLX_mVzvNymX:FindFirstChildOfClass(string.char(84,111,111,108))
                                if _BLX_NUxycgof then _BLX_NUxycgof:Activate() end
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
        if _BLX_lndkrXnm.RapidFire and LocalPlayer.Character then
            local _BLX_BoDnfwpv = LocalPlayer.Character:FindFirstChildOfClass(string.char(84,111,111,108))
            if _BLX_BoDnfwpv then _BLX_BoDnfwpv:Activate() end
        end
    end
end)

--========================================================--
--============  MOVEMENT FEATURES SYSTEMS ===============--
task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_APrpGfYS.SuperSpeed and LocalPlayer.Character then
            local _BLX_PmRmVbmR = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
            if _BLX_PmRmVbmR then _BLX_PmRmVbmR.WalkSpeed = _BLX_APrpGfYS.SpeedValue end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_APrpGfYS.WaterWalk and LocalPlayer.Character then
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA(string.char(66,97,115,101,80,97,114,116)) and part.Name == string.char(87,97,116,101,114) then
                    part.CanCollide = true
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_APrpGfYS.AntiGravity and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                local _BLX_mcYQUqLV = _BLX_lBajZbZj:FindFirstChild(string.char(65,110,116,105,71,114,97,118,66,71)) or Instance.new(string.char(66,111,100,121,86,101,108,111,99,105,116,121), _BLX_lBajZbZj)
                _BLX_mcYQUqLV.Name = string.char(65,110,116,105,71,114,97,118,66,71)
                _BLX_mcYQUqLV.Velocity = Vector3.new(0, 50, 0)
                _BLX_mcYQUqLV.MaxForce = Vector3.new(0, 4000, 0)
            end
        else
            if LocalPlayer.Character then
                local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                if _BLX_lBajZbZj and _BLX_lBajZbZj:FindFirstChild(string.char(65,110,116,105,71,114,97,118,66,71)) then
                    _BLX_lBajZbZj.AntiGravBG:Destroy()
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
        if _BLX_gBpJGzUX.AutoCollect and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and (obj.Name:lower():find(string.char(99,111,105,110)) or obj.Name:lower():find(string.char(103,101,109)) or obj.Name:lower():find(string.char(111,114,98))) then
                        if (obj.Position - _BLX_lBajZbZj.Position).Magnitude < 50 then
                            obj.CFrame = _BLX_lBajZbZj.CFrame
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
        if _BLX_gBpJGzUX.InfiniteZoom then
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
        if _BLX_EcTPbsnU.FlingPlayers and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                -- Store original CFrame
                local _BLX_CNQhUTPg = _BLX_lBajZbZj.CFrame
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local _BLX_kXTTIXcG = player.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                        if _BLX_kXTTIXcG then
                            local _BLX_CWkRoFlO = (_BLX_lBajZbZj.Position - _BLX_kXTTIXcG.Position).Magnitude
                            if _BLX_CWkRoFlO < 15 then
                                -- Powerful Fling Method
                                _BLX_lBajZbZj.CFrame = _BLX_kXTTIXcG.CFrame
                                _BLX_lBajZbZj.Velocity = Vector3.new(999999, 999999, 999999)
                                _BLX_lBajZbZj.RotVelocity = Vector3.new(999999, 999999, 999999)
                                task.wait(0.1)
                            end
                        end
                    end
                end
                
                -- Reset if no _BLX_YzIHWHGa or toggle off
                if not _BLX_EcTPbsnU.FlingPlayers then
                    _BLX_lBajZbZj.Velocity = Vector3.new(0, 0, 0)
                    _BLX_lBajZbZj.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_EcTPbsnU.InvisibleChar and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA(string.char(66,97,115,101,80,97,114,116)) or part:IsA(string.char(68,101,99,97,108)) then
                    part.Transparency = 1
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.03)
        if _BLX_EcTPbsnU.RainbowChar and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA(string.char(66,97,115,101,80,97,114,116)) then
                    part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        if _BLX_EcTPbsnU.VibrateChar and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                _BLX_lBajZbZj.CFrame = _BLX_lBajZbZj.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _BLX_EcTPbsnU.CloneChar and LocalPlayer.Character then
            local _BLX_OezYfbct = LocalPlayer.Character:Clone()
            _BLX_OezYfbct.Parent = workspace
            _BLX_OezYfbct:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(5, 0, 0))
            task.delay(5, function() _BLX_OezYfbct:Destroy() end)
            task.wait(2)
        end
    end
end)

local function GetPlayerByPartialName(_BLX_hrNGvXbu)
    if not _BLX_hrNGvXbu or _BLX_hrNGvXbu == "" then return nil end
    _BLX_hrNGvXbu = _BLX_hrNGvXbu:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player.Name:lower():find(_BLX_hrNGvXbu) or (player.DisplayName and player.DisplayName:lower():find(_BLX_hrNGvXbu)) then
                return player
            end
        end
    end
    return nil
end

task.spawn(function()
    local _BLX_hCACMlhl = game:GetService(string.char(95,66,76,88,95,104,67,65,67,77,108,104,108))
    
    _BLX_hCACMlhl.Heartbeat:Connect(function()
        -- Carry Logic
        if _BLX_EcTPbsnU.CarryPlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_MSahkfuG = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    
                    if _BLX_OswbGhVE and _BLX_MSahkfuG then
                        _BLX_OswbGhVE.CFrame = _BLX_MSahkfuG.CFrame * CFrame.new(0, 0, -3)
                        _BLX_OswbGhVE.Velocity = Vector3.new(0, 0, 0)
                        
                        -- Force _BLX_YzIHWHGa to stay in place if possible (Client-side simulation)
                        for _, part in pairs(_BLX_YzIHWHGa.Character:GetChildren()) do
                            if part:IsA(string.char(66,97,115,101,80,97,114,116)) then
                                part.Velocity = Vector3.new(0,0,0)
                                part.RotVelocity = Vector3.new(0,0,0)
                            end
                        end
                    end
                end
            end)
        end
        
        -- Ride Logic
        if _BLX_EcTPbsnU.RidePlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_MSahkfuG = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    
                    if _BLX_OswbGhVE and _BLX_MSahkfuG then
                        _BLX_MSahkfuG.CFrame = _BLX_OswbGhVE.CFrame * CFrame.new(0, 3, 0)
                        _BLX_MSahkfuG.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Attach Logic
        if _BLX_EcTPbsnU.AttachPlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_MSahkfuG = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    
                    if _BLX_OswbGhVE and _BLX_MSahkfuG then
                        _BLX_MSahkfuG.CFrame = _BLX_OswbGhVE.CFrame * CFrame.new(0, _BLX_EcTPbsnU.AttachHeight, _BLX_EcTPbsnU.RideDistance)
                        _BLX_MSahkfuG.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Hug Logic
        if _BLX_EcTPbsnU.HugPlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_MSahkfuG = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    
                    if _BLX_OswbGhVE and _BLX_MSahkfuG then
                        -- Position in front (Z = -1) and rotate 180 degrees to _BLX_bpZMRXPk _BLX_YzIHWHGa
                        _BLX_MSahkfuG.CFrame = _BLX_OswbGhVE.CFrame * CFrame.new(0, 0, -1) * CFrame.Angles(0, math.pi, 0)
                        _BLX_MSahkfuG.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        end

        -- Follow Logic
        if _BLX_EcTPbsnU.FollowPlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_PmRmVbmR = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    if _BLX_PmRmVbmR and _BLX_OswbGhVE then
                        _BLX_PmRmVbmR:MoveTo(_BLX_OswbGhVE.Position + Vector3.new(3, 0, 3))
                    end
                end
            end)
        end

        -- Freeze Logic
        if _BLX_EcTPbsnU.FreezePlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    if _BLX_OswbGhVE then
                        _BLX_OswbGhVE.Anchored = true
                        _BLX_OswbGhVE.Velocity = Vector3.new(0,0,0)
                    end
                end
            end)
        elseif not _BLX_EcTPbsnU.FreezePlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    if _BLX_OswbGhVE then
                        _BLX_OswbGhVE.Anchored = false
                    end
                end
            end)
        end
        
        -- Mirror Player Logic
        if _BLX_EcTPbsnU.MirrorPlayer and _BLX_EcTPbsnU.SelectedPlayer ~= "" then
            pcall(function()
                local _BLX_YzIHWHGa = GetPlayerByPartialName(_BLX_EcTPbsnU.SelectedPlayer)
                if _BLX_YzIHWHGa and _BLX_YzIHWHGa.Character and LocalPlayer.Character then
                    local _BLX_OswbGhVE = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_MSahkfuG = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
                    local _BLX_rYXEXxta = _BLX_YzIHWHGa.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
                    local _BLX_hyONRhnz = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
                    
                    if _BLX_OswbGhVE and _BLX_MSahkfuG and _BLX_rYXEXxta and _BLX_hyONRhnz then
                        -- Mirror Movement _BLX_RzUdrlEb
                        _BLX_hyONRhnz:Move(_BLX_rYXEXxta.MoveDirection)
                        if _BLX_rYXEXxta.Jump then _BLX_hyONRhnz.Jump = true end
                        
                        -- Look where they look
                        _BLX_MSahkfuG.CFrame = CFrame.new(_BLX_MSahkfuG.Position, _BLX_MSahkfuG.Position + _BLX_OswbGhVE.CFrame.LookVector)
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
        if _BLX_gBpJGzUX.TeleportCollect and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not _BLX_gBpJGzUX.TeleportCollect then break end
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) and (obj.Name:lower():find(string.char(99,111,105,110)) or obj.Name:lower():find(string.char(109,111,110,101,121)) or obj.Name:lower():find(string.char(103,101,109)) or obj.Name:lower():find(string.char(99,97,115,104))) then
                        _BLX_lBajZbZj.CFrame = obj.CFrame
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
        if _BLX_gBpJGzUX.AutoProximity and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not _BLX_gBpJGzUX.AutoProximity then break end
                    if obj:IsA(string.char(80,114,111,120,105,109,105,116,121,80,114,111,109,112,116)) then
                        local _BLX_OrLJlsHM = obj.Parent
                        if _BLX_OrLJlsHM:IsA(string.char(66,97,115,101,80,97,114,116)) then
                            local _BLX_CWkRoFlO = (_BLX_lBajZbZj.Position - _BLX_OrLJlsHM.Position).Magnitude
                            if _BLX_CWkRoFlO < (obj.MaxActivationDistance or 10) then
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
        if _BLX_gBpJGzUX.AutoCollect and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj then
                local _BLX_FhOaSFCk = {string.char(99,111,105,110), string.char(109,111,110,101,121), string.char(99,97,115,104), string.char(103,111,108,100), string.char(103,101,109), string.char(100,105,97,109,111,110,100), string.char(116,114,101,97,115,117,114,101), string.char(105,116,101,109), string.char(100,114,111,112), string.char(108,111,111,116), string.char(114,101,119,97,114,100)}
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not _BLX_gBpJGzUX.AutoCollect then break end
                    if obj:IsA(string.char(66,97,115,101,80,97,114,116)) then
                        local _BLX_hrNGvXbu = obj.Name:lower()
                        local _BLX_qLBdyjVx = false
                        for _, kw in pairs(_BLX_FhOaSFCk) do
                            if _BLX_hrNGvXbu:find(kw) then
                                _BLX_qLBdyjVx = true
                                break
                            end
                        end
                        
                        if _BLX_qLBdyjVx then
                            local _BLX_CWkRoFlO = (_BLX_lBajZbZj.Position - obj.Position).Magnitude
                            if _BLX_CWkRoFlO < 50 then
                                firetouchinterest(_BLX_lBajZbZj, obj, 0)
                                firetouchinterest(_BLX_lBajZbZj, obj, 1)
                            end
                        end
                    elseif obj:IsA(string.char(67,108,105,99,107,68,101,116,101,99,116,111,114)) then
                        local _BLX_OrLJlsHM = obj.Parent
                        if _BLX_OrLJlsHM:IsA(string.char(66,97,115,101,80,97,114,116)) then
                            local _BLX_CWkRoFlO = (_BLX_lBajZbZj.Position - _BLX_OrLJlsHM.Position).Magnitude
                            if _BLX_CWkRoFlO < (obj.MaxActivationDistance or 20) then
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
        if _BLX_gBpJGzUX.AntiVoid and LocalPlayer.Character then
            local _BLX_lBajZbZj = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if _BLX_lBajZbZj and _BLX_lBajZbZj.Position.Y < -50 then
                _BLX_lBajZbZj.Velocity = Vector3.new(0, 0, 0)
                _BLX_lBajZbZj.CFrame = CFrame.new(_BLX_lBajZbZj.Position.X, 50, _BLX_lBajZbZj.Position.Z)
                showNotification(string.char(66,108,111,111,100,105,120), string.char(65,110,116,105,45,86,111,105,100,32,84,114,105,103,103,101,114,101,100,33), 2)
            end
        end
    end
end)

-- Anti-AFK Connection (Enhanced Master)
local _BLX_AKCbYkFs = game:GetService(string.char(95,66,76,88,95,65,75,67,98,89,107,70,115))
LocalPlayer.Idled:Connect(function()
    if _BLX_rUfipTLV.AntiAFK or _BLX_gBpJGzUX.AntiAFK then
        pcall(function()
            _BLX_AKCbYkFs:CaptureController()
            _BLX_AKCbYkFs:ClickButton2(Vector2.new())
            _BLX_AKCbYkFs:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.1)
            _BLX_AKCbYkFs:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
end)

--========================================================--
--============  INFINITE YIELD INSPIRED FEATURES =========--

-- WAYPOINTS SYSTEM
local _BLX_jWVfgeaa = {}
local _BLX_OZDLBPaj = false

local function saveWaypoint(_BLX_hrNGvXbu)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
        local _BLX_trjpMtQc = LocalPlayer.Character.HumanoidRootPart.Position
        _BLX_jWVfgeaa[_BLX_hrNGvXbu] = _BLX_trjpMtQc
        return true
    end
    return false
end

local function loadWaypoint(_BLX_hrNGvXbu)
    if _BLX_jWVfgeaa[_BLX_hrNGvXbu] and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_BLX_jWVfgeaa[_BLX_hrNGvXbu])
        return true
    end
    return false
end

local function deleteWaypoint(_BLX_hrNGvXbu)
    if _BLX_jWVfgeaa[_BLX_hrNGvXbu] then
        _BLX_jWVfgeaa[_BLX_hrNGvXbu] = nil
        return true
    end
    return false
end

-- NOTIFICATION SYSTEM
-- REJOIN FUNCTION
local function rejoinServer()
    local _BLX_cqKVRdSp = game:GetService(string.char(95,66,76,88,95,99,113,75,86,82,100,83,112))
    _BLX_cqKVRdSp:Teleport(game.PlaceId, LocalPlayer)
end

-- SERVER HOP FUNCTION
local function serverHop()
    local _BLX_cqKVRdSp = game:GetService(string.char(95,66,76,88,95,99,113,75,86,82,100,83,112))
    local _BLX_tZGfzRus = game:GetService(string.char(95,66,76,88,95,116,90,71,102,122,82,117,115))
    
    local success, result = pcall(function()
        local _BLX_gZFOZkZh = _BLX_tZGfzRus:JSONDecode(game:HttpGet(string.char(104,116,116,112,115,58,47,47,103,97,109,101,115,46,114,111,98,108,111,120,46,99,111,109,47,118,49,47,103,97,109,101,115,47) .. game.PlaceId .. string.char(47,95,66,76,88,95,103,90,70,79,90,107,90,104,47,80,117,98,108,105,99,63,115,111,114,116,79,114,100,101,114,61,65,115,99,38,108,105,109,105,116,61,49,48,48)))
        
        if _BLX_gZFOZkZh and _BLX_gZFOZkZh.data then
            for _, server in pairs(_BLX_gZFOZkZh.data) do
                if server._BLX_YSislNZr ~= game.JobId and server.playing < server.maxPlayers then
                    _BLX_cqKVRdSp:TeleportToPlaceInstance(game.PlaceId, server._BLX_YSislNZr, LocalPlayer)
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
_BLX_xjNuGRWs:ClearAllChildren()
AddLabel(_BLX_xjNuGRWs, string.char(10024,32,73,78,70,73,78,73,84,69,32,89,73,69,76,68,32,73,78,83,80,73,82,69,68), 8)

AddLabel(_BLX_xjNuGRWs, string.char(55357,56580,32,83,101,114,118,101,114,32,67,111,110,116,114,111,108,115,58), 40)

local _BLX_VlfIEQny = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_VlfIEQny.Size = UDim2.new(0, 200, 0, 35)
_BLX_VlfIEQny.Position = UDim2.new(0, 15, 0, 70)
_BLX_VlfIEQny.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
_BLX_VlfIEQny.Text = string.char(55357,56580,32,82,101,106,111,105,110,32,83,101,114,118,101,114)
_BLX_VlfIEQny.TextColor3 = Color3.new(1, 1, 1)
_BLX_VlfIEQny.Font = Enum.Font.GothamBold
_BLX_VlfIEQny.TextSize = 14
_BLX_VlfIEQny.BorderSizePixel = 0

local _BLX_YgqkIbPR = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_VlfIEQny)
_BLX_YgqkIbPR.CornerRadius = UDim.new(0, 8)

_BLX_VlfIEQny.MouseButton1Click:Connect(function()
    showNotification(string.char(82,101,106,111,105,110,105,110,103,46,46,46), string.char(82,101,99,111,110,110,101,99,116,105,110,103,32,116,111,32,115,101,114,118,101,114,46,46,46), 2)
    task.wait(1)
    rejoinServer()
end)

local _BLX_HoOiXeLE = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_HoOiXeLE.Size = UDim2.new(0, 200, 0, 35)
_BLX_HoOiXeLE.Position = UDim2.new(0, 225, 0, 70)
_BLX_HoOiXeLE.BackgroundColor3 = Color3.fromRGB(200, 80, 120)
_BLX_HoOiXeLE.Text = string.char(55356,57104,32,83,101,114,118,101,114,32,72,111,112)
_BLX_HoOiXeLE.TextColor3 = Color3.new(1, 1, 1)
_BLX_HoOiXeLE.Font = Enum.Font.GothamBold
_BLX_HoOiXeLE.TextSize = 14
_BLX_HoOiXeLE.BorderSizePixel = 0

local _BLX_PyqWoafV = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_HoOiXeLE)
_BLX_PyqWoafV.CornerRadius = UDim.new(0, 8)

_BLX_HoOiXeLE.MouseButton1Click:Connect(function()
    showNotification(string.char(83,101,114,118,101,114,32,72,111,112,112,105,110,103,46,46,46), string.char(70,105,110,100,105,110,103,32,110,101,119,32,115,101,114,118,101,114,46,46,46), 2)
    task.wait(1)
    serverHop()
end)

AddLabel(_BLX_xjNuGRWs, string.char(55357,56525,32,95,66,76,88,95,106,87,86,102,103,101,97,97,32,83,121,115,116,101,109,58), 120)

local _BLX_FhewRsRL = Instance.new(string.char(84,101,120,116,66,111,120), _BLX_xjNuGRWs)
_BLX_FhewRsRL.Size = UDim2.new(0, 250, 0, 35)
_BLX_FhewRsRL.Position = UDim2.new(0, 15, 0, 150)
_BLX_FhewRsRL.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
_BLX_FhewRsRL.BorderSizePixel = 1
_BLX_FhewRsRL.BorderColor3 = Color3.fromRGB(80, 120, 200)
_BLX_FhewRsRL.PlaceholderText = string.char(87,97,121,112,111,105,110,116,32,78,97,109,101,46,46,46)
_BLX_FhewRsRL.Text = ""
_BLX_FhewRsRL.TextColor3 = Color3.new(1, 1, 1)
_BLX_FhewRsRL.Font = Enum.Font.Gotham
_BLX_FhewRsRL.TextSize = 14

local _BLX_cvJNQEmD = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_FhewRsRL)
_BLX_cvJNQEmD.CornerRadius = UDim.new(0, 6)

local _BLX_CWEwhMCP = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_CWEwhMCP.Size = UDim2.new(0, 80, 0, 35)
_BLX_CWEwhMCP.Position = UDim2.new(0, 275, 0, 150)
_BLX_CWEwhMCP.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
_BLX_CWEwhMCP.Text = string.char(55357,56510,32,83,97,118,101)
_BLX_CWEwhMCP.TextColor3 = Color3.new(1, 1, 1)
_BLX_CWEwhMCP.Font = Enum.Font.GothamBold
_BLX_CWEwhMCP.TextSize = 12
_BLX_CWEwhMCP.BorderSizePixel = 0

local _BLX_aPnkrTrc = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_CWEwhMCP)
_BLX_aPnkrTrc.CornerRadius = UDim.new(0, 6)

_BLX_CWEwhMCP.MouseButton1Click:Connect(function()
    local _BLX_hrNGvXbu = _BLX_FhewRsRL.Text
    if _BLX_hrNGvXbu ~= "" then
        if saveWaypoint(_BLX_hrNGvXbu) then
            showNotification(string.char(87,97,121,112,111,105,110,116,32,83,97,118,101,100), string.char(83,97,118,101,100,58,32) .. _BLX_hrNGvXbu, 2)
            _BLX_FhewRsRL.Text = ""
        else
            showNotification(string.char(69,114,114,111,114), string.char(70,97,105,108,101,100,32,116,111,32,115,97,118,101,32,119,97,121,112,111,105,110,116), 2)
        end
    end
end)

local _BLX_oQqYAPAM = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_oQqYAPAM.Size = UDim2.new(0, 80, 0, 35)
_BLX_oQqYAPAM.Position = UDim2.new(0, 365, 0, 150)
_BLX_oQqYAPAM.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
_BLX_oQqYAPAM.Text = string.char(55357,56525,32,76,111,97,100)
_BLX_oQqYAPAM.TextColor3 = Color3.new(1, 1, 1)
_BLX_oQqYAPAM.Font = Enum.Font.GothamBold
_BLX_oQqYAPAM.TextSize = 12
_BLX_oQqYAPAM.BorderSizePixel = 0

local _BLX_ACIZiBaA = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_oQqYAPAM)
_BLX_ACIZiBaA.CornerRadius = UDim.new(0, 6)

_BLX_oQqYAPAM.MouseButton1Click:Connect(function()
    local _BLX_hrNGvXbu = _BLX_FhewRsRL.Text
    if _BLX_hrNGvXbu ~= "" then
        if loadWaypoint(_BLX_hrNGvXbu) then
            showNotification(string.char(84,101,108,101,112,111,114,116,101,100), string.char(76,111,97,100,101,100,58,32) .. _BLX_hrNGvXbu, 2)
        else
            showNotification(string.char(69,114,114,111,114), string.char(87,97,121,112,111,105,110,116,32,110,111,116,32,102,111,117,110,100), 2)
        end
    end
end)

AddLabel(_BLX_xjNuGRWs, string.char(9889,32,81,117,105,99,107,32,65,99,116,105,111,110,115,58), 200)

local _BLX_ADTfNkzP = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_ADTfNkzP.Size = UDim2.new(0, 200, 0, 35)
_BLX_ADTfNkzP.Position = UDim2.new(0, 15, 0, 230)
_BLX_ADTfNkzP.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
_BLX_ADTfNkzP.Text = string.char(55357,56448,32,82,101,115,101,116,32,67,104,97,114,97,99,116,101,114)
_BLX_ADTfNkzP.TextColor3 = Color3.new(1, 1, 1)
_BLX_ADTfNkzP.Font = Enum.Font.GothamBold
_BLX_ADTfNkzP.TextSize = 14
_BLX_ADTfNkzP.BorderSizePixel = 0

local _BLX_NMADGivY = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_ADTfNkzP)
_BLX_NMADGivY.CornerRadius = UDim.new(0, 8)

_BLX_ADTfNkzP.MouseButton1Click:Connect(function()
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end)

local _BLX_XOcqeJti = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _BLX_xjNuGRWs)
_BLX_XOcqeJti.Size = UDim2.new(0, 200, 0, 35)
_BLX_XOcqeJti.Position = UDim2.new(0, 225, 0, 230)
_BLX_XOcqeJti.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
_BLX_XOcqeJti.Text = string.char(9851,65039,32,82,101,115,112,97,119,110)
_BLX_XOcqeJti.TextColor3 = Color3.new(1, 1, 1)
_BLX_XOcqeJti.Font = Enum.Font.GothamBold
_BLX_XOcqeJti.TextSize = 14
_BLX_XOcqeJti.BorderSizePixel = 0

local _BLX_aKcBnEiE = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_XOcqeJti)
_BLX_aKcBnEiE.CornerRadius = UDim.new(0, 8)

_BLX_XOcqeJti.MouseButton1Click:Connect(function()
    LocalPlayer.Character:BreakJoints()
    showNotification(string.char(82,101,115,112,97,119,110,105,110,103,46,46,46), string.char(67,104,97,114,97,99,116,101,114,32,119,105,108,108,32,114,101,115,112,97,119,110), 2)
end)

AddLabel(_BLX_xjNuGRWs, string.char(55356,57262,32,71,97,109,101,32,73,110,102,111,58), 280)

local _BLX_eRpNbfTz = Instance.new(string.char(70,114,97,109,101), _BLX_xjNuGRWs)
_BLX_eRpNbfTz.Size = UDim2.new(0, 440, 0, 100)
_BLX_eRpNbfTz.Position = UDim2.new(0, 10, 0, 310)
_BLX_eRpNbfTz.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
_BLX_eRpNbfTz.BorderSizePixel = 0

local _BLX_drNuWCCG = Instance.new(string.char(85,73,67,111,114,110,101,114), _BLX_eRpNbfTz)
_BLX_drNuWCCG.CornerRadius = UDim.new(0, 8)

local _BLX_NiqOQgan = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_eRpNbfTz)
_BLX_NiqOQgan.Size = UDim2.new(1, -20, 0, 20)
_BLX_NiqOQgan.Position = UDim2.new(0, 10, 0, 5)
_BLX_NiqOQgan.BackgroundTransparency = 1
_BLX_NiqOQgan.Text = string.char(71,97,109,101,58,32) .. game:GetService(string.char(77,97,114,107,101,116,112,108,97,99,101,83,101,114,118,105,99,101)):GetProductInfo(game.PlaceId).Name
_BLX_NiqOQgan.TextColor3 = Color3.new(1, 1, 1)
_BLX_NiqOQgan.Font = Enum.Font.Gotham
_BLX_NiqOQgan.TextSize = 12
_BLX_NiqOQgan.TextXAlignment = Enum.TextXAlignment.Left

local _BLX_fMuIKlRu = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_eRpNbfTz)
_BLX_fMuIKlRu.Size = UDim2.new(1, -20, 0, 20)
_BLX_fMuIKlRu.Position = UDim2.new(0, 10, 0, 25)
_BLX_fMuIKlRu.BackgroundTransparency = 1
_BLX_fMuIKlRu.Text = string.char(80,108,97,99,101,32,73,68,58,32) .. game.PlaceId
_BLX_fMuIKlRu.TextColor3 = Color3.new(0.8, 0.8, 0.8)
_BLX_fMuIKlRu.Font = Enum.Font.Gotham
_BLX_fMuIKlRu.TextSize = 12
_BLX_fMuIKlRu.TextXAlignment = Enum.TextXAlignment.Left

local _BLX_mojlwdPY = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_eRpNbfTz)
_BLX_mojlwdPY.Size = UDim2.new(1, -20, 0, 20)
_BLX_mojlwdPY.Position = UDim2.new(0, 10, 0, 45)
_BLX_mojlwdPY.BackgroundTransparency = 1
_BLX_mojlwdPY.Text = string.char(74,111,98,32,73,68,58,32) .. game.JobId
_BLX_mojlwdPY.TextColor3 = Color3.new(0.8, 0.8, 0.8)
_BLX_mojlwdPY.Font = Enum.Font.Gotham
_BLX_mojlwdPY.TextSize = 12
_BLX_mojlwdPY.TextXAlignment = Enum.TextXAlignment.Left

local _BLX_lsZoavXI = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _BLX_eRpNbfTz)
_BLX_lsZoavXI.Size = UDim2.new(1, -20, 0, 20)
_BLX_lsZoavXI.Position = UDim2.new(0, 10, 0, 65)
_BLX_lsZoavXI.BackgroundTransparency = 1
_BLX_lsZoavXI.Text = string.char(80,108,97,121,101,114,115,58,32) .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
_BLX_lsZoavXI.TextColor3 = Color3.new(0.8, 0.8, 0.8)
_BLX_lsZoavXI.Font = Enum.Font.Gotham
_BLX_lsZoavXI.TextSize = 12
_BLX_lsZoavXI.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while true do
        task.wait(1)
        _BLX_lsZoavXI.Text = string.char(80,108,97,121,101,114,115,58,32) .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
    end
end)

-- WELCOME NOTIFICATION
showNotification(string.char(55357,56613,32,66,76,79,79,68,73,88,32,86,54), string.char(76,111,97,100,101,100,32,115,117,99,99,101,115,115,102,117,108,108,121,33,32,80,114,101,115,115,32,80,32,116,111,32,116,111,103,103,108,101), 5)

end)

if not success then
    warn(string.char(66,108,111,111,100,105,120,58,32,70,97,116,97,108,32,101,114,114,111,114,32,100,117,114,105,110,103,32,105,110,105,116,105,97,108,105,122,97,116,105,111,110,58,32) .. tostring(err))
    -- Attempt to notify via alternative _BLX_fnqYamkb if GUI failed
    pcall(function()
        game:GetService(string.char(83,116,97,114,116,101,114,71,117,105)):SetCore(string.char(83,101,110,100,78,111,116,105,102,105,99,97,116,105,111,110), {
            _BLX_byZrWMRI = string.char(66,108,111,111,100,105,120,32,69,114,114,111,114),
            Text = string.char(70,97,105,108,101,100,32,116,111,32,108,111,97,100,32,115,99,114,105,112,116,46,32,67,104,101,99,107,32,99,111,110,115,111,108,101,32,40,70,57,41),
            Duration = 10
        })
    end)
end


-- End of BLOODIX-VIP Protected Code
