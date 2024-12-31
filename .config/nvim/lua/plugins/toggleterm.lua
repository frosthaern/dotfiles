return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        start_in_insert = false,
        direction = "tab",
        size = 20,
      })
      vim.keymap.set('n', '<leader>te', ':ToggleTerm<CR>')
    end,
  },
}
