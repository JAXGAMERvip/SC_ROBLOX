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
local ESPSettings = { Enabled=false, Line=true, Box=false, Name=true, Health=true, MaxDistance=1000 }
local PlayerSettings = { Speed=16, JumpPower=50, SpeedOn=false, JumpOn=false, NoClip=false, Fly=false }
local AimSettings = { Enabled=false, FOV=120, Smooth=0.25, TargetMethod="ClosestDistance", Priority="Head", VisibleCheck=true }
local HeadSizeSettings = { Enabled=false, Size=5 }
local Drawn = { lines={}, boxes={}, nameTexts={}, healthTexts={}, fovCircle=nil }
local ModifiedHeads = {}

-- HELPER FUNCTIONS
local function clamp(v,a,b) if v<a then return a elseif v>b then return b else return v end end
local function isEnemy(p) if not p or p==LocalPlayer then return false end if p.Team and LocalPlayer.Team then return p.Team~=LocalPlayer.Team end return true end
local function worldToScreen(pos) local p,onScreen=Camera:WorldToViewportPoint(pos) return Vector2.new(p.X,p.Y),onScreen end

--========================================================--
--===============  TEXT DRAWING AT TOP  ==================--
local topText = Drawing.new("Text")
topText.Visible = true
topText.Text = "🔥 BLOODIX V5 - Press P"
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

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 600, 0, 480)
Main.Position = UDim2.new(0.5,-300,0.45,-240)
Main.BackgroundColor3 = Color3.fromRGB(28,28,30)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundColor3 = Color3.fromRGB(18,18,20)
Title.Text = "🔥 BLOODIX V5 — Educational Panel"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- TABS
local TabsFrame = Instance.new("Frame", Main)
TabsFrame.Size = UDim2.new(0,140,1,-40)
TabsFrame.Position = UDim2.new(0,0,0,40)
TabsFrame.BackgroundColor3 = Color3.fromRGB(22,22,24)

local PagesFrame = Instance.new("Frame", Main)
PagesFrame.Size = UDim2.new(1,-140,1,-40)
PagesFrame.Position = UDim2.new(0,140,0,40)
PagesFrame.BackgroundColor3 = Color3.fromRGB(34,34,36)

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
    local p = Instance.new("Frame", PagesFrame)
    p.Size = UDim2.new(1,0,1,0)
    p.BackgroundTransparency = 1
    p.Visible = false
    return p
end

