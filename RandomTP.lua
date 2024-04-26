--hi
local players = game:GetService("Players")
local players2 = players:GetChildren()
local plr = players.LocalPlayer
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()
local Active = false

NEVERLOSE:Theme("Dark")

local Notification = NEVERLOSE:Notification()

local Window = NEVERLOSE:AddWindow("ZBOY HUB", "TROLL SCRIPTS - NEXT GENERATION")

local Tab = Window:AddTab("Main","earth")

local MassTp = Tab:AddSection("MASS TP")

MassTp:AddToggle("Random TP", false, function(val)
    Active=val
end)

function Update()
    local randomplr = players2[math.random(1,#players2)]
    local randomchar = randomplr.Character
    local char = plr.Character

    if randomchar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local rndhrp = randomchar:FindFirstChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(rndhrp.Position)*CFrame.Angles(0,math.rad(math.random(-180,180)),0)
    end
end 

function RenderStepped()
    if Active then
        Update()
    end
end

game:GetService("RunService").RenderStepped:Connect(RenderStepped)
