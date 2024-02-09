return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	cmd = "Telescope",
	dependencies = {
		"PauloGitbox/themes.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("themes")
	end,
}
