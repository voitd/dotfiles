local sign_define = vim.fn.sign_define
local lsp_config = require'lspconfig'
local lsp_completion = require'completion'

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, 
    {
      underline = true,
      virtual_text = {
        space = 2, 
        prefix = ' '
      },
      signs = true,
      update_in_insert = false,
    })

vim.g.diagnostic_auto_popup_while_jump = false

sign_define(
  "LspDiagnosticsSignError",
  {text = " ", texthl = "LspDiagnosticsError"}
)

sign_define(
  "LspDiagnosticsSignWarning",
  {text = "", texthl = "LspDiagnosticsWarning"}
)

sign_define(
  "LspDiagnosticsSignInformation",
  {text = "", texthl = "LspDiagnosticsInformation"}
)

sign_define(
  "LspDiagnosticsSignHint",
  {text = "", texthl = "LspDiagnosticsHint"}
)



