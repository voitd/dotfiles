local map = require("utils").map
local g = vim.g

g.lua_tree_ignore = {".git", "node_modules"}
g.lua_tree_auto_close = 1
g.lua_tree_quit_on_open = 1
g.lua_tree_git_hl = 1
g.lua_tree_tab_open=1
-- g.lua_tree_follow = 1
g.lua_tree_indent_markers = 1
g.lua_tree_root_folder_modifier = ':~'
g.lua_tree_show_icons = {
  git = 1,
  folders = 0,
  files = 0
}

g.lua_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },
  folder = {
      default = "",
      open = ""
    }
  -- folder = {default = "", open = " "}
}

-- g.lua_tree_bindings = {
--   toggle_ignored = {'.'},
-- }

map("n","<Leader>e",":LuaTreeToggle<CR>", {noremap = true,silent = true})
map("n","<Leader>er",":LuaTreeRefresh<CR>", {noremap = true,silent = true})

vim.api.nvim_exec(
  [[
augroup LuaTreeOverride
  au!
  au FileType LuaTree setlocal nowrap
augroup END
]],
  ""
)
