-- Focus WezTerm
hs.hotkey.bind("ctrl", "return", function()
    hs.application.launchOrFocus("WezTerm")
end)

-- Focus Arc
hs.hotkey.bind({"ctrl", "cmd"}, "return", function()
    hs.application.launchOrFocus("Arc")
end)

-- Focus Finder
hs.hotkey.bind({"ctrl", "cmd"}, "f", function()
    hs.application.launchOrFocus("Finder")
end)

-- Focus Calendar
hs.hotkey.bind({"ctrl", "cmd"}, "c", function()
    hs.application.launchOrFocus("Calendar")
end)

-- Focus Email
hs.hotkey.bind({"ctrl", "cmd"}, "m", function()
    hs.application.launchOrFocus("Mail")
end)

-- Focus Preview
hs.hotkey.bind({"ctrl", "cmd"}, "p", function()
    hs.application.launchOrFocus("Preview")
end)
