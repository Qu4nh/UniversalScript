local function ConvertTextToNumber(text)
    local value, suffix = text:match("([%d,%.]+)([kK]?)")
    if value then
        value = value:gsub(",", "")
        if suffix == "" or suffix:lower() == "k" then
            return tonumber(value) * (suffix:lower() == "k" and 1000 or 1)
        end
    end
    return nil
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Cuc cut",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local isToggled = false

local toggleButton = Tab:AddToggle({
    Name = "Poop",
    Callback = function(enabled)
        isToggled = enabled
        local args = {
            [1] = "Poop",
            [2] = "Spawn",
            [3] = "Poop"
        }
        while isToggled do
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end
})

local coinToggle = Tab:AddToggle({
    Name = "Coin Farm",
    Callback = function(enabled)
        _G.autofinish = enabled
        while _G.autofinish do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 46, 129)
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132, 56, 232)
        end
    end
})

local coinAndRebirthToggle = Tab:AddToggle({
    Name = "Coin Farm và Rebirth",
    Callback = function(enabled)
        _G.autofinishAndRebirth = enabled
        while _G.autofinishAndRebirth do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 46, 129)
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132, 56, 232)
            
            local requiredCoinsText = game.Workspace.Rebirth.RebirthHolder.SurfaceGui.TextLabel.Text
            local requiredCoins = ConvertTextToNumber(requiredCoinsText)
            local playerCoins = game.Players.LocalPlayer.leaderstats.Coins.Value
            
            if playerCoins >= requiredCoins then
                PerformRebirth()
            end
        end
    end
})

local rebirthButton = Tab:AddButton({
    Name = "Rebirth",
    Callback = function()
        PerformRebirth()
    end
})

function PerformRebirth()
    local RebirthPrompt = game.Workspace.Rebirth.RebirthPart.ProximityPrompt
    RebirthPrompt.RequiresLineOfSight = false
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
        = game.Workspace.Rebirth.RebirthPart.CFrame
    wait(0.2)
    fireproximityprompt(RebirthPrompt)
    wait() -- This ensures that the coin farming resumes immediately after rebirth
end

OrionLib:Init()