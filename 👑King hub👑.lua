local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "👑 King hub 👑 | Brookhaven RP 🏡",
    SubTitle = "By Dark & Fossil",
    SaveFolder = "testando Kakah Hub"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://129263597164551",
        BackgroundTransparency = 0
    },
    Corner = {
        CornerRadius = UDim.new(35, 1)
    },
})

local Tab1 = Window:MakeTab({"Credits", "info"})
local Tab2 = Window:MakeTab({"Fun", "fun"})
local Tab3 = Window:MakeTab({"Avatar", "shirt"})
local Tab4 = Window:MakeTab({"House", "Home"})
local Tab5 = Window:MakeTab({"Car", "Car"})
local Tab6 = Window:MakeTab({"RGB", "brush"})
local Tab7 = Window:MakeTab({"Music All", "radio"})
local Tab8 = Window:MakeTab({"Music", "music"})
local Tab9 = Window:MakeTab({"Troll", "skull"})
local Tab10 = Window:MakeTab({"Lag Server", "bomb"})
local Tab11 = Window:MakeTab({"Scripts", "scroll"})
local Tab12 = Window:MakeTab({"Teleportes", "map-pin"})
local Tab13 = Window:MakeTab({"Painel Adm", "shield"})

---
## Créditos
---

Tab1:AddSection({"Créditos do Hub"})

Tab1:AddDiscordInvite({
    Name = "Shife-Revolution Scripting",
    Description = "entre",
    Logo = "rbxassetid://10341849885",
    Invite = "https://discord.gg/MdFV6bUeE",
})

local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Executor Desconhecido"
    end
end

local executorName = detectExecutor()
local Paragraph = Tab1:AddParagraph({"Executor", executorName})
local Section = Tab1:AddSection({"Version 1.0"})
local Paragraph = Tab1:AddParagraph({"Creadores", "ShifeGaming"})

Tab1:AddButton({
    Name = "-Copiar Link de Telegram",
    Callback = function()
        setclipboard("@kaykaka2")
        setclipboard("https://t.me/ShifeScripter")
    end
})

---
## Fun
---

local Section = Tab2:AddSection({"Player Character"})
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local selectedPlayerName = nil
local headsitActive = false

local function headsitOnPlayer(targetPlayer)
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        warn("Jogador alvo sem cabeça ou personagem.")
        return false
    end
    
    local targetHead = targetPlayer.Character.Head
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    
    if not localRoot then
        warn("Seu personagem não tem HumanoidRootPart.")
        return false
    end
    
    localRoot.CFrame = targetHead.CFrame * CFrame.new(0, 2.2, 0)
    
    for _, v in pairs(localRoot:GetChildren()) do
        if v:IsA("WeldConstraint") then
            v:Destroy()
        end
    end
    
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = localRoot
    weld.Part1 = targetHead
    weld.Parent = localRoot
    
    if humanoid then
        humanoid.Sit = true
    end
    
    print("Headsit ativado em " .. targetPlayer.Name)
    return true
end

local function removeHeadsit()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    
    if localRoot then
        for _, v in pairs(localRoot:GetChildren()) do
            if v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
    end
    
    if humanoid then
        humanoid.Sit = false
    end
    
    print("Headsit desativado.")
end

