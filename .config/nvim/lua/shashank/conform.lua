require("conform").setup({
	formatters_by_ft = {
		c      = { "clang-format" },
		cpp    = { "clang-format" },
		lua    = { "stylua" },
		rust   = { "rustfmt" },
		java   = { "clang-format" },
		python = { "isort" },
		go     = { "gofmt" },
	},
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
})
