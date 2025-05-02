vim.g.mapleader = ' '
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<leader>m', ':Mason<CR>')
vim.keymap.set('n', '<leader>la', ':Lazy<CR>')
-- i only use this when im setting up or else i use oil nvim
vim.keymap.set('n', '<leader>dir', vim.cmd.Ex)
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- its like vim-tmux-navigator and shit
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the down window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the up window' }
)

--tabbing and terminaling
vim.keymap.set("n", "<leader>ta", ":tabnew<CR>", { desc = "create a new tab" })
vim.keymap.set("n", "<leader>l", ":tabnext<CR>", { desc = "move to next tab" })
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>", { desc = "move to previous tab" })
vim.keymap.set("n", "<leader>q", ":close<CR>", { desc = "close current tab" })

-- resizing
vim.keymap.set('n', '<C-Down>', '<CMD>resize -2<CR>', { desc = 'decrease the tab area' })
vim.keymap.set('n', '<C-Up>', '<CMD>resize +2<CR>', { desc = 'increase the tab area' })
vim.keymap.set('n', '<C-Left>', '<CMD>tabprevious<CR>', { desc = 'go to previous tab' })
vim.keymap.set('n', '<C-Right>', '<CMD>tabnext<CR>', { desc = 'go to next tab' })

--terminal keybindings
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- yank whole file
vim.keymap.set('n', '<leader>yf', ':%y+<CR>', { desc = 'yank whole file' })

-- for neorg: don't know what will happen in other filetypes
vim.keymap.set('n', 'z', 'za', { desc = 'shorten the za folding toggle to z' })
