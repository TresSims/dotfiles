local M = {}

M.cpuPrefix = "   "

M.cpuWidget = Wibox.widget({
	widget = Wibox.widget.textbox,
	markup = M.cpuPrefix .. " ...%",
})

M.memPrefix = "   "

M.memWidget = Wibox.widget({
	widget = Wibox.widget.textbox,
	markup = M.memPrefix .. " ...%",
})

M.gpuPrefix = "  󱑵 "

M.gpuWidget = Wibox.widget({
	widget = Wibox.widget.textbox,
	markup = M.gpuPrefix .. " ...%",
})

Gears.timer({
	timeout = 10,
	call_now = true,
	autostart = true,
	callback = function()
		Awful.spawn.easy_async_with_shell("mpstat | tail -n 1 | awk '{print $3}'", function(out)
			M.cpuWidget.markup = M.cpuPrefix .. " " .. out .. " %"
		end)
		Awful.spawn.easy_async_with_shell("free -m |grep Mem | awk '{print ($3/$2)*100}' | grep -o '^..'", function(out)
			M.memWidget.markup = M.memPrefix .. " " .. out .. " %"
		end)
		Awful.spawn.easy_async_with_shell("gpustat | grep -o '...%'", function(out)
			M.gpuWidget.markup = M.gpuPrefix .. " " .. out
		end)
	end,
})

return M
