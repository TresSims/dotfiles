local M = {}

M.tag_map = {
	["HDMI-0"] = {
		{
			key = "1",
			tag = "web",
		},
		{
			key = "4",
			tag = "?",
		},
		{
			key = "7",
			tag = "??",
		},
	},
	["DP-0"] = {
		{
			key = "2",
			tag = "primary",
		},
		{
			key = "5",
			tag = "secondary",
		},
		{
			key = "8",
			tag = "tertiary",
		},
	},
	["DP-2"] = {
		{
			key = "3",
			tag = "chat",
		},
		{
			key = "6",
			tag = "web-overflow",
		},
		{
			key = "9",
			tag = "steam",
		},
	},
}

function M.add_workspace_keymaps()
	local workspace_keymap = {}
	for s in screen do
		local tags = M.tag_map[next(s.outputs)]
		if tags then
			for _, tag in ipairs(tags) do
				local target = Awful.tag.find_by_name(nil, tag.tag)
				workspace_keymap = Gears.table.join(
					workspace_keymap,
					Awful.key({ Modkey }, tag.key, function()
						target:view_only()
						Awful.screen.focus(s)
					end, { description = "View tag " .. tag.tag, group = "tag" }),
					Awful.key({ Modkey, "Shift" }, tag.key, function()
						client.focus:move_to_tag(target)
					end)
				)
			end
		end
	end

	return workspace_keymap
end

return M
