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
		vim.keymap.set("n", "<leader>go", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
	end,
}
