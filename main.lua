--// Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

--// GUI Vars
local guiOpen = true

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BaqeGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// MAIN FRAME
local main = Instance.new("Frame")
main.Size = UDim2.new(0,520,0,360)
main.Position = UDim2.new(0.5,-260,0.5,-180)
main.BackgroundColor3 = Color3.fromRGB(18,20,25)
main.BorderSizePixel = 0
main.Visible = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

--// TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-40,0,40)
title.Position = UDim2.new(0,20,0,8)
title.BackgroundTransparency = 1
title.Text = "Baqe Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(120,200,255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

--// SUBTITLE
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,-40,0,22)
subtitle.Position = UDim2.new(0,20,0,40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "made by capp2231 on TikTok"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.fromRGB(180,180,180)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

--// LINE
local line = Instance.new("Frame")
line.Size = UDim2.new(1,-40,0,2)
line.Position = UDim2.new(0,20,0,68)
line.BackgroundColor3 = Color3.fromRGB(120,200,255)
line.BorderSizePixel = 0
line.Parent = main

--// SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,140,1,-90)
sidebar.Position = UDim2.new(0,15,0,80)
sidebar.BackgroundColor3 = Color3.fromRGB(22,24,30)
sidebar.BorderSizePixel = 0
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,14)

--// CONTENT
local pages = Instance.new("Frame")
pages.Size = UDim2.new(1,-175,1,-90)
pages.Position = UDim2.new(0,160,0,80)
pages.BackgroundColor3 = Color3.fromRGB(20,22,28)
pages.BorderSizePixel = 0
pages.Parent = main
Instance.new("UICorner", pages).CornerRadius = UDim.new(0,14)

--// Pages
local pageFrames = {}
local function createPage(name)
	local p = Instance.new("Frame")
	p.Size = UDim2.new(1,0,1,0)
	p.BackgroundTransparency = 1
	p.Visible = false
	p.Parent = pages
	pageFrames[name] = p
end

createPage("Stealer")
createPage("Player")
pageFrames["Stealer"].Visible = true

--// Sidebar Buttons
local function sideButton(text,y,page)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-20,0,46)
	b.Position = UDim2.new(0,10,0,y)
	b.BackgroundColor3 = Color3.fromRGB(35,38,46)
	b.Text = text
	b.Font = Enum.Font.GothamMedium
	b.TextSize = 18
	b.TextColor3 = Color3.fromRGB(230,230,230)
	b.Parent = sidebar
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)

	b.MouseButton1Click:Connect(function()
		for _,v in pairs(pageFrames) do v.Visible = false end
		pageFrames[page].Visible = true
	end)
end

sideButton("Stealer",10,"Stealer")
sideButton("Player",62,"Player")

--// Content Buttons
local function contentButton(parent,text,y,callback)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-40,0,52)
	b.Position = UDim2.new(0,20,0,y)
	b.BackgroundColor3 = Color3.fromRGB(30,34,42)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 18
	b.TextColor3 = Color3.fromRGB(245,245,245)
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.Parent = parent
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,14)
	b.MouseButton1Click:Connect(callback)
	return b
end

--// Stealer Buttons
local desyncUsed = false
contentButton(
	pageFrames["Stealer"],
	"Deysnc (sometimes working!)",
	20,
	function()
		if desyncUsed then return end
		desyncUsed = true
		loadstring(game:HttpGet('https://pastebin.com/raw/duHcZ5Mb'))()
	end
)

contentButton(pageFrames["Stealer"],"NoWalk",90,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/403k/UnwalkAnimation/refs/heads/main/GhostWalk"))()
end)

contentButton(pageFrames["Stealer"],"Insta Leave",160,function()
	loadstring(game:HttpGet("https://pastebin.com/raw/s6V6ZHPb"))()
end)

--// TOGGLE GUI
local function toggleGUI()
	guiOpen = not guiOpen
	main.Visible = guiOpen
end

--// FLOATING TOGGLE BUTTON
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0,60,0,60)
toggleBtn.Position = UDim2.new(0,20,0.5,-30)
toggleBtn.BackgroundColor3 = Color3.fromRGB(120,200,255)
toggleBtn.Text = "≡"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 32
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Parent = gui
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1,0)

toggleBtn.MouseButton1Click:Connect(toggleGUI)

--// DRAG SYSTEM (FIXED)
local dragging = false
local dragStart
local startPos
local dragTarget

local function beginDrag(target, input)
	dragging = true
	dragTarget = target
	dragStart = input.Position
	startPos = target.Position
end

toggleBtn.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		beginDrag(toggleBtn, i)
	end
end)

main.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		beginDrag(main, i)
	end
end)

UIS.InputChanged:Connect(function(i)
	if not dragging or not dragTarget then return end
	if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
		local delta = i.Position - dragStart
		dragTarget.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging = false
		dragTarget = nil
	end
end)
