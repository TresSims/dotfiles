-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
Gears = require("gears")
Awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
Wibox = require("wibox")
-- Theme handling library
Beautiful = require("beautiful")
-- Notification library
Naughty = require("naughty")
Menubar = require("menubar")
Hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

Util = require("util.root")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	Naughty.notify({
		preset = Naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		Naughty.notify({
			preset = Naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
Beautiful.init(Gears.filesystem.get_configuration_dir() .. "theme/root.lua")

-- This is used later as the default terminal and editor to run.
Terminal = "wezterm"
Editor = os.getenv("EDITOR") or "vim"
Editor_cmd = Terminal .. " -e " .. Editor

Modkey = "Mod4"
-- }}}

require("config.layouts")

-- {{{ Menu
-- Create a launcher widget and a main menu
require("config.menu")
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = Awful.widget.keyboardlayout()

-- {{{ Wibar
require("config.wibar")
-- }}}

-- {{{ Input
require("config.hotkeys")
-- }}}

-- {{{ Rules
require("config.rules")
-- }}}

-- {{{ Signals
require("config.signals")
-- }}}
