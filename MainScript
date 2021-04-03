wait()

local Player = game:GetService("Players").LocalPlayer
local LastPos = Player.Character:FindFirstChild("HumanoidRootPart").Position
local CoreGui = game:GetService("CoreGui")
local Cam = workspace.CurrentCamera
local Mouse = Player:GetMouse()
local MainGui

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

if not _G.KryptoniumKeybindings then
	
	_G.KryptoniumKeybindings = {
		Deselect="C";
		ClickTP="X";
		LastPosition="B";
	}
	
end

if (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	local Main = Instance.new("ScreenGui", CoreGui)
	Main.Name = randomString()
	syn.protect_gui(Main)
	MainGui = Main
elseif get_hidden_gui or gethui then
	local hiddenUI = get_hidden_gui or gethui
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = hiddenUI()
	MainGui = Main
else
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = CoreGui
	MainGui = Main
end

Notify = function(Textt, Color)
	local X = 0.3
	local Count = 0
	if MainGui:FindFirstChild("Notify") then
		for i, v in pairs(MainGui:GetChildren()) do
			if v.Name == "Notify" then
				Count = Count + 1
				X = X + 0.1
			end
		end
	end
	if Count > 7 then
		for i, Gui in pairs(MainGui:GetChildren()) do
			if Gui.Name == "Notify" then
				for i, v in pairs(Gui:GetChildren()) do
					v:TweenPosition(UDim2.new(-1, 0, v.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.8)
				end
				spawn(function()
					wait(0.8)
					Gui:Destroy()
				end)
			end
		end
	end
	local Prompt = Instance.new("Frame", MainGui)
	Prompt.Size = UDim2.new(1, 0, 1, 0)
	Prompt.Name = "Notify"
	Prompt.BackgroundTransparency = 1
	local MessageBox = Instance.new("Frame", Prompt)
	MessageBox.Style = "DropShadow"
	MessageBox.Size = UDim2.new(0.15, 0, 0.1, 0)
	MessageBox.Position = UDim2.new(-1, 0, X, 0)
	MessageBox.ZIndex = 9
	MessageBox:TweenPosition(UDim2.new(0, 0, X, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
	for i = 1, 3 do
		local MessageBoxA = Instance.new("Frame", Prompt)
		MessageBoxA.Style = "DropShadow"
		MessageBoxA.Size = UDim2.new(0.15, 0, 0.1, 0)
		MessageBoxA.Position = UDim2.new(-1, 0, X, 0)
		MessageBoxA:TweenPosition(UDim2.new(0, 0, X, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
		MessageBoxA.ZIndex = 8
	end
	local Exit = Instance.new("Frame", MessageBox)
	Exit.ZIndex = 10
	Exit.Size = UDim2.new(0, 30, 0, 30)
	Exit.Position = UDim2.new(1, -30, 0, 0)
	Exit.Style = "DropShadow"
	local TL = Instance.new("TextButton", Exit)
	TL.ZIndex = 11
	TL.Size = UDim2.new(1, 0, 1, 0)
	TL.BackgroundTransparency = 1
	TL.Font = "SourceSansBold"
	TL.TextColor3 = Color3.new(255, 255, 255)
	TL.TextScaled = true
	TL.Text = "X"
	TL.MouseEnter:Connect(function()
		TL.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TL.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TL.MouseLeave:Connect(function()
		TL.TextColor3 = Color3.new(255, 255, 255)
	end)
	TL.MouseButton1Up:Connect(function()
		for i, v in pairs(Prompt:GetChildren()) do
			v:TweenPosition(UDim2.new(-1, 0, v.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.8)
			spawn(function()
				wait(0.8)
				v:Destroy()
				Prompt:Destroy()
			end)
		end
	end)
	local T = Instance.new("TextLabel", MessageBox)
	T.ZIndex = 11
	T.Size = UDim2.new(0.75, 0, 0.8, 0)
	T.BackgroundTransparency = 1
	T.Position = UDim2.new(0.1, 0, 0.1, 0)
	T.Font = "SourceSansBold"
	T.TextColor3 = Color
	T.TextScaled = true
	T.TextXAlignment = "Left"
	T.TextStrokeTransparency = 0.7
	T.Text = tostring(Textt)
	spawn(function()
		wait(X * 12)
		for i, v in pairs(Prompt:GetChildren()) do
			print(v.Position.Y.Scale)
			v:TweenPosition(UDim2.new(-1, 0, v.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.8)
		end
		spawn(function()
			wait(0.8)
			Prompt:Destroy()
		end)
	end)
end

spawn(function()
	while wait() do
		for i, Notification in pairs(MainGui:GetChildren()) do
			if Notification.Name == "Notify" then
				local X = (0.2) + i * 0.1
				for i, v in pairs(Notification:GetChildren()) do
					v:TweenPosition(UDim2.new(0, 0, X, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5)
				end
			end
		end
	end
end)

spawn(function()
	wait(1)
	Notify("Kryptonium - For Exploiters.", BrickColor.new("Bright red").Color)
	Notify("Press '=' to set way points!", Color3.new(1, 1, 1))
	Notify("Click to select and again to delete! Press 'c' to de-select.", Color3.new(1, 1, 1))
	Notify("Press 'x' to teleport to your mouse.", Color3.new(1, 1, 1))
	Notify("Press ' to enable/disable keybindings.", Color3.new(1, 1, 1))
	Notify("Created by FluffyDeveloper.\nEdited by mandingo#0316", Color3.new(1, 1, 1))
end)

local Enabled = true
local Selected = nil

KeyPrompt = function(Question, Func)
	if MainGui:FindFirstChild("Prompt") then
		for i, v in pairs(MainGui:GetChildren()) do
			if v.Name == "Prompt" then
				for i, vv in pairs(v:GetChildren()) do
					vv:TweenPosition(UDim2.new(0.325, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.8)
					spawn(function()
						wait(0.8)
						vv:Destroy()
						v:Destroy()
					end)
				end
			end
		end
		return nil
	end
	local Prompt = Instance.new("Frame",  MainGui)
	Prompt.Size = UDim2.new(1, 0, 1, 0)
	Prompt.Name = "Prompt"
	Prompt.BackgroundTransparency = 1
	local MessageBox = Instance.new("Frame", Prompt)
	MessageBox.Style = "DropShadow"
	MessageBox.Size = UDim2.new(0.35, 0, 0.32, 0)
	MessageBox.Position = UDim2.new(0.325, 0, -1, 0)
	MessageBox.ZIndex = 9
	MessageBox:TweenPosition(UDim2.new(0.325, 0, 0.35, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
	for i = 1, 3 do
		local MessageBoxA = Instance.new("Frame", Prompt)
		MessageBoxA.Style = "DropShadow"
		MessageBoxA.Size = UDim2.new(0.35, 0, 0.32, 0)
		MessageBoxA.Position = UDim2.new(0.325, 0, -1, 0)
		MessageBoxA:TweenPosition(UDim2.new(0.325, 0, 0.35, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
	end
	local Exit = Instance.new("Frame", MessageBox)
	Exit.ZIndex = 10
	Exit.Size = UDim2.new(0, 30, 0, 30)
	Exit.Position = UDim2.new(1, -30, 0, 0)
	Exit.Style = "DropShadow"
	local TL = Instance.new("TextButton", Exit)
	TL.ZIndex = 11
	TL.Size = UDim2.new(1, 0, 1, 0)
	TL.BackgroundTransparency = 1
	TL.Font = "SourceSansBold"
	TL.TextColor3 = Color3.new(255, 255, 255)
	TL.TextScaled = true
	TL.Text = "X"
	TL.MouseEnter:Connect(function()
		TL.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TL.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TL.MouseLeave:Connect(function()
		TL.TextColor3 = Color3.new(255, 255, 255)
	end)
	TL.MouseButton1Up:Connect(function()
		if MainGui:FindFirstChild("Prompt") then
			for i, v in pairs(MainGui:GetChildren()) do
				if v.Name == "Prompt" then
					for i, vv in pairs(v:GetChildren()) do
						vv:TweenPosition(UDim2.new(0.325, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.8)
						spawn(function()
							wait(0.8)
							vv:Destroy()
							v:Destroy()
						end)
					end
				end
			end
		end
	end)
	local T = Instance.new("TextLabel", MessageBox)
	T.ZIndex = 11
	T.Size = UDim2.new(0.8, 0, 0.3, 0)
	T.BackgroundTransparency = 1
	T.Position = UDim2.new(0.1, 0, 0.2, 0)
	T.Font = "SourceSansBold"
	T.TextColor3 = Color3.new(255, 255, 255)
	T.TextScaled = true
	T.Text = tostring(Question)
	local TBox = Instance.new("Frame", MessageBox)
	TBox.Style = "DropShadow"
	TBox.Size = UDim2.new(0.9, 0, 0.2, 0)
	TBox.Position = UDim2.new(0.05, 0, 0.6, 0)
	TBox.ZIndex = 11
	local B = Instance.new("TextBox", TBox)
	B.ZIndex = 12
	B.Size = UDim2.new(1, 0, 1, 0)
	B.BackgroundTransparency = 1
	B.Font = "SourceSansLight"
	B.TextSize = 18
	B.TextWrapped = true
	B.TextColor3 = Color3.new(255, 255, 255)
	B.Text = "Key"
	local BBox = Instance.new("Frame", MessageBox)
	BBox.Style = "DropShadow"
	BBox.Size = UDim2.new(0.4, 0, 0.18, 0)
	BBox.Position = UDim2.new(0.3, 0, 0.8, 0)
	BBox.ZIndex = 11
	local TB = Instance.new("TextButton", BBox)
	TB.ZIndex = 12
	TB.Size = UDim2.new(1, 0, 1, 0)
	TB.BackgroundTransparency = 1
	TB.Font = "SourceSansBold"
	TB.TextColor3 = Color3.new(255, 255, 255)
	TB.TextSize = 15
	TB.Text = "Confirm"
	TB.MouseEnter:Connect(function()
		TB.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TB.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TB.MouseLeave:Connect(function()
		TB.TextColor3 = Color3.new(255, 255, 255)
	end)
	TB.MouseButton1Up:Connect(function()
		Func(B.Text or "")
	end)
end

local Select = function(Part)
	if Selected then
		if Selected:FindFirstChild("Box") then
			Selected.Box:Destroy()
		end
	end
	Selected = Part
	local Box = Instance.new("SelectionBox", Selected)
	Box.Name = "Box"
	Box.Adornee = Selected
	Box.LineThickness = 0.1
	Box.Color3 = BrickColor.Random().Color
end

Mouse.Button1Up:Connect(function()
	if Mouse.Target and Enabled then
		if Selected ~= Mouse.Target then
			Notify("Selected: "..Mouse.Target.Name, Color3.new(1,1,1))
			Select(Mouse.Target)
		elseif Selected == Mouse.Target then
			Notify("Destroyed: "..Selected.Name, Color3.new(1,1,1))
			Selected:Destroy()
			Selected = nil
		end
	end
end)

Mouse.KeyDown:Connect(function(Key)
	Key = Key:lower()
	if Key == "'" then
		if Enabled then
			Enabled = false
			Notify("Disabled key-binds!", Color3.new(1, 1, 1))
		else
			Enabled = true
			Notify("Enabled key-binds!", Color3.new(1, 1, 1))
		end
	elseif Key == tostring(_G.KryptoniumKeybindings.Deslect):lower() and Enabled then
		if Selected then
			if Selected:FindFirstChild("Box") then
				Selected.Box:Destroy()
			end
			Notify("De-selected: " .. Selected.Name, Color3.new(1, 1, 1))
			Selected = nil
		end
	elseif Key == tostring(_G.KryptoniumKeybindings.ClickTP):lower() and Enabled then
		LastPos = Player.Character:FindFirstChild("HumanoidRootPart").Position
		if Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart then
			Player.Character:FindFirstChildOfClass("Humanoid").Sit = false
			wait(.1)
		end
		Player.Character:FindFirstChild("HumanoidRootPart").CFrame = Mouse.Hit + Vector3.new(0,7,0)
		Notify("Teleported to mouse position", Color3.new(1,1,1))
	elseif Key == tostring(_G.KryptoniumKeyBindings.LastPosition):lower() and Enabled then
		if Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart then
			Player.Character:FindFirstChildOfClass("Humanoid").Sit = false
			wait(.1)
		end	
		Player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(LastPos)
		Notify("Teleported to previous position", Color3.new(1,1,1))
	end
end)
