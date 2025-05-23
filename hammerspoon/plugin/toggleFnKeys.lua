-- toggleFnKeys.lua
hs.hotkey.bind({ "cmd" }, "escape", function()
	hs.alert.show("Toggle fn keys...")
	local script = [[ set osver to system version of (system info)

        if osver ≥ 13.0 then
            open location "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"

            if osver ≥ 14.0 then
                tell application "System Settings"
                    reveal anchor "FunctionKeys" of pane id "com.apple.Keyboard-Settings.extension"
                end tell
            else
                tell application "System Events" to tell process "System Settings"
                    repeat until window begins with "Keyboard" exists
                    end repeat
                    repeat until exists of (1st window whose value of attribute "AXMain" is true)
                    end repeat
                    repeat until exists group 1 of group 2 of splitter group 1 of group 1 of window 1
                    end repeat
                    set keyboardButton to 3
                    try
                        click button keyboardButton of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
                    on error errorMessage number errorNumber
                        if errorNumber is -1719 then
                            set keyboardButton to 1
                            click button keyboardButton of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
                        end if
                    end try
                    repeat until sheet 1 of window 1 exists
                    end repeat
                    keystroke "f"
                end tell
            end if
            tell application "System Events" to tell process "System Settings"
                repeat until checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1 exists
                end repeat
                click checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
                click button 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
                repeat
                    try
                        repeat while sheet 1 of window 1 exists
                        end repeat
                        exit repeat
                    end try
                end repeat
            end tell
            tell application "System Settings" to quit
        else if osver < 13.0 then
            tell application "System Settings"
                set current pane to pane "com.apple.preference.keyboard"
            end tell

            tell application "System Events"
                if UI elements enabled then
                    tell application process "System Preferences"
                        repeat until exists tab group 1 of window "Keyboard"
                            delay 0.5
                        end repeat
                        click radio button "Keyboard" of tab group 1 of window "Keyboard"
                        try
                            click checkbox "Use F1, F2, etc. keys as standard function keys on external keyboards" of tab group 1 of window "Keyboard"
                        end try
                        try
                            click checkbox "Use F1, F2, etc. keys as standard function keys" of tab group 1 of window "Keyboard"
                        end try
                    end tell
                    tell application "System Settings" to quit
                else
                    tell application "System Settings"
                        activate
                        set current pane to pane "com.apple.preference.security"
                        display dialog "UI element scripting is not enabled. Please activate this app under Privacy -> Accessibility so it can access the settings it needs."
                    end tell
                end if
            end tell
        end if
    ]]

	-- Execute the AppleScript
	local ok = hs.osascript.applescript(script)

	-- Show a notification based on the result of the AppleScript
	if ok then
		hs.notify.new({ title = "Function Keys Toggled", informativeText = "Fn keys have been toggled." }):send()
	else
		hs.notify.new({ title = "Error", informativeText = "Failed to toggle Fn keys." }):send()
	end
end)
