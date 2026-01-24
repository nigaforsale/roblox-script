local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- [[ 0. SYSTEM VARIABLES ]] --
local Connections = {} 
local ESP_Cache = {} 
local FOV_Circle = nil
local UIVisible = true
local MenuGui, ESPGui

-- [[ 1. CONFIGURATION ]] --
local Settings = {
    ESP_Enabled = false,
    ESP_Box = true,        
    ESP_Skeleton = true,   
    ESP_Head = true,
    
    Speed_Enabled = false,
    Speed_Value = 1,
    
    Fly_Enabled = false,
    Fly_Speed = 1,
    
    Aimbot_Enabled = false,
    Aimbot_Mode = "Smooth", -- Default
    Aim_FOV = 150,
    Aim_Smoothness = 0.2,
    Aim_TeamCheck = true,
    Aim_Key = Enum.UserInputType.MouseButton2,
    
    ToggleKey = Enum.KeyCode.RightShift
}

local IsAiming = false

-- [[ 2. CORE GUI ENFORCER ]] --
local function GetParent()
    if gethui then return gethui() end
    return game:GetService("CoreGui") 
end

local TargetParent = GetParent()

MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "1337_Menu_v33"
MenuGui.IgnoreGuiInset = true
MenuGui.ResetOnSpawn = false
MenuGui.Parent = TargetParent

ESPGui = Instance.new("ScreenGui")
ESPGui.Name = "1337_Visuals_v33"
ESPGui.IgnoreGuiInset = true
ESPGui.ResetOnSpawn = false
ESPGui.Parent = TargetParent

local ESPLayer = Instance.new("Frame")
ESPLayer.Name = "ESPLayer"
ESPLayer.Parent = ESPGui
ESPLayer.BackgroundTransparency = 1
ESPLayer.Size = UDim2.new(1, 0, 1, 0)

-- [[ 3. UNLOAD SYSTEM ]] --
local function UnloadScript()
    for _, conn in pairs(Connections) do
        if conn then conn:Disconnect() end
    end
    Connections = {}
    
    if MenuGui then MenuGui:Destroy() end
    if ESPGui then ESPGui:Destroy() end
    
    if FOV_Circle then FOV_Circle:Remove() end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.PlatformStand = false
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        end
    end
end

-- [[ 4. UI LIBRARY ]] --
local Library = {}

function Library:Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

