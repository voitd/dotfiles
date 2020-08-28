
"---- Hooks -------------------------------------------------------
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
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

augroup vimplug
  autocmd!
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   call SetupPlug()
    \| endif
augroup end

" Auto Source init.vim When Saved
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"
augroup UpdateVim
  autocmd!
  " NOTE: This takes ${VIM_STARTUP_TIME} duration to run
  autocmd BufWritePost ~/.config/nvim/plug-config/*.vim,$MYVIMRC ++nested
        \  source $MYVIMRC | echom "Reloaded $NVIMRC" | redraw | silent doautocmd ColorScheme |
  autocmd FocusLost * silent! wall
augroup END

" Terminal settings
function s:add_terminal_mappings()
  if &filetype ==# '' || &filetype ==# 'toggleterm'
    if has('nvim')
      "Add neovim terminal escape with ESC mapping
      tnoremap <buffer><esc> <C-\><C-n>
      tnoremap <buffer><C-h> <C-\><C-n><C-W>h
      tnoremap <buffer><C-j> <C-\><C-n><C-W>j
      tnoremap <buffer><C-k> <C-\><C-n><C-W>k
      tnoremap <buffer><C-l> <C-\><C-n><C-W>l
      tnoremap <buffer><silent><S-Tab> <C-\><C-n>:bprev<CR>
      tnoremap <buffer><C-c> <C-\><C-n>:close \| :bnext<cr>
    else
      tmap <C-h> <C-W>h
      tmap <C-j> <C-W>j
      tmap <C-k> <C-W>k
      tmap <C-l> <C-W>l
      tmap <C-x> <C-W><silent>q!<CR>
    endif
  endif
endfunction

" Make sure the terminal buffer has no numbers and no sign column
" Always open on insert mode
augroup term
  autocmd!
  autocmd TermOpen * :setlocal signcolumn=no nonumber norelativenumber
  autocmd TermOpen term://* startinsert
  autocmd TermEnter,BufEnter term://* call s:add_terminal_mappings()
  autocmd BufLeave term://* stopinsert
augroup end

" Disable vim stupid format issue with comment
augroup FormatFile
  autocmd!
  autocmd BufEnter * set fo-=c fo-=r fo-=o
augroup end


" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Update filetype on save if empty
autocmd BufWritePost * nested
     \ if &l:filetype ==# '' || exists('b:ftdetect')
     \ |   unlet! b:ftdetect
     \ |   filetype detect
     \ |   echom 'Filetype set to ' . &ft
     \ | endif

" Autosave buffer
autocmd BufLeave,FocusLost,InsertLeave,TextChanged,FocusLost * :wa

    let g:python_host_prog  = expand('/usr/bin/python' )
    let g:python3_host_prog = expand('/usr/local/bin/python3.8')
    let g:loaded_python3_provider = 1
" " python setup
" if has('nvim')
"   let platform=system('uname -s')
"   if (match(platform, "darwin") == 0)
"     let g:python_host_prog  = expand('/usr/bin/python' )
"     let g:python3_host_prog = expand('/usr/local/bin/python3.8')
"     let g:loaded_python3_provider = 1
"   else
"     let g:python_host_prog  = '/usr/bin/python2'
"     let g:python3_host_prog = '/usr/bin/python3'
"   endif
" endif


" autocmd CursorHold * echo
" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Automatic rename of tmux window
augroup vimrc
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END

" Force a syntax sync after I enter a buffer.
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" autocmd BufEnter,InsertLeave * :syntax sync fromstart

" Set internal g:clipboard to save some startup time.
if has('mac') && executable('pbpaste')
	let g:clipboard = {
		\ 'name': 'pbcopy',
		\ 'cache_enabled': v:false,
		\ 'copy': {
		\ '+': 'pbcopy',
		\ '*': 'pbcopy'
		\ },
		\ 'paste': {
		\ '+': 'pbpaste',
		\ '*': 'pbpaste'
		\ }
	\ }
elseif exists('$DISPLAY') && executable('xclip')
	let g:clipboard = {
		\ 'name': 'xclip',
		\ 'cache_enabled': v:false,
		\ 'copy': {
		\ '+': 'xclip -quiet -i -selection clipboard',
		\ '*': 'xclip -quiet -i -selection primary'
		\ },
		\ 'paste': {
		\ '+': 'xclip -o -selection clipboard',
	  \ '*': 'xclip -o -selection primary'
		\ }
	\ }
endif

" function! s:SourceFilesFromDirectory(directory_name) abort
"   for file_path in split(glob('~/.vim/' . a:directory_name . '/*.vim'), '\n')
"     execute 'source ' . file_path
"   endfor
" endfunction

" call s:SourceFilesFromDirectory('plugin_config')

"*****************************************************************************
"" Commands
"*****************************************************************************

" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Shruggie
command! -nargs=0 Shrug exec "normal! a¯\\_(ツ)_/¯\<Esc>"

" Source
command! -nargs=0 Reload so %

" :redraw!
command! -nargs=0 Redraw redraw!

" General
command! -nargs=1 H exec ":vert h " . <f-args> . "\<cr>"

" Add a debug statement
" Takes a variable name as an arg and will output a debug log
" statement dependent on the language
" With no argument will use the word under the cursor
command! -nargs=? TurboConsoleLog call <SID>console_log(<f-args>)

" Open file in VSCode
command! VSCode :call system('nohup "code" '.expand('%:p').'> /dev/null 2>&1 < /dev/null &')<cr>

"*****************************************************************************
"" Functions
"*****************************************************************************

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

  silent!  vertical botright split new
  silent!  file vim-exec-output
  setlocal buftype=nofile bufhidden=wipe noswapfile
  execute 'silent! read' ofile
  normal! gg"_dd
  execute win.'wincmd w'
endfunction

" nnoremap <silent> <F5> :call <SID>run_this_script(0)<cr>
" nnoremap <silent> <F6> :call <SID>run_this_script(1)<cr>

function! s:console_log(...)
  let token = a:0 ? a:1 : expand('<cword>')
  if &ft ==# 'vim'
    let output = 'echo '.token
  " elseif &ft ==# 'ruby'
    " let output = ['p "#" * 80', 'p '.token, 'p "#" * 80']
  " elseif &ft ==# 'elixir'
  "   let output = ['IO.inspect '.token]
  elseif &ft =~# '^javascript'
    let output = 'console.log("'.token.' -> ", '.token.')'
  endif
  call append(line('.'), output)
  let z = @z
  normal! mz
  exec "silent normal! j".len(output)."=j`z"
  let @z = z
endfunction
" nnoremap gI :TurboConsoleLog<cr>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

function! ConsoleFromBuff()
	:execute "normal! Oconsole.log();\<esc>hP"
	:execute "normal! =="
endfunction
command! -nargs=0 ConsoleFromBuff :call ConsoleFromBuff()

" Better marks
function! Marks()
    marks abcdefghijklmnopqrstuvwxyz.
    echo 'Jump to mark: '
    let mark=nr2char(getchar())
    redraw
    execute 'normal! `'.mark
endfunction
command! Marks call Marks()
nnoremap <silent>_ :call Marks()<cr>

" Search for css defenittion
function! s:CSSSearchForClassDef()
  setlocal iskeyword+=-
  let word = expand('<cword>')
  setlocal iskeyword-=-
  execute ':Find .' . word
endfunction
command! CSSSearchForClassDef :call s:CSSSearchForClassDef()




