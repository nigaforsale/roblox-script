local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
repeat
	task.wait();
until game:IsLoaded() 
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167"));
local Workspace = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\20\194\56\206\239\51\204\41\192", "\156\67\173\74\165"));
local CoreGui = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\23\184\91\19\155\51\79", "\38\84\215\41\118\220\70"));
local VirtualInputManager = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\102\31\48\6\235\81\26\11\28\238\69\2\15\19\240\81\17\39\0", "\158\48\118\66\114"));
local GuiService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\140\49\25\5\118\183\237\162\39\21", "\155\203\68\112\86\19\197"));
local LocalPlayer = Players.LocalPlayer;
getgenv().ScriptRunning = true;
getgenv().Settings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\103\200\34\243\106\119\236\246", "\152\38\189\86\156\32\24\133")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\207\82\166\84\255\95\149\71\242\80\162", "\38\156\55\199")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\143\104\117\31\18\125\238\119\161\112\121", "\35\200\29\28\72\115\20\154")]=2.5};
local ScreenGui = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\42\188\195\218\136\34\19\12\182", "\84\121\223\177\191\237\76"));
ScreenGui.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\154\67\221\175\16\95\57\207\132\96\152\159\8\85\60\196\186\69\204", "\161\219\54\169\192\90\48\80");
ScreenGui.IgnoreGuiInset = true;
if pcall(function()
	ScreenGui.Parent = CoreGui;
end) then
else
	ScreenGui.Parent = LocalPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\121\78\1\60\76\80\39\48\64", "\69\41\34\96"));
end
local MainFrame = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\154\209\214\7\7", "\75\220\163\183\106\98"));
MainFrame.Parent = ScreenGui;
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25);
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -110);
MainFrame.Size = UDim2.new(0, 300, 0, 280);
MainFrame.Active = true;
MainFrame.Draggable = true;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\147\168\56\203\12\191\153", "\185\98\218\235\87"), MainFrame).CornerRadius = UDim.new(0, 8);
local Title = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\255\57\63\242\242\171\201\57\43", "\202\171\92\71\134\190"));
Title.Parent = MainFrame;
Title.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\8\212\56\135\105\235\35\129\39", "\232\73\161\76");
Title.Size = UDim2.new(1, 0, 0, 30);
Title.BackgroundTransparency = 1;
Title.TextColor3 = Color3.new(1, 1, 1);
Title.Font = Enum.Font.GothamBold;
Title.TextSize = 16;
local StatusLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\143\220\90\73\50\186\219\71\81", "\126\219\185\34\61"));
StatusLabel.Parent = MainFrame;
StatusLabel.Position = UDim2.new(0, 0, 0, 35);
StatusLabel.Size = UDim2.new(1, 0, 0, 25);
StatusLabel.BackgroundTransparency = 1;
StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 0);
StatusLabel.Font = Enum.Font.Code;
StatusLabel.TextSize = 13;
StatusLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\63\218\95\102\107\100\169\167\59\207\87\102\119\121\244\167\10\193\76\50\93\127\242\245\13\205\74\119\108\57\189\169", "\135\108\174\62\18\30\23\147");
local Container = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\144\251\43\198\29", "\167\214\137\74\171\120\206\83"));
Container.Parent = MainFrame;
Container.BackgroundTransparency = 1;
Container.Position = UDim2.new(0, 0, 0, 65);
Container.Size = UDim2.new(1, 0, 1, -65);
local UIListLayout = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\190\217\30\84\235\179\167\241\43\82\237\179", "\199\235\144\82\61\152"));
UIListLayout.Parent = Container;
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
UIListLayout.Padding = UDim.new(0, 8);
local StartBtn = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\51\19\161\63\37\3\173\63\8\24", "\75\103\118\217"));
StartBtn.Parent = Container;
StartBtn.Size = UDim2.new(0.9, 0, 0, 40);
StartBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
StartBtn.TextColor3 = Color3.new(1, 1, 1);
StartBtn.Font = Enum.Font.GothamBold;
StartBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\235\91\113\16\176\16\192\26\62\90", "\126\167\52\16\116\217");
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\7\3\143\166\23\249\218", "\156\168\78\64\224\212\121"), StartBtn).CornerRadius = UDim.new(0, 6);
local SkipBtn = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\51\235\189\218\37\251\177\218\8\224", "\174\103\142\197"));
SkipBtn.Parent = Container;
SkipBtn.Size = UDim2.new(0.9, 0, 0, 30);
SkipBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200);
SkipBtn.TextColor3 = Color3.new(1, 1, 1);
SkipBtn.Font = Enum.Font.GothamBold;
SkipBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\112\39\77\59\32\30\202\83\41\91\33\101\22\203\93\33\79\120\18\95\241\66\97", "\152\54\72\63\88\69\62");
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\225\237\205\83\198\202\235\78", "\60\180\164\142"), SkipBtn).CornerRadius = UDim.new(0, 6);
local StopBtn = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\108\91\29\61\5\248\6\76\81\11", "\114\56\62\101\73\71\141"));
StopBtn.Parent = Container;
StopBtn.Size = UDim2.new(0.9, 0, 0, 30);
StopBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50);
StopBtn.TextColor3 = Color3.new(1, 1, 1);
StopBtn.Font = Enum.Font.GothamBold;
StopBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\155\229\212\215\189\169\232\199\170\224\203\208", "\164\216\137\187");
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\231\207\18\189\180\240\14\192", "\107\178\134\81\210\198\158"), StopBtn).CornerRadius = UDim.new(0, 6);
local DebugDot = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\30\28\131\203\175", "\202\88\110\226\166"));
DebugDot.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\231\10\128\226\205\231\0\150", "\170\163\111\226\151");
DebugDot.Size = UDim2.new(0, 10, 0, 10);
DebugDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
DebugDot.Parent = ScreenGui;
DebugDot.Visible = false;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\36\25\145\55\92\57\44\3", "\73\113\80\210\88\46\87"), DebugDot).CornerRadius = UDim.new(1, 0);
local function UpdateStatus(msg)
	StatusLabel.Text = msg;
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\186\13\216\6\232\171\35\196\28\218\193", "\135\225\76\173\114") .. msg);
end
local function GetSafePosition(obj)
	if not obj then
		return nil;
	end
	if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\56\236\171\181\156\188\181\14", "\199\122\141\216\208\204\221")) then
		return obj.Position;
	end
	if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\128\210\20\245\116", "\150\205\189\112\144\24")) then
		local success, pivot = pcall(function()
			return obj:GetPivot();
		end);
		if (success and pivot) then
			return pivot.Position;
		end
		if obj.PrimaryPart then
			return obj.PrimaryPart.Position;
		end
		local part = obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\7\133\172\73\52\137\3\4", "\112\69\228\223\44\100\232\113"), true);
		if part then
			return part.Position;
		end
	end
	return nil;
