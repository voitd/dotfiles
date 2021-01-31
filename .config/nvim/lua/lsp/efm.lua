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
    "lua",
    "elixir",
    "css",
    "html"
  }
}
