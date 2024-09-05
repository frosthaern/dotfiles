vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("shashank-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command("NeorgToPdf", function()
	vim.cmd("Neorg export to-file output.md")
	vim.fn.system("pandoc -o output.pdf output.md")
	vim.fn.system("rm -rf output.md")
	vim.cmd("echo 'the file has been created'")
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
