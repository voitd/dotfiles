local g = vim.g
local cmd = vim.cmd

cmd "filetype plugin indent on"
g["test#strategy"] = "floaterm"
g["test#elixir#exunit#executable"] = "MIX_ENV=test mix test"
g["test#javascript#jest#options"] = "--color=always"
-- cmd('')

g.lengthmatters_highlight_one_column = 1

g.gitblame_enabled = 0
g.gitblame_message_template = "     <author> • <summary> • <date>"

g.ultest_icons = 1

g.clipboard = {
  name = "macOS-clipboard",
  copy = {
    ["+"] = "pbcopy",
    ["*"] = "pbcopy"
  },
  paste = {
    ["+"] = "pbpaste",
    ["*"] = "pbpaste"
  },
  cache_enabled = 0
}

g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/usr/local/bin/python3"

g.jsx_ext_required = 1
g.javascript_plugin_jsdoc = 1