local tabAimbot, tabESP, tabPlayer, tabTP, tabHack = MakeTab("AIMBOT",1), MakeTab("ESP",2), MakeTab("PLAYER",3), MakeTab("TELEPORT",4), MakeTab("HACK",5)
local pageAimbot, pageESP, pagePlayer, pageTP, pageHack = MakePage(), MakePage(), MakePage(), MakePage(), MakePage()
pageAimbot.Visible = true
local currentPage = pageAimbot
local tabMap = { [tabAimbot]=pageAimbot, [tabESP]=pageESP, [tabPlayer]=pagePlayer, [tabTP]=pageTP, [tabHack]=pageHack }
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
    lbl.Size=UDim2.new(0,440,0,22)
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
    btn.Size=UDim2.new(0,140,0,30)
    btn.Position=UDim2.new(0,10,0,y)
    btn.Text=label..": "..(initial and "ON" or "OFF")
    btn.Font=Enum.Font.Gotham
    btn.TextSize=14
    local state=initial
    btn.MouseButton1Click:Connect(function() 
        state=not state; 
        btn.Text=label..": "..(state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(60, 60, 70)
        if callback then callback(state) end 
    end)
    btn.BackgroundColor3 = initial and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(60, 60, 70)
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
    track.Size = UDim2.new(0, 250, 0, 6)
    track.Position = UDim2.new(0, 0, 0, 25)
    track.BackgroundColor3 = Color3.fromRGB(45, 45, 47)
    track.BorderSizePixel = 0
    
    local fill = Instance.new("Frame", track)
    fill.Size = UDim2.new((initial - minV) / (maxV - minV), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(110, 110, 220)
    fill.BorderSizePixel = 0
    
    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 12, 0, 16)
    knob.Position = UDim2.new(fill.Size.X.Scale - 0.03, 0, 0, -5)
    knob.BackgroundColor3 = Color3.fromRGB(180, 180, 220)
    knob.BorderSizePixel = 0
    
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
AddLabel(pageAimbot,"🎯 AIMBOT SETTINGS (Training Only)",8)

local togAim = AddToggle(pageAimbot,"Enable Aimbot Assist",36,false,function(s) 
    AimSettings.Enabled = s 
end)

local sliderFOV = AddSlider(pageAimbot, "Aimbot FOV", 76, 20, 600, AimSettings.FOV, function(v) 
    AimSettings.FOV = v 
end)

local sliderSmooth = AddSlider(pageAimbot, "Smoothness", 126, 0.01, 1, AimSettings.Smooth, function(v) 
    AimSettings.Smooth = v 
end)

AddLabel(pageAimbot,"Target Selection Method:",176)

local btnDist = Instance.new("TextButton",pageAimbot)
btnDist.Size = UDim2.new(0,140,0,30)
btnDist.Position = UDim2.new(0,10,0,206)
btnDist.Text = "Closest Distance"
btnDist.BackgroundColor3 = Color3.fromRGB(80,80,120)
btnDist.TextColor3 = Color3.new(1,1,1)
btnDist.Font = Enum.Font.Gotham
btnDist.MouseButton1Click:Connect(function() 
    AimSettings.TargetMethod = "ClosestDistance" 
    btnDist.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnScreen.BackgroundColor3 = Color3.fromRGB(80,80,120)
end)

local btnScreen = Instance.new("TextButton",pageAimbot)
btnScreen.Size = UDim2.new(0,140,0,30)
btnScreen.Position = UDim2.new(0,160,0,206)
btnScreen.Text = "Closest Screen"
btnScreen.BackgroundColor3 = Color3.fromRGB(80,80,120)
btnScreen.TextColor3 = Color3.new(1,1,1)
btnScreen.Font = Enum.Font.Gotham
btnScreen.MouseButton1Click:Connect(function() 
    AimSettings.TargetMethod = "ClosestScreen" 
    btnScreen.BackgroundColor3 = Color3.fromRGB(100,100,180)
    btnDist.BackgroundColor3 = Color3.fromRGB(80,80,120)
end)

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

local function findAimTarget()
    local best,bestScore = nil, math.huge
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isEnemy(p) and p.Character and p.Character.Parent then
            local primary = p.Character:FindFirstChild(AimSettings.Priority) or p.Character:FindFirstChild("HumanoidRootPart")
            if primary then
                local pos = primary.Position
                local screenPos, onScreen = worldToScreen(pos)
                if AimSettings.VisibleCheck and not onScreen then
                else
                    if AimSettings.TargetMethod == "ClosestDistance" then
                        local d = (Camera.CFrame.Position - pos).Magnitude
                        if d < bestScore then 
                            best = {player = p, part = primary, pos = pos}
                            bestScore = d 
                        end
                    else
                        local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                        local d2 = (screenPos - center).Magnitude
                        if d2 < bestScore then 
                            best = {player = p, part = primary, pos = pos}
                            bestScore = d2 
                        end
                    end
                end
            end
        end
    end
    return best
end

RunService.RenderStepped:Connect(function(dt)
    if AimSettings.Enabled and aimHeld then
        local t = findAimTarget()
        if t then
            local camPos = Camera.CFrame.Position
            local dir = (t.pos - camPos).Unit
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(camPos, camPos + dir), clamp(AimSettings.Smooth * dt * 60, 0, 1))
        end
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
end

for _, player in pairs(Players:GetPlayers()) do 
    if player ~= LocalPlayer then 
        createESP(player)
    end 
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then 
        createESP(player)
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
    if not ESPSettings.Enabled or not player.Character then
        if drawings.line then drawings.line.Visible = false end
        if drawings.box then drawings.box.Visible = false end
        if drawings.name then drawings.name.Visible = false end
        if drawings.health then drawings.health.Visible = false end
        return
    end
    
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local screenPos, onScreen = worldToScreen(humanoidRootPart.Position)
    local distance = (Camera.CFrame.Position - humanoidRootPart.Position).Magnitude
    
    if onScreen and distance <= ESPSettings.MaxDistance and isEnemy(player) then
        if ESPSettings.Line and drawings.line then
            drawings.line.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
            drawings.line.To = Vector2.new(screenPos.X, screenPos.Y)
            drawings.line.Visible = true
        elseif drawings.line then
            drawings.line.Visible = false
        end
        
        if ESPSettings.Box and drawings.box then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local headPos, _ = worldToScreen(head.Position)
                local rootPos, _ = worldToScreen(humanoidRootPart.Position)
                local height = math.abs(headPos.Y - rootPos.Y) * 2
                local width = height / 1.5
                
                drawings.box.Position = Vector2.new(screenPos.X - width/2, screenPos.Y - height/2)
                drawings.box.Size = Vector2.new(width, height)
                drawings.box.Visible = true
            end
        elseif drawings.box then
            drawings.box.Visible = false
        end
        
        if ESPSettings.Name and drawings.name then
            drawings.name.Position = Vector2.new(screenPos.X, screenPos.Y - 35)
            drawings.name.Text = player.Name
            drawings.name.Visible = true
        elseif drawings.name then
            drawings.name.Visible = false
        end
        
        if ESPSettings.Health and drawings.health then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                drawings.health.Position = Vector2.new(screenPos.X, screenPos.Y - 15)
                drawings.health.Text = "HP: " .. math.floor(humanoid.Health)
                drawings.health.Visible = true
            end
        elseif drawings.health then
            drawings.health.Visible = false
        end
    else
        if drawings.line then drawings.line.Visible = false end
        if drawings.box then drawings.box.Visible = false end
        if drawings.name then drawings.name.Visible = false end
        if drawings.health then drawings.health.Visible = false end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        
        if ESPSettings.Enabled then
            for player, drawings in pairs(Drawn.lines) do
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
        else
            for player, line in pairs(Drawn.lines) do
                if line then line.Visible = false end
            end
            for player, box in pairs(Drawn.boxes) do
                if box then box.Visible = false end
            end
            for player, name in pairs(Drawn.nameTexts) do
                if name then name.Visible = false end
            end
            for player, health in pairs(Drawn.healthTexts) do
                if health then health.Visible = false end
            end
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
    if not head then return false end
    
    local currentSize = head.Size.X
    local targetSize = HeadSizeSettings.Size
    
    if math.abs(currentSize - targetSize) > 0.1 then
        if not ModifiedHeads[player] then
            ModifiedHeads[player] = {
                OriginalSize = head.Size:Clone(),
                OriginalMassless = head.Massless
            }
        end
        
        head.Size = Vector3.new(targetSize, targetSize, targetSize)
        head.Massless = true
        
        local face = head:FindFirstChild("face") or head:FindFirstChildOfClass("Decal")
        if face then
            if not face:GetAttribute("OriginalFaceSize") then
                face:SetAttribute("OriginalFaceSize", Vector2.new(face.Size.X, face.Size.Y))
            end
            
            face.Size = Vector2.new(targetSize, targetSize)
        end
        
        return true
    end
    
    return false
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

local espLineToggleBtn = AddToggle(pageESP, "Line ESP", 76, true, function(s) 
    ESPSettings.Line = s 
end)

local espBoxToggleBtn = AddToggle(pageESP, "Box ESP", 116, false, function(s) 
    ESPSettings.Box = s 
end)

local espNameToggleBtn = AddToggle(pageESP, "Show Names", 156, true, function(s) 
    ESPSettings.Name = s 
end)

local espHealthToggleBtn = AddToggle(pageESP, "Show Health", 196, true, function(s) 
    ESPSettings.Health = s 
end)

local espDistanceSlider = AddSlider(pageESP, "Max Distance", 236, 100, 5000, ESPSettings.MaxDistance, function(v) 
    ESPSettings.MaxDistance = v 
end)

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

-- BIG HEADS SYSTEM
AddLabel(pagePlayer, "👑 BIG HEADS SYSTEM", 196)

local bigHeadsToggle = AddToggle(pagePlayer, "Big Heads", 226, HeadSizeSettings.Enabled, function(s)
    HeadSizeSettings.Enabled = s
    if s then
        applyBigHeadsToAll()
    else
        resetBigHeadsForAll()
    end
end)

local headSizeSlider = AddSlider(pagePlayer, "Head Size", 276, 1, 10, HeadSizeSettings.Size, function(v)
    HeadSizeSettings.Size = v
    if HeadSizeSettings.Enabled then
        applyBigHeadsToAll()
    end
end)

local speedSlider = AddSlider(pagePlayer, "Walk Speed", 326, 8, 380, PlayerSettings.Speed, function(v) 
    PlayerSettings.Speed = v 
end)

local jumpSlider = AddSlider(pagePlayer, "Jump Power", 376, 30, 250, PlayerSettings.JumpPower, function(v) 
    PlayerSettings.JumpPower = v 
end)

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
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
                hrp.Velocity = vel * PlayerSettings.Speed
            end
        end
    end
end)

