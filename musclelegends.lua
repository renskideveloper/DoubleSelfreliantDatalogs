local Red = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = Red:MakeWindow({
    Title = "Muscle Legends | Renski • Paid Script",
    SubTitle = "© Renski"
})
local Players = game:GetService("Players")
local user = Players.LocalPlayer
local basic = Window:MakeTab({
    "Basic",
    "cherry"
})
local whitelisted = loadstring(game:HttpGet("https://renskihub.onrender.com/whiteliste-check?ID="..user.UserId))()

local VirtualUser = game:GetService("VirtualUser")
local antiAFKConnection

local function setupAntiAFK()
    -- Disconnect previous connection if it exists
    if antiAFKConnection then
        antiAFKConnection:Disconnect()
    end
    
    -- Connect to PlayerIdleEvent to prevent AFK kicks
    antiAFKConnection = player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("Anti-AFK: Prevented idle kick")
    end)
    
    print("Anti-AFK system enabled")
end

-- Initialize Anti-AFK system
setupAntiAFK()

basic:AddToggle({
    Name = "Anti AFK",
    Default = false,
    Callback = function(bool)
        if bool then
            setupAntiAFK()
        else
            antiAFKConnection:Disconnect()
        end
    end
})
basic:AddSliders({
    Name = "Speed Hack",
    Min = 16,
    Max = 100,
    Increase = 10,
    Callback = function(value)
       local humanoid = player.Character:WaitForChild("Humanoid")
       humanoid.WalkSpeed(value)
   end
})
local auto = Window:MakeTab("Auto", "cherry")

local autoreb = false
auto:AddToggle({
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

local autoSize = false
auto:AddToggle({
    Name = "Auto Size 1",
    Default = false,
    Callback = function(value)
        autoSize = true
        while autosize and wait() do
            if value then
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
            else
                break
            end
        end
    end
})
local autotp_muscleking = false
auto:AddToggle({
    Name = "Auto Teleport to Muscle King",
    Default = false,
    Callback = function(value)
        autotp_muscleking = true
        while autotp_muscleking and wait() do
            if user.Character then
                game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8646, 17, -5738))
            else
                break
            end
        end
    end
})
auto_weight
auto:AddToggle({
    Name = "Auto Weight",
    Default = false,
    Callback = function(value)
        if value then
            local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
            if weightTool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(weightTool)
            end
        else
            local character = game.Players.LocalPlayer.Character
            local equipped = character:FindFirstChild("Weight")
            if equipped then
                qequipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    task.spawn(function()
        while auto_weight do
            if not auto_weight then break end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.1)
        end
    end)
            
})
    