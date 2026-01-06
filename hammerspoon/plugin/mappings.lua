-- mappings.lua
hs.hotkey.bind("ctrl", "8", function()
	hs.eventtap.keyStrokes("[")
end)
hs.hotkey.bind("ctrl", "9", function()
	hs.eventtap.keyStrokes("]")
end)
hs.hotkey.bind("ctrl", "7", function()
	hs.eventtap.keyStrokes("{")
end)
hs.hotkey.bind("ctrl", "0", function()
	hs.eventtap.keyStrokes("}")
end)
hs.hotkey.bind("cmd", "<", function()
	hs.eventtap.keyStrokes("\\")
end)
hs.hotkey.bind({ "cmd", "shift" }, "<", function()
	hs.eventtap.keyStrokes("/")
end)
hs.hotkey.bind("cmd", "i", function()
	hs.eventtap.keyStrokes("|")
end)

-- Nightlight lumen, timeStart, timeEnd
hs.redshift.start(2000, "06:00", "05:00")
hs.hotkey.bind({ "cmd" }, "$", "Toggle Redshift", hs.redshift.toggle)

-- Move to center of screen
local function resizeAndCenterWindow()
	local win = hs.window.focusedWindow()
	if win then
		local screen = win:screen()
		local frame = screen:frame()
		-- Change values to adjust screen size
		frame.w = frame.w / 1.1
		frame.h = frame.h / 1.1
		win:setFrame(frame)
		win:centerOnScreen(nil, true, 0.1)
	end
end

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "f", function()
	resizeAndCenterWindow()
end)
hs.hotkey.bind({ "ctrl", "cmd" }, "f", function()
	hs.application.launchOrFocus("Finder")
end)
hs.hotkey.bind({ "ctrl", "cmd" }, "t", function()
	hs.execute("open ~/.Trash", true)
	resizeAndCenterWindow()
end)
hs.hotkey.bind("ctrl", "return", function()
	hs.application.launchOrFocus("WezTerm")
end)
-- Focus Arc
hs.hotkey.bind({ "ctrl", "cmd" }, "return", function()
	hs.application.launchOrFocus("Arc")
end)
-- Focus Finder
