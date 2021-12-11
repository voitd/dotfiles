local M = {}

local lsputils = require "config.lsp.utils"

CONFIG = {}

function M.setup()
  local nls = require "null-ls"
  local sources = {
    nls.builtins.formatting.eslint_d,
    nls.builtins.diagnostics.shellcheck,
    nls.builtins.formatting.prettier_d_slim,
    nls.builtins.formatting.stylua,
    nls.builtins.code_actions.gitsigns,
  }
  nls.config { sources = sources }

  lsputils.setup_server("null-ls", CONFIG)
end

return M