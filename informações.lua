--========================================================
--  UI DE INFORMAÇÕES (ARRASTÁVEL + BOTÃO FECHAR + TAG AO LADO DO TÍTULO)
--========================================================

local INFO_TEXTO = [[
METE AS INFORMAÇÕES AQUI
]]

----------------------------------------------------------

local Player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "InfoUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BackgroundTransparency = 0.2
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.Position = UDim2.new(0.5, -175, 0.5, -125)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Título
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Informações"
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

-- TAG AO LADO DO TÍTULO
local TagFrame = Instance.new("Frame")
TagFrame.Parent = Frame
TagFrame.Size = UDim2.new(0, 90, 0, 25)
TagFrame.Position = UDim2.new(0, 220, 0, 5)
TagFrame.BackgroundColor3 = Color3.fromHex("#30ff6a")
TagFrame.BorderSizePixel = 0

local TagCorner = Instance.new("UICorner")
TagCorner.CornerRadius = UDim.new(0, 5)
TagCorner.Parent = TagFrame

local Icon = Instance.new("ImageLabel")
Icon.Parent = TagFrame
Icon.Size = UDim2.new(0, 20, 0, 20)
Icon.Position = UDim2.new(0, 5, 0, 2)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://7734183861"

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Parent = TagFrame
VersionLabel.Size = UDim2.new(1, -30, 1, 0)
VersionLabel.Position = UDim2.new(0, 25, 0, 0)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v1.6.6"
VersionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionLabel.TextSize = 16
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- BOTÃO FECHAR
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -35, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0

local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0, 8)
UICornerClose.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- CAIXA DE TEXTO (AGORA SOMENTE LEITURA)
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, -20, 1, -60)
InfoLabel.Position = UDim2.new(0, 10, 0, 45)
InfoLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
InfoLabel.BackgroundTransparency = 0
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextWrapped = true
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.Text = INFO_TEXTO
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 16
InfoLabel.BorderSizePixel = 0

local UICornerBox = Instance.new("UICorner")
UICornerBox.CornerRadius = UDim.new(0, 10)
UICornerBox.Parent = InfoLabel

----------------------------------------------------------
--  SISTEMA DE DRAG (FUNCIONAL)
----------------------------------------------------------

local UIS = game:GetService("UserInputService")
local dragging = false
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local mousePos = input.Position
		local closePos = CloseButton.AbsolutePosition
		local closeSize = CloseButton.AbsoluteSize

		-- Se clicou no botão fechar, não inicia drag
		if mousePos.X >= closePos.X and mousePos.X <= closePos.X + closeSize.X and
		   mousePos.Y >= closePos.Y and mousePos.Y <= closePos.Y + closeSize.Y then
			return
		end

		dragging = true
		dragStart = input.Position
		startPos = Frame.Position
	end
end)

Frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		update(input)
	end
end)
