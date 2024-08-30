return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 20,
			open_mapping = [[<C-\>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = "1",
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
				winblend = 3,
			},
		},
		config = function()
			require("toggleterm").setup({})
			vim.keymap.set("n", "<leader>to", ":ToggleTerm direction=float<CR>")
		end,
	},
}
