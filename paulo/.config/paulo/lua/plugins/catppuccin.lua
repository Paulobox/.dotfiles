return {
	"catppuccin/nvim", -- colorscheme catppuccin for neovim theme
    lazy = false,
    name = "catppuccin-colorscheme",
	priority = 1000,
	config = function()
	vim.cmd([[colorscheme catppuccin]]) -- loads colorscheme on opening nvim 
	end,
}
