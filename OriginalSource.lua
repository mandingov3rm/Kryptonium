--[[
	-------------------------------------------------------------
	Kryptonium
	
	Version: 1
	
	Tools GUI created for exploiters.
	Load the script in order to see all key binds.
	You can set waypoints, remove and select parts, noclip etc.
	
	Also comes with a knife using the 'k' key. The knife will only
	work/show when FilteringEnabled is false.
	
	Keys:
		= : Set way-points using a gui. One character only.
		z : No clip/clip.
		x : Teleport to mouse.
		c : De-select part.
		v : Invisible/visible.
		k : Knife (NON FILTERING ENABLED ONLY)
		' : Enable/Disable.
		Click : Select part.
		Click x2: Delete part.
		
	Extra info:
		Hover over a way-point to see what key it is set to.
		Click the way-point to delete it.
		Remember to click 'c' if you want to de-select.
		Also remember that the ' key is to enable/disable the script.
		Be careful when clicking parts. You may accidently delete them.
	
	<Created by FluffyDeveloper>
	--------------------------------------------------------------
--]]

wait()
local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:findFirstChild("PlayerGui")
if not PlayerGui or PlayerGui == nil then
	print("Unable to work without playergui!")
	return nil
end
local Cam = workspace.CurrentCamera
local Mouse = Player:GetMouse()

local MainGui = Instance.new("ScreenGui", PlayerGui)
MainGui.Name = "Essential X"

local NoClip = false
local Invisible = false

