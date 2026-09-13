M = {}

function M:init()
	SPEED = 5
	READER = "Preview"
	INSERTMODE = false
	NORMALMODE = true

	local appsWatcher = hs.application.watcher.new(M.previewWatcher)
	appsWatcher:start()
end

function M.previewWatcher(name, event)
	if name == READER and event == hs.application.watcher.activated then
		hs.hotkey.bind({}, "ESCAPE", function()
			if INSERTMODE then
				hs.alert.show("NORMAL")
				NORMALMODE = true
				INSERTMODE = false
				M.enableInsertKey()
				M.enableAllKeys()
			end
		end, nil, nil)

		hs.hotkey.bind({}, "I", function()
			if NORMALMODE then
				hs.alert.show("INSERT")
				INSERTMODE = true
				NORMALMODE = false
				M.disableInsertKey()
				M.disableScrollingKeys()
			end
		end, nil, nil)

		--Enable keybinding: Scroll Left
		hs.hotkey.bind(
			{},
			"H",
			function()
				hs.eventtap.scrollWheel({ SPEED, 0 }, {})
			end,
			nil,
			function()
				hs.eventtap.scrollWheel({ SPEED, 0 }, {})
			end
		)

		--Enable keybinding: Scroll Down
		hs.hotkey.bind(
			{},
			"J",
			function()
				hs.eventtap.scrollWheel({ 0, -SPEED }, {})
			end,
			nil,
			function()
				hs.eventtap.scrollWheel({ 0, -SPEED }, {})
			end
		)

		--Enable keybinding: Scroll Up
		hs.hotkey.bind(
			{},
			"K",
			function()
				hs.eventtap.scrollWheel({ 0, SPEED }, {})
			end,
			nil,
			function()
				hs.eventtap.scrollWheel({ 0, SPEED }, {})
			end
		)

		--Enable keybinding: Scroll Right
		hs.hotkey.bind(
			{},
			"L",
			function()
				hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
			end,
			nil,
			function()
				hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
			end
		)

		--Enable keybinding: Move to Bottom of PDF
		hs.hotkey.bind({ "shift" }, "G", function()
			hs.eventtap.keyStroke({ "cmd" }, "Down")
		end)

		--Enable keybinding: Move to Top of PDF
		hs.hotkey.bind({}, "G", function()
			hs.eventtap.keyStroke({ "cmd" }, "Up")
		end)

		--Enable keybinding: Scroll one page foward
		hs.hotkey.bind(
			{ "ctrl" },
			"D",
			function()
				hs.eventtap.keyStroke({}, "Right")
			end,
			nil,
			function()
				hs.eventtap.keyStroke({}, "Right")
			end
		)

		--Enable keybinding: Scroll one page backwards
		hs.hotkey.bind(
			{ "ctrl" },
			"U",
			function()
				hs.eventtap.keyStroke({}, "Left")
			end,
			nil,
			function()
				hs.eventtap.keyStroke({}, "Left")
			end
		)
	end

	--Disable all VIM keybindings when Preview application is NOT focused
	if name == READER and event == hs.application.watcher.deactivated then
		M.disableAllKeys()
	end
end

function M.enableAllKeys()
	--Enable keybinding: Scroll Left
	hs.hotkey.bind(
		{},
		"H",
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end
	)

	--Enable keybinding: Scroll Down
	hs.hotkey.bind(
		{},
		"J",
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end
	)

	--Enable keybinding: Scroll Up
	hs.hotkey.bind(
		{},
		"K",
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end
	)

	--Enable keybinding: Scroll Right
	hs.hotkey.bind(
		{},
		"L",
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end
	)

	--Enable Keybing: Bottom of PDF
	hs.hotkey.bind({ "shift" }, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Down")
	end)

	--Enable keybinding: Move to Top of PDF
	hs.hotkey.bind({}, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Up")
	end)

	--Enable keybinding: Scroll one page foward
	hs.hotkey.bind(
		{ "ctrl" },
		"D",
		function()
			hs.eventtap.keyStroke({}, "Right")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Right")
		end
	)

	--Enable keybinding: Scroll one page backwards
	hs.hotkey.bind(
		{ "ctrl" },
		"U",
		function()
			hs.eventtap.keyStroke({}, "Left")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Left")
		end
	)
