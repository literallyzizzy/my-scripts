local coreui = game:GetService("CoreGui")

-- Define the target name or substring you are looking for
local targetSubstring = "Vynixius"

-- Function to find a GUI by checking if its name contains the target substring
local function findGuiByNameSubstring(targetSubstring)
    -- Iterate through all children of CoreGui
    for _, child in ipairs(coreui:GetChildren()) do
        -- Check if the child is a ScreenGui and if its name contains the target substring
        if child:IsA("ScreenGui") and child.Name:find(targetSubstring) then
            return child
        end
    end
    return nil
end

-- Find the GUI
local vynixius = findGuiByNameSubstring(targetSubstring)

if gui then
    print("Found Vynixius:", gui.Name)
else
    print("Vynixius not found")
end