local wayPoints = {}
makeWayPoint = function(Key)
	local Character = Player.Character
	if Character and Character ~= nil then
		if Character:findFirstChild("HumanoidRootPart") then
			local Root = Character:findFirstChild("HumanoidRootPart")
			local Object = Instance.new("Part", Cam)
			Object.Material = "DiamondPlate"
			Object.Size = Vector3.new(3, 5, 3)
			Object.CFrame = Root.CFrame * CFrame.new(0, -3, 0)
			Object.Anchored = true
			Object.Name = "Way-Point"
			Object.Locked = true
			local C = Instance.new("ClickDetector", Object)
			C.MouseClick:connect(function()
				wayPoints[Key:lower()] = nil
				Object:Destroy()
			end)
			local BG = Instance.new("BillboardGui", Object)
			BG.Adornee = Object
			BG.Active = true
			BG.StudsOffset = Vector3.new(0, 5.3, 0)
			BG.Size = UDim2.new(0, 115, 0, 115)
			C.MouseHoverEnter:connect(function()
				if not BG:findFirstChild("Key") then
					local TL = Instance.new("TextLabel", BG)
					TL.ZIndex = 2
					TL.Font = "SourceSansBold"
					TL.Size = UDim2.new(1, 0, 0.2, 0)
					TL.Position = UDim2.new(0, 0, 0.4, 0)
					--TL.TextScaled = true
					TL.TextColor3 = Color3.new(255, 255, 255)
					TL.Name = "Key"
					TL.TextSize = 50
					TL.TextStrokeTransparency = 0.5
					TL.BackgroundTransparency = 1
					TL.Text = Key:upper()
				end
				spawn(function()
					wait(5)
					if BG:findFirstChild("Key") then
						BG.Key:Destroy()
					end
				end)
			end)
			C.MouseHoverLeave:connect(function()
				if BG:findFirstChild("Key") then
					BG.Key:Destroy()
				end
			end)
			local IL = Instance.new("ImageLabel", BG)
			IL.Size = UDim2.new(1, 0, 1, 0)
			local Images = {"560945766", "71700580", "54662087", "560946070", "51780482", "197173595", "315689690", "197173691", "197173823", "28371953", "156211232", "628631880", "518835148", "482255804", "576029852", "164055044", "616443472", "225842765", "620538016", "553362130"}
			local Randoms = {}
			for i=1, 5 do
				table.insert(Randoms, Images[math.random(1, #Images)])
			end
			IL.Image = "http://www.roblox.com/asset/?id="..Randoms[math.random(1, #Randoms)]
			IL.BackgroundTransparency = 1
			spawn(function()
				while IL and BG do
					wait()
					IL.Rotation = math.cos(time()) * 500
				end
			end)
			wayPoints[Key:lower()] = {Object = Object, CF = Object.CFrame}
			if MainGui:findFirstChild("Prompt") then
				for i,v in pairs(MainGui:GetChildren()) do
					if v.Name == "Prompt" then
						for i,vv in pairs(v:GetChildren()) do
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
		end
	end
end

Notify = function(Textt, Color)
	local X = 0.3
	local Count = 0
	if MainGui:findFirstChild("Notify") then
		for i,v in pairs(MainGui:GetChildren()) do
			if v.Name == "Notify" then
				Count = Count + 1
				X = X + 0.1
			end
		end
	end
	if Count > 7 then
		for i,Gui in pairs(MainGui:GetChildren()) do
			if Gui.Name == "Notify" then
				for i,v in pairs(Gui:GetChildren()) do
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
	for i=1, 3 do
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
	TL.MouseEnter:connect(function()
		TL.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TL.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TL.MouseLeave:connect(function()
		TL.TextColor3 = Color3.new(255, 255, 255)
	end)
	TL.MouseButton1Up:connect(function()
		for i,v in pairs(Prompt:GetChildren()) do
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
		for i,v in pairs(Prompt:GetChildren()) do
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
		for i,Notification in pairs(MainGui:GetChildren()) do
			if Notification.Name == "Notify" then
				local X = (0.2) + i * 0.1
				for i,v in pairs(Notification:GetChildren()) do
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
	Notify("Click to select and again to delete! 'c' to de-select.", Color3.new(1, 1, 1))
	Notify("Press 'x' to teleport to your mouse.", Color3.new(1, 1, 1))
	Notify("Press 'z' to no-clip/clip and 'v' for invisible/visible.", Color3.new(1, 1, 1))
	Notify("Press ' to enable/disable.", Color3.new(1, 1, 1))
	Notify("Created by FluffyDeveloper.", Color3.new(1, 1, 1))
end)

local Enabled = true
local Selected = nil

KeyPrompt = function(Question, Func)
	if MainGui:findFirstChild("Prompt") then
		for i,v in pairs(MainGui:GetChildren()) do
			if v.Name == "Prompt" then
				for i,vv in pairs(v:GetChildren()) do
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
	for i=1, 3 do
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
	TL.MouseEnter:connect(function()
		TL.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TL.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TL.MouseLeave:connect(function()
		TL.TextColor3 = Color3.new(255, 255, 255)
	end)
	TL.MouseButton1Up:connect(function()
		if MainGui:findFirstChild("Prompt") then
			for i,v in pairs(MainGui:GetChildren()) do
				if v.Name == "Prompt" then
					for i,vv in pairs(v:GetChildren()) do
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
	TB.MouseEnter:connect(function()
		TB.TextColor3 = Color3.new(255, 0, 0)
		spawn(function()
			wait(3)
			TB.TextColor3 = Color3.new(255, 255, 255)
		end)
	end)
	TB.MouseLeave:connect(function()
		TB.TextColor3 = Color3.new(255, 255, 255)
	end)
	TB.MouseButton1Up:connect(function()
		Func(B.Text or "")
	end)
end

local Select = function(Part)
	if Selected then
		if Selected:findFirstChild("Box") then
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

Mouse.Button1Up:connect(function()
	if Mouse.Target and Enabled and Mouse.Target.Name ~= "Way-Point" then
		if Selected ~= Mouse.Target then
			Notify("Selected: "..Mouse.Target.Name, Color3.new(1, 1, 1))
			Select(Mouse.Target)
		elseif Selected == Mouse.Target then
			Notify("Destroyed: "..Selected.Name, Color3.new(1, 1, 1))
			Selected:Destroy()
			Selected = nil
		end
	end
end)

Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
	if Key == "=" and Enabled then
		function ChooseKey()
			KeyPrompt("Which key would you like to set as this way-point?", function(Key)
				if string.len(Key) > 1 then
					ChooseKey()
					Notify("Incorrect data. One character only!", BrickColor.new("Really red").Color)
				elseif string.len(Key) < 1 then
					ChooseKey()
					Notify("Incorrect data. At least one character!" , BrickColor.new("Really red").Color)
				elseif Key == "=" or Key == "'" or Key == "x" or Key == "z" or Key == "c" or (Key == "k" and not workspace.FilteringEnabled) then
					ChooseKey()
					Notify("Cannot overwrite the '"..Key.."' key-bind!", BrickColor.new("Really red").Color)
				else
					makeWayPoint(Key:lower())
					Notify("Making way point... ("..Key:upper()..")", Color3.new(1, 1, 1))
					Notify("Click the way point to destroy.", Color3.new(1, 1, 1))
				end
			end)
		end
		ChooseKey()
	elseif Key == "'" then
		if Enabled then
			Enabled = false
			Notify("Disabled key-binds!", Color3.new(1, 1, 1))
		else
			Enabled = true
			Notify("Enabled key-binds!", Color3.new(1, 1, 1))
		end
	elseif Key == "c" and Enabled then
		if Selected then
			if Selected:findFirstChild("Box") then
				Selected.Box:Destroy()
			end
			Notify("De-selected: "..Selected.Name, Color3.new(1, 1, 1))
			Selected = nil
		end
	elseif Key == "x" and Enabled then
		local Character = Player.Character
		if Character and Character ~= nil and Mouse.Hit then
			if Character:findFirstChild("HumanoidRootPart") then
				local Root = Character:findFirstChild("HumanoidRootPart")
				Root.CFrame = Mouse.Hit * CFrame.new(0, 3, 0)
			end
		end
	elseif Key == "k" and Enabled and not workspace.FilteringEnabled then
		spawn(function()
			local tool=Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
			tool.Name="Fluffy Knife"
			 
			wait()
			script.Parent=tool
			
			--Murderer knife action script, original code from The Mad Murderer, by loleris.
			
			wait()
			local camera = game.Workspace.CurrentCamera
			local player = game.Players.LocalPlayer
			local character = player.Character
			local humanoid = character.Humanoid
			local head = character.Head
			local torso = character.Torso
			local Left_Arm = character["Left Arm"]
			local Right_Arm = character["Right Arm"]
			local tool = script.Parent
			local pl_mouse = player:GetMouse()
			
			local M = Instance.new("Model", character)
			M.Name = "Fluffy Knife"
			
			local rs = game:GetService("RunService")
			
			local stab_damage = 1100
			local walkspeeds = {24, 24}
			
			Settings = {
				Equip_time = 0.1,
				Idle_speed = 0.6,
				Attack_speed = 0.5,
				Throw_Offset = CFrame.new(1.5, 2, -0.3),
				ThrowChargeDelay = 0.2,
				DefaultKnifeSkin = "Galaxy",
				DefaultAbility = "Star Blast",
				
				Crosshair = "rbxassetid://54019936",
			}
			
			local KnifeSettings = {
				Equip_time = 0.3,
				Charge_time = 1,
				Throw_speed = 0.2,
				
				ThrowDamage = 1100,
				SlashDamage = 1100,
				
				CanThrow = true,
				CanSlash = true,
			}
			
			function GetIgnoreList(checkignored)
				local result = {}
				local ignored = false
				if player.Character then
					for _,c in pairs(player.Character:GetChildren()) do
						if c:IsA("Part") then
							table.insert(result,c)
							if checkignored ~= nil and checkignored == c then
								ignored = true
							end
						elseif c:IsA("Hat") then
							table.insert(result,c.Handle)
							if checkignored ~= nil and checkignored == c or checkignored == c.Handle then
								ignored = true
							end
						elseif c:IsA("Tool") then
							if c:FindFirstChild("Handle") then
								table.insert(result,c.Handle)
								if checkignored ~= nil and checkignored == c or checkignored == c.Handle then
									ignored = true
								end
							end
						end
					end
				end
				for _,c in pairs(workspace:GetChildren()) do
					if c.Name == "WeaponObject" then
						table.insert(result,c)
						if checkignored ~= nil and checkignored == c then
							ignored = true
						end
					end
				end
				for _,c in pairs(camera:GetChildren()) do
					table.insert(result,c)
					if checkignored ~= nil and checkignored == c then
						ignored = true
					end
				end
				if checkignored == nil then
				return result
				else
				return ignored
				end
			end
			
			local assetlink = "http://www.roblox.com/asset/?id="
			local hit_sounds = {"153647516", "153647519", "153647522", "153647526"}
			local death_sounds = {"146594640", "146594648", "146457047"}
			
			local Sounds = {
				Equip = {
					"153647514",
				},
				Slash = {
					"153647529",
					"153647534",
					"153647539",
					"153647540",
				},
				Throw = {
					"153647549",
					"153647554",
				},
				KnifeHitSurface = {
					"153647563",
					"153647564",
				},
				Death={
					"146594640", 
					"146457047", 
					"146594648",
					},
				HitPlayer={
					"153647516", 
					"153647519", 
					"153647522",
					"153647526",
				},
			}
			
			function HIT_HANDLE(hit, dmg, pos)
				if hit == nil then return end
				local h = hit.Parent:findFirstChild("Humanoid")
				if h == nil then
					h = hit.Parent.Parent:findFirstChild("Humanoid")
				end
				if h == nil then return end
				if h.Health <= 0 then return end
				
				local head = h.Parent:findFirstChild("Head")
				if head == nil then return end
				
				local sound_part = Instance.new("Part")
				sound_part.formFactor = "Custom"
				sound_part.Size = Vector3.new(0.2, 0.2, 0.2)
				sound_part.Transparency = 1
				sound_part.CanCollide = false
				sound_part.Anchored = true
				sound_part.CFrame = head.CFrame
				sound_part.Parent = Workspace
				local s_hit = Instance.new("Sound")
				s_hit.Volume = 1
				s_hit.SoundId = assetlink .. hit_sounds[math.random(1, #hit_sounds)]
				s_hit.Parent = sound_part
				local s_die = Instance.new("Sound")
				s_die.Volume = 1
				s_die.SoundId = assetlink .. death_sounds[math.random(1, #death_sounds)]
				s_die.Parent = sound_part
				
				s_hit:play()
				
				local Name = h.Parent.Name
				if not h.Parent:findFirstChild("Fluffy Knife") and not h.Parent.Parent:findFirstChild("Fluffy Knife") then
					h:TakeDamage(stab_damage)
					if h.Health <= dmg then
						s_die:play()
					end
				end
			end
			
			function RayCast(pos1, pos2, dist, ign)
				local ray = Ray.new(
					pos1,
					(pos2 - pos1).unit * math.abs(dist)
				) 
				local hit, hpos = Workspace:FindPartOnRayWithIgnoreList(ray, ign, false)
				return hit, hpos
			end
			
			local larm = character:findFirstChild("Left Arm")
			local rarm = character:findFirstChild("Right Arm")
			function Slash(del)
				coroutine.resume(coroutine.create(function()
					local hits = {}
					
					local start = tick()
					local actv = true
					
					local function ishitted(obj)
						for i = 1, #hits do
							if obj:IsDescendantOf(hits[i]) then
								return true
							end
						end
						return false
					end
					
					local function hitp(hit)
						if ishitted(hit) then return end
						local h = hit.Parent:findFirstChild("Humanoid")
						if h == nil then
							h = hit.Parent.Parent:findFirstChild("Humanoid")
						end
						if h == nil then return end
						hits[#hits + 1] = h.Parent
						HIT_HANDLE(hit, stab_damage)
					end
					
					local con = {
						larm.Touched:connect(hitp),
						rarm.Touched:connect(hitp),
					}
					
					while tick() - start <= Settings.Attack_speed do wait() end
					actv = false
					con[1]:disconnect()
					con[2]:disconnect()
				end))
			end
			
			local dg_sounds = {
				equip = {
					"153647514"
				},
				hit = {
					"153647516",
					"153647519",
					"153647522",
					"153647526"
				},
				Slash = {
					"153647529",
					"153647534",
					"153647539",
					"153647540"
				},
				Throw = {
					"153647549",
					"153647554",
				},
				KnifeHitSurface = {
					"153647563",
					"153647564",
				},
				Death={
					"146594640", 
					"146457047", 
					"146594648",
				},
			}
			
			local dg_soundobj = {}
			for k, v in pairs(dg_sounds) do
				dg_soundobj[k] = {}
				for i = 1, #v do
					local ns = Instance.new("Sound")
					ns.SoundId = assetlink .. v[i]
					ns.Volume = 1
					dg_soundobj[k][#dg_soundobj[k] + 1] = ns
				end
			end
			
			function LoadSounds()
				for __, v in pairs(dg_soundobj) do
					for i = 1, #v do
						v[i].Parent = head
					end
				end
			end
			function RemoveSounds()
				for __, v in pairs(dg_soundobj) do
					for i = 1, #v do
						v[i].Parent = nil
					end
				end
			end
			function PlaySound(nm, dl)
				if dl == nil then
					dg_soundobj[nm][math.random(1, #dg_soundobj[nm])]:play()
				else
					coroutine.resume(coroutine.create(function()
						wait(dl)
						dg_soundobj[nm][math.random(1, #dg_soundobj[nm])]:play()
					end))
				end
			end
			
			local ThrowProperties = {
				spin = 3,
				min_vel = 80,
				max_vel = 450,
				min_g = 11,
				max_g = 17,
				max_time = 30,
				cleanup_time = 10,
				fade_time = 1,
			}
			
			function Throw(target, pw, throw_prop)
				throw_prop = ThrowProperties --meh
				coroutine.resume(coroutine.create(function()
					local knf = Instance.new("Part")
					knf.Name = "WeaponObject"
					knf.CanCollide = false
					knf.Anchored = true
					knf.formFactor = "Custom"
					knf.Size = Vector3.new(0.2, 0.2, 0.2)
					knf.BrickColor = character.WeaponObject.BrickColor
					knf.Transparency = character.WeaponObject.Transparency
					knf.Reflectance = character.WeaponObject.Reflectance
					knf.TopSurface = 0
					knf.BottomSurface = 0
					local m = Instance.new("SpecialMesh")
					m.MeshId = "http://www.roblox.com/asset/?id=121944778"
					m.TextureId = character.WeaponObject.Mesh.TextureId
					m.Scale = Vector3.new(0.6, 0.6, 0.6)
					m.Parent = knf
					
					local hit_sound = nil
					
					local hit_sound = Instance.new("Sound")
					hit_sound.Volume = 1
					hit_sound.Pitch = 1
					if #Sounds.KnifeHitSurface > 0 then
						local sel_sound = dg_sounds.KnifeHitSurface[math.random(1, #dg_sounds.KnifeHitSurface)]
						if type(sel_sound) == "string" then
							hit_sound = Instance.new("Sound")
							hit_sound.Volume = 1
							hit_sound.Pitch = 1
							hit_sound.SoundId = assetlink..sel_sound
							hit_sound.Parent = knf
						elseif type(sel_sound) == "table" then
							hit_sound = {}
							for _, snd in pairs(sel_sound) do
								local sound = Instance.new("Sound")
								sound.Volume = 1
								sound.Pitch = 1
								sound.SoundId = assetlink..snd
								sound.Parent = knf
								table.insert(hit_sound, sound)
							end
						end
					end
					
					local start_pos = character.WeaponObject.Position
					local trg_cf = CFrame.new(start_pos, target)
					local dir_vec = (trg_cf).p - (trg_cf * CFrame.new(0, 0, -1)).p
					local t_ang = math.abs(math.atan(math.abs(dir_vec.y / Vector2.new(dir_vec.x, dir_vec.z).magnitude)))
					local isneg = -dir_vec.y / math.abs(dir_vec.y)
					
					local base_cf = CFrame.new(start_pos, Vector3.new(target.x, start_pos.y, target.z))
					local curr_vel = throw_prop.min_vel + ((throw_prop.max_vel - throw_prop.min_vel) * pw)
					
					local curr_g = throw_prop.min_g + ((throw_prop.max_g - throw_prop.min_g) * (1 - pw))
					local v_h = curr_vel * math.cos(t_ang)
					local v_v = curr_vel * math.sin(t_ang) * isneg
					
					local function GetCf(t)
						return base_cf * CFrame.new(0, v_v * t - (curr_g * (t ^2) * 0.5), -v_h * t)
					end
					local function throw_rc(p1, p2)
						return RayCast(p1, p2, (p1 - p2).magnitude + 0.001, GetIgnoreList())
					end
					
					knf.Parent = workspace
					knf.CFrame = base_cf
					spawn(function()
						game:GetService("Debris"):AddItem(knf, 12)
					end)
					
					local hit, pos
					
					spawn(function()
						local flying = true
						local start = tick()
						local last_p = base_cf.p
						while flying and tick() - start < throw_prop.max_time do
							local new_ps = GetCf(tick() - start)
							knf.CFrame = new_ps * CFrame.Angles(math.rad(-360 * (tick() * throw_prop.spin - math.floor(tick() * throw_prop.spin))), 0, 0)
							local ht, ps = throw_rc(last_p, new_ps.p)
							if ht ~= nil and ht~=knf then
								hit = ht
								pos = ps
								break
							end
							if humanoid.Health <= 0 then
								knf:remove()
								return
							end
							last_p = new_ps.p
							rs.RenderStepped:wait()
						end
						
						if hit == nil then
							knf:remove()
						else
							if not hit.Anchored then
								knf:remove()
							else
								knf.CFrame = CFrame.new(last_p, pos) * CFrame.new(0, 0, 0.4-(last_p - pos).magnitude) * CFrame.Angles(math.rad(-90), 0, 0)
								if hit_sound ~= nil then
									if type(hit_sound) == "table" then
										for _, snd_obj in pairs(hit_sound) do
											snd_obj:Play()
										end
									else
										hit_sound:Play()
									end
								end
							end
				
							if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("Humanoid"):IsA("Humanoid") or hit.Parent.Parent:FindFirstChild("Humanoid") and hit.Parent.Parent:FindFirstChild("Humanoid"):IsA("Humanoid") then
								if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("Humanoid"):IsA("Humanoid") then
									HIT_HANDLE(hit, KnifeSettings.ThrowDamage, {"Throw"})
								else
									HIT_HANDLE(hit.Parent, KnifeSettings.ThrowDamage, {"Throw"})
								end
							end
						end
					end)
				end))
			end
			
			local function OnThrow(target, power) --Called when the knife is thrown
				Throw(target, power, ThrowProperties)
			end
			
			local function SlashHandle(hit) --Called when the knife is slashed
				if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("Humanoid"):IsA("Humanoid") then
					if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("Humanoid"):IsA("Humanoid") then
						HIT_HANDLE(hit, KnifeSettings.ThrowDamage, {"Slash"})
					else
						HIT_HANDLE(hit.Parent, KnifeSettings.ThrowDamage, {"Slash"})
					end
					return hit.Parent
				end
				return nil
				--return object to add to ignore list
			end
			
			_G.MurderKnife_AnimType = "Default"
			_G.MurderKnife_AnimState = 0
			
			function Animate(tp, st)
				_G.MurderKnife_AnimType = tp
				_G.MurderKnife_AnimState = st
			end
			
			function SLASH()
				coroutine.resume(coroutine.create(function()
					local hits = {}
					
					local start = tick()
					local actv = true
					
					local function ishitted(obj)
						for i = 1, #hits do
							if obj:IsDescendantOf(hits[i]) then
								return true
							end
						end
						return false
					end
					
					local function hitp(hit)
						if ishitted(hit) then return end
						if hit.Parent:IsA("Model") and hit.Parent:FindFirstChild("Humanoid") then
							hit.Parent:BreakJoints()
						end
					end
					
					local con = {
						Left_Arm.Touched:connect(hitp),
						Right_Arm.Touched:connect(hitp),
					}
					
					while tick() - start <= Settings.Attack_speed do wait() end
					actv = false
					con[1]:disconnect()
					con[2]:disconnect()
				end))
			end
			
			tool.Selected:connect(function(mouse) --Default, Idle1, Idle2, Attack1, Attack2, Attack3, Charge, Throw
				humanoid.WalkSpeed = walkspeeds[2]
				mouse.Icon = assetlink .. "54019936"
				Animate("Charge", 0)
				LoadSounds()
				PlaySound("equip", 0.1)
				
				local anim_equip = 1
				local last_action = tick()
				local idle_rand = math.random(4, 7)
				local idle_perform = 0
				local idle_type = 1
				
				local attack_perform = 0
				local attack_type = 1
				
				local running = true
				local last_c = tick()
				local mouse_holding = false
				local throw_charge = 0
				local throw_perform = 0
				
				local function StartSlash()
					if tick() - attack_perform <= Settings.Attack_speed or tick() - throw_perform <= KnifeSettings.Throw_speed or anim_equip > 0 then return end
					attack_perform = tick()
					last_action = tick()
					attack_type = math.random(1, 3)
					idle_perform = 0
					SLASH()
					PlaySound("Slash", 0.23 * Settings.Attack_speed)
				end
				
				local click_start = tick()
				mouse.Button1Down:connect(function()
					mouse_holding = true
					if not running or anim_equip > 0 or (tick() - throw_perform) < KnifeSettings.Throw_speed then return end
					if KnifeSettings.CanThrow and KnifeSettings.CanSlash then --Throw and slash enabled
						if tick() - attack_perform <= Settings.Attack_speed or tick() - throw_perform <= KnifeSettings.Throw_speed then return end
						click_start = tick()
					elseif KnifeSettings.CanThrow then --Throw only
						if tick() - throw_perform <= KnifeSettings.Throw_speed then return end
						click_start = tick()
					elseif KnifeSettings.CanSlash then --Slash only
						StartSlash()
					end
				end)
				
				mouse.Button1Up:connect(function()
					mouse_holding = false
					if not running or anim_equip > 0 or (tick() - throw_perform) < KnifeSettings.Throw_speed then return end
					local clickd = tick() - click_start
					click_start = math.huge
					if KnifeSettings.CanThrow and KnifeSettings.CanSlash then --Throw and slash enabled
						if clickd < Settings.ThrowChargeDelay then
							StartSlash()
						else
							PlaySound("Throw")
							throw_perform = tick()
							OnThrow(mouse.Hit.p,math.min(clickd/KnifeSettings.Charge_time,1))
							delay(KnifeSettings.Throw_speed/2,function()
								PlaySound("equip", 0.1)
							end)
							delay(KnifeSettings.Throw_speed,function()
								if mouse_holding then
									click_start = tick()
								else
									click_start = math.huge
								end
							end)
						end
					elseif KnifeSettings.CanThrow then --Throw only
						PlaySound("Throw")
						throw_perform = tick()
						OnThrow(mouse.Hit.p,math.min(clickd/KnifeSettings.Charge_time,1))
						delay(KnifeSettings.Throw_speed/2,function()
							PlaySound("equip", 0.1)
						end)
						delay(KnifeSettings.Throw_speed,function()
							throw_perform = tick()
						end)
					elseif KnifeSettings.CanSlash then --Slash only
					end
				end)
				
				local conn = rs.RenderStepped:connect(function()
					if not running then return end
					local delta = tick() - last_c
					last_c = tick()
					local clickd = tick() - click_start
					
					if anim_equip > 0 then
						anim_equip = math.max(0, anim_equip - (delta / KnifeSettings.Equip_time))
						Animate("Equip", 1 - anim_equip)
					elseif mouse_holding and clickd >= Settings.ThrowChargeDelay then
						Animate("Charge", clickd/KnifeSettings.Charge_time)
						idle_perform = 0
					elseif tick() - throw_perform <= KnifeSettings.Throw_speed then
						Animate("Throw", (tick() - throw_perform) / KnifeSettings.Throw_speed)
						idle_perform = 0
					elseif tick() - attack_perform <= Settings.Attack_speed then
						Animate("Attack" .. attack_type, (tick() - attack_perform) / Settings.Attack_speed)
						idle_perform = 0
					elseif tick() - idle_perform <= Settings.Idle_speed then
						Animate("Idle" .. idle_type, (tick() - idle_perform) / Settings.Idle_speed)
					else
						Animate("Default", 0)
					end
					
					if tick() - last_action >= idle_rand then
						idle_rand = math.random(12, 20)
						last_action = tick()
						idle_perform = tick()
						idle_type = math.random(1, 2)
					end
					
				end)
				tool.Deselected:connect(function() running = false conn:disconnect() end)
			end)
			tool.Deselected:connect(function()
				RemoveSounds()
				humanoid.WalkSpeed = walkspeeds[1]
			end)
			
			--Murderer knife animation module, original code from The Mad Murderer, by loleris.
			
			local tool = script.Parent
			local player = game.Players.LocalPlayer
			local character = player.Character
			local humanoid = character:findFirstChild("Humanoid")
			local camera = Workspace.CurrentCamera
			local mouse = player:GetMouse()
			
			local conn_type = "Snap"
			
			local anim_head = false
			
			weapon_properties = {
				mesh_id = "http://www.roblox.com/asset/?id=121944778",
				texture_id = "http://www.roblox.com/asset/?id=470414400", --ADD TEXTURE HERE------------------------------------------------
				scale = Vector3.new(0.8, 0.8, 0.8),
				transparency = 0,
				reflectance = 0,
				brick_color = BrickColor.new("Really black"),
			}
			
			Animations = {
				Default = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)}
				},
				Equip = {
					{{}, 0, CFrame.new(0, 0, 0) * CFrame.Angles(-1.571, 0, 0), CFrame.new(0, 0, 0) * CFrame.Angles(-1.571, 0, 0), CFrame.new(0, -1.3, -0.5) * CFrame.Angles(-2.618, 0, 0)},
					{{0.8, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.524, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.2, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
				},
				Idle1 = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.3, 2}, 0, CFrame.new(0.8, -0.301, 0.2) * CFrame.Angles(-0.35, 0, 0.872), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0.523, 1.221, -0.699), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 1.221, 0)},
					{{0.55, 2}, 0, CFrame.new(0.2, -0.5, 0.2) * CFrame.Angles(-0.14, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0, 1.221, -0.175), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.746, 1.221, 0.174)},
					{{0.15, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
				},
				Idle2 = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.3, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.524, 0, 0.872), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, -0.175, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0.523, 0)},
					{{0.3, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(0.349, 0, 0.523), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0.174, 0.698, -0.524), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, -1.222, 0)},
					{{0.2, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(0.61, 0, 0.349), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0.139, 0.663, -0.489), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, -1.222, 0)},
					{{0.2, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)}
				},
				Attack1 = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.25, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-1.048, 0, 0.349), CFrame.new(-0.201, 0, 0) * CFrame.Angles(0.872, 0.349, 0.087), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.15, 2}, 0, CFrame.new(0.4, -0.101, 0.1) * CFrame.Angles(-1.571, 0, -0.35), CFrame.new(-0.301, -0.301, 0.1) * CFrame.Angles(-1.048, -0.175, -0.524), CFrame.new(0, -1.201, -0.801) * CFrame.Angles(-2.095, 0, 0)},
					{{0.6, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)}
				},
				Attack2 = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.25, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.699, 0, 0.872), CFrame.new(-0.401, 0.3, 0.1) * CFrame.Angles(1.919, 2.443, -1.222), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.15, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-1.048, 0, -0.524), CFrame.new(-0.5, -0.201, -0.101) * CFrame.Angles(0.523, 1.396, -0.873), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.6, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)}
				},
				Attack3 = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.25, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-1.397, 0, 0.174), CFrame.new(-0.401, -0.201, 0) * CFrame.Angles(1.396, 0.698, -1.571), CFrame.new(0, -1.3, -0.401) * CFrame.Angles(-2.444, 0, 0)},
					{{0.15, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-1.397, 0, 0.174), CFrame.new(-0.401, 0.1, 0) * CFrame.Angles(0.349, 2.094, -0.524), CFrame.new(0, -1.3, 0.1) * CFrame.Angles(-3.84, 0, 0)},
					{{0.6, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)} --Psst. Create a dummy, try setting position and angles of limbs and the weapon, save CFrame data to code. Easy? Yes. When making a single knife tool, it was all you needed.
				},
				Charge = {
					{{}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{1, 2}, 0, CFrame.new(0.5, -0.301, 0.2) * CFrame.Angles(-0.35, 0, 1.047), CFrame.new(-0.201, 0, -0.201) * CFrame.Angles(1.396, 0.087, 0.174), CFrame.new(0, -0.801, -0.801) * CFrame.Angles(-1.222, 0, 0)}
				},
				Throw = {
					{{}, 1, CFrame.new(0.5, -0.301, 0.2) * CFrame.Angles(-0.35, 0, 1.047), CFrame.new(-0.201, 0, -0.201) * CFrame.Angles(1.396, 0.087, 0.174), CFrame.new(0, -0.801, -0.801) * CFrame.Angles(-1.222, 0, 0)},
					{{0.1, 2}, 1, CFrame.new(0.5, -0.301, 0.2) * CFrame.Angles(-0.873, 0, 0.523), CFrame.new(-0.201, -0.201, 0.1) * CFrame.Angles(-0.35, 0.087, -0.175), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.5, 2}, 1, CFrame.new(0.5, -0.401, 0.2) * CFrame.Angles(-0.699, 0, 0.872), CFrame.new(-0.201, -0.201, 0) * CFrame.Angles(-1.92, -0.175, 0.174), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0, 2}, 0, CFrame.new(0.5, -0.401, 0.2) * CFrame.Angles(-0.699, 0, 0.872), CFrame.new(-0.201, -0.201, 0) * CFrame.Angles(-1.92, -0.175, 0.174), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)},
					{{0.4, 2}, 0, CFrame.new(0.4, -0.201, 0.2) * CFrame.Angles(-0.873, 0, 0.698), CFrame.new(-0.201, 0, 0) * CFrame.Angles(-0.175, 0.349, -0.262), CFrame.new(0, -0.95, -0.801) * CFrame.Angles(-1.571, 0, 0)}
				}
			}
			
			
			function CFrameTrans(GetCFrame1, GetCFrame2, GetNumber)
				local Diff2 = GetCFrame2.p - GetCFrame1.p
				local GetCFrame1_s = GetCFrame1 - GetCFrame1.p
				GetCFrame2 = GetCFrame2 - GetCFrame2.p
				local Diff = GetCFrame1_s:inverse() * GetCFrame2
				local x1, y1, z1 = Diff:toEulerAnglesXYZ()
				return (GetCFrame1 + (Diff2 * GetNumber)) * CFrame.Angles(x1 * GetNumber, y1 * GetNumber, z1 * GetNumber)
			end
			
			function TransEff(x, type)
				if type == 1 then
					return x
				elseif type == 2 then
					return x*x*(3 - 2*x)
				elseif type == 3 then
					return math.sin(math.rad(x * 90))
				elseif type == 4 then
					return 1 - math.sin(math.rad((1 - x) * 90))
				end
			end
			
			function num_trans(n1, n2, x)
				return n1 + ((n2 - n1) * x)
			end
			
			function PlayAnimation(animd, tm) --return {left, right, wep, trans}
				tm = math.min(1, math.max(0, tm))
				local anim = Animations[animd]
				if #anim == 1 then
					return {anim[1][3], anim[1][4], anim[1][5], anim[1][2]}
				else
					local trans_from = 1
					local trans_to = 1
					local tm_left = tm
					for i = 2, #anim do
						tm_left = tm_left - anim[i][1][1]
						if tm_left <= 0 then
							trans_from = i - 1
							trans_to = i
							break
						end
					end
					local trans_amm = TransEff((anim[trans_to][1][1] + tm_left) / anim[trans_to][1][1], anim[trans_to][1][2])
					return {
						CFrameTrans(anim[trans_from][3], anim[trans_to][3], trans_amm),
						CFrameTrans(anim[trans_from][4], anim[trans_to][4], trans_amm),
						CFrameTrans(anim[trans_from][5], anim[trans_to][5], trans_amm),
						num_trans(anim[trans_from][2], anim[trans_to][2], trans_amm)
					}
				end
			end
			
			rot_amplitude_head = 20
			rot_amplitude_chest = 15
			
			anim_p = {
				cam_offset = CFrame.new(0.2, -0.37, 0.91) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)),
				aim_amp = 0.5,
				aim_max_change = 4,
				aim_retract = 15,
				aim_max_deg = 20,
			}
			
			local weapon_model = Instance.new("Part")
			weapon_model.CanCollide = false
			weapon_model.Name = "WeaponObject"
			weapon_model.formFactor = "Custom"
			weapon_model.Size = Vector3.new(0.2, 0.2, 0.2)
			weapon_model.TopSurface = 0
			weapon_model.BottomSurface = 0
			weapon_model.BrickColor = weapon_properties.brick_color
			weapon_model.Transparency = weapon_properties.transparency
			weapon_model.Reflectance = weapon_properties.reflectance
			local mesh = Instance.new("SpecialMesh", weapon_model)
			mesh.Scale = weapon_properties.scale
			mesh.MeshId = weapon_properties.mesh_id
			mesh.TextureId = weapon_properties.texture_id
			
			torso = character.Torso
			head = character.Head
			
			motors = {torso:findFirstChild("Left Shoulder"), torso:findFirstChild("Right Shoulder"), torso:findFirstChild("Neck")}
			welds = {nil, nil, nil}
			weapon_parts = {weapon_model:clone(), weapon_model:clone()}
			weapon_model = nil
			
			function EndAnimation()
				if motors[1] then
					motors[1].Part1 = character:findFirstChild("Left Arm")
				end
				if motors[2] then
					motors[2].Part1 = character:findFirstChild("Right Arm")
				end
				if motors[3] then
					motors[3].Part1 = character:findFirstChild("Head")
				end
				if welds[1] then
					welds[1]:remove()
					welds[1] = nil
				end
				if welds[2] then
					welds[2]:remove()
					welds[2] = nil
				end
				if welds[3] then
					welds[3]:remove()
					welds[3] = nil
				end
				weapon_parts[1].Parent = nil
				if weapon_model then
					weapon_model.Parent = nil
				end
				coroutine.resume(coroutine.create(function()
					local swm = weapon_model
					wait()
					swm.Parent = nil
					wait(0.1)
					swm.Parent =  nil
					wait(0.5)
					swm.Parent =  nil
				end))
			end
			
			local anim_model = Instance.new("Model")
			anim_model.Name = "WeaponAnimation"
			weapon_model = anim_model
				
			local cam_larm = Instance.new("Part")
			cam_larm.Parent = anim_model
			cam_larm.BrickColor = BrickColor.new("Really black")
			cam_larm.formFactor = "Custom"
			cam_larm.Size = Vector3.new(0.2, 0.2, 0.2)
			cam_larm.TopSurface = 0
			cam_larm.BottomSurface = 0
			cam_larm.Transparency = 0.4
			cam_larm.CanCollide = false
			local hmesh = Instance.new("BlockMesh", cam_larm)
			hmesh.Scale = Vector3.new(5, 10, 5)
			
			local cam_rarm = cam_larm:clone()
			cam_rarm.Parent = anim_model
			
			function StartAnimation()
				local check = {torso:findFirstChild("LeftWeld"), torso:findFirstChild("RightWeld"), torso:findFirstChild("HeadWeld")}
				if check[1] then check[1]:remove() end
				if check[2] then check[2]:remove() end
				if check[3] then check[3]:remove() end
				local check2 = {character:findFirstChild("WeaponObject"), camera:findFirstChild("WeaponAnimation")}
				if check2[1] then check2[1].Parent = nil end
				if check2[2] then check2[2].Parent = nil end
				if motors[1] then
					motors[1].Part1 = nil
				end
				if motors[2] then
					motors[2].Part1 = nil
				end
				if motors[3] then
					motors[3].Part1 = nil
				end
				welds = {Instance.new(conn_type), Instance.new(conn_type), Instance.new(conn_type)}
				welds[1].Part0 = torso
				welds[2].Part0 = torso
				welds[3].Part0 = torso
				welds[1].Part1 = character:findFirstChild("Left Arm")
				welds[2].Part1 = character:findFirstChild("Right Arm")
				welds[3].Part1 = character:findFirstChild("Head")
				welds[1].Name = "LeftWeld"
				welds[2].Name = "RightWeld"
				welds[2].Name = "HeadWeld"
				welds[1].C0 = CFrame.new(-1.5, 0, 0)
				welds[2].C0 = CFrame.new(1.5, 0, 0)
				welds[3].C0 = CFrame.new(0, 1.5, 0)
				welds[1].Parent = torso
				welds[2].Parent = torso
				welds[3].Parent = torso
				
				weapon_parts[1].Parent = character
				local wep_weld = Instance.new(conn_type)
				wep_weld.Part0 = character:findFirstChild("Right Arm")
				wep_weld.Part1 = weapon_parts[1]
				wep_weld.C0 = CFrame.new()
				wep_weld.Parent = weapon_parts[1]
				
				local weld1 = welds[1]
				local weld2 = welds[2]
				local weld3 = welds[3]
				
				local cam_welds = {Instance.new(conn_type), Instance.new(conn_type), Instance.new(conn_type)}
				cam_welds[1].Part0 = torso
				cam_welds[1].Part1 = cam_larm
				cam_welds[1].Parent = cam_larm
				cam_welds[2].Part0 = torso
				cam_welds[2].Part1 = cam_rarm
				cam_welds[2].Parent = cam_rarm
				cam_welds[3].Part0 = cam_rarm
				cam_welds[3].Part1 = weapon_parts[2]
				cam_welds[3].Parent = weapon_parts[2]
				weapon_parts[2].Parent = anim_model
				
				local move_anim_speed = 3
				local last_p = Vector3.new()
				local move_amm = 0
				coroutine.resume(coroutine.create(function()
					while weld1.Parent ~= nil do
						local delta = wait(1/25)
						local cur_p = torso.Position
						if (cur_p - last_p).magnitude >= 0.1 then
							move_amm = math.min(1, move_amm + delta * move_anim_speed)
						else
							move_amm = math.max(0, move_amm - delta * move_anim_speed)
						end
						last_p = cur_p
					end
				end))
				
				local r_serv = game:GetService("RunService")
				
				--EASTER EGG
				function easein(x)
					return math.sin(math.rad(x * 90))
				end
			
				local a_horse = (character:findFirstChild("HorseHead") ~= nil)
				local horse_displace = {0, 0}
				local horse_cf = CFrame.Angles(0.0001, 0.0001, 0)
				if a_horse then
					coroutine.resume(coroutine.create(function()
						while weld1.Parent ~= nil do
							local rndwait = (math.random(100, 1000) / 1000) * 4
							wait(rndwait)
							local oldd = {horse_displace[1], horse_displace[2]}
							local disp2 = {math.random(-60, 60), math.random(0, 25)}
							
							local ld = 0
							while ld ~= 1 do
								local st = tick()
								r_serv.RenderStepped:wait()
								ld = math.min(1, ld + ((tick() - st) * 4))
								local eff = easein(ld)
								
								local x = oldd[1] - ((oldd[1] - disp2[1]) * eff)
								local y = oldd[2] - ((oldd[2] - disp2[2]) * eff)
								horse_displace = {x, y}
								horse_cf = CFrame.Angles(math.rad(y), math.rad(x) , 0)
							end
						end
					end))
				end
				
				--EASTER EGG
				
				local last_va = 0
				local last_va2 = 0
				local view_velocity = {0, 0}
				
				coroutine.resume(coroutine.create(function()
					local last_time = tick()
					while weld1.Parent ~= nil do
						r_serv.RenderStepped:wait() ------------------------------------------------
						local delta = tick() - last_time
						last_time = tick()
						
						local breathe_amp = 2
						local breathe_freq = 0.8
						local breathe = math.sin(math.rad(tick() * 90 * breathe_freq)) * breathe_amp
						
						local shake_freq = 5
						local shake_amp = {0.05, 0.05}
						local arm_shake = CFrame.new(
							math.sin(math.rad(tick() * 90 * shake_freq)) * move_amm * shake_amp[1],
							0,
							math.abs(math.sin(math.rad(tick() * 90 * shake_freq)) * move_amm * shake_amp[2]))
			
			
						--ANIMATION LOOP
						local p_distance = (head.Position - mouse.Hit.p).magnitude
						if p_distance == 0 then p_distance = 0.0001 end
						local p_height = mouse.Hit.p.y - head.Position.y
						local view_angle 
						if p_height ~= 0 then
							view_angle = math.deg(math.asin(math.abs(p_height) / p_distance)) * (math.abs(p_height) / p_height)
						else
							view_angle = 0
						end
						
						local cam_cf = camera.CoordinateFrame
						local looking_at = cam_cf * CFrame.new(0, 0, -100)
						local view_angle2 = math.deg(math.atan2(cam_cf.p.x - looking_at.p.x, cam_cf.p.z - looking_at.p.z)) + 180
						
						local v_delta1, v_delta2
						local dir1 = 0
						local dir2 = 0
						v_delta1 = math.abs(view_angle - last_va)
						if v_delta1 ~= 0 then
							dir1 = (view_angle - last_va) / v_delta1
						end
						local va_check = {math.abs(view_angle2 - last_va2), 360 - math.abs(view_angle2 - last_va2)}
						if view_angle2 == last_va2 then
							dir2 = 0
							v_delta2 = 0
						elseif va_check[1] < va_check[2] then
							v_delta2 = va_check[1]
							dir2 = (view_angle2 - last_va2) / va_check[1]
						else
							v_delta2 = va_check[2]
							if last_va2 > view_angle2 then
								dir2 = 1
							else
								dir2 = -1
							end
						end
						last_va = view_angle
						last_va2 = view_angle2
						
						view_velocity[1] = view_velocity[1] / (1 + (delta * anim_p.aim_retract))
						view_velocity[2] = view_velocity[2] / (1 + (delta * anim_p.aim_retract))
						
						local calc1 = v_delta1 * dir1 * anim_p.aim_amp
						if calc1 ~= 0 then
							view_velocity[1] = view_velocity[1] + (math.min(anim_p.aim_max_change, math.abs(calc1)) * (calc1 / math.abs(calc1)))
						end
						local calc2 = v_delta2 * dir2 * anim_p.aim_amp
						if calc2 ~= 0 then
							view_velocity[2] = view_velocity[2] + (math.min(anim_p.aim_max_change, math.abs(calc2)) * (calc2 / math.abs(calc2)))
						end
						
						if view_velocity[1] ~= 0 then
							view_velocity[1] = math.min(anim_p.aim_max_deg, math.abs(view_velocity[1])) * (math.abs(view_velocity[1]) / view_velocity[1])
						end
						if view_velocity[2] ~= 0 then
							view_velocity[2] = math.min(anim_p.aim_max_deg, math.abs(view_velocity[2])) * (math.abs(view_velocity[2]) / view_velocity[2])
						end
						
						local anmtp = _G.MurderKnife_AnimType
						local anmst = _G.MurderKnife_AnimState
						
						if anmst == nil then
							anmst = 0
						end
						
						if anmtp ~= nil then
							if Animations[anmtp] == nil then
								anmtp = "Default"
							end
						else
							anmtp = "Default"
						end
						local curr_anim = PlayAnimation(anmtp, anmst) --left, right, weapon, wep trans
						
						--curr_anim = {Animations.Default[1][3], Animations.Default[1][4], Animations.Default[1][5], 0}
						
						local chestCF = CFrame.new(0, 0.5, 0) * CFrame.Angles(math.rad(math.max(-rot_amplitude_chest, math.min(rot_amplitude_chest, view_angle)) + 90 + breathe), 0, 0)
						weld1.C1 = (chestCF * curr_anim[1] * CFrame.new(0, -0.5, 0)):inverse()
						weld2.C1 = (chestCF * curr_anim[2] * CFrame.new(0, -0.5, 0)):inverse()
						wep_weld.C1 = (curr_anim[3]):inverse()
						weapon_parts[1].Transparency = curr_anim[4]
						if anim_head then
							weld3.C1 = (CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.max(-rot_amplitude_head, math.min(rot_amplitude_head, view_angle))), 0, 0) * horse_cf):inverse()
						else
							weld3.C1 = (CFrame.new(0, 0, 0)):inverse()
						end
						
						if (head.Position - camera.CoordinateFrame.p).magnitude < 3 then
							if anim_model.Parent == nil then
								anim_model.Parent = camera
							end
							cam_welds[1].Parent = cam_larm
							cam_welds[2].Parent = cam_rarm
							cam_welds[3].Parent = weapon_parts[2]
							for _,c in pairs(cam_larm:GetChildren()) do
								if c:IsA("Snap") and c ~= cam_welds[1] then
									c:remove()
								end
							end
							for _,c in pairs(cam_rarm:GetChildren()) do
								if c:IsA("Snap") and c ~= cam_welds[2] then
									c:remove()
								end
							end
							for _,c in pairs(weapon_parts[2]:GetChildren()) do
								if c:IsA("Snap") and c ~= cam_welds[3] then
									c:remove()
								end
							end
							local cam_cf = camera.CoordinateFrame * CFrame.Angles(math.rad(90 + (breathe / 2) - view_velocity[1]), 0, math.rad(view_velocity[2])) * arm_shake * anim_p.cam_offset
							cam_welds[1].C1 = (torso.CFrame:inverse() * cam_cf * CFrame.new(-1.5, 0, 0) * curr_anim[1] * CFrame.new(0, -0.5, 0)):inverse()
							cam_welds[2].C1 = (torso.CFrame:inverse() * cam_cf * CFrame.new(1.5, 0, 0) * curr_anim[2] * CFrame.new(0, -0.5, 0)):inverse()
							cam_welds[3].C1 = (curr_anim[3]):inverse()
							weapon_parts[2].Transparency = curr_anim[4]
						else
							if anim_model.Parent ~= nil then
								anim_model.Parent = nil
							end
						end
						--ANIMATION LOOP
					end
				end))
			end
			
			local last_st = 0
			local eq = false
			tool.Selected:connect(function(mouse)
				if eq then return end
				eq = true
				wait()
				StartAnimation()
			end)
			
			tool.Deselected:connect(function()
				eq = false
				EndAnimation()
			end)
		end)
	elseif Key == "v" and Enabled then
		local Character = Player.Character
		if Character and Character ~= nil then
			if not Invisible then
				for i,Part in pairs(Character:GetChildren()) do
					if string.find(Part.ClassName, "Part") then
						Part.Transparency = 1
					elseif Part.ClassName == "Hat" or Part.ClassName == "Accessory" then
						if Part:findFirstChild("Handle") then
							Part.Handle.Transparency = 1
						end
					end
				end
				if Character:findFirstChild("Head") then
					if Character:findFirstChild("Head"):findFirstChild("face") then
						Character:findFirstChild("Head"):findFirstChild("face").Transparency = 1
					end
				end
				Invisible = true
				Notify("You are now invisible!", Color3.new(1, 1, 1))
			else
				for i,Part in pairs(Character:GetChildren()) do
					if string.find(Part.ClassName, "Part") then
						if Part.Name ~= "HumanoidRootPart" then
							Part.Transparency = 0
						end
					elseif Part.ClassName == "Hat" or Part.ClassName == "Accessory" then
						if Part:findFirstChild("Handle") then
							Part.Handle.Transparency = 0
						end
					end
				end
				if Character:findFirstChild("Head") then
					if Character:findFirstChild("Head"):findFirstChild("face") then
						Character:findFirstChild("Head"):findFirstChild("face").Transparency = 0
					end
				end
				Invisible = false
				Notify("You are now visible!", Color3.new(1, 1, 1))
			end
		end
	elseif Key == "z" and Enabled then
		local Character = Player.Character
		if Character and Character ~= nil then
			if Character:findFirstChild("Head") and Character:findFirstChild("Torso") then
				if NoClip then
					NoClip = false
					Character:findFirstChild("Head").CanCollide = true
					Character:findFirstChild("Torso").CanCollide = true
					Notify("No-clip is now off!", Color3.new(1, 1, 1))
				else
					NoClip = true
					Notify("No-clip is now activated!", Color3.new(1, 1, 1))
					spawn(function()
						game:GetService("RunService").Stepped:connect(function()
							if Character and NoClip and Character:findFirstChild("Head") and Character:findFirstChild("Torso") then
								Character:findFirstChild("Head").CanCollide = false
								Character:findFirstChild("Torso").CanCollide = false
							end
						end)
					end)
				end
			else
				Notify("R15/16 is not supported with no-clip!", BrickColor.new("Really red").Color)
			end
		end
	elseif wayPoints[Key] and Enabled then
		local Character = Player.Character
		if Character and Character ~= nil then
			if Character:findFirstChild("HumanoidRootPart") then
				local Root = Character:findFirstChild("HumanoidRootPart")
				Root.CFrame = wayPoints[Key].CF * CFrame.new(0, 3, 0)
				Notify("Going to way-point: '"..Key:upper().."'", Color3.new(1, 1, 1))
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:connect(function()
	if NoClip then
		local Character = Player.Character
		if Character and Character ~= nil then
			if Character:findFirstChild("Head") and Character:findFirstChild("Torso") then
				Character:findFirstChild("Head").CanCollide = false
				Character:findFirstChild("Torso").CanCollide = false
			end
		end
	end
end)
