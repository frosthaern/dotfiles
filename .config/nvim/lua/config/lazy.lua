local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  spec = {
    -- { import = "plugins.codeium" },
    { import = 'plugins.trouble' },
    -- { import = "plugins.lualine" },
    { import = 'plugins.cmp' },
    { import = 'plugins.colorscheme' },
    { import = 'plugins.comment' },
    { import = 'plugins.conform' },
    { import = 'plugins.git_signs' },
    { import = 'plugins.indentline' },
    { import = 'plugins.lazydev' },
    { import = 'plugins.lsp' },
    { import = 'plugins.mini' },
    { import = 'plugins.neogit' },
    { import = 'plugins.neorg' },
    { import = 'plugins.oil' },
    { import = 'plugins.surround' },
    { import = 'plugins.telescope' },
    { import = 'plugins.todo' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.vim_sleuth' },
    { import = 'plugins.toggleterm' },
    { import = 'plugins.autopairs' },
    { import = 'plugins.image' },
  },
})
