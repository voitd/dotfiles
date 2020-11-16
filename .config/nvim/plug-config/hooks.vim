
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

" Startuptime
  if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd!
    autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
  augroup END
endif

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  au VimEnter * PlugInstall | source $MYVIMRC
endif

if !exists('*SetupPlug')
  function SetupPlug()
    let g:not_finish_vimplug = "yes"
    PlugInstall --sync
    unlet g:not_finish_vimplug
    "set verbose=15
    source $MYVIMRC | q
    "set verbose=0
  endfunction
endif

" Set augroup
augroup MyHooks
  au!
augroup END

au VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   call SetupPlug()
  \| endif

" Auto Source init.vim When Saved
" au BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"
" NOTE: This takes ${VIM_STARTUP_TIME} duration to run
" augroup AutoReload $MYVIVRC
"   au BufWritePost ~/.config/nvim/plug-config/*.vim,$MYVIMRC ++nested
"       \  source $MYVIMRC | echom "Reloaded $NVIMRC" | redraw | silent doautocmd ColorScheme |
"   au FocusLost * silent! wall
" augroup END
" Make sure the terminal buffer has no numbers and no sign column
" Always open on insert mode
" tnoremap <Esc> <C-\><C-n>
" au TermOpen * setlocal signcolumn=no nonumber norelativenumber statusline=%{b:term_title}
" au TermOpen term://* startinsert
" au BufLeave term://* stopinsert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
au FileType floaterm tnoremap <buffer> <C-h> <c-\><c-n>:FloatermPrev<CR>
au FIleType floaterm tnoremap <buffer> <C-l> <c-\><c-n>:FloatermNext<CR>
" Disable vim stupid format issue with comment
au BufEnter * set fo-=c fo-=r fo-=o

" Return to last edit position (You want this!) *N*
au BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

" Update filetype on save if empty
" au BufWritePost * nested
"      \ if &l:filetype ==# '' || exists('b:ftdetect')
"      \ |   unlet! b:ftdetect
"      \ |   filetype detect
"      \ |   echom 'Filetype set to ' . &ft
"      \ | endif

" Autosave buffers
" au FocusLost,TextChanged,TextChangedI * silent! :wa!
au FocusLost * :wa!

" Only show the cursor line in the active buffer.
au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal relativenumber cursorline ""statusline=%!ActiveLine() 
au WinLeave,BufLeave * setlocal norelativenumber nocursorline ""statusline=%!InactiveLine()

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:
au BufReadPost fugitive://* set bufhidden=delete
" Try to fix issue where netrw is open and opened buffer not writable
" (requiring :set bt=): https://github.com/tpope/vim-vinegar/issues/13
au FileType netrw setl bufhidden=delete
" When opening a markdown or txt, set the textwidth to 80 and enable spell check
" au BufRead,BufNewFile *.md setlocal textwidth=80
" au BufRead,BufNewFile *.md setlocal spell
" au BufRead,BufNewFile *.txt setlocal textwidth=80
" au BufRead,BufNewFile *.txt setlocal spell
" au FileType ruby setlocal ts=2 sts=2 sw=2 noexpandtab
" au FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
" au FileType typescript setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType javascript,javascriptreact,jsx setlocal foldmethod=syntax nofoldenable
au FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
au FileType json syntax match Comment +\/\/.\+$+

" Automatic rename of tmux window
" augroup vimrc
"   if exists('$TMUX') && !exists('$NORENAME')
"     au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
"     au VimLeave * call system('tmux set-window automatic-rename on')
"   endif
" augroup end

" Force a syntax sync after I enter a buffer.
" au BufEnter * :syntax sync maxlines=100

au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Cleanup Start Page
au User StartifyReady set laststatus=0 showtabline=0 noruler
au User StartifyBufferOpened set laststatus=2 showtabline=0 noruler

" hide tmux status bar when vim starts, show when vim extts
" autocmd VimEnter * silent !tmux set status off
" autocmd VimLeave * silent !tmux set status on

" au ColorScheme * hi htmlArg gui=italic | hi Type gui=italic | hi Comment gui=italic

au VimResized * :wincmd =

" augroup CocExplorerCustom
"   autocmd!
"   autocmd BufEnter * call <SID>enter_explorer()
"   autocmd FileType coc-explorer call <SID>init_explorer()
" augroup END
""*****************************************************************************
"" Commands
"*****************************************************************************


" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Shruggie
command! -nargs=0 Shrug exec "normal! a¯\\_(ツ)_/¯\<Esc>"

" Open file in VSCode
command! VSCode :call system('nohup "code" '.expand('%:p').'> /dev/null 2>&1 < /dev/null &')<cr>

command! CtrlSemicolumn normal maA;<Esc>`a
command! CtrlColumn normal maA,<Esc>`a

command! -bang FzfTodo FzfPreviewProjectGrep FIXME\|TODO<CR>

"*****************************************************************************
"" Functions
"*****************************************************************************
" delete plugs which not on plug list
" function! s:uninstall_unused_coc_extensions() abort
"   for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
"     if index(g:coc_global_extensions, e) < 0
"       execute 'CocUninstall ' . e
"     endif
"   endfor
" endfunction
" au User CocNvimInit call s:uninstall_unused_coc_extensions()

