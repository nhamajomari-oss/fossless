local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Players = game:GetService("Players")

-- Só executa no Brookhaven
if game.PlaceId ~= 4924922222 then
    return print("❌ Este script só funciona no Brookhaven.")
end

local Window = redzlib:MakeWindow({
    Title = "👑 King hub 👑 : Brookhaven Rp",
    SubTitle = "by dark & fossil",
    SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://129263597164551", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- TAB CRÉDITOS
local Tab1 = Window:MakeTab({"creditos", "info"})
Tab1:AddSection({"Discord"})

Tab1:AddDiscordInvite({
    Name = "👑King hub👑",
    Description = "Join server",
    Logo = "rbxassetid://129263597164551",
    Invite = "https://discord.gg/MdFV6bUeE",
})

Tab1:AddSection({"Criadores"})
Tab1:AddParagraph({"Donos", "Dark & Fossil"})

-- TAB PRINCIPAL
local Tab2 = Window:MakeTab({"principal", "sword"})

-- FUNÇÃO PARA PEGAR PLAYERS
local function GetPlayers()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(list, plr.Name)
    end
    return list
end

-- CRIA A DROPDOWN UMA ÚNICA VEZ
local PlayerDropdown = Tab2:AddDropdown({
    Name = "Players List",
    Description = "Jogadores no servidor",
    Options = GetPlayers(),
    Default = nil,
    Flag = "DropdownPlayers",
    Callback = function(selected)
        print("Selecionaste:", selected)
    end
})

-- FUNÇÃO PARA ATUALIZAR OPÇÕES DA DROPDOWN
local function UpdateDropdown()
    -- Limpa a tabela Options e insere novamente
    PlayerDropdown.Options = GetPlayers()
    -- Força a UI a redesenhar (RedzLib geralmente faz automaticamente)
end

-- ATUALIZA AUTOMÁTICA QUANDO ENTRA OU SAI ALGUÉM
Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

-- BOTÃO PARA ATUALIZAR MANUALMENTE
Tab2:AddButton({"Atualizar lista de players", function()
    UpdateDropdown()
    print("Lista atualizada manualmente!")
end})
