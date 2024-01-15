-- Key mappings / KEYBOARD SHORTCUTS
vim.g.mapleader = " " -- My leader key is space

-- increment/decrement numbers
vim.api.nvim_set_keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.api.nvim_set_keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.api.nvim_set_keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.api.nvim_set_keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.api.nvim_set_keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.api.nvim_set_keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.api.nvim_set_keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- open new tab and Rename tab keymap
vim.api.nvim_set_keymap('n', '<F10>', [[:let t = tabpagenr()<CR>:exe "tabnew " . input("New tab name: ")<CR>]], { noremap = true, silent = true })

-- save file to txt f12
vim.api.nvim_set_keymap('n', '<F12>', [[:let @a = expand('%')<CR>:write <C-R>=substitute(@a, '\v(\.[^.]+)?$', '.txt', '')<CR><CR>]], { noremap = true, silent = true })

-- Insert mode: <C-v> to paste from system clipboard
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true })

-- Insert mode: <C-c> to copy to system clipboard
vim.api.nvim_set_keymap('i', '<C-c>', '"+y', { noremap = true })

-- Visual mode: <C-c> to copy to system clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })

-- Visual mode: <C-x> to cut
vim.api.nvim_set_keymap('v', '<C-x>', '"+x', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-x>', '"x', { noremap = true })

-- Select all text: <C-a>
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<C-\\><C-n>ggVG', { noremap = true })

-- Delete text: backspace
vim.api.nvim_set_keymap('v', '<BS>', 'd', { noremap = true })
vim.api.nvim_set_keymap('n', '<BS>', 'd', { noremap = true })
vim.api.nvim_set_keymap('i', '<BS>', '<C-g>u<BS>', { noremap = true })

-- Leader remaps
vim.api.nvim_set_keymap('n', '<leader>pv', ':vertical Lexplore<CR>', { noremap = true })

-- Undo Tree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- Laptop key shortcuts
--vim.api.nvim_set_keymap('n', '<S-End>', ':call delete(expand("%")) \| :q!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-PageUp>', ':wq!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-PageDown>', ':q!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-q>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F1>', ':1tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', ':2tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', ':3tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F4>', ':4tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', ':5tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', ':6tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', ':7tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F9>', ':8tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F9>', ':9tabnext<CR>', { noremap = true })
--vim.api.nvim_set_keymap('n', '<C-T>', ':tabnew<CR>', { noremap = true })
--vim.api.nvim_set_keymap('n', '<C-w>', ':tabclose<CR>', { noremap = true })

vim.api.nvim_set_keymap('v', 'K', "'>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', "'<-2<CR>gv=gv", { noremap = true, silent = true })
