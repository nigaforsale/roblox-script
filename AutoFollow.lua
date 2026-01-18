local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local targetPlayer = nil
local isFollowing = false
local connections = {}

local stopDistance = 5
local renderName = "FollowBot_Movement"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoFollow_V1"
if pcall(function() ScreenGui.Parent = CoreGui end) then else ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -150)
MainFrame.Size = UDim2.new(0, 260, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame; Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50); Title.BackgroundTransparency = 0; Title.Size = UDim2.new(1, 0, 0, 40); Title.Font = Enum.Font.GothamBold; Title.Text = "AutoFollow_V1"; Title.TextColor3 = Color3.fromRGB(255, 255, 255); Title.TextSize = 16; Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Parent = MainFrame; TargetLabel.BackgroundTransparency = 1; TargetLabel.Position = UDim2.new(0, 0, 0, 45); TargetLabel.Size = UDim2.new(1, 0, 0, 25); TargetLabel.Font = Enum.Font.Gotham; TargetLabel.Text = "Target: None"; TargetLabel.TextColor3 = Color3.fromRGB(200, 200, 200); TargetLabel.TextSize = 14

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame; ScrollingFrame.Active = true; ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40); ScrollingFrame.BorderSizePixel = 0; ScrollingFrame.Position = UDim2.new(0.05, 0, 0.25, 0); ScrollingFrame.Size = UDim2.new(0.9, 0, 0.5, 0); ScrollingFrame.ScrollBarThickness = 4
local UIListLayout = Instance.new("UIListLayout"); UIListLayout.Parent = ScrollingFrame; UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder; UIListLayout.Padding = UDim.new(0, 5)

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Parent = MainFrame; ButtonContainer.BackgroundTransparency = 1; ButtonContainer.Position = UDim2.new(0.05, 0, 0.78, 0); ButtonContainer.Size = UDim2.new(0.9, 0, 0.2, 0)
local UIListLayoutBtn = Instance.new("UIListLayout"); UIListLayoutBtn.Parent = ButtonContainer; UIListLayoutBtn.FillDirection = Enum.FillDirection.Horizontal; UIListLayoutBtn.SortOrder = Enum.SortOrder.LayoutOrder; UIListLayoutBtn.Padding = UDim.new(0, 10)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ButtonContainer; ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80); ToggleButton.Size = UDim2.new(0.65, 0, 1, 0); ToggleButton.Font = Enum.Font.GothamBold; ToggleButton.Text = "Start"; ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255); ToggleButton.TextSize = 16; Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 6)

local UnloadButton = Instance.new("TextButton")
UnloadButton.Parent = ButtonContainer; UnloadButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50); UnloadButton.Size = UDim2.new(0.3, 0, 1, 0); UnloadButton.Font = Enum.Font.GothamBold; UnloadButton.Text = "Close"; UnloadButton.TextColor3 = Color3.fromRGB(255, 255, 255); UnloadButton.TextSize = 14; Instance.new("UICorner", UnloadButton).CornerRadius = UDim.new(0, 6)

local function UpdateMovement()
    if not isFollowing or not targetPlayer or not targetPlayer.Character then return end
    
    local myChar = LocalPlayer.Character
    local targetChar = targetPlayer.Character
    if not myChar or not targetChar then return end

    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    local humanoid = myChar:FindFirstChild("Humanoid")

    if myHRP and targetHRP and humanoid and targetChar:FindFirstChild("Humanoid") and targetChar.Humanoid.Health > 0 then
        
        if myHRP.Anchored then myHRP.Anchored = false end

        local distance = (myHRP.Position - targetHRP.Position).Magnitude

        if distance > stopDistance then
            local lookVector = (targetHRP.Position - myHRP.Position)
            local moveDir = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
            
            humanoid.AutoRotate = true

            humanoid:Move(moveDir)

            if targetChar.Humanoid.Jump and not humanoid.Jump then
                humanoid.Jump = true
            end
        else
            humanoid:Move(Vector3.new(0,0,0))
        end
    end
end


local function StartFollowing()
    isFollowing = true
    ToggleButton.Text = "Stop"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 150, 50)
    
    RunService:BindToRenderStep(renderName, Enum.RenderPriority.Camera.Value + 1, UpdateMovement)
end

local function StopFollowing()
    isFollowing = false
    ToggleButton.Text = "Start"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
    
    pcall(function() RunService:UnbindFromRenderStep(renderName) end)
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0))
    end
end

local function UnloadScript()
    StopFollowing()
    for _, conn in pairs(connections) do if conn then conn:Disconnect() end end
    table.clear(connections)
    if ScreenGui then ScreenGui:Destroy() end
end

local function RefreshPlayerList()
    for _, child in pairs(ScrollingFrame:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local PlayerBtn = Instance.new("TextButton")
            PlayerBtn.Parent = ScrollingFrame; PlayerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60); PlayerBtn.Size = UDim2.new(1, -5, 0, 30); PlayerBtn.Font = Enum.Font.Gotham; PlayerBtn.Text = player.DisplayName .. " (@" .. player.Name .. ")"; PlayerBtn.TextColor3 = Color3.fromRGB(230, 230, 230); PlayerBtn.TextSize = 12; Instance.new("UICorner", PlayerBtn).CornerRadius = UDim.new(0, 4)
            PlayerBtn.MouseButton1Click:Connect(function()
                targetPlayer = player
                TargetLabel.Text = "Target: " .. player.DisplayName
                for _, btn in pairs(ScrollingFrame:GetChildren()) do if btn:IsA("TextButton") then btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60) end end
                PlayerBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
                if isFollowing then StopFollowing() end
            end)
        end
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if not targetPlayer then TargetLabel.Text = "Select a player first!"; return end
    if isFollowing then StopFollowing() else StartFollowing() end
end)

UnloadButton.MouseButton1Click:Connect(UnloadScript)
table.insert(connections, Players.PlayerAdded:Connect(RefreshPlayerList))
table.insert(connections, Players.PlayerRemoving:Connect(RefreshPlayerList))

RefreshPlayerList()
