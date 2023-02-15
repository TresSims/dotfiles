local colors = require("tokyonight.colors").setup({ transform = true })

require("window-picker").setup({
	autoselect_one = true,
	current_win_hl_color = colors.blue,
	other_win_hl_color = colors.purple,
})
