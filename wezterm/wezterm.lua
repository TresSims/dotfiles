local wezterm = require("wezterm")

local tab_style = require("tab_style")

return {
	hide_tab_bar_if_only_one_tab = true,
	font_size = 14.0,
	font = wezterm.font("FiraCode Nerd Font"),
	color_scheme = "Tokyo Night Moon",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
}
