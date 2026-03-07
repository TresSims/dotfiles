local M = {}

function M.add_audio_keymaps()
	return {
		Awful.key({}, "XF86AudioRaiseVolume", function()
			Awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")
		end),
		Awful.key({}, "XF86AudioLowerVolume", function()
			Awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")
		end),
		Awful.key({}, "XF86AudioMute", function()
			Awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
		end),
		Awful.key({}, "XF86AudioMicMute", function()
			Awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
		end),
	}
end

return M
