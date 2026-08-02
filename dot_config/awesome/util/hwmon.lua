local BAT_STATUS_KEY = "STATUS"
local BAT_VALUE_KEY = "CAPACITY"

local M = {}

M.cpuPrefix = "   "
M.memPrefix = "   "
M.gpuPrefix = "  󱑵 "
M.batPrefix = "  "

M.batteryIcons = {}
M.batteryIcons["Discharging"] =
	{ "󰂃", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹" }
M.batteryIcons["Charging"] = { "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅" }

-- Each metric writes to its own slot so async results can land in any
-- order without clobbering or interleaving with the others.
M.segments = {
	cpu = M.cpuPrefix .. "..%",
	mem = M.memPrefix .. "..%",
	gpu = M.gpuPrefix .. "..%",
	battery = M.batPrefix .. "..%",
}

local function trim(s)
	return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function batteryIcon(status, capacity)
	local icons = M.batteryIcons[status] or M.batteryIcons["Discharging"]
	local idx = math.floor((tonumber(capacity) or 0) / 100 * (#icons - 1)) + 1
	idx = math.max(1, math.min(#icons, idx))
	return icons[idx]
end

local function renderMarkup()
	M.hwMarkup = table.concat({ M.segments.cpu, M.segments.mem, M.segments.gpu, M.segments.battery })
	M.hwWidget.markup = M.hwMarkup
end

function M.pollHardwareState()
	-- CPU Load
	Awful.spawn.easy_async_with_shell(
		"mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0].\"cpu-load\"[0].usr'",
		function(out)
			M.segments.cpu = M.cpuPrefix .. trim(out) .. "%"
			renderMarkup()
		end
	)

	-- Memory Usage
	Awful.spawn.easy_async_with_shell("free -m | grep Mem | awk '{print ($3/$2)*100}' | grep -o '^..'", function(out)
		M.segments.mem = M.memPrefix .. trim(out) .. "%"
		renderMarkup()
	end)

	-- GPU Usage
	Awful.spawn.easy_async_with_shell("gpustat | grep -o '...%'", function(out, _, _, exitcode)
		if exitcode ~= 0 then
			M.segments.gpu = ""
		else
			M.segments.gpu = M.gpuPrefix .. trim(out)
		end

		renderMarkup()
	end)

	-- Battery Percent
	Awful.spawn.easy_async_with_shell("cat /sys/class/power_supply/BAT1/uevent", function(out, _, _, exitcode)
		if exitcode ~= 0 then
			M.segments.battery = ""
		else
			local batStatus = {}

			for line in out:gmatch("[^\n]+") do
				local k, v = line:match("(%w+)=(%w+)")
				if k then
					batStatus[k] = v
				end
			end

			local status = batStatus[BAT_STATUS_KEY] or "Discharging"
			local capacity = batStatus[BAT_VALUE_KEY] or "0"
			M.segments.battery = M.batPrefix .. batteryIcon(status, capacity) .. " " .. capacity .. "%"
		end
		renderMarkup()
	end)
end

M.hwWidget = Wibox.widget({
	widget = Wibox.widget.textbox,
	markup = table.concat({ M.segments.cpu, M.segments.mem, M.segments.gpu, M.segments.battery }),
})

Gears.timer({
	timeout = 1,
	call_now = true,
	autostart = true,
	callback = M.pollHardwareState,
})

return M