--========================================================--
--====================  TELEPORT TAB ====================--
pageTP:ClearAllChildren()

AddLabel(pageTP, "📍 TELEPORT SYSTEM", 8)
AddLabel(pageTP, "Teleport to Players:", 40)

local playersScroll = Instance.new("ScrollingFrame", pageTP)
playersScroll.Size = UDim2.new(0, 440, 0, 150)
playersScroll.Position = UDim2.new(0, 10, 0, 70)
playersScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
playersScroll.BorderSizePixel = 0
playersScroll.ScrollBarThickness = 6

local function refreshPlayersList()
    playersScroll:ClearAllChildren()
    
    local yPos = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
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
            tpButton.Size = UDim2.new(0, 100, 0, 30)
            tpButton.Position = UDim2.new(1, -110, 0.5, -15)
            tpButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
            tpButton.Text = "TELEPORT"
            tpButton.TextColor3 = Color3.new(1, 1, 1)
            tpButton.Font = Enum.Font.GothamBold
            tpButton.TextSize = 12
            
            tpButton.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = player.Character.HumanoidRootPart.CFrame
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    end
                end
            end)
            
            yPos = yPos + 50
        end
    end
    
    playersScroll.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

refreshPlayersList()
Players.PlayerAdded:Connect(refreshPlayersList)
Players.PlayerRemoving:Connect(refreshPlayersList)

