local sign_define = vim.fn.sign_define
local lsp = vim.lsp

-- map("n", "'d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {})
-- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
-- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      space = 2,
      prefix = "❮"
    },
    signs = true,
    update_in_insert = false
  }
)
-- sign_define(
--   "LspDiagnosticsSignError",
--   {
--     text = " ",
--     texthl = "Error"
--   }
-- )

-- sign_define(
--   "LspDiagnosticsSignWarning",
--   {
--     text = " ",
--     texthl = "WarningMsg"
--   }
-- )

-- sign_define(
--   "LspDiagnosticsSignInformation",
--   {
--     text = " ",
--     texthl = "Statement"
--   }
-- )

-- sign_define(
--   "LspDiagnosticsSignHint",
--   {
--     text = " ",
--     texthl = "diffAdded"
--   }
-- )

sign_define(
  "LspDiagnosticsSignError",
  {
    text = " ",
    texthl = "LspDiagnosticsError"
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = " ",
    texthl = "LspDiagnosticsWarning"
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = " ",
    texthl = "LspDiagnosticsInformation"
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = " ",
    texthl = "LspDiagnosticsHint"
  }
)

