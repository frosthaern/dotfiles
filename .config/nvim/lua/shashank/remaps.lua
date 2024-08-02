vim.g.mapleader = " "
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.keymap.set("n", "<leader>la", ":Lazy<CR>")
vim.keymap.set("n", "<leader>dir", vim.cmd.Ex)

--its like vim-tmux-navigator and shit

-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--tabbing and terminaling
vim.keymap.set("n", "<C-t>", ":tabnew<CR>:terminal<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-c>", ":close<CR>")


--resizing for splits
vim.keymap.set("n", "<M-j>", ":resize -2<CR>")
vim.keymap.set("n", "<M-k>", ":resize +2<CR>")

--terminal keybindings
vim.keymap.set("t", "<M-t>", "<C-\\><C-n>")
