vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.o.scrolloff = 10
vim.g.have_nerd_font = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.termguicolors = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.disable_autoformat = true
vim.cmd("set mouse=")
vim.opt.timeoutlen = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.g.codeium_disable_bindings = 1
vim.cmd("let g:codeium_render = v:false")
vim.g.codeium_disable_virtual_text = true
vim.g.netrw_banner = 0
vim.g.netrw_browser_split = 0
-- vim.cmd.colorscheme("carbonfox")
vim.cmd("set statusline+=%{get(b:,'gitsigns_status','')}")
