local TABLE_TableIndirection = {};
TABLE_TableIndirection["Players%0"] = game:GetService("Players");
TABLE_TableIndirection["RunService%0"] = game:GetService("RunService");
TABLE_TableIndirection["UserInputService%0"] = game:GetService("UserInputService");
TABLE_TableIndirection["TweenService%0"] = game:GetService("TweenService");
TABLE_TableIndirection["Camera%0"] = workspace.CurrentCamera;
TABLE_TableIndirection["LocalPlayer%0"] = TABLE_TableIndirection["Players%0"].LocalPlayer;
TABLE_TableIndirection["Mouse%0"] = TABLE_TableIndirection["LocalPlayer%0"]:GetMouse();
TABLE_TableIndirection["Connections%0"] = {};
TABLE_TableIndirection["ESP_Cache%0"] = {};
TABLE_TableIndirection["FOV_Circle%0"] = nil;
TABLE_TableIndirection["UIVisible%0"] = true;
local MenuGui, ESPGui;
TABLE_TableIndirection["Settings%0"] = {ESP_Enabled=false,ESP_Box=true,ESP_Skeleton=true,ESP_Head=true,Speed_Enabled=false,Speed_Value=1,Fly_Enabled=false,Fly_Speed=1,Aimbot_Enabled=false,Aimbot_Mode="Smooth",Aim_FOV=150,Aim_Smoothness=0.2,Aim_TeamCheck=true,Aim_Key=Enum.UserInputType.MouseButton2,ToggleKey=Enum.KeyCode.RightShift};
TABLE_TableIndirection["IsAiming%0"] = false;
local function GetParent()
	if gethui then
		return gethui();
	end
	return game:GetService("CoreGui");
end
TABLE_TableIndirection["TargetParent%0"] = GetParent();
MenuGui = Instance.new("ScreenGui");
MenuGui.Name = "1337_Menu_v33";
MenuGui.IgnoreGuiInset = true;
MenuGui.ResetOnSpawn = false;
MenuGui.Parent = TABLE_TableIndirection["TargetParent%0"];
ESPGui = Instance.new("ScreenGui");
ESPGui.Name = "1337_Visuals_v33";
ESPGui.IgnoreGuiInset = true;
ESPGui.ResetOnSpawn = false;
ESPGui.Parent = TABLE_TableIndirection["TargetParent%0"];
TABLE_TableIndirection["ESPLayer%0"] = Instance.new("Frame");
TABLE_TableIndirection["ESPLayer%0"].Name = "ESPLayer";
TABLE_TableIndirection["ESPLayer%0"].Parent = ESPGui;
TABLE_TableIndirection["ESPLayer%0"].BackgroundTransparency = 1;
TABLE_TableIndirection["ESPLayer%0"].Size = UDim2.new(1, 0, 1, 0);
local function UnloadScript()
	for _, conn in pairs(TABLE_TableIndirection["Connections%0"]) do
		if conn then
			conn:Disconnect();
		end
	end
	TABLE_TableIndirection["Connections%0"] = {};
	if MenuGui then
		MenuGui:Destroy();
	end
	if ESPGui then
		ESPGui:Destroy();
	end
	if TABLE_TableIndirection["FOV_Circle%0"] then
		TABLE_TableIndirection["FOV_Circle%0"]:Remove();
	end
	if (TABLE_TableIndirection["LocalPlayer%0"].Character and TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("Humanoid")) then
		TABLE_TableIndirection["LocalPlayer%0"].Character.Humanoid.PlatformStand = false;
		if TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("HumanoidRootPart") then
			TABLE_TableIndirection["LocalPlayer%0"].Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);
		end
	end
end
TABLE_TableIndirection["Library%0"] = {};
TABLE_TableIndirection["Library%0"].Tween = function(self, obj, props, time)
	TABLE_TableIndirection["TweenService%0"]:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play();
