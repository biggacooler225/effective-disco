local ts = game:GetService("TextChatService")
local ui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local tb = Instance.new("TextBox", ui)

ts.ChatInputBarConfiguration.AutocompleteEnabled = true
tb.Size = UDim2.new(1,0,1,0)
ui.IgnoreGuiInset = true
tb.BackgroundTransparency = 1
tb.TextTransparency = 1

for i,v in ts:GetChildren() do
	if(v.Name == "TextChatCommands") then
		for i,v in v:GetChildren() do
			if(v.Name == "RBXClearCommand") then
				v.PrimaryAlias = "/fatty"
			else
				v:Destroy()
			end
		end
	end
end

function enter()
	task.wait(.1)
	tb:CaptureFocus()
end

function focus()
	ts.ChatInputBarConfiguration.TextBox = tb
	task.wait(0.05)
	ts.ChatInputBarConfiguration.TextBox = nil
end

tb.Focused:Connect(function()
	focus()
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if(input.KeyCode == Enum.KeyCode.Slash) then
		enter()
	end
end)
