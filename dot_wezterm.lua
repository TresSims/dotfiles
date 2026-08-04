local wezterm = require("wezterm")

require("tab_style")
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")

local config = {
	hide_tab_bar_if_only_one_tab = true,
	font_size = 14.0,
	font = wezterm.font("FiraCode Nerd Font"),
	color_scheme = "Tokyo Night Moon",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	front_end = "OpenGL",
}

modal.apply_to_config(config)
modal.set_default_keys(config)

return config
