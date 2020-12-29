-- Currently, there is no interface to create user commands in Lua. It is planned, though:
-- PR: https://github.com/neovim/neovim/pull/12378

local fn = vim.fn
local cmd = vim.cmd
local api = vim.api
local U = require("utils")

-- Auto save files when focus is lost
cmd "au FocusLost * silent! :wa!"
cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})"
cmd "au BufEnter * set fo-=c fo-=r fo-=o"
cmd "au TermOpen * setlocal signcolumn=no nonumber norelativenumber"

cmd "au BufNewFile,BufRead .prettierrc setf json"
cmd "au BufNewFile,BufRead .eslintrc setf json"
cmd "au BufNewFile,BufRead .eslintignore setf gitignore"

cmd "au BufEnter *.txt lua require('utils').help_tab()"

-- Reload module after saving
-- cmd("au BufWritePost ~/.config/nvim/init.lua <cmd>lua require'plenary.reload'.reload_module'init'<cr>")

-- tsconfig.json supports comments and json5 enables comments
-- cmd "au BufNewFile,BufRead tsconfig.json setlocal filetype=json5"

-- cmd("au BufEnter * lua require'completion'.on_attach()")
-- cmd("au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")

-- Startuptime
api.nvim_exec(
  [[
  if has('vim_starting') && has('reltime')
   let g:startuptime = reltime()
   augroup vimrc-startuptime
     autocmd!
     autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
   augroup END
 endif
]],
  ""
)

-- Automatic rename of tmux window
api.nvim_exec(
  [[
   augroup vimrc
     if exists('$TMUX') && !exists('$NORENAME')
       au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
       au VimLeave * call system('tmux set-window automatic-rename on')
     endif
   augroup end
  ]],
  ""
)

cmd [[augroup numbertoggle]]
cmd [[autocmd!]]
cmd [[autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif]]
cmd [[autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif]]
cmd [[augroup END]]
