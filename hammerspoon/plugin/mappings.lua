-- mappings.lua
-- Small rebinds to make python less of a pain
hs.hotkey.bind("ctrl", "8", function()
	hs.eventtap.keyStrokes("[")
end)
hs.hotkey.bind("ctrl", "9", function()
	hs.eventtap.keyStrokes("]")
end)
hs.hotkey.bind({ "ctrl", "cmd" }, "8", function()
	hs.eventtap.keyStrokes("{")
end)
hs.hotkey.bind({ "ctrl", "cmd" }, "9", function()
	hs.eventtap.keyStrokes("}")
end)
hs.hotkey.bind("alt", "<", function()
	hs.eventtap.keyStrokes("\\")
end)
hs.hotkey.bind({ "alt", "shift" }, "<", function()
	hs.eventtap.keyStrokes("/")
end)
hs.hotkey.bind("ctrl", "2", function()
	hs.eventtap.keyStrokes("'")
end)

-- Nightlight lumen, timeStart, timeEnd
hs.redshift.start(2800, "06:00", "05:00")
hs.hotkey.bind({ "cmd" }, "$", "Toggle Redshift", hs.redshift.toggle)

-- Move to center of screen
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "f", function()
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
end)

-- Focus WezTerm
hs.hotkey.bind("ctrl", "return", function()
	hs.application.launchOrFocus("WezTerm")
end)
-- Focus Arc
hs.hotkey.bind({ "ctrl", "cmd" }, "return", function()
	hs.application.launchOrFocus("Arc")
end)
-- Focus Finder
hs.hotkey.bind({ "ctrl", "cmd" }, "f", function()
	hs.application.launchOrFocus("Finder")
end)
-- Focus Calendar
hs.hotkey.bind({ "ctrl", "cmd" }, "c", function()
	hs.application.launchOrFocus("Calendar")
end)
-- Focus Email
hs.hotkey.bind({ "ctrl", "cmd" }, "m", function()
	hs.application.launchOrFocus("Mail")
end)
-- Focus Preview
hs.hotkey.bind({ "ctrl", "cmd" }, "p", function()
	hs.application.launchOrFocus("Preview")
end)
