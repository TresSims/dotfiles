local M = {}

function M.generate_layouts()
	return {
		Awful.layout.suit.tile,
		Awful.layout.suit.tile.left,
		Awful.layout.suit.fair.horizontal,
		Awful.layout.suit.tile.bottom,
		Awful.layout.suit.tile.top,
		Awful.layout.suit.fair,
		Awful.layout.suit.max,
		Awful.layout.suit.spiral,
	}
end

function M.horizontal_layouts() end

function M.vertical_layouts() end

function M.stacked_layouts() end

return M
