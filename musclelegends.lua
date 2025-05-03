local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local user = Players.LocalPlayer
loadstring(game:HttpGet('https://renskihub.onrender.com/whitelist-check?ID='.. user.UserId))()
local Window = Rayfield:CreateWindow({
   Name = "Muscle Legends | RNSHub • PAID",
   Icon = 0,  
   LoadingTitle = "RNSHUB",
   LoadingSubtitle = "by Renski",
   Theme = "Default", 
   KeySystem = false
})
Rayfield:Notify({
    Title = "RNSHub",
    Content = "Running...",
    Duration = 5.5
    
})
-- TABS
basicTab = Window:CreateTab(
    "Basic",
    "home"
)
autoTab = Window:CreateTab(
    "Auto",
    "bot"
)
grindTab = Window:CreateTab(
    "Grind",
    "target"
)
-- FUN
autoTab:CreateToggle({
    Name = "Auto Rebirth (INFINITE)",
    Default = false,
    Callback = function(value)
        autoreb = true
        while autoreb and wait(0.1) do
            if value then
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            else
                break
            end
        end
    end
})
basicTab:CreateSlider({
    Name = "Speed",
    Range = {0,100},
    Increment = 10,
    Suffix = "Speed",
    Flag = "Slider_SPEED",
    CurrentValue = 16,
    Callback = function(value)
        human = User.Character:WaitForChild("humanoid")
        human.WalkSpeed = value
    end
})
autoTab:CreateToggle({
    Name = "Auto Spin Wheel",
    Default = false,
    Callback = function(boolean)
        while boolean and wait(1) do
            if boolean then
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
            else 
                break
        end
    end
end
})
grindTab:CreateButton({
    Name = "Reset Stats",
    Default = false,
    Callback = function()
          sessionStartStrength = player.leaderstats.Strength.Value
          sessionStartDurability = player.Durability.Value
          sessionStartKills = player.leaderstats.Kills.Value
          sessionStartRebirths = player.leaderstats.Rebirths.Value
          sessionStartBrawls = player.leaderstats.Brawls.Value
          sessionStartTime = os.time()
          Reyfield:Notify({
              Title = "STATS",
              Content = "Resets Stats.",
              Duration = 5.5
          })
      end
})
