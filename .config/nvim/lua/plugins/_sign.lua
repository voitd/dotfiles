require("gitsigns").setup {
  signs = {
    add = {hl = "GitGutterAdd", text = "│"},
    change = {hl = "GitGutterChange", text = "│"},
    delete = {hl = "GitGutterDelete", text = "│"},
    topdelete = {hl = "GitGutterDelete", text = "│"},
    changedelete = {hl = "GitGutterChange", text = "│"}
  },
  numhl = true,
  keymaps = {
    noremap = true,
    buffer = true,
    ["n ]g"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    ["n [g"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  sign_priority = 6,
  status_formatter = nil -- Use default
}
