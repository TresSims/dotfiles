return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		options = {
			parsers = {
				names = false,
			},
		},
	},
}
