local map = require("utils").map

vim.g.lua_tree_side = "left"
vim.g.lua_tree_ignore = {".git", "node_modules"}
vim.g.lua_tree_auto_open = 1
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_follow = 1
vim.g.lua_tree_tab_open = 1
vim.g.lua_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

vim.g.lua_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },
  folder = {default = "", open = " "}
}

vim.g.lua_tree_bindings = {
  edit_split = {"<C-s>"},
  create = {"n"}
}

map("n","<Leader>e","LuaTreeToggle<CR>", {})

vim.api.nvim_exec(
  [[
augroup LuaTreeOverride
  au!
  au FileType LuaTree setlocal nowrap
augroup END
]],
  ""
)
