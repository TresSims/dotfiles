local M = {}

function M.angle_rect(cr, width, height, n)
	n = n or width / 3
	cr:move_to(0, 0)
	cr:line_to(width, 0)
	cr:line_to(width - n, height)
	cr:line_to(0, height)
	cr:close_path()
end

M.offset = 12

function M.angle_rect_wibar(cr, width, height)
	M.angle_rect(cr, width, height, M.offset)
end

function M.angle_rect_wibar_inverse(cr, width, height)
	Gears.shape.transform(M.angle_rect):translate(width, 0):scale(-1, 1)(cr, width, height, M.offset)
end

function M.parallelogram_left(cr, width, height)
	Gears.shape.parallelogram(cr, width, height, width - M.offset)
end

function M.parallelogram_right(cr, width, height)
	Gears.shape
		.transform(Gears.shape.parallelogram)
		:translate(width, 0)
		:scale(-1, 1)(cr, width, height, width - M.offset)
end

M.hwmon = require("util.hwmon")

return M
