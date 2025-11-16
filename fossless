local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Fossless Hub",
    Icon = "door-open",
    Author = "by Fossil and Dark",
    Folder = "Ink Game",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        end,
    },
    KeySystem = { 
        Key = { "anonimo", "anónimo" },
        Note = "meta sua key",
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "clique em get key depois meta no seu navegador e complete o sistema de chave, depois meta no script",
        },
        URL = "https://link-center.net/1390959/SA6YOBYCltsU",
        SaveKey = false,
    },
})

-- VARIÁVEIS E SERVIÇOS(NÃO REMOVA!!!)

local cloneref = (cloneref or clonereference or function(instance)
    return instance
end)
-- BYPASS DETECTION( INK GAME! )

local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))

shared.ppl = game.Players.LocalPlayer
shared.Character = shared.ppl.Character or shared.ppl.CharacterAdded:Wait()

shared.fossless = shared.fossless or {
autoredlight = false,
AutoRedLightConn = nil
}

local Tab = Window:Tab({
    Title = "red light",
    Icon = "bird",
    Locked = false
})


Tab:Toggle({
    Title = "Finish",
    Icon = "bot",
    Type = "Checkbox",
    Value = shared.fossless.autoredlight,
    Callback = function(state) 
     shared.fossless.autoredlight = state
    end
})

local autoredlightposWin = CFrame.new(-45, 1025, 137)

shared.fossless.AutoRedLightConn = RunService.Heartbeat:Connect(function()
if shared.fossless.autoredlight then    

if shared.Character and shared.Character:FindFirstChild("HumanoidRootPart") and shared.Character:FindFirstChild("Humanoid") and shared.Character.Humanoid.Health > 0 then
shared.Character.HumanoidRootPart.CFrame = autoredlightposWin
shared.Character:PivotTo(autoredlightposWin)                
end
            
end

end)

shared.ppl.CharacterAdded:Connect(function(char)
task.wait(0.1)
shared.Character = char
-- sempre que o jogador resnacer ele vai esperar 0.1ms e vai dedinir o movo c
haracter!
end)
