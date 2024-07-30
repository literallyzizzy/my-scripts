-- Instances:

local ButtonParent = Instance.new("ScreenGui")
ButtonParent.Name = "ButtonParent"
ButtonParent.Parent = game:GetService("CoreGui")
ButtonParent.Enabled = true

local ToggleButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

-- Properties:

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ButtonParent
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.487588584, 0, 0.122569606, 0)
ToggleButton.Size = UDim2.new(0, 65, 0, 64)
ToggleButton.Image = "rbxassetid://18726080466"

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

-- Scripts:

local function OQBES_fake_script() -- ToggleButton.Dragify 
	local script = Instance.new('LocalScript', ToggleButton)

	local UserInputService = game:GetService("UserInputService")
	local CoreGui = game:GetService("CoreGui")
	
	local gui = script.Parent
	local rayHub = CoreGui:WaitForChild("RayHub")
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	gui.MouseButton1Down:Connect(function()
		gui.ImageTransparency = 0.5 -- Make the image go slightly brighter
	end)
	
	gui.MouseButton1Up:Connect(function()
		gui.ImageTransparency = 0 -- Revert to original brightness
	end)
	
	gui.MouseButton1Click:Connect(function()
		if rayHub.Enabled then
			rayHub.Enabled = false
		else
			rayHub.Enabled = true
		end
	end)
end

coroutine.wrap(OQBES_fake_script)()
