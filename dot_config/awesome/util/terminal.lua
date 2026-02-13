local M = {}

M.dropdown_term_class = "ddterm"

function M.dropdown_toggle()
	for _, c in ipairs(client.get()) do
		if c.class == M.dropdown_term_class then
			if c.minimized then
				M.configure(c)
				c:emit_signal("request::activate", "tasklist", { raise = true })
				return
			else
				c.minimized = true
				return
			end
		end
	end
	Awful.spawn("wezterm start --always-new-process --class " .. M.dropdown_term_class)
end

function M.configure(c)
	local screen = Awful.screen.focused()
	c.width = screen.geometry.width
	c.height = screen.geometry.height / 2
	c.x = screen.geometry.x
	c.y = c.height - screen.geometry.y
end

return M
