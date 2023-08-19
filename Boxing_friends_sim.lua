-- Gui library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Main window
local Window = OrionLib:MakeWindow({
    Name = "@qu4nh",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YourConfigFolder"
})

-- Tabs
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://your_icon_id"
})


-- Main
MainTab:AddButton({
    Name = "Tự động giết 200 boss lv 20",
    Callback = function()
        for i=1,300 do
            local args = {
                [1] = "Kill",
                [2] = "Level 20"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("NPC"):FireServer(unpack(args))
            wait(0.5)
        end
    end
})

MainTab:AddButton({
    Name = "auto egg (ko auto delete, spam càng nhiều càng nhanh)",
    Callback = function()
        while true do
            local args = {
                [1] = "Town",
                [2] = 1
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("HatchEgg"):InvokeServer(unpack(args))
            wait(0)
        end
    end
})

MainTab:AddButton({
    Name = "Kill boss lv5",
    Callback = function()
        local args = {
            [1] = "Kill",
            [2] = "Level 5"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("NPC"):FireServer(unpack(args))
    end
})

MainTab:AddButton({
    Name = "Kill boss lv10",
    Callback = function()
        local args = {
            [1] = "Kill",
            [2] = "Level 10"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("NPC"):FireServer(unpack(args))
    end
})

MainTab:AddButton({
    Name = "Kill boss lv15",
    Callback = function()
        local args = {
            [1] = "Kill",
            [2] = "Level 15"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("NPC"):FireServer(unpack(args))
    end
})

-- Init
OrionLib:Init()