function Library:Window(name)
    local conn = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Settings.ToggleKey then
            UIVisible = not UIVisible
            MenuGui.Enabled = UIVisible
        end
    end)
    table.insert(Connections, conn)

    local Main = Instance.new("Frame")
    Main.Name = "Main"; Main.Parent = MenuGui; Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Main.Position = UDim2.new(0.3, 0, 0.3, 0); Main.Size = UDim2.new(0, 500, 0, 350); Main.ClipsDescendants = true
    Main.Active = true; Main.Draggable = true
    
    local MainCorner = Instance.new("UICorner"); MainCorner.CornerRadius = UDim.new(0, 6); MainCorner.Parent = Main
    local MainStroke = Instance.new("UIStroke"); MainStroke.Color = Color3.fromRGB(40, 40, 40); MainStroke.Thickness = 1; MainStroke.Parent = Main

    local Sidebar = Instance.new("Frame"); Sidebar.Parent = Main; Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25); Sidebar.Size = UDim2.new(0, 130, 1, 0); Sidebar.BorderSizePixel = 0
    local SidebarCorner = Instance.new("UICorner"); SidebarCorner.CornerRadius = UDim.new(0, 6); SidebarCorner.Parent = Sidebar
    local FixPatch = Instance.new("Frame", Sidebar); FixPatch.BorderSizePixel=0; FixPatch.BackgroundColor3=Color3.fromRGB(25,25,25); FixPatch.Size=UDim2.new(0,10,1,0); FixPatch.Position=UDim2.new(1,-10,0,0)

    local Title = Instance.new("TextLabel"); Title.Parent = Sidebar; Title.Text = name; Title.Font = Enum.Font.GothamBold; Title.TextSize = 18; Title.TextColor3 = Color3.fromRGB(255, 255, 255); Title.Size = UDim2.new(1, 0, 0, 50); Title.BackgroundTransparency = 1
    
    local TabContainer = Instance.new("Frame"); TabContainer.Parent = Sidebar; TabContainer.BackgroundTransparency = 1; TabContainer.Position = UDim2.new(0, 0, 0, 60); TabContainer.Size = UDim2.new(1, 0, 1, -60)
    local TabList = Instance.new("UIListLayout"); TabList.Parent = TabContainer; TabList.SortOrder = Enum.SortOrder.LayoutOrder; TabList.Padding = UDim.new(0, 5)

    local Content = Instance.new("Frame"); Content.Parent = Main; Content.BackgroundColor3 = Color3.fromRGB(18, 18, 18); Content.Position = UDim2.new(0, 140, 0, 10); Content.Size = UDim2.new(1, -150, 1, -20); Content.BackgroundTransparency = 1

    local WindowObj = {}; local first = true

    function WindowObj:Tab(text)
        local TabObj = {}
        local TabBtn = Instance.new("TextButton"); TabBtn.Parent = TabContainer; TabBtn.BackgroundTransparency = 1; TabBtn.Text = text; TabBtn.Font = Enum.Font.GothamMedium; TabBtn.TextSize = 14; TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150); TabBtn.Size = UDim2.new(1, -10, 0, 30)
        local Bar = Instance.new("Frame"); Bar.Parent = TabBtn; Bar.BackgroundColor3 = Color3.fromRGB(67, 137, 255); Bar.Size = UDim2.new(0, 3, 0, 20); Bar.Position = UDim2.new(0, 0, 0.5, -10); Bar.Visible = false
        
        local Page = Instance.new("ScrollingFrame"); Page.Parent = Content; Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.ScrollBarThickness = 2; Page.Visible = false
        local PageList = Instance.new("UIListLayout"); PageList.Parent = Page; PageList.SortOrder = Enum.SortOrder.LayoutOrder; PageList.Padding = UDim.new(0, 5)
        PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10) end)

        if first then first = false; Page.Visible = true; TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255); Bar.Visible = true end

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Content:GetChildren()) do v.Visible = false end
            for _, v in pairs(TabContainer:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(150, 150, 150); v.Frame.Visible = false end end
            Page.Visible = true; TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255); Bar.Visible = true
        end)

        function TabObj:Toggle(text, default, callback)
            local toggled = default
            local ToggleBtn = Instance.new("TextButton"); ToggleBtn.Parent = Page; ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); ToggleBtn.Size = UDim2.new(1, -5, 0, 40); ToggleBtn.Text = ""; ToggleBtn.AutoButtonColor = false; local TC = Instance.new("UICorner"); TC.CornerRadius = UDim.new(0, 4); TC.Parent = ToggleBtn
            local Title = Instance.new("TextLabel"); Title.Parent = ToggleBtn; Title.Text = text; Title.Font = Enum.Font.GothamMedium; Title.TextSize = 14; Title.TextColor3 = Color3.fromRGB(230, 230, 230); Title.Size = UDim2.new(1, -50, 1, 0); Title.Position = UDim2.new(0, 10, 0, 0); Title.BackgroundTransparency = 1; Title.TextXAlignment = Enum.TextXAlignment.Left
            local Check = Instance.new("Frame"); Check.Parent = ToggleBtn; Check.Size = UDim2.new(0, 20, 0, 20); Check.Position = UDim2.new(1, -30, 0.5, -10); Check.BackgroundColor3 = toggled and Color3.fromRGB(67, 137, 255) or Color3.fromRGB(40, 40, 40); local CC = Instance.new("UICorner"); CC.CornerRadius = UDim.new(0, 4); CC.Parent = Check
            ToggleBtn.MouseButton1Click:Connect(function() toggled = not toggled; Library:Tween(Check, {BackgroundColor3 = toggled and Color3.fromRGB(67, 137, 255) or Color3.fromRGB(40, 40, 40)}, 0.2); callback(toggled) end)
        end

        function TabObj:Slider(text, min, max, default, callback)
            local val = default
            local SliderFrame = Instance.new("Frame"); SliderFrame.Parent = Page; SliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25); SliderFrame.Size = UDim2.new(1, -5, 0, 55); local SC = Instance.new("UICorner"); SC.CornerRadius = UDim.new(0, 4); SC.Parent = SliderFrame
            local Title = Instance.new("TextLabel"); Title.Parent = SliderFrame; Title.Text = text; Title.Font = Enum.Font.GothamMedium; Title.TextSize = 14; Title.TextColor3 = Color3.fromRGB(230, 230, 230); Title.Size = UDim2.new(1, 0, 0, 25); Title.Position = UDim2.new(0, 10, 0, 0); Title.BackgroundTransparency = 1; Title.TextXAlignment = Enum.TextXAlignment.Left
            local ValLbl = Instance.new("TextLabel"); ValLbl.Parent = SliderFrame; ValLbl.Text = tostring(val); ValLbl.Font = Enum.Font.Gotham; ValLbl.TextSize = 14; ValLbl.TextColor3 = Color3.fromRGB(150, 150, 150); ValLbl.Size = UDim2.new(0, 50, 0, 25); ValLbl.Position = UDim2.new(1, -60, 0, 0); ValLbl.BackgroundTransparency = 1
            local BarBG = Instance.new("TextButton"); BarBG.Parent = SliderFrame; BarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40); BarBG.Size = UDim2.new(1, -20, 0, 6); BarBG.Position = UDim2.new(0, 10, 0, 35); BarBG.Text = ""; BarBG.AutoButtonColor = false; Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1, 0)
            local Fill = Instance.new("Frame"); Fill.Parent = BarBG; Fill.BackgroundColor3 = Color3.fromRGB(67, 137, 255); Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0); Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            local dragging = false
            local function update(input) local percent = math.clamp((input.Position.X - BarBG.AbsolutePosition.X) / BarBG.AbsoluteSize.X, 0, 1); val = math.floor(min + (max - min) * percent * 10) / 10; Library:Tween(Fill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1); ValLbl.Text = tostring(val); callback(val) end
            local c1 = BarBG.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; update(input) end end)
            local c2 = UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end end)
            local c3 = UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
            table.insert(Connections, c1); table.insert(Connections, c2); table.insert(Connections, c3)
        end
        
        function TabObj:Keybind(text, default, callback)
            local key = default
            local KeyFrame = Instance.new("TextButton"); KeyFrame.Parent = Page; KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25); KeyFrame.Size = UDim2.new(1, -5, 0, 40); KeyFrame.Text = ""; KeyFrame.AutoButtonColor = false; Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 4)
            local Title = Instance.new("TextLabel"); Title.Parent = KeyFrame; Title.Text = text; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.fromRGB(230, 230, 230); Title.Size = UDim2.new(0.5, 0, 1, 0); Title.Position = UDim2.new(0, 10, 0, 0); Title.BackgroundTransparency = 1; Title.TextXAlignment = Enum.TextXAlignment.Left
            local BindLbl = Instance.new("TextLabel"); BindLbl.Parent = KeyFrame; BindLbl.Text = key.Name; BindLbl.Font = Enum.Font.Gotham; BindLbl.TextColor3 = Color3.fromRGB(150, 150, 150); BindLbl.Size = UDim2.new(0.5, -10, 1, 0); BindLbl.Position = UDim2.new(0.5, 0, 0, 0); BindLbl.BackgroundTransparency = 1; BindLbl.TextXAlignment = Enum.TextXAlignment.Right
            local listening = false
            KeyFrame.MouseButton1Click:Connect(function() listening = true; BindLbl.Text = "..."; BindLbl.TextColor3 = Color3.fromRGB(67, 137, 255) end)
            local conn = UserInputService.InputBegan:Connect(function(input) if listening then if input.UserInputType ~= Enum.UserInputType.MouseMovement then key = (input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode or input.UserInputType; BindLbl.Text = key.Name; BindLbl.TextColor3 = Color3.fromRGB(150, 150, 150); listening = false; callback(key) end end end)
            table.insert(Connections, conn)
        end
        
        function TabObj:Button(text, callback)
            local Btn = Instance.new("TextButton")
            Btn.Parent = Page
            Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Btn.Size = UDim2.new(1, -5, 0, 40)
            Btn.Text = text
            Btn.Font = Enum.Font.GothamBold
            Btn.TextColor3 = Color3.fromRGB(255, 50, 50) 
            Btn.TextSize = 14
            Btn.AutoButtonColor = false
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
            Btn.MouseButton1Click:Connect(callback)
        end
        
        return TabObj
    end
    return WindowObj
end

-- [[ 5. MAIN LOGIC ]] --
local UI = Library:Window("1337")

local AimTab = UI:Tab("Aimbot")
AimTab:Toggle("Enable Aimbot", false, function(v) Settings.Aimbot_Enabled = v end)
AimTab:Toggle("Team Check", true, function(v) Settings.Aim_TeamCheck = v end)
-- [NEW] Silent Mode Toggle
AimTab:Toggle("Silent Mode (Force)", false, function(v) 
    Settings.Aimbot_Mode = v and "Force" or "Smooth" 
end)
AimTab:Keybind("Aim Key", Enum.UserInputType.MouseButton2, function(v) Settings.Aim_Key = v end)
AimTab:Slider("FOV Radius", 10, 500, 150, function(v) Settings.Aim_FOV = v end)
-- [UPDATED] Smoothness Max to 2
AimTab:Slider("Smoothness", 0.1, 2, 0.2, function(v) Settings.Aim_Smoothness = v end)

local VisTab = UI:Tab("Visuals")
VisTab:Toggle("Master Switch", false, function(v) 
    Settings.ESP_Enabled = v 
    if not v then 
        for _, obj in pairs(ESP_Cache) do 
            if obj.Box then obj.Box.Visible = false end 
            if obj.HeadCircle then obj.HeadCircle.Visible = false end 
            if obj.Lines then for _,l in pairs(obj.Lines) do l.Visible = false end end
        end 
    end
end)
VisTab:Toggle("2D Box", true, function(v) Settings.ESP_Box = v end)
VisTab:Toggle("Skeleton", true, function(v) Settings.ESP_Skeleton = v end)
VisTab:Toggle("Head Circle", true, function(v) Settings.ESP_Head = v end)

local MiscTab = UI:Tab("Misc")
MiscTab:Toggle("Enable Speed", false, function(v) Settings.Speed_Enabled = v end)
MiscTab:Slider("Speed Value", 0, 5, 1, function(v) Settings.Speed_Value = v end)
MiscTab:Toggle("Enable Fly", false, function(v) Settings.Fly_Enabled = v end)
MiscTab:Slider("Fly Speed", 0, 5, 1, function(v) Settings.Fly_Speed = v end)
MiscTab:Keybind("Toggle UI", Enum.KeyCode.RightShift, function(v) Settings.ToggleKey = v end)
MiscTab:Button("Unload Script", function() UnloadScript() end)

-- [[ 6. GAMEPLAY LOOPS ]] --

local leaveConn = Players.PlayerRemoving:Connect(function(plr)
    if ESP_Cache[plr] then
        if ESP_Cache[plr].Box then ESP_Cache[plr].Box:Destroy() end
        if ESP_Cache[plr].HeadCircle then ESP_Cache[plr].HeadCircle:Destroy() end
        if ESP_Cache[plr].Lines then for _, l in pairs(ESP_Cache[plr].Lines) do l:Destroy() end end
        ESP_Cache[plr] = nil
    end
end)
table.insert(Connections, leaveConn)

local function UpdateLine(frame, p1, p2)
    local distance = (p1 - p2).Magnitude
    local center = (p1 + p2) / 2
    local angle = math.atan2(p1.Y - p2.Y, p1.X - p2.X)
    frame.Position = UDim2.new(0, center.X, 0, center.Y)
    frame.Size = UDim2.new(0, distance, 0, 1.5)
    frame.Rotation = math.deg(angle)
    frame.Visible = true
end

local function RemoveESP(plr)
    if ESP_Cache[plr] then
        local visuals = ESP_Cache[plr]
        if visuals.Box then visuals.Box:Destroy() end
        if visuals.HeadCircle then visuals.HeadCircle:Destroy() end
        if visuals.Lines then for _, line in pairs(visuals.Lines) do if line then line:Destroy() end end end
        ESP_Cache[plr] = nil
    end
end

local function CreateESP(plr)
    local objects = { Box = Instance.new("Frame"), HeadCircle = Instance.new("Frame"), Lines = {} }
    objects.Box.Parent = ESPLayer; objects.Box.BackgroundColor3 = Color3.fromRGB(255,255,255); objects.Box.BackgroundTransparency = 1; objects.Box.BorderSizePixel = 0
    local s1 = Instance.new("UIStroke"); s1.Parent = objects.Box; s1.Color = Color3.fromRGB(255,50,50); s1.Thickness = 1.5
    objects.HeadCircle.Parent = ESPLayer; objects.HeadCircle.BackgroundColor3 = Color3.fromRGB(255,255,255); objects.HeadCircle.BackgroundTransparency = 1
    local s2 = Instance.new("UIStroke"); s2.Parent = objects.HeadCircle; s2.Color = Color3.fromRGB(255,50,50); s2.Thickness = 1.5
    local c2 = Instance.new("UICorner"); c2.CornerRadius = UDim.new(1, 0); c2.Parent = objects.HeadCircle
    for i=1, 20 do local l = Instance.new("Frame"); l.Parent = ESPLayer; l.BackgroundColor3 = Color3.fromRGB(50,255,50); l.BorderSizePixel = 0; l.AnchorPoint = Vector2.new(0.5,0.5); l.Visible = false; table.insert(objects.Lines, l) end
    ESP_Cache[plr] = objects
end

local Loop1 = RunService.RenderStepped:Connect(function()
    -- Anti-Stuck
    for plr, _ in pairs(ESP_Cache) do
        if not Players:FindFirstChild(plr.Name) then RemoveESP(plr) end
    end

    if FOV_Circle then
        FOV_Circle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOV_Circle.Radius = Settings.Aim_FOV
        FOV_Circle.Visible = Settings.Aimbot_Enabled
    end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        local char = plr.Character; local hum = char and char:FindFirstChild("Humanoid")
        if Settings.ESP_Enabled and char and hum and hum.Health > 0 then
            if Settings.Aim_TeamCheck and plr.Team == LocalPlayer.Team and plr.Team ~= nil then RemoveESP(plr); continue end
            if not ESP_Cache[plr] then CreateESP(plr) end
            local visuals = ESP_Cache[plr]
            local head = char:FindFirstChild("Head"); local root = char:FindFirstChild("HumanoidRootPart"); local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
            if root and head then
                local rootPos, rootVis = Camera:WorldToViewportPoint(root.Position)
                if rootVis then
                    if Settings.ESP_Box then
                        local topPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1, 0)); local botPos = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
                        local height = math.abs(topPos.Y - botPos.Y); local width = height * 0.65
                        visuals.Box.Size = UDim2.new(0, width, 0, height); visuals.Box.Position = UDim2.new(0, rootPos.X - width/2, 0, topPos.Y); visuals.Box.Visible = true
                    else visuals.Box.Visible = false end
                    if Settings.ESP_Head then
                        local headPos = Camera:WorldToViewportPoint(head.Position)
                        local height = math.abs(rootPos.Y - Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1, 0)).Y)
                        local circleSize = height * 0.8
                        visuals.HeadCircle.Size = UDim2.new(0, circleSize, 0, circleSize); visuals.HeadCircle.Position = UDim2.new(0, headPos.X - circleSize/2, 0, headPos.Y - circleSize/2); visuals.HeadCircle.Visible = true
                    else visuals.HeadCircle.Visible = false end
                    if Settings.ESP_Skeleton and torso then
                        local points = {{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","Torso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
                        local lineIdx = 1
                        for _, pair in pairs(points) do
                            local p1 = char:FindFirstChild(pair[1]); local p2 = char:FindFirstChild(pair[2])
                            if p1 and p2 then
                                local v1, vis1 = Camera:WorldToViewportPoint(p1.Position); local v2, vis2 = Camera:WorldToViewportPoint(p2.Position)
                                if lineIdx <= #visuals.Lines then UpdateLine(visuals.Lines[lineIdx], Vector2.new(v1.X, v1.Y), Vector2.new(v2.X, v2.Y)); lineIdx = lineIdx + 1 end
                            end
                        end
                        for i = lineIdx, #visuals.Lines do visuals.Lines[i].Visible = false end
                    else for _, line in pairs(visuals.Lines) do line.Visible = false end end
                else visuals.Box.Visible = false; visuals.HeadCircle.Visible = false; for _, line in pairs(visuals.Lines) do line.Visible = false end end
            end
        else RemoveESP(plr) end
    end
end)
table.insert(Connections, Loop1)

if Drawing then FOV_Circle = Drawing.new("Circle"); FOV_Circle.Color = Color3.fromRGB(255,255,255); FOV_Circle.Thickness = 1; FOV_Circle.NumSides = 64; FOV_Circle.Radius = Settings.Aim_FOV; FOV_Circle.Visible = false; FOV_Circle.Filled = false; FOV_Circle.Transparency = 1 end

local function GetClosestPlayer()
    local closest, shortest = nil, Settings.Aim_FOV
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            if Settings.Aim_TeamCheck and plr.Team == LocalPlayer.Team and plr.Team ~= nil then continue end
            local part = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (center - Vector2.new(pos.X, pos.Y)).Magnitude
                    if dist < shortest then closest = part; shortest = dist end
                end
            end
        end
    end
    return closest
end

local c1 = UserInputService.InputBegan:Connect(function(input) if (input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Settings.Aim_Key) or (input.UserInputType == Settings.Aim_Key) then IsAiming = true end end)
local c2 = UserInputService.InputEnded:Connect(function(input) if (input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Settings.Aim_Key) or (input.UserInputType == Settings.Aim_Key) then IsAiming = false end end)
table.insert(Connections, c1); table.insert(Connections, c2)

local Loop2 = RunService.RenderStepped:Connect(function()
    if Settings.Aimbot_Enabled and IsAiming then
        local target = GetClosestPlayer()
        if target then
            local pos = Camera:WorldToViewportPoint(target.Position)
            -- [UPDATED] Check Mode
            if Settings.Aimbot_Mode == "Force" then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
            elseif mousemoverel then
                 local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                 mousemoverel((pos.X - center.X) * Settings.Aim_Smoothness, (pos.Y - center.Y) * Settings.Aim_Smoothness)
            else
                 Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), Settings.Aim_Smoothness)
            end
        end
    end
end)
table.insert(Connections, Loop2)

local Loop3 = RunService.Heartbeat:Connect(function()
    if Settings.Speed_Enabled and Settings.Speed_Value > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + (LocalPlayer.Character.Humanoid.MoveDirection * Settings.Speed_Value * 0.5)
        end
    end

    if Settings.Fly_Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        local hum = LocalPlayer.Character.Humanoid
        root.Velocity = Vector3.new(0, 0, 0)
        local flyVec = Vector3.new(0,0,0)
        local cf = Camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then flyVec = flyVec + cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then flyVec = flyVec - cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then flyVec = flyVec - cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then flyVec = flyVec + cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then flyVec = flyVec + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then flyVec = flyVec - Vector3.new(0, 1, 0) end
        if flyVec.Magnitude > 0 then
            root.CFrame = root.CFrame + (flyVec * Settings.Fly_Speed * 0.5) 
        end
        hum.PlatformStand = true
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
    end
end)
table.insert(Connections, Loop3)
