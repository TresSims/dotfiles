local ok, godot = pcall(require, "godot")
if not ok then
	return
end

local config = {
	-- bin = "godot4",
	-- gui = {
	--         console_config = @config for vim.api.nvim_open_win
	-- },
}

godot.setup(config)