end

function M.disableAllKeys()
	--Disable: Normal Mode keybinding
	hs.hotkey.disableAll({}, "ESCAPE", function()
		M.disableScrollingKeys()
	end, nil, nil)

	--Disable: Insert Mode keybinding
	hs.hotkey.disableAll({}, "I", function()
		M.disableScrollingKeys()
	end, nil, nil)

	--Disbale: Scroll Left keybinding
	hs.hotkey.disableAll(
		{},
		"H",
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end
	)

	--Disbale: Scroll Down keybinding
	hs.hotkey.disableAll(
		{},
		"J",
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end
	)

	--Disbale: Scroll Up keybinding
	hs.hotkey.disableAll(
		{},
		"K",
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end
	)

	--Disbale: Scroll Right keybinding
	hs.hotkey.disableAll(
		{},
		"L",
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end
	)

	--Disable: Bottom of PDF keybinding
	hs.hotkey.disableAll({ "shift" }, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Down")
	end)

	--Disable: Top of PDF keybinding
	hs.hotkey.disableAll({}, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Up")
	end)

	--Disable: Scroll one page foward keybinding
	hs.hotkey.disableAll(
		{ "ctrl" },
		"D",
		function()
			hs.eventtap.keyStroke({}, "Right")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Right")
		end
	)

	--Disable: Scroll one page backward keybinding
	hs.hotkey.disableAll(
		{ "ctrl" },
		"U",
		function()
			hs.eventtap.keyStroke({}, "Left")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Left")
		end
	)
end

function M.enableInsertKey()
	--Enable insert key when in Normal mode; So we can go back
	--to Insert Mode if we wanted to.

	--Enable: Insert Mode keybinding
	hs.hotkey.bind({}, "I", function()
		if NORMALMODE then
			hs.alert.show("Insert Mode")
			INSERTMODE = true
			NORMALMODE = false
			M.disableInsertKey()
			M.disableScrollingKeys()
		end
	end, nil, nil)
end

function M.disableInsertKey()
	--Disable Insert key when we are in Insert Mode; So we can type
	--the letter 'i'.

	--Disable: Insert Mode keybinding
	hs.hotkey.disableAll({}, "I", function()
		if NORMALMODE then
			hs.alert.show("Insert Mode")
			INSERTMODE = true
			NORMALMODE = false
			M.disableInsertKey()
			M.disableScrollingKeys()
		end
	end, nil, nil)
end

function M.disableScrollingKeys()
	--Disable: Scroll Left keybinding
	hs.hotkey.disableAll(
		{},
		"H",
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ SPEED, 0 }, {})
		end
	)

	--Disable: Scroll Down keybinding
	hs.hotkey.disableAll(
		{},
		"J",
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, -SPEED }, {})
		end
	)

	--Disable: Scroll Up keybinding
	hs.hotkey.disableAll(
		{},
		"K",
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ 0, SPEED }, {})
		end
	)

	--Disable: Scroll Right keybinding
	hs.hotkey.disableAll(
		{},
		"L",
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end,
		nil,
		function()
			hs.eventtap.scrollWheel({ -SPEED, 0 }, {})
		end
	)

	--Disable: Bottom of PDF keybinding
	hs.hotkey.disableAll({ "shift" }, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Down")
	end)

	--Disable: Top of PDF keybinding
	hs.hotkey.disableAll({}, "G", function()
		hs.eventtap.keyStroke({ "cmd" }, "Up")
	end)

	--Disable: Scroll one page foward keybinding
	hs.hotkey.disableAll(
		{ "ctrl" },
		"D",
		function()
			hs.eventtap.keyStroke({}, "Right")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Right")
		end
	)

	--Disable: Scroll one page backward keybinding
	hs.hotkey.disableAll(
		{ "ctrl" },
		"U",
		function()
			hs.eventtap.keyStroke({}, "Left")
		end,
		nil,
		function()
			hs.eventtap.keyStroke({}, "Left")
		end
	)
end

M:init()
