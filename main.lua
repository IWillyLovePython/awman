--GAME: https://www.roblox.com/games/3403279477/Creeper-Aw-man-2-15-Part-1
--Dreamer#5114
--https://github.com/OriginalAlien
--https://github.com/IWillyLovePython/roblox/README.md
--loadstring(game:HttpGet("https://raw.githubusercontent.com/IWillyLovePython/awman/main/main.lua"))()

local colors = {
    SchemeColor = Color3.fromRGB(128 ,0 , 128),
    Background = Color3.fromRGB(20,20,20),
    Header = Color3.fromRGB(10,10,10),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(15, 15, 15)
}
-- Stopped Using Colors and Switched to Themes

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Creeper? Aw man | Hack Panel", "Ocean")

local PP = Window:NewTab("Player")
local CC = Window:NewTab("Combat")
local SS = Window:NewTab("Stats")
local II = Window:NewTab("Items")
local TT = Window:NewTab("Teleports")
local EE = Window:NewTab("Extra")
local CREDIT = Window:NewTab("Credits")

local player = PP:NewSection("Player")
local combat = CC:NewSection("Combat")
local stats = SS:NewSection("Stats")
local stats1 = SS:NewSection("Shortcut")
local stats2 = SS:NewSection("Extras")
local item = II:NewSection("Items")
local item2 = II:NewSection("Key Items")
local item3 = II:NewSection("Gamepass Items")
local teleport = TT:NewSection("Teleports")
local extra = EE:NewSection("Become")
local extra2 = EE:NewSection("Get")
local extra3 = EE:NewSection("Extra")
CREDIT:NewSection("Discord: Dreamer#5114")
CREDIT:NewSection("Github: OriginalAlien")

--PLAYERS
player:NewButton("God Mode", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame1.PVP.HP:FireServer(math.huge, math.huge)
end)

player:NewToggle("Be Invisible (Reset If Not Work)", "", function(boolean)
    getgenv().invisible = boolean
    
    if not getgenv().invisible then
        return end
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "To Stay Invisible, Don't Delete The \"Let me be clear\" Tool.\n\nUnless If You Want To Stop It";
        Icon = ""; 
        Duration = 15;
    })
    while getgenv().invisible do
        if not pcall(function()
            game:GetService("Players").LocalPlayer.Backpack["Let me be clear"].Sound:FireServer()
            game:GetService("Players").LocalPlayer.Backpack["Let me be clear"].Sound:FireServer()
            wait(1.5)
        end) then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Notification";
                Text = "Couldn't Find \"Let me be clear Tool\"";
                Icon = ""; 
                Duration = 15;
            })
            break
        end
    end
end)

player:NewButton("Reset", "", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

player:NewTextBox("Walk Speed", "", function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

player:NewTextBox("Jump Power", "", function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

player:NewButton("Anti-Admins", "If Any Admin/Owner Joins, You Get Disconnected", function()
    local admins = {"xBushi", "X0XTYTYTYTYTYTX0X", "testaccount1213245", "tw_lord", "RobloxUISep2", "PatThink", "KawaiiTemYT", "gottabigcarnamed", "jackzanderYT"}
    --Add more admins username if you want ^
    for _, v in pairs(game:GetService("Players"):GetChildren()) do
        if table.find(admins, tostring(v.Name)) then
            game:GetService("Players").LocalPlayer:Kick("\nAnti-Admin: Admin In The Server\n\nName: "..tostring(v.Name) .." \nDisplay Name: "..tostring(v.DisplayName) .."\n")
        end
    end
    
    game:GetService("Players").PlayerAdded:Connect(function(plr)
        if table.find(admins, tostring(plr.Name)) then
            game:GetService("Players").LocalPlayer:Kick("\nAnti-Admin: Admin Joined\n\nName: "..tostring(plr.Name) .." \nDisplay Name: "..tostring(plr.DisplayName) .."\n")
        end
    end)
end)

--COMBAT
combat:NewTextBox("Explode User", "thats it lol", function(user)
    user = string.lower(user)
    for _, v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), user) or string.find(string.lower(v.DisplayName), user)  then
            targetted = tostring(v.Name)
        end
    end
    game:GetService("ReplicatedStorage").plrexplode:FireServer()
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[targetted].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
        wait()
    end
end)

combat:NewTextBox("Annoy User", "Good for Loop-Kill, Just Equip a One-Hit Tool", function(user)
    user = string.lower(user)
    for _, v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), user) or string.find(string.lower(v.DisplayName), user)  then
            targetted = tostring(v.Name)
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Reset to Stop";
        Icon = ""; 
        Duration = 15;
    })
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[targetted].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
        wait()
    end
