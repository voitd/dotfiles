
"---- Hooks -------------------------------------------------------
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
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

augroup vimplug
  au!
  au VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   call SetupPlug()
    \| endif
augroup end

" Auto Source init.vim When Saved
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"
augroup UpdateVim
  au!
  " NOTE: This takes ${VIM_STARTUP_TIME} duration to run
  au BufWritePost ~/.config/nvim/plug-config/*.vim,$MYVIMRC ++nested
        \  source $MYVIMRC | echom "Reloaded $NVIMRC" | redraw | silent doautocmd ColorScheme |
  au FocusLost * silent! wall
augroup end

" Make sure the terminal buffer has no numbers and no sign column
" Always open on insert mode
augroup term
  au!
  " tnoremap <Esc> <C-\><C-n>
  au TermOpen * :setlocal signcolumn=no nonumber norelativenumber
  au TermOpen term://* startinsert
  au TermOpen * setlocal statusline=%{b:term_title}
  au BufLeave term://* stopinsert
augroup end

" Disable vim stupid format issue with comment
augroup FormatFile
  au!
  au BufEnter * set fo-=c fo-=r fo-=o
augroup end


" Return to last edit position (You want this!) *N*
au BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Update filetype on save if empty
au BufWritePost * nested
     \ if &l:filetype ==# '' || exists('b:ftdetect')
     \ |   unlet! b:ftdetect
     \ |   filetype detect
     \ |   echom 'Filetype set to ' . &ft
     \ | endif

" Autosave buffer
au BufLeave,WinLeave,FocusLost,InsertLeave,TextChanged,FocusLost * :wall!

" Only show the cursor line in the active buffer.
augroup ActiveLine
  au!
  au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline  statusline=%!ActiveLine() 
  au WinLeave,BufLeave * setlocal nocursorline  statusline=%!InactiveLine()
  au WinLeave * hi statusline guifg=NONE 
  au WinLeave * hi statuslinenc guifg=NONE
augroup end


" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:
au BufReadPost fugitive://* set bufhidden=delete

" When opening a markdown or txt, set the textwidth to 80 and enable spell check
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal spell
au FileType ruby setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType typescript setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255


" Automatic rename of tmux window
augroup vimrc
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup end

" Force a syntax sync after I enter a buffer.
augroup SyncFromStart
  au!
  au BufEnter * :syntax sync maxlines=200
augroup end

augroup coc-explorer
  au!
  au FileType coc-explorer setlocal statusline=%#StatusLineNC#%{substitute(getcwd(),$HOME,'~','')}
augroup end

" Cleanup Start Page
augroup Startpage
  au User StartifyReady set laststatus=0 showtabline=0 noruler
  au User StartifyBufferOpened set laststatus=2 showtabline=0 noruler
augroup end

" hide tmux status bar when vim starts, show when vim extts
" autocmd VimEnter * silent !tmux set status off
" autocmd VimLeave * silent !tmux set status on

" au ColorScheme * hi htmlArg gui=italic | hi Type gui=italic | hi! link jsObjectKey jsString 

""*****************************************************************************
"" Commands
"*****************************************************************************


" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Shruggie
command! -nargs=0 Shrug exec "normal! a¯\\_(ツ)_/¯\<Esc>"

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
command! Flash silent! call Flash()

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

function! SpellFix()
	normal! mp[s1z=`p
endfunction
command! SpellFix silent! call SpellFix()

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
function! NativeMarks()
    marks abcdefghijklmnopqrstuvwxyz.
    echo 'Jump to mark: '
    let mark=nr2char(getchar())
    redraw
    execute 'normal! `'.mark
endfunction
command! NativeMarks call NativeMarks()


"*****************************************************************************
"" Check syntax
"*****************************************************************************
function! GetSyntaxID(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! GetSyntaxAttr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction

function! GetSyntaxInfo()
  let baseSyn = GetSyntaxAttr(GetSyntaxID(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = GetSyntaxAttr(GetSyntaxID(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call GetSyntaxInfo()

"*****************************************************************************
" replace in all opened buffers http://vim.wikia.com/wiki/VimTip382
"*****************************************************************************
function! Replace()
  let s:word = input("Replace " . expand('<cword>') . " with:")
  exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
  unlet! s:word
endfunction
map <Leader>R :call Replace()<CR>