end
local function IsSpotTaken(position)
	for _, player in ipairs(Players:GetPlayers()) do
		if ((player ~= LocalPlayer) and player.Character) then
			local root = player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\252\10\10\210\184\115\143\208\45\8\220\162\76\135\198\11", "\230\180\127\103\179\214\28"));
			if root then
				if ((root.Position - position).Magnitude < getgenv().Settings.SearchRange) then
					return true;
				end
			end
		end
	end
	return false;
end
local function SmartClick(btn)
	if not btn then
		return;
	end
	UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\175\9\86\69\239\72\238\139\95\31", "\128\236\101\63\38\132\33") .. btn.Name);
	local absPos = btn.AbsolutePosition;
	local absSize = btn.AbsoluteSize;
	local center = absPos + (absSize / 2);
	local inset = GuiService:GetGuiInset();
	local x1, y1 = center.X, center.Y;
	local x2, y2 = center.X, center.Y + inset.Y;
	DebugDot.Visible = true;
	DebugDot.Position = UDim2.new(0, x2 - 5, 0, y2 - 5);
	if firesignal then
		pcall(function()
			firesignal(btn.MouseButton1Click);
		end);
		pcall(function()
			firesignal(btn.Activated);
		end);
	end
	if btn.MouseButton1Click then
		pcall(function()
			btn.MouseButton1Click:Fire();
		end);
	end
	VirtualInputManager:SendMouseButtonEvent(x2, y2, 0, true, game, 1);
	task.wait(0.05);
	VirtualInputManager:SendMouseButtonEvent(x2, y2, 0, false, game, 1);
	task.wait(0.1);
	VirtualInputManager:SendMouseButtonEvent(x1, y1, 0, true, game, 1);
	task.wait(0.05);
	VirtualInputManager:SendMouseButtonEvent(x1, y1, 0, false, game, 1);
	task.wait(0.2);
	DebugDot.Visible = false;
