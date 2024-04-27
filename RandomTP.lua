-----------------------------------------------------------------------------

-- TROLL SCRIPTS BY IAYZBOY
-- THIS CODE IS OPEN SOURCE AND THUS FREE TO USE.

-----------------------------------------------------------------------------
local players = game:GetService("Players")
local plr = players.LocalPlayer
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()
local Active = false
local Distance = 15

NEVERLOSE:Theme("Dark")

local Notification = NEVERLOSE:Notification()

local Window = NEVERLOSE:AddWindow("ZBOY HUB", "TROLL SCRIPTS - NEXT GENERATION")

local Tab = Window:AddTab("Main","earth")
local Hubs = Window:AddTab("Script Hubs", "list")

local MassTp = Tab:AddSection("MASS TP", "left")
local DestroyGui = Tab:AddSection("Destroy GUI", "right")

local HubsSection = Hubs:AddSection("Script Hubs")

MassTp:AddToggle("Random TP", false, function(val)
    Active=val
end)
MassTp:AddSlider("Distance",0,50,15,function(val)
    Distance=val
end)

DestroyGui:AddButton("Destroy GUI", function()
    Window:Delete()
end)
DestroyGui:AddButton("Destroy Others", function()
    for _,v in pairs(players:GetPlayers()) do
        if v.Name~=plr.Name then
            v:Destroy()
        end
    end
end)

HubsSection:AddButton("Infinite Yield FE", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
HubsSection:AddButton("CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

function Update()
    local players2 = players:GetChildren()
    local randomplr = players2[math.random(1,#players2)]
    local randomchar = randomplr.Character
    local char = plr.Character

    if randomchar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local rndhrp = randomchar:FindFirstChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(rndhrp.Position)*CFrame.Angles(0,math.rad(math.random(-180,180)),0) * CFrame.new(0,0,Distance)
    end
end 

function RenderStepped()
    if Active then
        Update()
    end
end

game:GetService("RunService").RenderStepped:Connect(RenderStepped)
