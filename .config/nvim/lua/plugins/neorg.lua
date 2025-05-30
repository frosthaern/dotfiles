return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = {
		default_folding_mode = "folded",
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				folds = true,
				icon_preset = "diamond",
			},
			["core.autocommands"] = {},
			["core.integrations.treesitter"] = {},
			["core.export"] = {},
		},
	}
}
