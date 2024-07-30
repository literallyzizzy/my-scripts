-- Instances:

local rayhub = game:GetService("CoreGui"):WaitForChild("RayHub")
local RayHubToggle = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

--Properties:

RayHubToggle.Name = "RayHubToggle"
RayHubToggle.Parent = CoreGui

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = RayHubToggle
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.502141595, 0, 0.122569606, 0)
ToggleButton.Size = UDim2.new(0, 49, 0, 49)
ToggleButton.Image = "rbxassetid://18726080466"

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

-- Scripts:

local function ZUGHZR_fake_script() -- ToggleButton.Dragify
local script = Instance.new('LocalScript', ToggleButton)

local UserInputService = game:GetService("UserInputService")



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
coroutine.wrap(ZUGHZR_fake_script)()

ToggleButton.MouseButton1Click:Connect(function()
rayhub.Enabled = not rayhub.Enabled
end)
