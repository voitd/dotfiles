require "trouble".setup {
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = false, -- automatically close the list when you have no diagnostics
  fold_open = "▾",
  fold_closed = "▸",
  indent_lines = true,
  use_lsp_diagnostic_signs = true
}

vim.cmd [[highlight link TroubleText CursorLineNr]]
