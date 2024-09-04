return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("neogit").setup({})
		vim.keymap.set("n", "<leader>nc", "<cmd>Neogit commit<cr>", { desc = "Neogit Commit" })
		vim.keymap.set("n", "<leader>np", "<cmd>Neogit push<cr>", { desc = "Neogit Push" })
	end,
}
