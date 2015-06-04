--TheCanadianNation

local Creator = {["QuintinityZero"] = true}

--[[
	
	Hello there Quintinity, so, this script may seem 
	quite "Filled" or unorganized, but trust me...
	I have it all under control.
	
	Just to let you know, I am quite the "Talker" when
	it comes to comments, I place quite a bit of them
	all around the place. I like talking to myself!
	Ahh... the irony.     ^Look at those lined up I's.

	This is the most important script within the chat
	for EM2 as this is the brains of the operation. I
	have tried to make this script as easy to understand
	as I can so that way you can modify it as you wish.

	I may or may not add a list of all of the resources
	at some point, but for right now I will stick with
	the way it is and continue helping you if you need
	it.

	Just to notify you, this script is specialy made
	for EM2, but if someone so wanted to get a hand
	on it, it would be just as simple as a public
	script.

	I have done everything in order of how important
	the operation is and at what stage it would be used
	at.

	Be aware, I am not the best scripter in terms of
	effeciency, so be prepared for a little bit of
	"Urg's" throughout the script.

	If you have any questions, feel free to PM me at
	any time.

	~TheCanadianNation

	P.S: I may add more features in the future, so
	please be acceptable to updates or new scripts
	that I may need you to add.

]]--

--[[ ===== API Dump ===== ]]-- (I do not recommend changing anything here...)

--{Operation Requirements}--

local WS = game.Workspace

local RSS = game.ServerScriptService

local HNT = _G.Hints
local HTIME = _G.HintTime

local GP = _G.GroupPrefix
local GID = _G.GroupId

local GN = "Epic Mining 2"

function gName()
	return GN[1]
end

function checkGroupP(pName)--Checks if player is in miner group.
	local getPlayer = game.Players:FindFirstChild(pName)
	if getPlayer then
		if getPlayer:IsInGroup(GID) then 
			return pName else 
			return "E_GroupP:NM" 
		end 
	end 
end

function checkGoldS(pName)--Checks if player owns gold pass.
	local getPlayer = game.Players:FindFirstChild(pName)
	if getPlayer then
		if game:GetService("MarketplaceService"):PlayerOwnsAsset(getPlayer,251291121) then 
			return pName else 
			return "E_GoldS:NM" 
		end 
	end 
end

--{PlayerSetup Import/Handling}--

function checkCreator(pName)--Checks if player is creator.
for PC = 1, #Creator do 
	if pName:upper() == Creator[PC]:upper() then 
		return pName else 
		return "E" 
		end 
	end 
end

--[[ ===== Setup ===== ]]--

if script.Parent ~= game.workspace then --Urm... So yucky. But hey!
	script.Parent = game.workspace
	print('Chat loading')
end
VIS = script.ChatVIS
if VIS then --Need to move it here from the script or bugs...
	VIS.Parent = game:GetService("StarterGui")
	print('Chat loaded')
end

--Now comes the annoying part...
l1 = Instance.new("TextLabel",script)
l1.Name = "l1"
l1.Text = ""

l2 = Instance.new("TextLabel",script)
l2.Name = "l2"
l2.Text = ""

l3 = Instance.new("TextLabel",script)
l3.Name = "l3"
l3.Text = ""

l4 = Instance.new("TextLabel",script)
l4.Name = "l4"
l4.Text = ""

l5 = Instance.new("TextLabel",script)
l5.Name = "l5"
l5.Text = ""

l6 = Instance.new("TextLabel",script)
l6.Name ="l6"
l6.Text =""

l7 = Instance.new("TextLabel",script)
l7.Name = "l7"
l7.Text = ""

l8 = Instance.new("TextLabel",script)
l8.Name = "l8"
l8.Text = ""

function lSend(nextText, nextColor)--Handles chats.
	l8.TextColor3 = l7.TextColor3
	l8.Text = l7.Text
	l7.TextColor3 = l6.TextColor3	
	l7.Text = l6.Text
	l6.TextColor3 = l5.TextColor3	
	l6.Text = l5.Text
	l5.TextColor3 = l4.TextColor3	
	l5.Text = l4.Text
	l4.TextColor3 = l3.TextColor3	
	l4.Text = l3.Text
	l3.TextColor3 = l2.TextColor3	
	l3.Text = l2.Text
	l2.TextColor3 = l1.TextColor3	
	l2.Text = l1.Text
	l1.Text = nextText
	l1.TextColor3 = nextColor
end

--[[ ===== Chat Preparation ===== ]]--

function creatorChat(sentMessage, pName)--Handles creator chat.
	lSend("[Creator] " ..pName..": " ..sentMessage, Color3.new(0, 64/194, 5))
end

function devChat(sentMessage, pName)--Handles dev chat.
	lSend("[Developer] " ..pName..": " ..sentMessage, Color3.new(0, 255, 0))
end

function minerChat(sentMessage, pName)--Handles miner chat.
	lSend(GP.." " ..pName ..": " ..sentMessage, Color3.new(255, 255, 255))
end

function goldChat(sentMessage, pName)--Handles gold chat.
	lSend("[Gold Supporter] " ..pName ..": " ..sentMessage, Color3.new(255, 170, 0))
end

function regChat(sentMessage, pName)--Handles reg chat.
	lSend(pName ..": " ..sentMessage, Color3.new(255, 255, 255))
end

--[[ ===== Action Handling ===== ]]--

function plrJoined(pName)
	lSend("[Game] "..pName.." has entered the server!", Color3.new(170, 0, 0))
	lSend("[Game] Welcome, "..pName.." to Epic Mining 2!", Color3.new(170, 0, 0))
end

function plrLeft(pName)
	lSend("[Game] "..pName.." has left the server.", Color3.new(170, 0, 0))
end

function plrDied(deadPlr, killerPlr)--Detects death, sends chat.
	if killerPlr == "no one" then
		lSend(deadPlr .." has died.", Color3.new(170, 0, 0))
	else
		lSend(deadPlr .." was killed by " ..killerPlr ..".", Color3.new(170, 0, 0))
	end
end

--[[ ===== Chat & Prefix Handler ===== ]]--

local a = 0

game:GetService("Players").PlayerAdded:connect(function(player)
	plrJoined(player.Name)
	player.Chatted:connect(function(message)
		if player.Name == checkCreator(player.Name) or player.Name == checkCreator(player.Name) then creatorChat(message, player.Name)
		else if player.Name == "Player" or player.Name == "TheCanadianNation" then devChat(message, player.Name)--This is where I store devs, change if you wish.
			else if player.Name == checkGoldS(player.Name) then goldChat(message, player.Name)
				else if player.Name == checkGroupP(player.Name) then minerChat(message, player.Name)
		        	else regChat(message, player.Name)
					end
				end
			end
		end
	end)
end)

game.Players.PlayerRemoving:connect(function(leavingplayer)
	plrLeft(leavingplayer.Name)
end)

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function(Character)
	wait()
	Character.Humanoid.Died:connect(function()
		local Tag = Character.Humanoid:FindFirstChild("creator")
		if Tag ~= nil and Tag.Value ~=nil and Tag.Value.Parent ~=nil and Tag.Value.Character ~= nil then 
			plrDied(Player.Name, Tag.Value.Name)
			else plrDied(Player.Name, "no one")
		end
	end)
end)
end)

	while true do	--Hints!
		wait(HTIME)
		a=a+1
		if HNT[a] ~= nil then
			lSend("[Hint] "..HNT[a], Color3.new(170, 0, 255))
		else
		a = 0
	end
end
