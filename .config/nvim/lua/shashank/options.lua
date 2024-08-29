vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "1000"
vim.o.scrolloff = 10
vim.g.have_nerd_font = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.termguicolors = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "no"
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
-- vim.g.netrw_banner = 0
-- vim.g.netrw_browser_split = 0
vim.cmd [[ colorscheme carbonfox ]]
-- vim.g.netrw_winsize = 25
vim.g.vikwiki_global_ext = 0
vim.g.vimwiki_list = { {
	syntax = "markdown",
	ext = "md",
} }