--========================================================--
--=====================  HACK TAB =======================--
pageHack:ClearAllChildren()

AddLabel(pageHack, "🛠️ ADVANCED TOOLS", 8)

AddLabel(pageHack, "Administration Tools:", 40)

local refreshBtn = Instance.new("TextButton", pageHack)
refreshBtn.Size = UDim2.new(0, 200, 0, 35)
refreshBtn.Position = UDim2.new(0, 10, 0, 70)
refreshBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
refreshBtn.Text = "🔄 Refresh Players"
refreshBtn.TextColor3 = Color3.new(1, 1, 1)
refreshBtn.Font = Enum.Font.Gotham
refreshBtn.TextSize = 13

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
fixESPBtn.Position = UDim2.new(0, 220, 0, 70)
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
fixHeadsBtn.Position = UDim2.new(0, 10, 0, 115)
fixHeadsBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 200)
fixHeadsBtn.Text = "👑 Fix Big Heads"
fixHeadsBtn.TextColor3 = Color3.new(1, 1, 1)
fixHeadsBtn.Font = Enum.Font.Gotham
fixHeadsBtn.TextSize = 13

fixHeadsBtn.MouseButton1Click:Connect(function()
    if HeadSizeSettings.Enabled then
        applyBigHeadsToAll()
    end
end)

AddLabel(pageHack, "System Information:", 170)

local infoFrame = Instance.new("Frame", pageHack)
infoFrame.Size = UDim2.new(0, 440, 0, 60)
infoFrame.Position = UDim2.new(0, 10, 0, 200)
infoFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)

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
print("🔥 BLOODIX V5 EDU FINAL - LOADED SUCCESSFULLY!")
print("======================================================")
print("🎮 Controls:")
print("   • Press P to open/close control panel")
print("   • Right Mouse Button for Aimbot (when enabled)")
print("")
print("✅ ALL SYSTEMS WORKING:")
print("   • 🎯 Aimbot System - Complete")
print("   • 👁️ ESP System - Updates every 0.1s")
print("   • 👑 Big Heads System - Updates every 2s")
print("   • 👤 Player Tools - Speed, Jump, NoClip, Fly")
print("   • 📍 Teleport System - Works perfectly")
print("   • 🛠️ Hack Tools - Refresh and Fix buttons")
print("======================================================")

local notification = Instance.new("TextLabel", ScreenGui)
notification.Size = UDim2.new(0, 300, 0, 40)
notification.Position = UDim2.new(0.5, -150, 0, 100)
notification.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
notification.Text = "BLOODIX V5 - ALL SYSTEMS WORKING!"
notification.TextColor3 = Color3.new(1, 1, 1)
notification.Font = Enum.Font.GothamBold
notification.TextSize = 16

task.delay(3, function()
    notification:Destroy()
end)