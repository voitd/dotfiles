local map = require "utils".map
local g = vim.g

g.floaterm_autoclose = 2
g.floaterm_width=0.85
g.floaterm_height=0.85

g.floaterm_winblend=0.7
g.floaterm_autoinsert=1
g.floaterm_keymap_kill   = '<F10>'
g.floaterm_keymap_toggle = '<F12>'
g.floaterm_title = 'TERM [$1/$2]'

g.floaterm_rootmarkers = { ".git", ".gitignore" }

map("n", "<F12>", ":FloatermToggle<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>:FloatermToggle<CR>")
