return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			cmake = { "cmakelang" },
			json = { "clang-format" },
		},
	},
}
