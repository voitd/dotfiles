local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Auto save files when focus is lost
cmd "au FocusLost * silent! :wa!"
cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})"
cmd "au BufEnter * set fo-=c fo-=r fo-=o"
cmd "au TermOpen * setlocal signcolumn=no nonumber norelativenumber"

cmd "au BufNewFile,BufRead .aliases setf sh"
-- cmd "au BufNewFile,BufRead .setf json"
cmd "au BufNewFile,BufRead .prettierrc setf json"
cmd "au BufNewFile,BufRead .eslintrc setf json"
cmd "au BufNewFile,BufRead .eslintignore setf gitignore"

cmd "au BufEnter *.txt lua require('utils').help_tab()"

-- Open image file in system preview
cmd [[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]]
-- cmd [[au BufEnter *.png,*.jpg,*gif exec "! kitty +kitten icat ".expand("%") | :bw]]

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
-- Reload module after saving
cmd "command!  -nargs=1 ReloadModule lua require('plenary.reload').reload_module(<q-args>)"
cmd "au BufWritePost *.lua :ReloadModule<CR>"

cmd "au CmdlineLeave : echo ''"


cmd "command! ReloadLSP lua reload_lsp()"
cmd "command! DebugLSP lua print(vim.inspect(vim.lsp.get_active_clients()))"
cmd "command! LogLSP lua open_lsp_log()"

-- cmd("au BufEnter * lua require'com_pletion'.on_attach()")
-- cmd("au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")

-- Startuptime
exec([[
  if has('vim_starting') && has('reltime')
   let g:startuptime = reltime()
   augroup vimrc-startuptime
     autocmd!
     autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
   augroup END
 endif
]],"")

-- Automatic rename of tmux window
-- api.nvim_exec(
--   [[
--    augroup vimrc
--      if exists('$TMUX') && !exists('$NORENAME')
--        au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
--        au VimLeave * call system('tmux set-window automatic-rename on')
--      endif
--    augroup end
--   ]],
--   ""
-- )

exec([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]],"")
