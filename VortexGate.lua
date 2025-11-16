local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "VortexGate",
    Icon = "door-open",
    Author = "by saintss",
    Folder = "VortexGate",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})

WindUI:Notify({
    Title = "test",
    Content = "seja bem vindo",
    Duration = 5,
    Icon = "bot",
})
     Window:Tag({
    Title = "v1.0",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 4, -- from 0 to 13
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "bot",
    Locked = false,
})

local Toggle = Tab:Toggle({
    Title = "Aimbot",
    Desc = "ativar o aimbot",
    Icon = "target",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        print("Toggle Activated" .. tostring(state))
    end
})


--------------------------------------------------------
-- SEGUNDO TAB (VISUAL / ESP)
--------------------------------------------------------
local Tab = Window:Tab({
    Title = "Visual",
    Icon = "bird",
    Locked = false,
})

-- FOLDER ONDE OS HIGHLIGHTS(ESP) FICAM
local highlightsFolder = Instance.new("Folder")
highlightsFolder.Name = "PLAYER_ESP_FOLDER"
highlightsFolder.Parent = game.CoreGui

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- cria highlight de um player
local function addESP(character)
    if not character or character:FindFirstChild(localPlayer.Name) then return end

    -- evita duplicar
    if highlightsFolder:FindFirstChild(character.Name) then return end

    local h = Instance.new("Highlight")
    h.Name = character.Name
    h.FillTransparency = 1
    h.OutlineTransparency = 0
    h.OutlineColor = Color3.fromRGB(255, 0, 0)
    h.Adornee = character
    h.Parent = highlightsFolder
end

-- remove todos os highlights
local function removeAllESP()
    for _,v in pairs(highlightsFolder:GetChildren()) do
        v:Destroy()
    end
end


-- AQUI O TOGGLE DO ESP 🔥🔥🔥🔥🔥
local Toggle = Tab:Toggle({
    Title = "esp players",
    Desc = "ative o esp",
    Icon = "bird",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)

        if state == true then
            -- LIGAR ESP
            removeAllESP()

            for _,player in ipairs(Players:GetPlayers()) do
                if player ~= localPlayer and player.Character then
                    addESP(player.Character)
                end

                player.CharacterAdded:Connect(function(char)
                    if Toggle.Value then
                        task.wait(0.3)
                        addESP(char)
                    end
                end)
            end

        else
            -- DESLIGAR ESP
            removeAllESP()
        end
    end
})

         --ABA PARA UPDATES DE SCRIPTS
    local Tab = Window:Tab{
       Title = "Updates",
       Icon = "Info",
       Locked =  false, --   se estiver true, não sera possivel acessar a aba
     }
         local Dialog = Window:Dialog({
    Icon = "plane",
    Title = "o script esta em manutenção(beta) e pode conter falhas e funções não funcionais",
    Content = "test",
    Buttons = {
        {
            Title = "Confirm",
            Callback = function()
                print("Confirmed!")
            end,
        },
        {
            Title = "Cancel",
            Callback = function()
                print("Cancelled!")
            end,
        },
    },
})
     --deixa script em manutenção(não executavel)
