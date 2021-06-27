local map = require "settings.utils".map

require "trouble".setup {
  fold_open = "▾",
  fold_closed = "▸",
  indent_lines = true,
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = ""
  },
  action_keys = {jump = {"<cr>"}, toggle_fold = {"<tab>"}}
}
local opts = {silent = true, noremap = true}
map("n", "<space>j", "<cmd>TroubleToggle<CR>", opts)
map("n", "<space>jw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", opts)
map("n", "<space>jd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>", opts)
map("n", "<space>jq", "<cmd>TroubleToggle quickfix<CR>", opts)
vim.cmd [[highlight link TroubleText CursorLineNr]]
