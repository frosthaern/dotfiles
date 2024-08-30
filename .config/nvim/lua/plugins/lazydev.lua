return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
		dependency = { "Bilal2453/luvit-meta", lazy = true },
		config = function()
			require("lazydev").setup()
		end,
	},
}
