local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Auto save files when focus is lost
cmd "au FocusLost * silent! :wa!"
cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup='IncSearch',timeout = 800})"
cmd "au BufEnter * set fo-=c fo-=r fo-=o"
cmd "au TermOpen * setlocal signcolumn=no nonumber norelativenumber"
cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json"

-- cmd "au BufWritePre * Format"
cmd "au BufWritePre * lua vim.lsp.buf.formatting_sync()"
cmd "au BufWritePost * normal! zv"

cmd "au FileType gitcommit setl spell"
-- cmd "au FileType html,css,scss,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall"

cmd "au BufEnter *.txt lua require('settings.utils').help_tab()"
-- Open image file in system preview
cmd [[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]]
-- cmd [[au BufEnter *.png,*.jpg,*gif exec "! kitty +kitten icat ".expand("%") | :bw]]

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

-- cmd "au Filetype fzf setlocal winblend=7"
cmd "au CmdlineLeave : echo ''"

cmd "au FileType floaterm nnoremap <silent> <buffer> q :q<CR>"

cmd "command! LSPReload lua reload_lsp()"
cmd "command! LSPDebug lua print(vim.inspect(vim.lsp.get_active_clients()))"
cmd "command! LSPLog lua open_lsp_log()"

-- cmd "au VimEnter * hi! StatusLineNC gui=underline guibg=NONE guifg=NONE"
cmd "au VimEnter * hi! MatchParen guifg=NONE guibg=NONE"


--  cmd "au VimEnter * hi! CmpItemAbbrDeprecated gui = "strikethrough", guibg=NONE"

-- cmd [[command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')."} from '';"]]

-- Startuptime
exec(
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
exec(
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

exec(
  [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]],
  ""
)