"*****************************************************************************
"" <F5> / <F6> | Run script
"*****************************************************************************

  function! s:run_this_script(output)
   let head   = getline(1)
   let pos    = stridx(head, '#!')
   let file   = expand('%:p')
   let ofile  = tempname()
   let rdr    = " 2>&1 | tee ".ofile
   let win    = winnr()
   let prefix = a:output ? 'silent !' : '!'
   " Shebang found
   if pos != -1
     execute prefix.strpart(head, pos + 2).' '.file.rdr
   " Shebang not found but executable
   elseif executable(file)
     execute prefix.file.rdr
   elseif &filetype == 'javascript'
     execute prefix.'node '.file.rdr
   " elseif &filetype == 'go'
     " execute prefix.'go run '.file.rdr
   else
     return
   end

    redraw!
   if !a:output | return | endif

    " Scratch buffer
   if bufwinnr('vim-exec-output') > 0
     silent!  bdelete vim-exec-output
   endif

   silent!  split new
   silent!  resize 10
   silent!  file vim-exec-output
   setlocal buftype=nofile bufhidden=wipe noswapfile nonumber
   execute 'silent! read' ofile
   normal! gg"_dd
   execute win.'wincmd w'
 endfunction

 nnoremap <silent> <F5> :call <SID>run_this_script(0)<cr>
 nnoremap <silent> <F6> :call <SID>run_this_script(1)<cr>

" Coc Explorer hook
" function! s:coc_list_current_dir(args)
"   let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
"   execute 'cd ' . fnamemodify(node_info['fullpath'], ':h')
"   execute 'CocList ' . a:args
" endfunction

" function! s:init_explorer()
"   set winblend=10
"   nmap <buffer> <Leader>fg :call <SID>coc_list_current_dir('-I grep')<CR>
"   nmap <buffer> <Leader>fG :call <SID>coc_list_current_dir('-I grep -regex')<CR>
"   nmap <buffer> <C-p> :call <SID>coc_list_current_dir('files')<CR>
" endfunction

" function! s:enter_explorer()
"   if &filetype == 'coc-explorer'
"     " statusline
"     setl statusline=coc-explorer
"   endif
" endfunction

" Switch case of the character under the cursor, but DON'T move to the right.
function! SwitchCase()
    normal! ~
    if strlen(getline('.')) != virtcol('.')
        normal! h
    endif
endfunction
nnoremap U :call SwitchCase()<CR>

function! SourceThis()
	exec "source %"
	sleep 100m
endfunction
command! SourceThis silent! call SourceThis()

" This will flash cols and rows to locate the cursor
function! Flash()
	set cursorline cursorcolumn
	redraw
	sleep 200m
	set nocursorline nocursorcolumn
endfunction
command! PingCursor silent! call Flash()

if executable('ctags')
	command! MakeTags !ctags -R --fields=+iaS --extra=+q --exclude=.git .
endif

" This will toggle spell check.
function! ToggleSpell()
	if &spell
		set nospell
		echom "Spell Check OFF"
	else
		set spell
		echom "Spell Check ON"
	endif
endfunction
command! ToggleSpell silent! call ToggleSpell()

" This will toggle tabline
function! ToggleTabline()
	if &showtabline
		set showtabline=0
		echom "Tabline OFF"
	else
		set showtabline=2
		echom "Tabline ON"
	endif
endfunction
command! ToggleTabline silent! call ToggleTabline()

function! SpellFix()
	normal! mp[s1z=`p
  echom "Spell fixed!"
endfunction
command! SpellFix silent! call SpellFix()

" Add a debug statement
" Takes a variable name as an arg and will output a debug log
" statement dependent on the language
" With no argument will use the word under the cursor
function! s:console_log(...)
  let token = a:0 ? a:1 : expand('<cword>')
  if &ft ==# 'vim'
    let output = 'echo '.token
  " elseif &ft ==# 'ruby'
    " let output = ['p "#" * 80', 'p '.token, 'p "#" * 80']
  " elseif &ft ==# 'elixir'
  "   let output = ['IO.inspect '.token]
  elseif &ft =~# '^javascript'
    let output = 'console.log("'.token.' -> ", '.token.');'
  endif
  call append(line('.'), output)
  let z = @z
  normal! mz
  exec "silent normal! j".len(output)."=j`z"
  let @z = z
endfunction
command! -nargs=? TurboConsoleLog call <SID>console_log(<f-args>)
" nnoremap gI :TurboConsoleLog<cr>

function! ConsoleFromReg()
	exec "normal! Oconsole.log();\<esc>hP"
	exec "normal! =="
endfunction
command! -nargs=0 ConsoleFromReg :call ConsoleFromReg()

" function! s:small_terminal() abort
"   new
"   wincmd J
"   call nvim_win_set_height(0, 16)
"   set winfixheight
"   term
" endfunction
" " Make a small terminal.
" nnoremap <leader>q :call <SID>small_terminal()<CR>

