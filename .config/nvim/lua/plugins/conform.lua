return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'clang-format' },
      python = { 'ruff_format' },
      markdown = { 'doctoc' },
    },
  },
}