end;
TABLE_TableIndirection["Library%0"].Window = function(self, name)
	TABLE_TableIndirection["conn%0"] = TABLE_TableIndirection["UserInputService%0"].InputBegan:Connect(function(input)
		if (input.KeyCode == TABLE_TableIndirection["Settings%0"].ToggleKey) then
			TABLE_TableIndirection["UIVisible%0"] = not TABLE_TableIndirection["UIVisible%0"];
			MenuGui.Enabled = TABLE_TableIndirection["UIVisible%0"];
		end
	end);
	table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["conn%0"]);
	TABLE_TableIndirection["Main%0"] = Instance.new("Frame");
	TABLE_TableIndirection["Main%0"].Name = "Main";
	TABLE_TableIndirection["Main%0"].Parent = MenuGui;
	TABLE_TableIndirection["Main%0"].BackgroundColor3 = Color3.fromRGB(18, 18, 18);
	TABLE_TableIndirection["Main%0"].Position = UDim2.new(0.3, 0, 0.3, 0);
	TABLE_TableIndirection["Main%0"].Size = UDim2.new(0, 500, 0, 350);
	TABLE_TableIndirection["Main%0"].ClipsDescendants = true;
	TABLE_TableIndirection["Main%0"].Active = true;
	TABLE_TableIndirection["Main%0"].Draggable = true;
	TABLE_TableIndirection["MainCorner%0"] = Instance.new("UICorner");
	TABLE_TableIndirection["MainCorner%0"].CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection["MainCorner%0"].Parent = TABLE_TableIndirection["Main%0"];
	TABLE_TableIndirection["MainStroke%0"] = Instance.new("UIStroke");
	TABLE_TableIndirection["MainStroke%0"].Color = Color3.fromRGB(40, 40, 40);
	TABLE_TableIndirection["MainStroke%0"].Thickness = 1;
	TABLE_TableIndirection["MainStroke%0"].Parent = TABLE_TableIndirection["Main%0"];
	TABLE_TableIndirection["Sidebar%0"] = Instance.new("Frame");
	TABLE_TableIndirection["Sidebar%0"].Parent = TABLE_TableIndirection["Main%0"];
	TABLE_TableIndirection["Sidebar%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
	TABLE_TableIndirection["Sidebar%0"].Size = UDim2.new(0, 130, 1, 0);
	TABLE_TableIndirection["Sidebar%0"].BorderSizePixel = 0;
	TABLE_TableIndirection["SidebarCorner%0"] = Instance.new("UICorner");
	TABLE_TableIndirection["SidebarCorner%0"].CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection["SidebarCorner%0"].Parent = TABLE_TableIndirection["Sidebar%0"];
	TABLE_TableIndirection["FixPatch%0"] = Instance.new("Frame", TABLE_TableIndirection["Sidebar%0"]);
	TABLE_TableIndirection["FixPatch%0"].BorderSizePixel = 0;
	TABLE_TableIndirection["FixPatch%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
	TABLE_TableIndirection["FixPatch%0"].Size = UDim2.new(0, 10, 1, 0);
	TABLE_TableIndirection["FixPatch%0"].Position = UDim2.new(1, -10, 0, 0);
	TABLE_TableIndirection["Title%0"] = Instance.new("TextLabel");
	TABLE_TableIndirection["Title%0"].Parent = TABLE_TableIndirection["Sidebar%0"];
	TABLE_TableIndirection["Title%0"].Text = name;
	TABLE_TableIndirection["Title%0"].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection["Title%0"].TextSize = 18;
	TABLE_TableIndirection["Title%0"].TextColor3 = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["Title%0"].Size = UDim2.new(1, 0, 0, 50);
	TABLE_TableIndirection["Title%0"].BackgroundTransparency = 1;
	TABLE_TableIndirection["TabContainer%0"] = Instance.new("Frame");
	TABLE_TableIndirection["TabContainer%0"].Parent = TABLE_TableIndirection["Sidebar%0"];
	TABLE_TableIndirection["TabContainer%0"].BackgroundTransparency = 1;
	TABLE_TableIndirection["TabContainer%0"].Position = UDim2.new(0, 0, 0, 60);
	TABLE_TableIndirection["TabContainer%0"].Size = UDim2.new(1, 0, 1, -60);
	TABLE_TableIndirection["TabList%0"] = Instance.new("UIListLayout");
	TABLE_TableIndirection["TabList%0"].Parent = TABLE_TableIndirection["TabContainer%0"];
	TABLE_TableIndirection["TabList%0"].SortOrder = Enum.SortOrder.LayoutOrder;
	TABLE_TableIndirection["TabList%0"].Padding = UDim.new(0, 5);
	TABLE_TableIndirection["Content%0"] = Instance.new("Frame");
	TABLE_TableIndirection["Content%0"].Parent = TABLE_TableIndirection["Main%0"];
	TABLE_TableIndirection["Content%0"].BackgroundColor3 = Color3.fromRGB(18, 18, 18);
	TABLE_TableIndirection["Content%0"].Position = UDim2.new(0, 140, 0, 10);
	TABLE_TableIndirection["Content%0"].Size = UDim2.new(1, -150, 1, -20);
	TABLE_TableIndirection["Content%0"].BackgroundTransparency = 1;
	TABLE_TableIndirection["WindowObj%0"] = {};
	TABLE_TableIndirection["first%0"] = true;
	TABLE_TableIndirection["WindowObj%0"].Tab = function(self, text)
		TABLE_TableIndirection["TabObj%0"] = {};
		TABLE_TableIndirection["TabBtn%0"] = Instance.new("TextButton");
		TABLE_TableIndirection["TabBtn%0"].Parent = TABLE_TableIndirection["TabContainer%0"];
		TABLE_TableIndirection["TabBtn%0"].BackgroundTransparency = 1;
		TABLE_TableIndirection["TabBtn%0"].Text = text;
		TABLE_TableIndirection["TabBtn%0"].Font = Enum.Font.GothamMedium;
		TABLE_TableIndirection["TabBtn%0"].TextSize = 14;
		TABLE_TableIndirection["TabBtn%0"].TextColor3 = Color3.fromRGB(150, 150, 150);
		TABLE_TableIndirection["TabBtn%0"].Size = UDim2.new(1, -10, 0, 30);
		TABLE_TableIndirection["Bar%0"] = Instance.new("Frame");
		TABLE_TableIndirection["Bar%0"].Parent = TABLE_TableIndirection["TabBtn%0"];
		TABLE_TableIndirection["Bar%0"].BackgroundColor3 = Color3.fromRGB(67, 137, 255);
		TABLE_TableIndirection["Bar%0"].Size = UDim2.new(0, 3, 0, 20);
		TABLE_TableIndirection["Bar%0"].Position = UDim2.new(0, 0, 0.5, -10);
		TABLE_TableIndirection["Bar%0"].Visible = false;
		TABLE_TableIndirection["Page%0"] = Instance.new("ScrollingFrame");
		TABLE_TableIndirection["Page%0"].Parent = TABLE_TableIndirection["Content%0"];
		TABLE_TableIndirection["Page%0"].Size = UDim2.new(1, 0, 1, 0);
		TABLE_TableIndirection["Page%0"].BackgroundTransparency = 1;
		TABLE_TableIndirection["Page%0"].ScrollBarThickness = 2;
		TABLE_TableIndirection["Page%0"].Visible = false;
		TABLE_TableIndirection["PageList%0"] = Instance.new("UIListLayout");
		TABLE_TableIndirection["PageList%0"].Parent = TABLE_TableIndirection["Page%0"];
		TABLE_TableIndirection["PageList%0"].SortOrder = Enum.SortOrder.LayoutOrder;
		TABLE_TableIndirection["PageList%0"].Padding = UDim.new(0, 5);
		TABLE_TableIndirection["PageList%0"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			TABLE_TableIndirection["Page%0"].CanvasSize = UDim2.new(0, 0, 0, TABLE_TableIndirection["PageList%0"].AbsoluteContentSize.Y + 10);
		end);
		if TABLE_TableIndirection["first%0"] then
			TABLE_TableIndirection["first%0"] = false;
			TABLE_TableIndirection["Page%0"].Visible = true;
			TABLE_TableIndirection["TabBtn%0"].TextColor3 = Color3.fromRGB(255, 255, 255);
			TABLE_TableIndirection["Bar%0"].Visible = true;
		end
		TABLE_TableIndirection["TabBtn%0"].MouseButton1Click:Connect(function()
			for _, v in pairs(TABLE_TableIndirection["Content%0"]:GetChildren()) do
				v.Visible = false;
			end
			for _, v in pairs(TABLE_TableIndirection["TabContainer%0"]:GetChildren()) do
				if v:IsA("TextButton") then
					v.TextColor3 = Color3.fromRGB(150, 150, 150);
					v.Frame.Visible = false;
				end
			end
			TABLE_TableIndirection["Page%0"].Visible = true;
			TABLE_TableIndirection["TabBtn%0"].TextColor3 = Color3.fromRGB(255, 255, 255);
			TABLE_TableIndirection["Bar%0"].Visible = true;
		end);
		TABLE_TableIndirection["TabObj%0"].Toggle = function(self, text, default, callback)
			TABLE_TableIndirection["toggled%0"] = default;
			TABLE_TableIndirection["ToggleBtn%0"] = Instance.new("TextButton");
			TABLE_TableIndirection["ToggleBtn%0"].Parent = TABLE_TableIndirection["Page%0"];
			TABLE_TableIndirection["ToggleBtn%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
			TABLE_TableIndirection["ToggleBtn%0"].Size = UDim2.new(1, -5, 0, 40);
			TABLE_TableIndirection["ToggleBtn%0"].Text = "";
			TABLE_TableIndirection["ToggleBtn%0"].AutoButtonColor = false;
			TABLE_TableIndirection["TC%0"] = Instance.new("UICorner");
			TABLE_TableIndirection["TC%0"].CornerRadius = UDim.new(0, 4);
			TABLE_TableIndirection["TC%0"].Parent = TABLE_TableIndirection["ToggleBtn%0"];
			TABLE_TableIndirection["Title%1"] = Instance.new("TextLabel");
			TABLE_TableIndirection["Title%1"].Parent = TABLE_TableIndirection["ToggleBtn%0"];
			TABLE_TableIndirection["Title%1"].Text = text;
			TABLE_TableIndirection["Title%1"].Font = Enum.Font.GothamMedium;
			TABLE_TableIndirection["Title%1"].TextSize = 14;
			TABLE_TableIndirection["Title%1"].TextColor3 = Color3.fromRGB(230, 230, 230);
			TABLE_TableIndirection["Title%1"].Size = UDim2.new(1, -50, 1, 0);
			TABLE_TableIndirection["Title%1"].Position = UDim2.new(0, 10, 0, 0);
			TABLE_TableIndirection["Title%1"].BackgroundTransparency = 1;
			TABLE_TableIndirection["Title%1"].TextXAlignment = Enum.TextXAlignment.Left;
			TABLE_TableIndirection["Check%0"] = Instance.new("Frame");
			TABLE_TableIndirection["Check%0"].Parent = TABLE_TableIndirection["ToggleBtn%0"];
			TABLE_TableIndirection["Check%0"].Size = UDim2.new(0, 20, 0, 20);
			TABLE_TableIndirection["Check%0"].Position = UDim2.new(1, -30, 0.5, -10);
			TABLE_TableIndirection["Check%0"].BackgroundColor3 = (TABLE_TableIndirection["toggled%0"] and Color3.fromRGB(67, 137, 255)) or Color3.fromRGB(40, 40, 40);
			TABLE_TableIndirection["CC%0"] = Instance.new("UICorner");
			TABLE_TableIndirection["CC%0"].CornerRadius = UDim.new(0, 4);
			TABLE_TableIndirection["CC%0"].Parent = TABLE_TableIndirection["Check%0"];
			TABLE_TableIndirection["ToggleBtn%0"].MouseButton1Click:Connect(function()
				TABLE_TableIndirection["toggled%0"] = not TABLE_TableIndirection["toggled%0"];
				TABLE_TableIndirection["Library%0"]:Tween(TABLE_TableIndirection["Check%0"], {BackgroundColor3=((TABLE_TableIndirection["toggled%0"] and Color3.fromRGB(67, 137, 255)) or Color3.fromRGB(40, 40, 40))}, 0.2);
				callback(TABLE_TableIndirection["toggled%0"]);
			end);
		end;
		TABLE_TableIndirection["TabObj%0"].Slider = function(self, text, min, max, default, callback)
			TABLE_TableIndirection["val%0"] = default;
			TABLE_TableIndirection["SliderFrame%0"] = Instance.new("Frame");
			TABLE_TableIndirection["SliderFrame%0"].Parent = TABLE_TableIndirection["Page%0"];
			TABLE_TableIndirection["SliderFrame%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
			TABLE_TableIndirection["SliderFrame%0"].Size = UDim2.new(1, -5, 0, 55);
			TABLE_TableIndirection["SC%0"] = Instance.new("UICorner");
			TABLE_TableIndirection["SC%0"].CornerRadius = UDim.new(0, 4);
			TABLE_TableIndirection["SC%0"].Parent = TABLE_TableIndirection["SliderFrame%0"];
			TABLE_TableIndirection["Title%1"] = Instance.new("TextLabel");
			TABLE_TableIndirection["Title%1"].Parent = TABLE_TableIndirection["SliderFrame%0"];
			TABLE_TableIndirection["Title%1"].Text = text;
			TABLE_TableIndirection["Title%1"].Font = Enum.Font.GothamMedium;
			TABLE_TableIndirection["Title%1"].TextSize = 14;
			TABLE_TableIndirection["Title%1"].TextColor3 = Color3.fromRGB(230, 230, 230);
			TABLE_TableIndirection["Title%1"].Size = UDim2.new(1, 0, 0, 25);
			TABLE_TableIndirection["Title%1"].Position = UDim2.new(0, 10, 0, 0);
			TABLE_TableIndirection["Title%1"].BackgroundTransparency = 1;
			TABLE_TableIndirection["Title%1"].TextXAlignment = Enum.TextXAlignment.Left;
			TABLE_TableIndirection["ValLbl%0"] = Instance.new("TextLabel");
			TABLE_TableIndirection["ValLbl%0"].Parent = TABLE_TableIndirection["SliderFrame%0"];
			TABLE_TableIndirection["ValLbl%0"].Text = tostring(TABLE_TableIndirection["val%0"]);
			TABLE_TableIndirection["ValLbl%0"].Font = Enum.Font.Gotham;
			TABLE_TableIndirection["ValLbl%0"].TextSize = 14;
			TABLE_TableIndirection["ValLbl%0"].TextColor3 = Color3.fromRGB(150, 150, 150);
			TABLE_TableIndirection["ValLbl%0"].Size = UDim2.new(0, 50, 0, 25);
			TABLE_TableIndirection["ValLbl%0"].Position = UDim2.new(1, -60, 0, 0);
			TABLE_TableIndirection["ValLbl%0"].BackgroundTransparency = 1;
			TABLE_TableIndirection["BarBG%0"] = Instance.new("TextButton");
			TABLE_TableIndirection["BarBG%0"].Parent = TABLE_TableIndirection["SliderFrame%0"];
			TABLE_TableIndirection["BarBG%0"].BackgroundColor3 = Color3.fromRGB(40, 40, 40);
			TABLE_TableIndirection["BarBG%0"].Size = UDim2.new(1, -20, 0, 6);
			TABLE_TableIndirection["BarBG%0"].Position = UDim2.new(0, 10, 0, 35);
			TABLE_TableIndirection["BarBG%0"].Text = "";
			TABLE_TableIndirection["BarBG%0"].AutoButtonColor = false;
			Instance.new("UICorner", TABLE_TableIndirection["BarBG%0"]).CornerRadius = UDim.new(1, 0);
			TABLE_TableIndirection["Fill%0"] = Instance.new("Frame");
			TABLE_TableIndirection["Fill%0"].Parent = TABLE_TableIndirection["BarBG%0"];
			TABLE_TableIndirection["Fill%0"].BackgroundColor3 = Color3.fromRGB(67, 137, 255);
			TABLE_TableIndirection["Fill%0"].Size = UDim2.new((TABLE_TableIndirection["val%0"] - min) / (max - min), 0, 1, 0);
			Instance.new("UICorner", TABLE_TableIndirection["Fill%0"]).CornerRadius = UDim.new(1, 0);
			TABLE_TableIndirection["dragging%0"] = false;
			local function update(input)
				TABLE_TableIndirection["percent%0"] = math.clamp((input.Position.X - TABLE_TableIndirection["BarBG%0"].AbsolutePosition.X) / TABLE_TableIndirection["BarBG%0"].AbsoluteSize.X, 0, 1);
				TABLE_TableIndirection["val%0"] = math.floor(min + ((max - min) * TABLE_TableIndirection["percent%0"] * 10)) / 10;
				TABLE_TableIndirection["Library%0"]:Tween(TABLE_TableIndirection["Fill%0"], {Size=UDim2.new(TABLE_TableIndirection["percent%0"], 0, 1, 0)}, 0.1);
				TABLE_TableIndirection["ValLbl%0"].Text = tostring(TABLE_TableIndirection["val%0"]);
				callback(TABLE_TableIndirection["val%0"]);
			end
			TABLE_TableIndirection["c1%0"] = TABLE_TableIndirection["BarBG%0"].InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1) then
					TABLE_TableIndirection["dragging%0"] = true;
					update(input);
				end
			end);
			TABLE_TableIndirection["c2%0"] = TABLE_TableIndirection["UserInputService%0"].InputChanged:Connect(function(input)
				if (TABLE_TableIndirection["dragging%0"] and (input.UserInputType == Enum.UserInputType.MouseMovement)) then
					update(input);
				end
			end);
			TABLE_TableIndirection["c3%0"] = TABLE_TableIndirection["UserInputService%0"].InputEnded:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1) then
					TABLE_TableIndirection["dragging%0"] = false;
				end
			end);
			table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["c1%0"]);
			table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["c2%0"]);
			table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["c3%0"]);
		end;
		TABLE_TableIndirection["TabObj%0"].Keybind = function(self, text, default, callback)
			TABLE_TableIndirection["key%0"] = default;
			TABLE_TableIndirection["KeyFrame%0"] = Instance.new("TextButton");
			TABLE_TableIndirection["KeyFrame%0"].Parent = TABLE_TableIndirection["Page%0"];
			TABLE_TableIndirection["KeyFrame%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
			TABLE_TableIndirection["KeyFrame%0"].Size = UDim2.new(1, -5, 0, 40);
			TABLE_TableIndirection["KeyFrame%0"].Text = "";
			TABLE_TableIndirection["KeyFrame%0"].AutoButtonColor = false;
			Instance.new("UICorner", TABLE_TableIndirection["KeyFrame%0"]).CornerRadius = UDim.new(0, 4);
			TABLE_TableIndirection["Title%1"] = Instance.new("TextLabel");
			TABLE_TableIndirection["Title%1"].Parent = TABLE_TableIndirection["KeyFrame%0"];
			TABLE_TableIndirection["Title%1"].Text = text;
			TABLE_TableIndirection["Title%1"].Font = Enum.Font.GothamMedium;
			TABLE_TableIndirection["Title%1"].TextColor3 = Color3.fromRGB(230, 230, 230);
			TABLE_TableIndirection["Title%1"].Size = UDim2.new(0.5, 0, 1, 0);
			TABLE_TableIndirection["Title%1"].Position = UDim2.new(0, 10, 0, 0);
			TABLE_TableIndirection["Title%1"].BackgroundTransparency = 1;
			TABLE_TableIndirection["Title%1"].TextXAlignment = Enum.TextXAlignment.Left;
			TABLE_TableIndirection["BindLbl%0"] = Instance.new("TextLabel");
			TABLE_TableIndirection["BindLbl%0"].Parent = TABLE_TableIndirection["KeyFrame%0"];
			TABLE_TableIndirection["BindLbl%0"].Text = TABLE_TableIndirection["key%0"].Name;
			TABLE_TableIndirection["BindLbl%0"].Font = Enum.Font.Gotham;
			TABLE_TableIndirection["BindLbl%0"].TextColor3 = Color3.fromRGB(150, 150, 150);
			TABLE_TableIndirection["BindLbl%0"].Size = UDim2.new(0.5, -10, 1, 0);
			TABLE_TableIndirection["BindLbl%0"].Position = UDim2.new(0.5, 0, 0, 0);
			TABLE_TableIndirection["BindLbl%0"].BackgroundTransparency = 1;
			TABLE_TableIndirection["BindLbl%0"].TextXAlignment = Enum.TextXAlignment.Right;
			TABLE_TableIndirection["listening%0"] = false;
			TABLE_TableIndirection["KeyFrame%0"].MouseButton1Click:Connect(function()
				TABLE_TableIndirection["listening%0"] = true;
				TABLE_TableIndirection["BindLbl%0"].Text = "...";
				TABLE_TableIndirection["BindLbl%0"].TextColor3 = Color3.fromRGB(67, 137, 255);
			end);
			TABLE_TableIndirection["conn%1"] = TABLE_TableIndirection["UserInputService%0"].InputBegan:Connect(function(input)
				if TABLE_TableIndirection["listening%0"] then
					if (input.UserInputType ~= Enum.UserInputType.MouseMovement) then
						TABLE_TableIndirection["key%0"] = ((input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode) or input.UserInputType;
						TABLE_TableIndirection["BindLbl%0"].Text = TABLE_TableIndirection["key%0"].Name;
						TABLE_TableIndirection["BindLbl%0"].TextColor3 = Color3.fromRGB(150, 150, 150);
						TABLE_TableIndirection["listening%0"] = false;
						callback(TABLE_TableIndirection["key%0"]);
					end
				end
			end);
			table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["conn%1"]);
		end;
		TABLE_TableIndirection["TabObj%0"].Button = function(self, text, callback)
			TABLE_TableIndirection["Btn%0"] = Instance.new("TextButton");
			TABLE_TableIndirection["Btn%0"].Parent = TABLE_TableIndirection["Page%0"];
			TABLE_TableIndirection["Btn%0"].BackgroundColor3 = Color3.fromRGB(25, 25, 25);
			TABLE_TableIndirection["Btn%0"].Size = UDim2.new(1, -5, 0, 40);
			TABLE_TableIndirection["Btn%0"].Text = text;
			TABLE_TableIndirection["Btn%0"].Font = Enum.Font.GothamBold;
			TABLE_TableIndirection["Btn%0"].TextColor3 = Color3.fromRGB(255, 50, 50);
			TABLE_TableIndirection["Btn%0"].TextSize = 14;
			TABLE_TableIndirection["Btn%0"].AutoButtonColor = false;
			Instance.new("UICorner", TABLE_TableIndirection["Btn%0"]).CornerRadius = UDim.new(0, 4);
			TABLE_TableIndirection["Btn%0"].MouseButton1Click:Connect(callback);
		end;
		return TABLE_TableIndirection["TabObj%0"];
	end;
	return TABLE_TableIndirection["WindowObj%0"];
end;
TABLE_TableIndirection["UI%0"] = TABLE_TableIndirection["Library%0"]:Window("1337");
TABLE_TableIndirection["AimTab%0"] = TABLE_TableIndirection["UI%0"]:Tab("Aimbot");
TABLE_TableIndirection["AimTab%0"]:Toggle("Enable Aimbot", false, function(v)
	TABLE_TableIndirection["Settings%0"].Aimbot_Enabled = v;
end);
TABLE_TableIndirection["AimTab%0"]:Toggle("Team Check", true, function(v)
	TABLE_TableIndirection["Settings%0"].Aim_TeamCheck = v;
end);
TABLE_TableIndirection["AimTab%0"]:Toggle("Silent Mode (Force)", false, function(v)
	TABLE_TableIndirection["Settings%0"].Aimbot_Mode = (v and "Force") or "Smooth";
end);
TABLE_TableIndirection["AimTab%0"]:Keybind("Aim Key", Enum.UserInputType.MouseButton2, function(v)
	TABLE_TableIndirection["Settings%0"].Aim_Key = v;
end);
TABLE_TableIndirection["AimTab%0"]:Slider("FOV Radius", 10, 500, 150, function(v)
	TABLE_TableIndirection["Settings%0"].Aim_FOV = v;
end);
TABLE_TableIndirection["AimTab%0"]:Slider("Smoothness", 0.1, 2, 0.2, function(v)
	TABLE_TableIndirection["Settings%0"].Aim_Smoothness = v;
end);
TABLE_TableIndirection["VisTab%0"] = TABLE_TableIndirection["UI%0"]:Tab("Visuals");
TABLE_TableIndirection["VisTab%0"]:Toggle("Master Switch", false, function(v)
	TABLE_TableIndirection["Settings%0"].ESP_Enabled = v;
	if not v then
		for _, obj in pairs(TABLE_TableIndirection["ESP_Cache%0"]) do
			if obj.Box then
				obj.Box.Visible = false;
			end
			if obj.HeadCircle then
				obj.HeadCircle.Visible = false;
			end
			if obj.Lines then
				for _, l in pairs(obj.Lines) do
					l.Visible = false;
				end
			end
		end
	end
end);
TABLE_TableIndirection["VisTab%0"]:Toggle("2D Box", true, function(v)
	TABLE_TableIndirection["Settings%0"].ESP_Box = v;
end);
TABLE_TableIndirection["VisTab%0"]:Toggle("Skeleton", true, function(v)
	TABLE_TableIndirection["Settings%0"].ESP_Skeleton = v;
end);
TABLE_TableIndirection["VisTab%0"]:Toggle("Head Circle", true, function(v)
	TABLE_TableIndirection["Settings%0"].ESP_Head = v;
end);
TABLE_TableIndirection["MiscTab%0"] = TABLE_TableIndirection["UI%0"]:Tab("Misc");
TABLE_TableIndirection["MiscTab%0"]:Toggle("Enable Speed", false, function(v)
	TABLE_TableIndirection["Settings%0"].Speed_Enabled = v;
end);
TABLE_TableIndirection["MiscTab%0"]:Slider("Speed Value", 0, 5, 1, function(v)
	TABLE_TableIndirection["Settings%0"].Speed_Value = v;
end);
TABLE_TableIndirection["MiscTab%0"]:Toggle("Enable Fly", false, function(v)
	TABLE_TableIndirection["Settings%0"].Fly_Enabled = v;
end);
TABLE_TableIndirection["MiscTab%0"]:Slider("Fly Speed", 0, 5, 1, function(v)
	TABLE_TableIndirection["Settings%0"].Fly_Speed = v;
end);
TABLE_TableIndirection["MiscTab%0"]:Keybind("Toggle UI", Enum.KeyCode.RightShift, function(v)
	TABLE_TableIndirection["Settings%0"].ToggleKey = v;
end);
TABLE_TableIndirection["MiscTab%0"]:Button("Unload Script", function()
	UnloadScript();
end);
TABLE_TableIndirection["leaveConn%0"] = TABLE_TableIndirection["Players%0"].PlayerRemoving:Connect(function(plr)
	if TABLE_TableIndirection["ESP_Cache%0"][plr] then
		if TABLE_TableIndirection["ESP_Cache%0"][plr].Box then
			TABLE_TableIndirection["ESP_Cache%0"][plr].Box:Destroy();
		end
		if TABLE_TableIndirection["ESP_Cache%0"][plr].HeadCircle then
			TABLE_TableIndirection["ESP_Cache%0"][plr].HeadCircle:Destroy();
		end
		if TABLE_TableIndirection["ESP_Cache%0"][plr].Lines then
			for _, l in pairs(TABLE_TableIndirection["ESP_Cache%0"][plr].Lines) do
				l:Destroy();
			end
		end
		TABLE_TableIndirection["ESP_Cache%0"][plr] = nil;
	end
end);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["leaveConn%0"]);
local function UpdateLine(frame, p1, p2)
	TABLE_TableIndirection["distance%0"] = (p1 - p2).Magnitude;
	TABLE_TableIndirection["center%0"] = (p1 + p2) / 2;
	TABLE_TableIndirection["angle%0"] = math.atan2(p1.Y - p2.Y, p1.X - p2.X);
	frame.Position = UDim2.new(0, TABLE_TableIndirection["center%0"].X, 0, TABLE_TableIndirection["center%0"].Y);
	frame.Size = UDim2.new(0, TABLE_TableIndirection["distance%0"], 0, 1.5);
	frame.Rotation = math.deg(TABLE_TableIndirection["angle%0"]);
	frame.Visible = true;