local function findPlayerByPartialName(partial)
    partial = partial:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Name:lower():sub(1, #partial) == partial then
            return player
        end
    end
    return nil
end

local function notifyPlayerSelected(player)
    local StarterGui = game:GetService("StarterGui")
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
    
    StarterGui:SetCore("SendNotification", {
        Title = "Player Selecionado",
        Text = player.Name .. " foi selecionado!",
        Icon = content,
        Duration = 5
    })
end

Tab2:AddTextBox({
    Name = "Nombre del Jugador",
    Description = "Escribe el nombre",
    PlaceholderText = "Ej:Shiro → Shife",
    Callback = function(Value)
        local foundPlayer = findPlayerByPartialName(Value)
        if foundPlayer then
            selectedPlayerName = foundPlayer.Name
            notifyPlayerSelected(foundPlayer)
        else
            warn("Nenhum jogador encontrado com esse nome.")
        end
    end
})

Tab2:AddButton({
    "",
    function()
        if not selectedPlayerName then
            return
        end
        
        if not headsitActive then
            local target = Players:FindFirstChild(selectedPlayerName)
            if target and headsitOnPlayer(target) then
                headsitActive = true
            end
        else
            removeHeadsit()
            headsitActive = false
        end
    end
})

Tab2:AddSlider({
    Name = "Speed Player",
    Increase = 1,
    MinValue = 16,
    MaxValue = 888,
    Default = 16,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
})

Tab2:AddSlider({
    Name = "Jumppower",
    Increase = 1,
    MinValue = 50,
    MaxValue = 500,
    Default = 50,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = Value
        end
    end
})

Tab2:AddSlider({
    Name = "Gravity",
    Increase = 1,
    MinValue = 0,
    MaxValue = 10000,
    Default = 196.2,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

local InfiniteJumpEnabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab2:AddButton({
    Name = "Reset Speed/Gravity/Jumppower.✅",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
        
        game.Workspace.Gravity = 196.2
        InfiniteJumpEnabled = false
    end
})

Tab2:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
    end
})

local UltimateNoclip = {
    Enabled = false,
    Connections = {},
    SoccerBalls = {}
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local function managePlayerCollisions(character)
    if not character then
        return
    end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not UltimateNoclip.Enabled
            part.Anchored = false
        end
    end
end

local function voidProtection(rootPart)
    if rootPart.Position.Y < -500 then
        local safeCFrame = CFrame.new(0, 100, 0)
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {
            LocalPlayer.Character
        }
        local result = Workspace:Raycast(rootPart.Position, Vector3.new(0, 500, 0), rayParams)
        rootPart.CFrame = result and CFrame.new(result.Position + Vector3.new(0, 5, 0)) or safeCFrame
    end
end

local function manageSoccerBalls()
    local soccerFolder = Workspace:FindFirstChild("Com", true) and Workspace.Com:FindFirstChild("001_SoccerBalls")
    if soccerFolder then
        for _, ball in ipairs(soccerFolder:GetChildren()) do
            if ball.Name:match("^Soccer") then
                pcall(function()
                    ball.CanCollide = not UltimateNoclip.Enabled
                    ball.Anchored = UltimateNoclip.Enabled
                end)
                UltimateNoclip.SoccerBalls[ball] = true
            end
        end
        
        if not UltimateNoclip.Connections.BallAdded then
            UltimateNoclip.Connections.BallAdded = soccerFolder.ChildAdded:Connect(function(ball)
                if ball.Name:match("^Soccer") then
                    task.wait(0.3)
                    pcall(function()
                        ball.CanCollide = not UltimateNoclip.Enabled
                        ball.Anchored = UltimateNoclip.Enabled
                    end)
                end
            end)
        end
    end
end

local function mainLoop()
    UltimateNoclip.Connections.Heartbeat = RunService.Heartbeat:Connect(function()
        local character = LocalPlayer.Character
        if character then
            managePlayerCollisions(character)
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                voidProtection(rootPart)
            end
        end
        if tick() % 2 < 0.1 then
            manageSoccerBalls()
        end
    end)
end

local NoclipToggle = Tab2:AddToggle({
    Name = "Ultimate Noclip",
    Description = "Noclip+Controle de bolas integrado",
    Default = false
})

NoclipToggle:Callback(function(state)
    UltimateNoclip.Enabled = state
    
    if state then
        mainLoop()
        manageSoccerBalls()
        UltimateNoclip.Connections.CharAdded = LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            managePlayerCollisions(LocalPlayer.Character)
        end)
    else
        for _, conn in pairs(UltimateNoclip.Connections) do
            conn:Disconnect()
        end
        
        if LocalPlayer.Character then
            managePlayerCollisions(LocalPlayer.Character)
        end
        
        for ball in pairs(UltimateNoclip.SoccerBalls) do
            if ball.Parent then
                pcall(function()
                    ball.CanCollide = true
                    ball.Anchored = false
                end)
            end
        end
    end
end)

local antiSitConnection = nil
local antiSitEnabled = false

Tab2:AddToggle({
    Name = "Anti-Sit",
    Description = "Impede o jogador de sentar",
    Default = false,
    Callback = function(state)
        antiSitEnabled = state
        local LocalPlayer = game:GetService("Players").LocalPlayer
        
        if state then
            local function applyAntiSit(character)
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Sit = false
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    
                    if antiSitConnection then
                        antiSitConnection:Disconnect()
                    end
                    
                    antiSitConnection = humanoid.Seated:Connect(function(isSeated)
                        if isSeated then
                            humanoid.Sit = false
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end)
                end
            end
            
            if LocalPlayer.Character then
                applyAntiSit(LocalPlayer.Character)
            end
            
            local characterAddedConnection
            characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                if not antiSitEnabled then
                    characterAddedConnection:Disconnect()
                    return
                end
                
                local humanoid = character:WaitForChild("Humanoid", 5)
                if humanoid then
                    applyAntiSit(character)
                end
            end)
        else
            if antiSitConnection then
                antiSitConnection:Disconnect()
                antiSitConnection = nil
            end
            
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end
    end
})

