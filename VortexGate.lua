local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "VortexGate",
    Icon = "door-open", -- lucide icon
    Author = "by Vortex",
    Folder = "VortexGate",
    
    -- ↓ This all is Optional. You can remove it.
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
    
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
    
    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "Darkness", "darkness" },
        
        Note = "clica em get key.",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "key não permanente",
        },
        
        -- ↓ Optional. You can remove it.
        URL = "https://link-target.net/1390959/yXbxX7iINych)",
        
        -- ↓ Optional. You can remove it.
        SaveKey = false, -- automatically save and load the key.
        
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})

WindUI:Notify({
    Title = "test",
    Content = "atualizaremos as versões pelo git hub",
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

 local Button = Tab:Button{
    Title = "aimbot",
    Desc = "script",
    Icon = "bomb",
     Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sl1yyypixel/Synx-Scripts-Universal-Aimbot/main/synx_universal.lua"))()
    end
}


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

      local Toggle = Tab:Toggle({
    Title = "esp line",
    Desc = "não foi feito",
    Icon = "line",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
         -- meta o esp linha aqui
            print("Toggle Activated" .. tostring(state))
    end
})   
    
   local Toggle = Tab:Toggle({
    Title = "esp cham",
    Desc = "não foi feito",
    Icon = "lasso",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        print("Toggle Activated" .. tostring(state))
    end
})
           Window:Divider()
        
             --ABA PARA configurações do player
    local Tab = Window:Tab{
       Title = "player",
       Icon = "anchor",
       Locked =  false, --   se estiver true, não sera possivel acessar a aba
     }
      
local Toggle = Tab:Toggle({
    Title = "speed",
    Desc = "não foi feito",
    Icon = "zap",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        -- meta o speed aqui
            print("Toggle Activated" .. tostring(state))
    end
})  
      local Dialog = Window:Dialog({
    Icon = "plane",
    Title = "o nosso script esta quase pronto",
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

      local Tab = Window:Tab({
    Title = "script",
    Icon = "book-open", -- optional
    Locked = false,
}) 
     local Button = Tab:Button({
    Title = "Button",
    Desc = "Test Button",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nhamajomari-oss/fossless/refs/heads/main/update.lua", true))()
    end
}) 
      local Button = Tab:Button({
    Title = "informações",
    Desc = "abrir a aba de inf",
    Locked = false,
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nhamajomari-oss/fossless/refs/heads/main/informa%C3%A7%C3%B5es.lua", true))()
    end
})

