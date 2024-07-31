-- Instances:

local rayhub = game:GetService("CoreGui"):WaitForChild("RayHub")
local DraggableButton = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

--Properties:

DraggableButton.Name = "DraggableButton"
DraggableButton.Parent = CoreGui
DraggableButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = DraggableButton
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.500625253, 0, 0.121980675, 0)
ImageButton.Size = UDim2.new(0, 54, 0, 54)
ImageButton.Image = "rbxassetid://18726080466"

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton

-- Scripts:

local function MUBRB_fake_script() -- ImageButton.Dragify 
	local script = Instance.new('LocalScript', ImageButton)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
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
end
coroutine.wrap(MUBRB_fake_script)()

ImageButton.MouseButton1Click:Connect(function()
rayhub.Enabled = not rayhub.Enabled
end)
