-- Try to get the AppleWare iOS GUI from CoreGui
local appleware = game:GetService("CoreGui"):FindFirstChild("AppleWare iOS")

-- Check if the AppleWare iOS GUI exists
if appleware then
    -- Start the search from the root of the AppleWare iOS GUI
local elementsToCheck = {appleware}

while #elementsToCheck > 0 do
    local element = table.remove(elementsToCheck)

    -- Check if the current element is a TextLabel, TextButton, or TextBox
    if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
        if element.Text == "discord.gg/appleware" then
            element.Text = "discord.gg/fPMkjerXTX"
            break  -- Stop searching once the text is found and changed
        end
    end

    -- Add all children of the current element to the list to check
    for _, child in ipairs(element:GetChildren()) do
        table.insert(elementsToCheck, child)
    end
end

-- Start the search from the root of the AppleWare iOS GUI
local elementsToCheck = {appleware}

while #elementsToCheck > 0 do
    local element = table.remove(elementsToCheck)

    -- Check if the current element is a TextLabel, TextButton, or TextBox
    if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
        if element.Text == "Join our Discord server!" then
            element.Text = "You’re using Ray Hub, why not join our server?"
            break  -- Stop searching once the text is found and changed
        end
    end

    -- Add all children of the current element to the list to check
    for _, child in ipairs(element:GetChildren()) do
        table.insert(elementsToCheck, child)
    end
end
else
    -- Do nothing if it doesn't exist
end