end
local function ClickButtonByName(nameToFind)
	UpdateStatus("Finding '" .. nameToFind .. "'");
	local PlayerGui = LocalPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\156\165\16\93\179\249\232\185\160", "\175\204\201\113\36\214\139"));
	for _, obj in ipairs(PlayerGui:GetDescendants()) do
		if ((obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\115\201\45\200\38\82\216\33\211\10", "\100\39\172\85\188")) or obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\132\117\184\135\54\143\109\173\148\60\163", "\83\205\24\217\224"))) and obj.Visible) then
			if (obj.Name == nameToFind) then
				SmartClick(obj);
				return true;
			end
		end
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\221\228\216\41\233\239\194\52\232\248\141\31\243\209\217\50\232\133\195\50\242\133\203\50\243\203\201\103\166", "\93\134\165\173") .. nameToFind);
	return false;
end
local function AutoJoinLoop()
	local teamUp = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\138\247\192\207\15\222", "\30\222\146\161\162\90\174\210"));
	if not teamUp then
		UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\192\92\98\80\165\96\127\74\209\75\113\7\208\94", "\106\133\46\16"));
		return;
	end
	local teamUpArea = teamUp:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\108\37\114\241\111\80\121\50\118\253", "\32\56\64\19\156\58"));
	if not teamUpArea then
		UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\127\218\247\12\26\220\143\26\252\224\87\87\199\144\123\218\224\87", "\224\58\168\133\54\58\146"));
		return;
	end
	local targetPos = nil;
	for i = 1, 4 do
		local spot = teamUpArea:FindFirstChild(tostring(i));
		if spot then
			local pos = GetSafePosition(spot);
			if (pos and not IsSpotTaken(pos)) then
				targetPos = pos;
				break;
			end
		end
	end
	if targetPos then
		local char = LocalPlayer.Character;
		if (char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\113\67\70\252\123\137\142\15", "\107\57\54\43\157\21\230\231"))) then
			UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\236\138\29\254\176\210\200\155\159\30\181\170\204\192\207\197\95\187", "\175\187\235\113\149\217\188"));
			char.Humanoid:MoveTo(targetPos);
			local t = 0;
			while ((char.HumanoidRootPart.Position - targetPos).Magnitude > 3) and (t < 50) do
				task.wait(0.1);
				t = t + 1;
			end
			char.HumanoidRootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0));
			UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\11\174\136\88\234\119\127\124\136\180\101\173\55\54", "\24\92\207\225\44\131\25"));
			task.wait(getgenv().Settings.GuiWaitTime);
			if ClickButtonByName(LUAOBFUSACTOR_DECRYPT_STR_0("\120\214\180\73\24\105\102\210\168\110\15\115", "\29\43\179\216\44\123")) then
				task.wait(1.5);
				if ClickButtonByName(LUAOBFUSACTOR_DECRYPT_STR_0("\158\209\33\92\169\220\50\29\159\205\46", "\44\221\185\64")) then
					task.wait(1.2);
					if ClickButtonByName(LUAOBFUSACTOR_DECRYPT_STR_0("\40\244\110\77\122\4\233\76\76\92\15\235\81\125\103\15", "\19\97\135\40\63")) then
						task.wait(0.8);
					end
					if ClickButtonByName(LUAOBFUSACTOR_DECRYPT_STR_0("\141\78\54\58\59\52\154\89\50\54\13\37\160", "\81\206\60\83\91\79")) then
						UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\121\170\217\102\38\205\74\228\125\191\209\96\59\237\66\179\108\191\222\60\97\141", "\196\46\203\176\18\79\163\45"));
						task.wait(2);
						if ClickButtonByName(LUAOBFUSACTOR_DECRYPT_STR_0("\139\54\127\12\48\213\224\175\0\106\16", "\143\216\66\30\126\68\155")) then
							UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\153\221\14\200\192\176\196\160\234\239\12\198\192\227\228\245\171\218\25\194\203\164\153", "\129\202\168\109\171\165\195\183"));
							getgenv().Settings.AutoJoin = false;
							StartBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80);
							StartBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\17\76\54\202\202", "\134\66\56\87\184\190\116");
							return;
						else
							UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\26\48\0\183\67\171\15\58\124\2\29\186\11\255\15\58\43\19\29\181", "\85\92\81\105\219\121\139\65"));
						end
					else
						UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\219\178\89\73\38\159\222\161\85\68\104\218\201\182\81\72\94\203\243", "\191\157\211\48\37\28"));
					end
				else
					UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\249\30\253\16\96\159\60\252\29\42\203\26\230\77\24\203\17", "\90\191\127\148\124"));
				end
			else
				UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\94\134\39\27\34\199\29\18\116\130\45\3\85\134\62\53\108\137", "\119\24\231\78"));
			end
		end
	else
		UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\172\34\229\79\209\80\5\155\109\182\90\211\84\2\194\43\170\95\210\68\95", "\113\226\77\197\42\188\32"));
	end
