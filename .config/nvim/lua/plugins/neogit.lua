return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
	},
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>go", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
	end,
}
