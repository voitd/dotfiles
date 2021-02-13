local util = require "lspconfig/util"
local lspconfig = require"lspconfig"

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "vue",
    "lua",
    "elixir",
    "css",
    "html"
  },
  settings = {
    rootMarkers = {'package.json'},
    --[[ languages = {
      typescript = {eslint},
      typescriptreact = {eslint},
      javascript = {eslint},
      vue = {eslint},
    }, ]]
  },
}


