vim.cmd[[packadd nvim-autopairs]]
local npairs = require('nvim-autopairs')
local map = require"settings.utils".map

npairs.setup{
  break_line_filetype = nil, -- enable this rule for all filetypes
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = { "TelescopePrompt" },
  html_break_line_filetype = {
    'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'
  },
  ignored_next_char = "[%w%.%+%-%=%/%,]"
}

local check_surroundings = function()
  local col = vim.fn.col('.')
  local line = vim.fn.getline('.')
  local prev_char = line:sub(col - 1, col - 1)
  local next_char = line:sub(col, col)
  local pattern = '[%{|%}|%[|%]]'

  if prev_char:match(pattern) and next_char:match(pattern) then
    return true
  else
    return false
  end
end

 function _G.insert_space()
  local is_char_present = check_surroundings()

  if is_char_present then
    return vim.api.nvim_replace_termcodes("  <Left>", true, false, true)
  end

  return " "
end

map("i", "<Space>", "v:lua insert_space()", {})
