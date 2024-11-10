vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("shashank-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("NeorgToPdf", function()
  -- Get the name of the current buffer and remove the extension
  local buffer_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")
  local output_pdf = buffer_name .. ".pdf"
  -- Export to markdown file and convert to PDF with pandoc
  vim.cmd("Neorg export to-file output.md")
  vim.fn.system("pandoc -o " .. output_pdf .. " output.md")
  vim.fn.system("rm -rf output.md")
  -- Notify user
  vim.cmd("echo 'The file " .. output_pdf .. " has been created'")
end, {})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.b.codeium_enabled = false -- Disable Codeium for Neorg files
  end,
})