end)

--STATS

stats:NewDropdown("Select Option", "", {"Diamonds", "Level", "Rebirths", "OmegaRebirths", "EndTokens", "RiftOffer", "EventPoints"}, function(currentOption)
    Option = currentOption
end)

stats:NewTextBox("Custom Amount", "", function(amount)
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, game:GetService("Players").LocalPlayer.Currency[Option].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, -amount, "Buy");
end)

stats:NewButton("Get Infinite", "", function()
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, -999999999999999999*9, "Buy");
end)

stats:NewButton("Reset", "", function() 
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, game:GetService("Players").LocalPlayer.Currency[Option].Value, "Buy");
end)
--There's more stats in (game.Players.LocalPlayer.Currency) that can be modified
stats1:NewButton("Reset All Stats", "", function()
    for _, v in pairs({"Diamonds", "Level", "Rebirths", "OmegaRebirths", "EndTokens", "RiftOffer", "EventPoints"}) do
        game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", tostring(v), game:GetService("Players").LocalPlayer.Currency[tostring(v)].Value, "Buy");
    end
end)

stats1:NewButton("Infinite All Stats", "", function()
    for _, v in pairs({"Diamonds", "Level", "Rebirths", "OmegaRebirths", "EndTokens", "RiftOffer", "EventPoints"}) do
        game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", tostring(v), game:GetService("Players").LocalPlayer.Currency[tostring(v)].Value, "Buy");
        game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", tostring(v), -999999999999999999*9, "Buy");
    end
end)

stats1:NewButton("Make EndToken Bag", "Press Backspace to give (MUST HAVE ENOUGH)", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1000", 100000000000)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
end)

stats1:NewButton("Make RiftOffer Bag", "Press Backspace to give (MUST HAVE ENOUGH)", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1001", 100000000000)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
end)

stats1:NewButton("Make Negative EndTokens Bag", "To give someone too much that it becomes negative", function()
    local amount = game:GetService("Players").LocalPlayer.Currency["EndTokens"].Value
    wait(1)
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "EndTokens", game:GetService("Players").LocalPlayer.Currency["EndTokens"].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "EndTokens", -999999999999999999*9, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "EndTokens", -99999999999999999*2, "Buy")
    wait(1)
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1000", game:GetService("Players").LocalPlayer.Currency["EndTokens"].Value)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
    wait(1)
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "EndTokens", game:GetService("Players").LocalPlayer.Currency["EndTokens"].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "EndTokens", -amount, "Buy");
end)

stats1:NewButton("Make Negative RiftOffer Bag", "To give someone too much that it becomes negative", function()
    local amount = game:GetService("Players").LocalPlayer.Currency["RiftOffer"].Value
    wait(1)
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "RiftOffer", game:GetService("Players").LocalPlayer.Currency["RiftOffer"].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "RiftOffer", -999999999999999999*9, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "RiftOffer", -99999999999999999*2, "Buy")
    wait(1)
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1001", game:GetService("Players").LocalPlayer.Currency["RiftOffer"].Value)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
    wait(1)
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "RiftOffer", game:GetService("Players").LocalPlayer.Currency["RiftOffer"].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", "RiftOffer", -amount, "Buy");
end)

stats2:NewTextBox("Make RiftOffer Bag", "Press Backspace to give (MUST HAVE ENOUGH)", function(amount)
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1001", amount)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
end)

stats2:NewTextBox("Make EndToken Bag", "Press Backspace to give (MUST HAVE ENOUGH)", function(amount)
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = true
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Salvage.BagCreate.Create.BeginCheck:FireServer("1000", amount)
    wait()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Inventory.Visible = false
end)

