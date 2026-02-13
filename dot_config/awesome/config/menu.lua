Myawesomemenu = {
	{
		"hotkeys",
		function()
			Hotkeys_popup.show_help(nil, Awful.screen.focused())
		end,
	},
	{ "manual", Terminal .. " -e man awesome" },
	{ "edit config", Editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

Mymainmenu = Awful.menu({
	items = {
		{ "awesome", Myawesomemenu, Beautiful.awesome_icon },
		{ "open terminal", Terminal },
	},
})

Mylauncher = Awful.widget.launcher({ image = Beautiful.awesome_icon, menu = Mymainmenu })

-- Menubar configuration
Menubar.utils.Terminal = Terminal -- Set the terminal for applications that require it
