vim.g.mapleader = " "
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.keymap.set("n", "<leader>la", ":Lazy<CR>")
-- i only use this when im setting up or else i use oil nvim
vim.keymap.set("n", "<leader>dir", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- its like vim-tmux-navigator and shit
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

--tabbing and terminaling
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { desc = "create a new tab and make a terminal out of it" })
vim.keymap.set("n", "<M-l>", ":tabnext<CR>", { desc = "move to next tab" })
vim.keymap.set("n", "<M-h>", ":tabprevious<CR>", { desc = "move to previous tab" })
vim.keymap.set("n", "<M-c>", ":close<CR>", { desc = "close current tab" })

--resizing for splits
vim.keymap.set("n", "<M-j>", ":resize -2<CR>")
vim.keymap.set("n", "<M-k>", ":resize +2<CR>")

--terminal keybindings
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
