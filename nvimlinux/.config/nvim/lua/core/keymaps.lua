-- Set leader key to space and shortcut for mapping keys (keymap.set)
local keymap = vim.keymap.set
vim.g.mapleader = " "
--quick exit from  trip Q
keymap("n", "QQQ", ":q!<CR>", { noremap = true }, { desc = "qucik exit" })
keymap("i", "jj", "<ESC>", { noremap = true }, { desc = "qucik exit insert mode" })

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- keymap("n", ":to", ":tabnew<CR>", { noremap = true })
-- keymap("n", ":tx", ":tabclose<CR>", { noremap = true })

-- open new tab and Rename tab keymap
keymap(
	"n",
	"<F10>",
	[[:let t = tabpagenr()<CR>:exe "tabnew " . input("New tab name: ")<CR>]],
	{ noremap = true, silent = true }
)

-- save file to txt f12
keymap(
	"n",
	"<C-F12>",
	[[:let @a = expand('%')<CR>:write <C-R>=substitute(@a, '\v(\.[^.]+)?$', '.txt', '')<CR><CR>]],
	{ noremap = true, silent = true }
)

-- cut ctrl+x to visual mode
keymap("v", "<C-x>", '"+x', { noremap = true })
keymap("i", "<C-x>", '"x', { noremap = true })

-- Select all text in normal or insert mode: <C-a>
-- keymap('n', '<C-a>', 'ggVG', { noremap = true })
-- keymap('v', '<C-a>', 'ggVG', { noremap = true })
keymap("i", "<C-a>", "<C-\\><C-n>ggVG", { noremap = true })

-- Delete text: backspace
keymap("v", "<BS>", "d", { noremap = true, silent = true })
keymap("n", "<BS>", "d", { noremap = true, silent = true })

-- Leader remaps
keymap("n", "<leader>pv", ":vertical Lexplore<CR>", { noremap = true })

-- undo Tree
keymap("n", "<leader><f3>", ":UndotreeToggle<CR>")

-- nvim-tree
keymap("n", "<leader>ex", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap("n", "<leader>er", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>") -- toggle focus to file explorer
keymap("n", "<leader>ee", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- telescope keybindings
local builtin = require("telescope.builtin")
keymap("n", "<leader>th", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
keymap("n", "<leader>ff", builtin.find_files, { desc = "find files" })
keymap("n", "<leader>fr", builtin.oldfiles, { desc = "recent files" })
keymap("n", "<leader>fg", builtin.git_files, { desc = "find Git files" })
keymap("n", "<leader>ft", builtin.live_grep, { desc = "find text, live grep" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
keymap("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Laptop key shortcuts
--keymap('n', '<S-End>', ':call delete(expand("%")) \| :q!<CR>', { noremap = true })
keymap("n", "<C-PageUp>", ":wq!<CR>", { noremap = true })
keymap("n", "<C-PageDown>", ":q!<CR>", { noremap = true })
keymap("n", "<S-q>", ":tabprevious<CR>", { noremap = true })
keymap("n", "<S-Tab>", ":tabnext<CR>", { noremap = true })
keymap("n", "<F1>", ":1tabnext<CR>", { noremap = true })
keymap("n", "<F2>", ":2tabnext<CR>", { noremap = true })
keymap("n", "<F3>", ":3tabnext<CR>", { noremap = true })
keymap("n", "<F4>", ":4tabnext<CR>", { noremap = true })
keymap("n", "<F5>", ":5tabnext<CR>", { noremap = true })
--keymap('n', '<C-T>', ':tabnew<CR>', { noremap = true })
--keymap('n', '<C-w>', ':tabclose<CR>', { noremap = true })

--move selected text up and down the lines
keymap("v", "K", "'>+1<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "J", "'<-2<CR>gv=gv", { noremap = true, silent = true })

-- unhiglight selected text with space+backtick `
keymap("n", "<leader>`", ":nohlsearch<CR>", { noremap = true, silent = true })

-- move visualy selected text with shift and K J
keymap("v", "K", ":m '>+1<CR>gv=gv")
keymap("v", "J", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap({ "n", "v" }, "<C-c>", [["+y]])
keymap({ "n", "v" }, "<C-v>", [["+p]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

-- If in visual mode you stops selection and go up to first wprd
keymap("v", "<C-s>", "o<Esc>", { noremap = true, silent = true })

keymap("n", "Q", "<nop>")
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<leader>gf", vim.lsp.buf.format, { desc = "format" })

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/config/packer.lua<CR>")
keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

--colorscheme quick select
keymap("n", "<leader><f5>", ":colorscheme duskfox<CR>", {})
keymap("n", "<leader><f6>", ":colorscheme synthwave84<CR>", {})
keymap("n", "<leader><f7>", ":colorscheme kanagawa<CR>", {})
keymap("n", "<leader><f8>", ":colorscheme tokyonight<CR>", {})
keymap("n", "<leader><f9>", ":colorscheme catppuccin-macchiato<CR>", {})
keymap("n", "<leader><f10>", ":colorscheme catppuccin<CR>", {})

--transparency toggle
keymap("n", "<leader><f1>", ":TransparentToggle<CR>", {})
keymap("n", "<leader><f2>", ":TransparentToggle<CR>", {})

--debugging
keymap("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint at the current line" })
keymap("n", "<f9>", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint at the current line" })
keymap("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue execution until the next breakpoint" })
keymap("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate debugging session" })
keymap("n", "<leader>dj", ":DapStepOver<CR>", { desc = "Step over to the next line" })
keymap("n", "<leader>dk", ":DapStepInto<CR>", { desc = "Step into the function at the current line" })
keymap("n", "<leader>do", ":DapStepOut<CR>", { desc = "Step out of the current function" })
keymap(
  "n",
  "<leader>dr",
  ":lua require('dapui').open({reset = true})<CR>",
  { noremap = true, desc = "DAP UI with reset" }
)
keymap("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:", desc = "Search and navigate through diagnostics" })
end)
keymap("n", "<leader>di", function()
  require("dap.ui.widgets").hover({ desc = "Show hover information for the current line" })
end)

-- --lsp binds only uncomment if keybindings are not set in lsp-config
-- keymap("n", "K", vim.lsp.buf.hover, { desc = "show_description" })
-- keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go_to_definitions" })
-- keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "guide_references" })
-- keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code_action" })

-- reloads file (:source)
keymap("n", "<leader>so", ":source<CR>")

-- Enable/disable cursor blinking
vim.api.nvim_set_keymap("n", "<Leader>eb", [[:lua ToggleCursorBlink()<CR>]], { noremap = true, silent = true })

function ToggleCursorBlink()
	if vim.o.guicursor:find("blink") then
		vim.o.guicursor = vim.o.guicursor:gsub("blink", "")
	else
		vim.o.guicursor = vim.o.guicursor .. ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
	end
end
