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
