return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      cmake = { 'cmakelang' },
      json = { 'clang-format' },
      go = { 'gofmt' },
      java = { 'google-java-format' },
      haskell = { 'fourmolu' },
      python = {"ruff_format"}
    },
  },
}