--ITEMS

item:NewButton("Clear Inventory", "", function()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v:Destroy()
    end
end)

item:NewButton("Necromancer Staff", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("Necromancer")
end)

item:NewButton("Death", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("Death")
end)

item:NewButton("Ghost Saber", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("GhostSaber")
end)

item:NewButton("Nether Axe", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("EventAxe")
end)

item:NewButton("Admin Weapon 1 (Blue Shitty Scythe)", "", function()
    game:GetService("ReplicatedStorage").OwSw:FireServer("TP")
end)

item:NewButton("Admin Weapon 2 (OP Jawbreaker)", "", function()
    game:GetService("ReplicatedStorage").OwSw2:FireServer()
end)

item:NewButton("Admin Weapon 3 (Mid Purple Sword)", "", function()
    game:GetService("ReplicatedStorage").ok:FireServer()
end)

item:NewButton("60K Omega Rebirth Weapon", "", function()
   game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("BestSwordEver", "OmegaRebirths", 0, "Unlock"); 
end)

item:NewButton("Heal Gun", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("HealGun") 
end)

item:NewButton("Fart Gun", "", function()
   game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("FartGun") 
end)

item2:NewButton("Astral Fuel", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.AstralRocket.Buy.Give:FireServer()
end)

item2:NewButton("Rocket Fuel", "", function()
   game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Rocket.Buy.Give:FireServer()
end)

item2:NewButton("Cube Extractor", "", function()
   game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Extract.Buy.Give:FireServer() 
end)

item2:NewButton("Cube", "EQUIP CUBE EXTRACTOR", function()
    if not pcall(function()
        game:GetService("Workspace")[tostring(game.Players.LocalPlayer)].CubeExtractor.Give:FireServer()
    end) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Notification";
            Text = "Equip Cube Extractor First";
            Icon = ""; 
            Duration = 15;
        })
    end
end)

item2:NewButton("Ender Eye", "", function()
   game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Eye.Buy.Give:FireServer()
end)

item3:NewButton("Walmart", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Walmart.Buy.Tool:FireServer()
end)

item3:NewButton("Time Keeper", "", function() 
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.TimeKeeper.Buy.Tool:FireServer()
end)

item3:NewButton("Mech", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Mech.Buy.Tool:FireServer()
end)

item3:NewButton("Controller", "", function() 
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Controller.Buy.Tool:FireServer()
end)

item3:NewButton("Dark", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Dark.Buy.Tool:FireServer()
end)

item3:NewButton("Baton", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Baton.Buy.Tool:FireServer()
end)

item3:NewButton("Vortex", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Vortex.Buy.Tool:FireServer()
end)

item3:NewButton("Doom Sword", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.Doom.Buy.Tool:FireServer()
end)

item3:NewButton("Doom Spell", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.WeaponShop.DoomSpell.Buy.Tool:FireServer()
end)

--TELEPORT
teleport:NewTextBox("Teleport to User", "", function(user)
    plr1 = game.Players.LocalPlayer.Character
    user = string.lower(user)
    for _, v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), user) or string.find(string.lower(v.DisplayName), user)  then
            plr2 = tostring(v.Name)
            plr1.HumanoidRootPart.CFrame = game.Players[plr2].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
        end
    end
end)

teleport:NewButton("Teleport to Astral World", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109.549988, 24648.7988, 121.601791, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Diamond Planet", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.56958, 14419.8916, 10.5787659, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Cheese Moon", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(259.5, 4815.83496, 121.400879, 0, 1, -0, -1, 0, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Nether", "", function()
    game:GetService("ReplicatedStorage").NetherTP:FireServer()
end)

teleport:NewButton("Teleport to DJ", "", function()
    game:GetService("ReplicatedStorage").DJ:FireServer()
end)

teleport:NewButton("Teleport to SECRET ARMOR", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-379, 1204, 6920)
end)

teleport:NewButton("Teleport to ??? Armor", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385, 1095, 6299)
end)

teleport:NewButton("Teleport to Spells Dealer", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-305.751099, 50.9499931, -173.756882, 0.0577276908, 5.81315773e-10, 0.998332381, -8.53164082e-08, 1, 4.35105907e-09, -0.998332381, -8.54253059e-08, 0.0577276908)
end)

