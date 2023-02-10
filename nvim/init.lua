-- lazy load plugins
if not require("impatient") then
	vim.cmd([[PackerSync]])
end

-- Set up basic vim settings
require("settings")

-- Install all Plugins
require("plugins")

-- Add my keybind settings
require("keybinds")
