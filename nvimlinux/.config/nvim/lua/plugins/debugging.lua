return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"tpope/vim-fugitive",
		"leoluz/nvim-dap-go", --Go
		"mfussenegger/nvim-dap-python", --Python
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		--no configuration found ? you need to add require:
		require("dapui").setup()
		require("dap-go").setup()
		require("dap-python").setup()

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		--Keymaps for debugging are in /core/keymap.lua
		-- <Leader>dt :DapToggleBreakpoint
		-- <Leader>dc :DapContinue
		-- <Leader>dx :DapTerminate
		-- <Leader>do :DapStepOver
		-- <leader>dr reset ui
	end,
}
