return
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
      local Window = redzlib:MakeWindow({
  Title = "👑 King hub 👑 : Brookhaven Rp",
  SubTitle = "by dark & fossil",
  SaveFolder = "testando | redz lib v5.lua"
})
   Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://129263597164551", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})
      local Tab1 = Window:MakeTab({"creditos", "info"})
local Section = Tab1:AddSection({"Discord"})

       Tab1:AddDiscordInvite({
    Name = "👑King hub👑",
    Description = "Join server",
    Logo = "rbxassetid://129263597164551",
    Invite = "https://discord.gg/MdFV6bUeE",
})
    local Section = Tab1:AddSection({"Criadores"})
    local Paragraph = Tab1:AddParagraph({"Donos", "Dark & Fossil"})
    