end
StartBtn.MouseButton1Click:Connect(function()
	if (StartBtn.Text == LUAOBFUSACTOR_DECRYPT_STR_0("\22\25\245\177\51\24\243\251\116\88", "\213\90\118\148")) then
		UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\107\34\177\87\94\94\110\163\87\68\79\110\178\89\95\27\45\188\87\95\90\45\160\83\95\21\96\250", "\45\59\78\212\54"));
		return;
	end
	if getgenv().Settings.AutoJoin then
		return;
	end
	getgenv().Settings.AutoJoin = true;
	StartBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
	StartBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\34\67\141\133\143\32\170\190\94\24", "\144\112\54\227\235\230\78\205");
	task.spawn(function()
		while getgenv().Settings.AutoJoin and getgenv().ScriptRunning do
			AutoJoinLoop();
			task.wait(3);
		end
	end);
end);
StopBtn.MouseButton1Click:Connect(function()
	getgenv().ScriptRunning = false;
	getgenv().Settings.AutoJoin = false;
	ScreenGui:Destroy();
end);
local TriggerFound = false;
local function SetReadyState()
	if TriggerFound then
		return;
	end
	TriggerFound = true;
	UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\129\45\14\248\201\27\167\39\79\207\196\90\161\60\78", "\59\211\72\111\156\176"));
	StartBtn.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\125\147\226\63\90\207\209\40\79\131\250\100", "\77\46\231\131");
	StartBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100);
	StartBtn.TextColor3 = Color3.new(0, 0, 0);
	SkipBtn.Visible = false;
	local sound = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\137\91\163\78\190", "\32\218\52\214"), Workspace);
	sound.SoundId = LUAOBFUSACTOR_DECRYPT_STR_0("\92\21\41\169\226\163\64\78\71\19\107\231\190\228\16\3\30\65\100\255\162\233\20", "\58\46\119\81\200\145\208\37");
	sound.Volume = 2;
	sound:Play();
end
SkipBtn.MouseButton1Click:Connect(function()
	UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\28\141\57\184\233\142\61\34\156\32\169\173\253\52\50\204\5\191\172\175\120", "\86\75\236\80\204\201\221"));
	SetReadyState();
end);
local function CheckCharacter()
	local char = LocalPlayer.Character;
	if (char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\90\84\122\132\240\132\123\69\69\138\241\159\66\64\101\145", "\235\18\33\23\229\158")) and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\120\175\204\186\94\181\200\191", "\219\48\218\161"))) then
		return true;
	end
	return false;
end
task.spawn(function()
	UpdateStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\211\112\117\93\210\65\231\164\119\115\91\155\108\232\229\99\125\74\207\74\242\164\66\108\72\204\65\174\170\63", "\128\132\17\28\41\187\47"));
	if CheckCharacter() then
		task.wait(3);
		SetReadyState();
		return;
	end
	LocalPlayer.CharacterAdded:Connect(function()
		task.wait(3);
		SetReadyState();
	end);
	while not TriggerFound and getgenv().ScriptRunning do
		if CheckCharacter() then
			task.wait(2);
			SetReadyState();
			break;
		end
		task.wait(1);
	end
end);
