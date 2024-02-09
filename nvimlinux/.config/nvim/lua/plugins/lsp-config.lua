return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		priority = 1000,
		--note some of lsp installations on windows11 is done through Anaconda or (Miniconda3) prompt.
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"clangd",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			-- uncomment bellow lines if not set in core keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show_description" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go_to_definitions" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "guide_references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code_action" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"black",
					"isort",
					"cspell",
					"stylua",
					"debugpy",
          "shfmt",
				},
			})
		end,
	},
}
