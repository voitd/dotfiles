local sign_define = vim.fn.sign_define
-- local lsp_config = require'lspconfig'
-- local lsp_status = require'lsp-status'
-- local lsp_completion = require'completion'

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      space = 2,
      prefix = " "
    },
    signs = true,
    update_in_insert = false
  }
)

sign_define(
  "LspDiagnosticsSignError",
  {
    text = " ",
    -- texthl = "LspDiagnosticsDefaultError",
    -- numhl = "LspDiagnosticsDefaultError"
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = "",
    -- texthl = "LspDiagnosticsDefaultWarning",
    -- numhl = "LspDiagnosticsDefaultWarning"
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = "",
    -- texthl = "LspDiagnosticsDefaultInformation",
    -- numhl = "LspDiagnosticsDefaultInformation"
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = "",
    -- texthl = "LspDiagnosticsDefaultHint",
    -- numhl = "LspDiagnosticsDefaultHint"
  }
)