Tab2:AddButton({
    Name = "Ativar Fly GUI",
    Description = "Carrega um GUI de fly universal",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-30439"))()
        end)
        
        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Sucesso" or "Erro",
            Text = success and "Fly GUI carregado!" or "Falha ao carregar o Fly GUI.",
            Duration = 5
        })
    end
})

---
## ESP
---

local Section = Tab2:AddSection({"ESP"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB Suave"

Tab2:AddDropdown({
    Name = "Cor do ESP",
    Default = "RGB ",
    Options = {"RGB", "Branco", "Preto", "Vermelho", "Verde", "Azul", "Amarelo", "Rosa", "Roxo"},
    Callback = function(value)
        selectedColor = value
    end
})

local function getESPColor()
    if selectedColor == "RGB" then
        local h = (tick() % 5) / 5
        return Color3.fromHSV(h, 1, 1)
    elseif selectedColor == "Preto" then
        return Color3.fromRGB(0, 0, 0)
    elseif selectedColor == "Branco" then
        return Color3.fromRGB(255, 255, 255)
    elseif selectedColor == "Vermelho" then
        return Color3.fromRGB(255, 0, 0)
    elseif selectedColor == "Verde" then
        return Color3.fromRGB(0, 255, 0)
    elseif selectedColor == "Azul" then
        return Color3.fromRGB(0, 170, 255)
    elseif selectedColor == "Amarelo" then
        return Color3.fromRGB(255, 255, 0)
    elseif selectedColor == "Rosa" then
        return Color3.fromRGB(255, 105, 180)
    elseif selectedColor == "Roxo" then
        return Color3.fromRGB(128, 0, 128)
    end
    return Color3.new(1, 1, 1)
end

local function updateESP(player)
    if player == Players.LocalPlayer then
        return
    end
    
    if not espEnabled then
        return
    end
    
    local character = player.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            if billboardGuis[player] then
                billboardGuis[player]:Destroy()
            end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_Billboard"
            billboard.Parent = head
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "TextLabel"
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 14
            textLabel.Text = player.Name .. " | " .. player.AccountAge .. " dias"
            textLabel.TextColor3 = getESPColor()
            
            billboardGuis[player] = billboard
        end
    end
end

local function removeESP(player)
    if billboardGuis[player] then
        billboardGuis[player]:Destroy()
        billboardGuis[player] = nil
    end
end

local Toggle1 = Tab2:AddToggle({
    Name = "ESP Ativado",
    Description = "Mostra nome e idade da conta dos jogadores.",
    Default = false
})

Toggle1:Callback(function(value)
    espEnabled = value
    
    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            updateESP(player)
        end
        
        local updateConnection = RunService.Heartbeat:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                updateESP(player)
            end
            
            if selectedColor == "RGB" then
                for _, player in pairs(Players:GetPlayers()) do
                    local gui = billboardGuis[player]
                    if gui and gui:FindFirstChild("TextLabel") then
                        gui.TextLabel.TextColor3 = getESPColor()
                    end
                end
            end
        end)
        table.insert(connections, updateConnection)
        
        local playerAdded = Players.PlayerAdded:Connect(function(player)
            updateESP(player)
            local charConn = player.CharacterAdded:Connect(function()
                updateESP(player)
            end)
            table.insert(connections, charConn)
        end)
        table.insert(connections, playerAdded)
        
        local playerRemoving = Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
        table.insert(connections, playerRemoving)
        
    else
        for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
        end
        
        for _, conn in pairs(connections) do
            conn:Disconnect()
        end
        connections = {}
        billboardGuis = {}
    end
end)

---
## Avatar
---

local Section = Tab3:AddSection({"Copy Avatar"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local valor_do_nome_do_joagdor
local Target = nil

local function GetPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = Tab3:AddDropdown({
    Name = "Players List",
    Description = "",
    Options = GetPlayerNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        valor_do_nome_do_joagdor = playername
        Target = playername
    end
})

local function UptadePlayers()
    Dropdown:Set(GetPlayerNames())
end

UptadePlayers()
Players.PlayerAdded:Connect(UptadePlayers)
Players.PlayerRemoving:Connect(UptadePlayers)

Tab3:AddButton({
    "Atualizar lista",
    function()
        UptadePlayers()
    end
})

Tab3:AddButton({
    Name = "Copy Avatar",
    Callback = function()
        if not Target then
            return
        end
        
        local LP = Players.Loca