end
local function RemoveESP(plr)
	if TABLE_TableIndirection["ESP_Cache%0"][plr] then
		TABLE_TableIndirection["visuals%0"] = TABLE_TableIndirection["ESP_Cache%0"][plr];
		if TABLE_TableIndirection["visuals%0"].Box then
			TABLE_TableIndirection["visuals%0"].Box:Destroy();
		end
		if TABLE_TableIndirection["visuals%0"].HeadCircle then
			TABLE_TableIndirection["visuals%0"].HeadCircle:Destroy();
		end
		if TABLE_TableIndirection["visuals%0"].Lines then
			for _, line in pairs(TABLE_TableIndirection["visuals%0"].Lines) do
				if line then
					line:Destroy();
				end
			end
		end
		TABLE_TableIndirection["ESP_Cache%0"][plr] = nil;
	end
end
local function CreateESP(plr)
	TABLE_TableIndirection["objects%0"] = {Box=Instance.new("Frame"),HeadCircle=Instance.new("Frame"),Lines={}};
	TABLE_TableIndirection["objects%0"].Box.Parent = TABLE_TableIndirection["ESPLayer%0"];
	TABLE_TableIndirection["objects%0"].Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["objects%0"].Box.BackgroundTransparency = 1;
	TABLE_TableIndirection["objects%0"].Box.BorderSizePixel = 0;
	TABLE_TableIndirection["s1%0"] = Instance.new("UIStroke");
	TABLE_TableIndirection["s1%0"].Parent = TABLE_TableIndirection["objects%0"].Box;
	TABLE_TableIndirection["s1%0"].Color = Color3.fromRGB(255, 50, 50);
	TABLE_TableIndirection["s1%0"].Thickness = 1.5;
	TABLE_TableIndirection["objects%0"].HeadCircle.Parent = TABLE_TableIndirection["ESPLayer%0"];
	TABLE_TableIndirection["objects%0"].HeadCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["objects%0"].HeadCircle.BackgroundTransparency = 1;
	TABLE_TableIndirection["s2%0"] = Instance.new("UIStroke");
	TABLE_TableIndirection["s2%0"].Parent = TABLE_TableIndirection["objects%0"].HeadCircle;
	TABLE_TableIndirection["s2%0"].Color = Color3.fromRGB(255, 50, 50);
	TABLE_TableIndirection["s2%0"].Thickness = 1.5;
	TABLE_TableIndirection["c2%0"] = Instance.new("UICorner");
	TABLE_TableIndirection["c2%0"].CornerRadius = UDim.new(1, 0);
	TABLE_TableIndirection["c2%0"].Parent = TABLE_TableIndirection["objects%0"].HeadCircle;
	for i = 1, 20 do
		TABLE_TableIndirection["l%0"] = Instance.new("Frame");
		TABLE_TableIndirection["l%0"].Parent = TABLE_TableIndirection["ESPLayer%0"];
		TABLE_TableIndirection["l%0"].BackgroundColor3 = Color3.fromRGB(50, 255, 50);
		TABLE_TableIndirection["l%0"].BorderSizePixel = 0;
		TABLE_TableIndirection["l%0"].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection["l%0"].Visible = false;
		table.insert(TABLE_TableIndirection["objects%0"].Lines, TABLE_TableIndirection["l%0"]);
	end
	TABLE_TableIndirection["ESP_Cache%0"][plr] = TABLE_TableIndirection["objects%0"];
