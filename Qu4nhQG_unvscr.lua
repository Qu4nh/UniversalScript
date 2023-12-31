--by Qu4nh 

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Player
local LocalPlayer = Players.LocalPlayer

-- Gui library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Main window
local Window = OrionLib:MakeWindow({
    Name = "Tổng hợp Script (Qu4nh)",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YourConfigFolder"
})

-- Tabs
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://your_icon_id"
})

local PurchaseTab = Window:MakeTab({
    Name = "Mua hàng",
    Icon = "rbxassetid://your_icon_id"
})

local ServersTab = Window:MakeTab({
    Name = "Servers",
    Icon = "rbxassetid://your_icon_id"
})

local GameTab = Window:MakeTab({
    Name = "Games",
    Icon = "rbxassetid://your_icon_id"
})

-- Main
MainTab:AddButton({
    Name = "Xoá thời gian giữ nút",
    Callback = function()
        while true do
            for _, v in next, workspace:GetDescendants() do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end
            wait(1) -- Adjust the delay between loops as needed
        end
    end
})

MainTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

MainTab:AddButton({
    Name = "Ghost hub",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})

MainTab:AddButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
})

MainTab:AddButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MaksBloxX/NoClipScript/main/Fly%20V3", true))()
    end
})

MainTab:AddButton({
    Name = "Mở khoá emotes",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FEmotesGui/main/FEmotesGui.lua", true))()
    end
})

MainTab:AddToggle({
    Name = "Xoá tất cả người chơi",
    Default = false,
    Callback = function(Value)
        _G.HideAll = Value
	while _G.HideAll and  task.wait() do

	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Name ~= game.Players.LocalPlayer.Name and v.Character then
			v.Character:Destroy()
		end
	end
	end
    end
})

-- Purchase
local desiredID = "14392245801"

local idTextbox = PurchaseTab:AddTextbox({
    Name = "ID item",
    Default = desiredID,
    TextDisappear = false,
    Callback = function(text)
        desiredID = text
    end
})

PurchaseTab:AddButton({
    Name = "Nhắc nhở mua hàng (có thể không hoạt động)",
    Callback = function()
        local args = {
            [1] = tonumber(desiredID) or 0
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PromptPurchaseEvent"):FireServer(unpack(args))
    end
})

-- Servers
ServersTab:AddButton({
    Name = "Tham gia máy chủ bé nhất bây giờ",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"

        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"

        local function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
            return Http:JSONDecode(Raw)
        end

        local Server, Next
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server

        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
})

ServersTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
        module:Teleport(game.PlaceId)
    end
})

GameTab:AddButton({
    Name = "Push Simulator",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Push/main/Simulator5"))()
    end
})

GameTab:AddButton({
    Name = "Punch simulator",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubPunchingSimulator.lua", true))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/Punch%20Simulator.lua"))()
    end
})

GameTab:AddButton({
    Name = "Ninja Fighting Simulator",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0Ninja"))()
    end
})


-- Init
OrionLib:Init()
