-- Create a textclock widget
mytextclock = Wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = Gears.table.join(
	Awful.button({}, 1, function(t)
		t:view_only()
	end),
	Awful.button({ Modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	Awful.button({}, 3, Awful.tag.viewtoggle),
	Awful.button({ Modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	Awful.button({}, 4, function(t)
		Awful.tag.viewnext(t.screen)
	end),
	Awful.button({}, 5, function(t)
		Awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = Gears.table.join(
	Awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	Awful.button({}, 3, function()
		Awful.menu.client_list({ theme = { width = 250 } })
	end),
	Awful.button({}, 4, function()
		Awful.client.focus.byidx(1)
	end),
	Awful.button({}, 5, function()
		Awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper()
	-- Wallpaper
	if Beautiful.wallpaper then
		local wallpaper = Beautiful.wallpaper
		Gears.wallpaper.maximized(wallpaper, nil, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

Awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper()

	-- Each screen has its own tag table.
	local output_name = next(s.outputs)
	local tags = Util.workspace.tag_map[output_name]

	if tags then
		for i, tag in ipairs(tags) do
			Awful.tag.add(tag.tag, {
				layout = Awful.layout.layouts[1],
				screen = s,
				selected = i == 1,
			})
		end
	else
		Awful.tag({ "1", "2", "3", "4", "5" }, s, Awful.layout.layouts[1])
	end

	-- Create a promptbox for each screen
	s.mypromptbox = Awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = Awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(Gears.table.join(
		Awful.button({}, 1, function()
			Awful.layout.inc(1)
		end),
		Awful.button({}, 3, function()
			Awful.layout.inc(-1)
		end),
		Awful.button({}, 4, function()
			Awful.layout.inc(1)
		end),
		Awful.button({}, 5, function()
			Awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = Awful.widget.taglist({
		screen = s,
		filter = Awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = Awful.widget.tasklist({
		screen = s,
		filter = Awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = Wibox.widget.imagebox,
						},
						margins = 2,
						wiget = Wibox.container.margin,
					},
					{
						id = "text_role",
						widget = Wibox.widget.textbox,
					},
					layout = Wibox.layout.fixed.horziontal,
				},
				left = 10,
				right = 10,
				widget = Wibox.container.margin,
			},
			id = "background_role",
			widget = Wibox.container.background,
		},
	})

	-- Create the wibox
	s.mywibox = Awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = Wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = Wibox.layout.fixed.horizontal,
			Mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = Wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			Wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