end
TABLE_TableIndirection["Loop1%0"] = TABLE_TableIndirection["RunService%0"].RenderStepped:Connect(function()
	for plr, _ in pairs(TABLE_TableIndirection["ESP_Cache%0"]) do
		if not TABLE_TableIndirection["Players%0"]:FindFirstChild(plr.Name) then
			RemoveESP(plr);
		end
	end
	if TABLE_TableIndirection["FOV_Circle%0"] then
		TABLE_TableIndirection["FOV_Circle%0"].Position = Vector2.new(TABLE_TableIndirection["Camera%0"].ViewportSize.X / 2, TABLE_TableIndirection["Camera%0"].ViewportSize.Y / 2);
		TABLE_TableIndirection["FOV_Circle%0"].Radius = TABLE_TableIndirection["Settings%0"].Aim_FOV;
		TABLE_TableIndirection["FOV_Circle%0"].Visible = TABLE_TableIndirection["Settings%0"].Aimbot_Enabled;
	end
	for _, plr in pairs(TABLE_TableIndirection["Players%0"]:GetPlayers()) do
		if (plr == TABLE_TableIndirection["LocalPlayer%0"]) then
			continue;
		end
		TABLE_TableIndirection["char%0"] = plr.Character;
		TABLE_TableIndirection["hum%0"] = TABLE_TableIndirection["char%0"] and TABLE_TableIndirection["char%0"]:FindFirstChild("Humanoid");
		if (TABLE_TableIndirection["Settings%0"].ESP_Enabled and TABLE_TableIndirection["char%0"] and TABLE_TableIndirection["hum%0"] and (TABLE_TableIndirection["hum%0"].Health > 0)) then
			if (TABLE_TableIndirection["Settings%0"].Aim_TeamCheck and (plr.Team == TABLE_TableIndirection["LocalPlayer%0"].Team) and (plr.Team ~= nil)) then
				RemoveESP(plr);
				continue;
			end
			if not TABLE_TableIndirection["ESP_Cache%0"][plr] then
				CreateESP(plr);
			end
			TABLE_TableIndirection["visuals%0"] = TABLE_TableIndirection["ESP_Cache%0"][plr];
			TABLE_TableIndirection["head%0"] = TABLE_TableIndirection["char%0"]:FindFirstChild("Head");
			TABLE_TableIndirection["root%0"] = TABLE_TableIndirection["char%0"]:FindFirstChild("HumanoidRootPart");
			TABLE_TableIndirection["torso%0"] = TABLE_TableIndirection["char%0"]:FindFirstChild("UpperTorso") or TABLE_TableIndirection["char%0"]:FindFirstChild("Torso");
			if (TABLE_TableIndirection["root%0"] and TABLE_TableIndirection["head%0"]) then
				local rootPos, rootVis = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["root%0"].Position);
				if rootVis then
					if TABLE_TableIndirection["Settings%0"].ESP_Box then
						TABLE_TableIndirection["topPos%0"] = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["head%0"].Position + Vector3.new(0, 1, 0));
						TABLE_TableIndirection["botPos%0"] = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["root%0"].Position - Vector3.new(0, 3, 0));
						TABLE_TableIndirection["height%0"] = math.abs(TABLE_TableIndirection["topPos%0"].Y - TABLE_TableIndirection["botPos%0"].Y);
						TABLE_TableIndirection["width%0"] = TABLE_TableIndirection["height%0"] * 0.65;
						TABLE_TableIndirection["visuals%0"].Box.Size = UDim2.new(0, TABLE_TableIndirection["width%0"], 0, TABLE_TableIndirection["height%0"]);
						TABLE_TableIndirection["visuals%0"].Box.Position = UDim2.new(0, rootPos.X - (TABLE_TableIndirection["width%0"] / 2), 0, TABLE_TableIndirection["topPos%0"].Y);
						TABLE_TableIndirection["visuals%0"].Box.Visible = true;
					else
						TABLE_TableIndirection["visuals%0"].Box.Visible = false;
					end
					if TABLE_TableIndirection["Settings%0"].ESP_Head then
						TABLE_TableIndirection["headPos%0"] = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["head%0"].Position);
						TABLE_TableIndirection["height%0"] = math.abs(rootPos.Y - TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["head%0"].Position + Vector3.new(0, 1, 0)).Y);
						TABLE_TableIndirection["circleSize%0"] = TABLE_TableIndirection["height%0"] * 0.8;
						TABLE_TableIndirection["visuals%0"].HeadCircle.Size = UDim2.new(0, TABLE_TableIndirection["circleSize%0"], 0, TABLE_TableIndirection["circleSize%0"]);
						TABLE_TableIndirection["visuals%0"].HeadCircle.Position = UDim2.new(0, TABLE_TableIndirection["headPos%0"].X - (TABLE_TableIndirection["circleSize%0"] / 2), 0, TABLE_TableIndirection["headPos%0"].Y - (TABLE_TableIndirection["circleSize%0"] / 2));
						TABLE_TableIndirection["visuals%0"].HeadCircle.Visible = true;
					else
						TABLE_TableIndirection["visuals%0"].HeadCircle.Visible = false;
					end
					if (TABLE_TableIndirection["Settings%0"].ESP_Skeleton and TABLE_TableIndirection["torso%0"]) then
						TABLE_TableIndirection["points%0"] = {{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","Torso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}};
						TABLE_TableIndirection["lineIdx%0"] = 1;
						for _, pair in pairs(TABLE_TableIndirection["points%0"]) do
							TABLE_TableIndirection["p1%0"] = TABLE_TableIndirection["char%0"]:FindFirstChild(pair[1]);
							TABLE_TableIndirection["p2%0"] = TABLE_TableIndirection["char%0"]:FindFirstChild(pair[2]);
							if (TABLE_TableIndirection["p1%0"] and TABLE_TableIndirection["p2%0"]) then
								local v1, vis1 = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["p1%0"].Position);
								local v2, vis2 = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["p2%0"].Position);
								if (TABLE_TableIndirection["lineIdx%0"] <= #TABLE_TableIndirection["visuals%0"].Lines) then
									UpdateLine(TABLE_TableIndirection["visuals%0"].Lines[TABLE_TableIndirection["lineIdx%0"]], Vector2.new(v1.X, v1.Y), Vector2.new(v2.X, v2.Y));
									TABLE_TableIndirection["lineIdx%0"] = TABLE_TableIndirection["lineIdx%0"] + 1;
								end
							end
						end
						for i = TABLE_TableIndirection["lineIdx%0"], #TABLE_TableIndirection["visuals%0"].Lines do
							TABLE_TableIndirection["visuals%0"].Lines[i].Visible = false;
						end
					else
						for _, line in pairs(TABLE_TableIndirection["visuals%0"].Lines) do
							line.Visible = false;
						end
					end
				else
					TABLE_TableIndirection["visuals%0"].Box.Visible = false;
					TABLE_TableIndirection["visuals%0"].HeadCircle.Visible = false;
					for _, line in pairs(TABLE_TableIndirection["visuals%0"].Lines) do
						line.Visible = false;
					end
				end
			end
		else
			RemoveESP(plr);
		end
	end
end);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["Loop1%0"]);
if Drawing then
	TABLE_TableIndirection["FOV_Circle%0"] = Drawing.new("Circle");
	TABLE_TableIndirection["FOV_Circle%0"].Color = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["FOV_Circle%0"].Thickness = 1;
	TABLE_TableIndirection["FOV_Circle%0"].NumSides = 64;
	TABLE_TableIndirection["FOV_Circle%0"].Radius = TABLE_TableIndirection["Settings%0"].Aim_FOV;
	TABLE_TableIndirection["FOV_Circle%0"].Visible = false;
	TABLE_TableIndirection["FOV_Circle%0"].Filled = false;
	TABLE_TableIndirection["FOV_Circle%0"].Transparency = 1;
