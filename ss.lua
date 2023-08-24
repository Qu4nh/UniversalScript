local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "qu4nh",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local tpButton = Tab:AddButton({
    Name = "tp đến 1v1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1098.98352, 6.51116514, -702.954834, 0.0724184737, -5.01507031e-08, 0.997374356, -1.0675528e-08, 1, 5.10578708e-08, -0.997374356, -1.43450309e-08, 0.0724184737)
    end
})

local autowin1v1Toggle = Tab:AddToggle({
    Name = "autowin 1v1",
    Callback = function(enabled)
        local args = {
            [1] = Vector3.new(1074.0670166015625, 0, -714.471923828125)
        }
        while enabled do
            game:GetService("ReplicatedStorage").Court_ClientHitBall:InvokeServer(unpack(args))
            wait()
        end
    end
})

local tpTo2v2Button = Tab:AddButton({
    Name = "tp đến 2v2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1153.77332, 13.3695154, -985.076782, 0.999623418, -4.01099776e-08, -0.0274405591, 4.26719815e-08, 1, 9.27800272e-08, 0.0274405591, -9.39160287e-08, 0.999623418)
    end
})

local autowin2v2Toggle = Tab:AddToggle({
    Name = "autowin 2v2",
    Callback = function(enabled)
        local args = {
            [1] = Vector3.new(1153.5850830078125, 0, -1025.8641357421875)
        }
        while enabled do
            game:GetService("ReplicatedStorage").Court_ClientHitBall:InvokeServer(unpack(args))
            wait()
        end
    end
})

local autocompleteButton = Tab:AddButton({
    Name = "autocomplete ball crew",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents.RL_Start.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents["RL_Checkpoint 1"].CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents["RL_Checkpoint2"].CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents["RL_Checkpoint3"].CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents["RL_Checkpoint4"].CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RALPHLAUREN.RL_Obby.RLComponents.GoalTrigger.CFrame
    end
})

local autocompleteEmiratesButton = Tab:AddButton({
    Name = "autocomplete emirates",
    Callback = function()
        local prompt = game.Workspace.ART.EMIRATES.E_Obby.ZiplineExpress_Middle.StartInteractionPoint.ProximityPrompt

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Start.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Em_Checkpoint2.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Em_Checkpoint3.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Em_Checkpoint4.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Em_Checkpoint5.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.EComponents.Em_Checkpoint6.CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1356.98181, 213.826767, -573.327209, 0.00524246693, 0, 0.999986291, 0, 1, 0)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1306.82971, 211.961411, -528.159241, 0.999986112, -0, -0.00526562473, 0, 1, -0)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ART.EMIRATES.E_Obby.ZiplineExpress_Middle.StartInteractionPoint.CFrame
        wait(0.01)
        fireproximityprompt(prompt)
    end
})

local tpToCannonButton = Tab:AddButton({
    Name = "tp đến cannon",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1342.35535, 33.3637123, -705.19928, -0.999978721, -4.27194067e-08, 0.00652595283, -4.34088534e-08, 1, -1.05505052e-07, -0.00652595283, -1.05786086e-07, -0.999978721)
    end
})

OrionLib:Init()