local wezterm = require("wezterm")

-- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_left_triangle

-- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_lower_right_triangel

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local gutter = "#1a1b26"
	local hilight = "#7aa2fa"
	local hover_hilight = "#f7768e"

	local edge_background = gutter
	local background = "#16161e"
	local foreground = hilight

	if tab.is_active then
		background = hilight
		foreground = gutter
	end

	if hover then
		foreground = hover_hilight
	end

	local edge_foreground = background

	local title = tab_title(tab)

	local left_glyph = " "
	if tab.tab_index == 0 then
		left_glyph = " "
	end

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	local big_title = string.len(title) > max_width
	local trunc_size = 4
	if big_title then
		trunc_size = 7
	end
	title = wezterm.truncate_left(title, max_width - trunc_size)
	if big_title then
		title = "..." .. title
	end

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = edge_background } },
		{ Text = left_glyph },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = "" },
	}
end)

return {
	window_frame = {
		active_titlebar_bg = "#1a1b6c",
		inactive_titlebar_bg = "#1a1b6c",
	},

	colors = {
		tab_bar = {
			inactive_tab_edge = "#1a1b5c",
		},
	},
}