end
local function GetClosestPlayer()
	local closest, shortest = nil, TABLE_TableIndirection["Settings%0"].Aim_FOV;
	TABLE_TableIndirection["center%0"] = Vector2.new(TABLE_TableIndirection["Camera%0"].ViewportSize.X / 2, TABLE_TableIndirection["Camera%0"].ViewportSize.Y / 2);
	for _, plr in pairs(TABLE_TableIndirection["Players%0"]:GetPlayers()) do
		if ((plr ~= TABLE_TableIndirection["LocalPlayer%0"]) and plr.Character and plr.Character:FindFirstChild("Humanoid") and (plr.Character.Humanoid.Health > 0)) then
			if (TABLE_TableIndirection["Settings%0"].Aim_TeamCheck and (plr.Team == TABLE_TableIndirection["LocalPlayer%0"].Team) and (plr.Team ~= nil)) then
				continue;
			end
			TABLE_TableIndirection["part%0"] = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("HumanoidRootPart");
			if TABLE_TableIndirection["part%0"] then
				local pos, onScreen = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["part%0"].Position);
				if onScreen then
					TABLE_TableIndirection["dist%0"] = (TABLE_TableIndirection["center%0"] - Vector2.new(pos.X, pos.Y)).Magnitude;
					if (TABLE_TableIndirection["dist%0"] < shortest) then
						closest = TABLE_TableIndirection["part%0"];
						shortest = TABLE_TableIndirection["dist%0"];
					end
				end
			end
		end
	end
	return closest;
