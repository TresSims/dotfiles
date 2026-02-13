-- {{{ Mouse Keys
root.buttons(Gears.table.join(
	Awful.button({}, 3, function()
		Mymainmenu:toggle()
	end),
	Awful.button({}, 4, Awful.tag.viewnext),
	Awful.button({}, 5, Awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = Gears.table.join(
	Awful.key({ Modkey }, "s", Hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	Awful.key({ Modkey }, "Escape", Awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Client Navigation
	Awful.key({ Modkey }, "Left", Util.navigation.client_left, { description = "Client Left", group = "tag" }),
	Awful.key({ Modkey }, "Right", Util.navigation.client_right, { description = "Client Right", group = "tag" }),
	Awful.key({ Modkey }, "Up", Util.navigation.client_up, { description = "Client up", group = "tag" }),
	Awful.key({ Modkey }, "Down", Util.navigation.client_down, { description = "Client Down", group = "tag" }),

	Awful.key({ Modkey }, "h", Util.navigation.client_left, { description = "Client Left", group = "tag" }),
	Awful.key({ Modkey }, "l", Util.navigation.client_right, { description = "Client Right", group = "tag" }),
	Awful.key({ Modkey }, "k", Util.navigation.client_up, { description = "Client up", group = "tag" }),
	Awful.key({ Modkey }, "j", Util.navigation.client_down, { description = "Client Down", group = "tag" }),

	Awful.key({ Modkey }, "w", function()
		Mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	-- Client manipulation
	Awful.key(
		{ Modkey, "Shift" },
		"j",
		Util.navigation.swap_down,
		{ description = "swap with next client by index", group = "client" }
	),
	Awful.key(
		{ Modkey, "Shift" },
		"k",
		Util.navigation.swap_up,
		{ description = "swap with previous client by index", group = "client" }
	),
	Awful.key(
		{ Modkey, "Shift" },
		"h",
		Util.navigation.swap_left,
		{ description = "swap with next client by index", group = "client" }
	),
	Awful.key(
		{ Modkey, "Shift" },
		"l",
		Util.navigation.swap_right,
		{ description = "swap with previous client by index", group = "client" }
	),

	Awful.key({ Modkey, "Control" }, "j", function()
		Awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	Awful.key({ Modkey, "Control" }, "k", function()
		Awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	Awful.key({ Modkey }, "u", Awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	Awful.key({ Modkey }, "Tab", function()
		Awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	Awful.key({ Modkey }, "Return", function()
		Awful.spawn(Terminal)
	end, { description = "open a terminal", group = "launcher" }),
	Awful.key({ Modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	Awful.key({ Modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),

	Awful.key({ Modkey }, "l", function()
		Awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	Awful.key({ Modkey }, "h", function()
		Awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	Awful.key({ Modkey, "Shift" }, "h", function()
		Awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	Awful.key({ Modkey, "Shift" }, "l", function()
		Awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	Awful.key({ Modkey, "Control" }, "h", function()
		Awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	Awful.key({ Modkey, "Control" }, "l", function()
		Awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	Awful.key({ Modkey }, "space", function()
		Awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	Awful.key({ Modkey, "Shift" }, "space", function()
		Awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	Awful.key({ Modkey, "Control" }, "n", function()
		local c = Awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	Awful.key({ Modkey }, "x", function()
		Awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = Awful.screen.focused().mypromptbox.widget,
			exe_callback = Awful.util.eval,
			history_path = Awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),

	-- Run things
	Awful.key({ Modkey }, "d", function()
		Menubar.show()
	end, { description = "show the menubar", group = "launcher" }),

	Awful.key({ "Control", "Shift" }, "space", function()
		Awful.spawn.with_shell("~/.config/rofi/bin/launcher_slate")
	end),

	-- Dropdown term
	Awful.key({}, "F12", function()
		Util.terminal.dropdown_toggle()
	end)
)

globalkeys = Gears.table.join(globalkeys, Util.workspace.add_workspace_keymaps())

clientkeys = Gears.table.join(
	Awful.key({ Modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	Awful.key({ Modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	Awful.key(
		{ Modkey, "Shift" },
		"space",
		Awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	Awful.key({ Modkey, "Control" }, "Return", function(c)
		c:swap(Awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	Awful.key({ Modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	Awful.key({ Modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	Awful.key({ Modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	Awful.key({ Modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	Awful.key({ Modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	Awful.key({ Modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

clientbuttons = Gears.table.join(
	Awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	Awful.button({ Modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		Awful.mouse.client.move(c)
	end),
	Awful.button({ Modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		Awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
