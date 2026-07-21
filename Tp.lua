local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local SavedCFrame = nil

-- تحديث الشخصية عند إعادة الإحياء
Player.CharacterAdded:Connect(function(Char)
	Character = Char
	HumanoidRootPart = Char:WaitForChild("HumanoidRootPart")
end)

-- إنشاء الواجهة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 260, 0, 145)
Frame.Position = UDim2.new(0.5, -130, 0.5, -72)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 16)
Corner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(90, 170, 255)
Stroke.Thickness = 1.5
Stroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundTransparency = 1
Title.Text = "Coordinate Saver"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.Parent = Frame

local SaveButton = Instance.new("TextButton")
SaveButton.Size = UDim2.new(0.85,0,0,42)
SaveButton.Position = UDim2.new(0.075,0,0.32,0)
SaveButton.Text = "💾 حفظ الإحداثيات"
SaveButton.Font = Enum.Font.GothamBold
SaveButton.TextSize = 16
SaveButton.TextColor3 = Color3.new(1,1,1)
SaveButton.BackgroundColor3 = Color3.fromRGB(0,170,120)
SaveButton.BorderSizePixel = 0
SaveButton.Parent = Frame

local C1 = Instance.new("UICorner")
C1.CornerRadius = UDim.new(0,12)
C1.Parent = SaveButton

local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(0.85,0,0,42)
TeleportButton.Position = UDim2.new(0.075,0,0.65,0)
TeleportButton.Text = "📍 الانتقال إلى الحفظ"
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextSize = 16
TeleportButton.TextColor3 = Color3.new(1,1,1)
TeleportButton.BackgroundColor3 = Color3.fromRGB(0,120,255)
TeleportButton.BorderSizePixel = 0
TeleportButton.Parent = Frame

local C2 = Instance.new("UICorner")
C2.CornerRadius = UDim.new(0,12)
C2.Parent = TeleportButton

local function Animate(Button)
	local t1 = TweenService:Create(Button,TweenInfo.new(0.08),{Size=Button.Size-UDim2.new(0,4,0,4)})
	local t2 = TweenService:Create(Button,TweenInfo.new(0.08),{Size=Button.Size})
	t1:Play()
	t1.Completed:Wait()
	t2:Play()
end

SaveButton.MouseButton1Click:Connect(function()
	Animate(SaveButton)
	SavedCFrame = HumanoidRootPart.CFrame
	SaveButton.Text = "✔ تم الحفظ"
	task.wait(1)
	SaveButton.Text = "💾 حفظ الإحداثيات"
end)

TeleportButton.MouseButton1Click:Connect(function()
	Animate(TeleportButton)
	if SavedCFrame then
		HumanoidRootPart.CFrame = SavedCFrame
	end
end)
