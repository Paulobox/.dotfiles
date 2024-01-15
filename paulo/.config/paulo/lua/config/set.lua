--explore windows size etc
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', { noremap = true, silent = true })
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 0

-- unhiglight selected text with space+backtick ` 
vim.api.nvim_set_keymap('n', '<leader>`', ':nohlsearch<CR>', { noremap = true, silent = true })

-- move visualy selected text with shift and K J
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
        require("vim-with-me").StartVimWithMe()
    end)
    vim.keymap.set("n", "<leader>svwm", function()
            require("vim-with-me").StopVimWithMe()
        end)

        -- greatest remap ever
         vim.keymap.set("x", "<leader>p", [["_dP]])

         -- next greatest remap ever : asbjornHaland
         vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
         vim.keymap.set("n", "<leader>Y", [["+Y]])

         vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

         -- This is going to get me cancelled
         vim.keymap.set("i", "<C-c>", "<Esc>")

         vim.keymap.set("n", "Q", "<nop>")
         vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
         vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

         vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
         vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
         vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
         vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

         vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
         vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

         vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/config/packer.lua<CR>");
         vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

         vim.keymap.set("n", "<leader><leader>", function()
             vim.cmd("so")
         end)

-- set numbers < on the left to appear etc
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.cursorline = true
--vim.opt.colorcolumn = "80" " show split in middle of screen for concentration

-- color highlight setting
--vim.cmd([[ highlight LineNr guifg=#e0af68 ]])
--vim.cmd([[ highlight LineNrAbove guifg=#787c99 ]])
--vim.cmd([[ highlight LineNrBelow guifg=#787c99 ]])
vim.cmd([[
augroup CustomLineNumber
autocmd!
autocmd CursorMoved * highlight CursorLineNr guifg=#e0af68
augroup END
]])
