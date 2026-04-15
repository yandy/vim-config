vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.markdown_folding = 1
vim.g.simple_indicator_on = false

-- [[ Setting options ]]
-- See `:help vim.opt`

--  For more options, you can see `:help option-list`
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'auto'
vim.opt.numberwidth = 4

-- enable soft line wrap
vim.opt.wrap = true

-- only one statusline
vim.opt.laststatus = 3

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.schedule(function()
    -- Sync clipboard between OS and Neovim.
    --  Schedule the setting after `UiEnter` because it can increase startup-time.
    --  Remove this option if you want your OS clipboard to remain independent.
    --  See `:help 'clipboard'`
    vim.opt.clipboard = 'unnamedplus'
    --  enable nvim.undotree
    vim.cmd.packadd('nvim.undotree')
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeout = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Win
vim.opt.winborder = 'single'

-- Required for opencode `opts.events.reload`
vim.opt.autoread = true

-- folding
vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = 'syntax'
vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
