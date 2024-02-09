return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
					concat = "Useful Nvim commands:  <space gf>=format :checkhealth  exit force=:q! force save&exit=:wq!", --concat string after time string line
					-- append = --table append after time string line
				},
				shortcut = {
					{
						desc = "󰏔 Update plugins",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						desc = " Recent files",
						group = "Number",
						action = "Telescope oldfiles",
						key = "<leader>fr",
					},
					{
						desc = "search Text 󰅍 ",
						group = "DiagnosticHint",
						action = "Telescope live_grep",
						key = "<leader>ft",
					},
					{
						icon = "", --
						icon_hl = "@variable",
						desc = "Find files 󰈞 ",
						group = "Label",
						action = "Telescope find_files",
						key = "<leader>ff",
					},
					{
						desc = "select theme ",
						group = "theme",
						action = "Telescope themes",
						key = "<leader>th",
					},
					{
						desc = " quit󰱞",
						-- group = "",
						action = "q",
						key = "QQQ",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
