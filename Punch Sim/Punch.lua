local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService") 
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer

-- Reusable functions
local function autoClick(enabled, interval)
  while enabled do
    local x, y = 420, 420
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
    
    wait(interval)
  end
end

local function autoPunch(enabled)
  while enabled do
    ReplicatedStorage.Events.DamageIncreaseOnClickEvent:FireServer()
    wait() 
  end
end

local function fireEggs(count, delay, arg)
  local args = {
    [1] = tostring(arg) 
  }

  local remote = ReplicatedStorage.Events.PlayerPressedKeyOnEgg

  for i = 1, count do
    remote:FireServer(unpack(args))
    wait(delay) 
  end

end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Main window
local Window = OrionLib:MakeWindow({
  Name = "Punch Simulator",
  HidePremium = false,
  SaveConfig = true,
  ConfigFolder = "PunchSimulator"
})

-- Tabs
local MainTab = Window:MakeTab({
  Name = "Main", 
  Icon = "rbxassetid://4483345998"
})

local EggTab = Window:MakeTab({
  Name = "Egg",
  Icon = "rbxassetid://4483345998" 
})

local GeneralTab = Window:MakeTab({
  Name = "General",
  Icon = "rbxassetid://4483345998"
})

-- Elements
MainTab:AddParagraph("made by", "pizza")

-- Main
local autoPunchEnabled = false

MainTab:AddToggle({
    Name = "skip fight",
    Default = false,
    Callback = function(Value)
        _G.skipfight = Value
        while _G.skipfight and task.wait() do
			local args = {
				[1] = true
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PushEvent"):FireServer(unpack(args))
		end
    end
})


MainTab:AddToggle({
  Name = "auto punch",
  Default = false,
  Callback = function(value) 
    autoPunchEnabled = value
    autoPunch(autoPunchEnabled)
  end
})

MainTab:AddButton({
  Name = "remove proximityprompt timer",
  Callback = function(value) 
	for _, v in next, workspace:GetDescendants() do
		if v:IsA("ProximityPrompt") then
		v.HoldDuration = 0
		end
	end
  end
})

MainTab:AddButton({
    Name = "load tora script",
    Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0PUNCH'))()
    end    
})

MainTab:AddButton({
    Name = "load redblue script",
    Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
    end    
})



-- Egg 
EggTab:AddToggle({
  Name = "Auto Hatch Forest Egg",
  Default = false,
  Callback = function(Value)
    autoBreakEgg1 = Value
    while autoBreakEgg1 and task.wait() do
      local args = {
        [1] = "1"  
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))
    end
  end
})

EggTab:AddToggle({
  Name = "Auto Hatch Desert Egg",
  Default = false,
  Callback = function(Value)
    autoBreakEgg2 = Value
    while autoBreakEgg2 and task.wait() do
      local args = {
        [1] = "2"  
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))
    end
  end
})

EggTab:AddToggle({
  Name = "Auto Hatch Farm Egg",
  Default = false,
  Callback = function(Value)
    autoBreakEgg8 = Value
    while autoBreakEgg8 and task.wait() do
      local args = {
        [1] = "8"  
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))
    end
  end
})

EggTab:AddToggle({
  Name = "Auto Hatch Samurai Egg",
  Default = false,
  Callback = function(Value)
    autoBreakEgg9 = Value
    while autoBreakEgg9 and task.wait() do
      local args = {
        [1] = "9"  
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))
    end
  end
})

EggTab:AddToggle({
  Name = "Hide Animation",
  Default = false,
  Callback = function(Value)
    autoHideAnimation = Value
    while autoHideAnimation and task.wait() do
      if workspace.Camera:FindFirstChild("EggOpenMap") then
        workspace.Camera:FindFirstChild("EggOpenMap"):Destroy()
      end
    end
  end  
})

GeneralTab:AddToggle({
  Name = "Claim UGC",
  Default = false,
  Callback = function(Value)
    autoClaimUGC = Value
    while autoClaimUGC and task.wait(0.5) do
	  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClickedEventClaimButton"):FireServer()
    end
  end  
})


GeneralTab:AddToggle({
  Name = "Claim Axolotl UGC",
  Default = false,
  Callback = function(Value)
    autoClaimUGC = Value
    while autoClaimUGC and task.wait(0.5) do
	  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClickedAxolotlEventClaimButton"):FireServer()

    end
  end  
})


local freq = GeneralTab:AddTextbox({
	Name = "autoclick interval",
	Default = "0.01",
	TextDisappear = false, 
	Callback = function(text)
		delay = tonumber(text) or 0
	end
})


GeneralTab:AddToggle({
    Name = "auto click",
    Default = false,
    Callback = function(Value)
        _G.click = Value
	    local virtual_input_manager = game:GetService("VirtualInputManager")
        while _G.click and task.wait(freq) do
	    local x, y = 420, 420
	        virtual_input_manager:SendMouseButtonEvent(x, y, 0, false, game, 0) -- Press the button
	        virtual_input_manager:SendMouseButtonEvent(x, y, 0, true, game, 0) -- Release the button
	    end
    end
})

OrionLib:Init()