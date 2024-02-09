--ignore case-sensitive searches
vim.o.ignorecase = true

--explore windows size etc
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 0

-- set numbers < on the left to appear etc
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = true

--set indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

--set highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

--other useful set options
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.cursorline = true


--Toggle cursorcolumn with <Leader>cd
local cursorcolumn_enabled = false

local function toggle_cursorcolumn()
    cursorcolumn_enabled = not cursorcolumn_enabled
    vim.opt.cursorcolumn = cursorcolumn_enabled
end

vim.keymap.set("n", "<Leader>cd", function() toggle_cursorcolumn() end, { desc = "Toggle vertical highlighter" })


--vim.opt.colorcolumn = "80" " show split in middle of screen for concentration

-- color highlight setting
--vim.cmd([[ highlight LineNr guifg=#e0af68 ]])
--vim.cmd([[ highlight LineNrAbove guifg=#787c99 ]])
--vim.cmd([[ highlight LineNrBelow guifg=#787c99 ]])

--make selected line number on the left in orange color
vim.cmd([[
augroup CustomLineNumber
autocmd!
autocmd CursorMoved * highlight CursorLineNr guifg=#e0af68
augroup END
]])
