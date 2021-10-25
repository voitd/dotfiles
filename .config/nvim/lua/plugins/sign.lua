require("gitsigns").setup {
  signs = {
    -- add = {text = "", numhl = "GitGutterAdd"},
    -- change = {text = "", numhl = "GitGutterChange"},
    -- delete = {text = "", numhl = "GitGutterDelete"},
    -- topdelete = {text = "", numhl = "GitGutterDelete"},
    -- changedelete = {text = "", numhl = "GitGutterDelete"}
    --  add = {hl = "GitGutterAdd", text = "│", numhl = ""},
    --  change = {hl = "GitGutterChange", text = "│", numhl = ""},
    --  delete = {hl = "GitGutterDelete", text = "│", numhl = ""},
    --  topdelete = {hl = "GitGutterDelete", text = "│", numhl = ""},
    --  changedelete = {hl = "GitGutterDelete", text = "│", numhl = ""}
    add = {hl = "SingAdd", text = "│", numhl = ""},
    change = {hl = "SingChange", text = "│", numhl = ""},
    delete = {hl = "SingDelete", text = "│", numhl = ""},
    topdelete = {hl = "SignDelete", text = "│", numhl = ""},
    changedelete = {hl = "SignDelete", text = "│", numhl = ""}
    --[[ add = {
      hl = "GitSignsAdd",
      text = "│",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn"
    },
    change = {
      hl = "GitSignsChange",
      text = "│",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn"
    },
    delete = {
      hl = "GitSignsDelete",
      text = "│",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn"
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "│",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn"
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "│",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn"
    } --]]
  },
  numhl = true,
  keymaps = {
    noremap = true,
    buffer = true,
    ["n ]g"] = {expr = true, '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    ["n [g"] = {expr = true, '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    ["n <leader>ha"] = '<cmd>lua require"gitsigns".attach()<CR>',
    ["n <leader>hd"] = '<cmd>lua require"gitsigns".detach_all()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame_opts = {
    virt_text_pos = "right_align" -- 'eol' | 'overlay' | 'right_align'
  },
  sign_priority = 6,
  status_formatter = nil,
  update_debounce = 100,
  -- yadm = {enable = true}
  -- status_formatter = function(status)
  -- local added = status.added > 0 and "  " .. status.added or ""
  -- local changed = status.changed > 0 and "  " .. status.changed or ""
  -- local removed = status.removed > 0 and "  " .. status.removed or ""
  -- return status.head .. added .. changed .. removed .. " "
  -- end
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor"
  }
}