end
TABLE_TableIndirection["c1%0"] = TABLE_TableIndirection["UserInputService%0"].InputBegan:Connect(function(input)
	if (((input.UserInputType == Enum.UserInputType.Keyboard) and (input.KeyCode == TABLE_TableIndirection["Settings%0"].Aim_Key)) or (input.UserInputType == TABLE_TableIndirection["Settings%0"].Aim_Key)) then
		TABLE_TableIndirection["IsAiming%0"] = true;
	end
end);
TABLE_TableIndirection["c2%0"] = TABLE_TableIndirection["UserInputService%0"].InputEnded:Connect(function(input)
	if (((input.UserInputType == Enum.UserInputType.Keyboard) and (input.KeyCode == TABLE_TableIndirection["Settings%0"].Aim_Key)) or (input.UserInputType == TABLE_TableIndirection["Settings%0"].Aim_Key)) then
		TABLE_TableIndirection["IsAiming%0"] = false;
	end
end);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["c1%0"]);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["c2%0"]);
TABLE_TableIndirection["Loop2%0"] = TABLE_TableIndirection["RunService%0"].RenderStepped:Connect(function()
	if (TABLE_TableIndirection["Settings%0"].Aimbot_Enabled and TABLE_TableIndirection["IsAiming%0"]) then
		TABLE_TableIndirection["target%0"] = GetClosestPlayer();
		if TABLE_TableIndirection["target%0"] then
			TABLE_TableIndirection["pos%0"] = TABLE_TableIndirection["Camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["target%0"].Position);
			if (TABLE_TableIndirection["Settings%0"].Aimbot_Mode == "Force") then
				TABLE_TableIndirection["Camera%0"].CFrame = CFrame.new(TABLE_TableIndirection["Camera%0"].CFrame.Position, TABLE_TableIndirection["target%0"].Position);
			elseif mousemoverel then
				TABLE_TableIndirection["center%0"] = Vector2.new(TABLE_TableIndirection["Camera%0"].ViewportSize.X / 2, TABLE_TableIndirection["Camera%0"].ViewportSize.Y / 2);
				mousemoverel((TABLE_TableIndirection["pos%0"].X - TABLE_TableIndirection["center%0"].X) * TABLE_TableIndirection["Settings%0"].Aim_Smoothness, (TABLE_TableIndirection["pos%0"].Y - TABLE_TableIndirection["center%0"].Y) * TABLE_TableIndirection["Settings%0"].Aim_Smoothness);
			else
				TABLE_TableIndirection["Camera%0"].CFrame = TABLE_TableIndirection["Camera%0"].CFrame:Lerp(CFrame.new(TABLE_TableIndirection["Camera%0"].CFrame.Position, TABLE_TableIndirection["target%0"].Position), TABLE_TableIndirection["Settings%0"].Aim_Smoothness);
			end
		end
	end
end);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["Loop2%0"]);
TABLE_TableIndirection["Loop3%0"] = TABLE_TableIndirection["RunService%0"].Heartbeat:Connect(function()
	if (TABLE_TableIndirection["Settings%0"].Speed_Enabled and (TABLE_TableIndirection["Settings%0"].Speed_Value > 0) and TABLE_TableIndirection["LocalPlayer%0"].Character and TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("Humanoid")) then
		if (TABLE_TableIndirection["LocalPlayer%0"].Character.Humanoid.MoveDirection.Magnitude > 0) then
			TABLE_TableIndirection["LocalPlayer%0"].Character.HumanoidRootPart.CFrame = TABLE_TableIndirection["LocalPlayer%0"].Character.HumanoidRootPart.CFrame + (TABLE_TableIndirection["LocalPlayer%0"].Character.Humanoid.MoveDirection * TABLE_TableIndirection["Settings%0"].Speed_Value * 0.5);
		end
	end
	if (TABLE_TableIndirection["Settings%0"].Fly_Enabled and TABLE_TableIndirection["LocalPlayer%0"].Character and TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("HumanoidRootPart")) then
		TABLE_TableIndirection["root%0"] = TABLE_TableIndirection["LocalPlayer%0"].Character.HumanoidRootPart;
		TABLE_TableIndirection["hum%0"] = TABLE_TableIndirection["LocalPlayer%0"].Character.Humanoid;
		TABLE_TableIndirection["root%0"].Velocity = Vector3.new(0, 0, 0);
		TABLE_TableIndirection["flyVec%0"] = Vector3.new(0, 0, 0);
		TABLE_TableIndirection["cf%0"] = TABLE_TableIndirection["Camera%0"].CFrame;
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] + TABLE_TableIndirection["cf%0"].LookVector;
		end
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] - TABLE_TableIndirection["cf%0"].LookVector;
		end
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] - TABLE_TableIndirection["cf%0"].RightVector;
		end
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] + TABLE_TableIndirection["cf%0"].RightVector;
		end
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] + Vector3.new(0, 1, 0);
		end
		if TABLE_TableIndirection["UserInputService%0"]:IsKeyDown(Enum.KeyCode.LeftControl) then
			TABLE_TableIndirection["flyVec%0"] = TABLE_TableIndirection["flyVec%0"] - Vector3.new(0, 1, 0);
		end
		if (TABLE_TableIndirection["flyVec%0"].Magnitude > 0) then
			TABLE_TableIndirection["root%0"].CFrame = TABLE_TableIndirection["root%0"].CFrame + (TABLE_TableIndirection["flyVec%0"] * TABLE_TableIndirection["Settings%0"].Fly_Speed * 0.5);
		end
		TABLE_TableIndirection["hum%0"].PlatformStand = true;
	elseif (TABLE_TableIndirection["LocalPlayer%0"].Character and TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("Humanoid")) then
		TABLE_TableIndirection["LocalPlayer%0"].Character.Humanoid.PlatformStand = false;
	end
end);
table.insert(TABLE_TableIndirection["Connections%0"], TABLE_TableIndirection["Loop3%0"]);