teleport:NewButton("Teleport to Swamp", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(233, 13, 480)
end)

teleport:NewButton("Teleport to New Land", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(443.302643, 2.95000577, -2858.02344, 0.999960065, 2.06070307e-08, 0.00893836841, -2.11993658e-08, 1, 6.61740955e-08, -0.00893836841, -6.63609399e-08, 0.999960065)
end)

teleport:NewButton("Teleport to Spawn", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5,5,5)
end)

--EXTRA

extra:NewButton("Become Poop Dealer", "", function()
    game:GetService("ReplicatedStorage").TW:FireServer()
end)

extra:NewButton("Become Epic Burger", "", function()
    game:GetService("ReplicatedStorage").Burger:FireServer()
end)

extra:NewButton("Become Sprite Cranberry", "", function()
    game:GetService("ReplicatedStorage").Sprite:FireServer()
end)

extra:NewButton("Become Coffin", "", function()
    game:GetService("ReplicatedStorage").Coffin:FireServer()
end)

extra2:NewButton("Get Grab Gun", "NOT MADE BY ME, Grabs Unanchored Stuff", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OriginalAlien/dahoodaimlock/main/telekinesisGun.lua"))()
end)

extra2:NewButton("Get OMEGA FART GUN", "One Shot Fart", function()
    for i=0, 10 do
        game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("FartGun")
        wait(.1)
        game.Players.LocalPlayer.Backpack.FartGun.Parent = game.Players.LocalPlayer.Character
    end
end)

extra2:NewButton("Get OMEGA HEAL GUN", "10K Armor Per Shot", function()
    for i=0, 1000 do
        game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("HealGun")
        wait(.01)
        game.Players.LocalPlayer.Backpack.HealGun.Parent = game.Players.LocalPlayer.Character
    end
end)

extra2:NewButton("Get Building Tools", "", function()
    game:GetService("ReplicatedStorage").Btools:FireServer()
end)

extra2:NewButton("Get Happy Meal", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("HappyMeal")
end)


extra2:NewButton("Get Jeep", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Jeep.Buy.Spawn:FireServer()
end)

extra2:NewButton("Get Click TP Pearl", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("Orb")
end)

extra2:NewButton("Get Random Collectable Item (RARE)", "Check Inventory > Collectables", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.CrateShop.OmegaAstral.Buy.Buy:FireServer()
end)

extra2:NewButton("Get Random Collectable Item (COMMON)", "Check Inventory > Collectables", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.CrateShop.Rare.Buy.Buy:FireServer()
end)

extra3:NewButton("Reset Armor", "", function()
    game.ReplicatedStorage.ArmorEquip:FireServer("None")
end)

extra3:NewTextBox("Spawn Music ID", "", function(id)
    local link = "rbxassetid://" ..tostring(id)
    game:GetService("ReplicatedStorage").DJCHANGE:FireServer(link)
end)

extra3:NewButton("Infinite Yield", "Not Made By Me", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

extra3:NewButton("Destroy All Blocks (Might Lag)", "", function()
    game:GetService("ReplicatedStorage").Btools:FireServer()
    wait(3)
    for _, v in pairs(game.Workspace.PlacedParts:GetChildren()) do
        game:GetService("Players").LocalPlayer.Backpack.DiamondPickAxe.BreakObject:FireServer(v)
    end
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Done!";
        Icon = ""; 
        Duration = 15;
    })
end)

extra3:NewButton("Crash Server (Keep Clicking)", "Lags Yourself Too, SAVE BEFORE CRASH", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Do Not Leave, Stay Until You're Disconnected to Fully Crash Everyone";
        Icon = ""; 
        Duration = 15;
    })
    game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame1.PVP.HP:FireServer(math.huge, math.huge)
    wait(1)
    for i=0, 45000 do
        game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Jeep.Buy.Spawn:FireServer()
    end
end)

--IGNORE:
--game.ReplicatedStorage.Ban:FireServer(game.Players.NAME, "reason for ban")
--game.ReplicatedStorage.Kick:FireServer(game.Players.NAME, "reason for kick")
