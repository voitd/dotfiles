"--- Floaterm ---------------------------------------------
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.95
let g:floaterm_height=0.6
" let g:floaterm_position='bottom'
" let g:floaterm_position='top'
let g:floaterm_wintitle=1
let g:floaterm_winblend=1
let g:floaterm_autoclose=2
let g:floaterm_keymap_next   = '<A-n>'
let g:floaterm_keymap_prev   = '<A-p>'
" let g:floaterm_keymap_kill   = '<A-k>'
let g:floaterm_keymap_kill   = '<F10>'
" let g:floaterm_keymap_toggle = '<A-j>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_title = 'Terminal [ $1..$2 ]'

" display line number, remove terminal from buffer list on term buffer enter
function s:floatermSettings()
    setlocal nobuflisted
endfunction

" hi FloatermBorder guifg=#F37F97
autocmd User Startified setlocal buflisted

" " custom function to display all floating terminal
" function! s:floaterm_list() abort
"   let l:bufs = floaterm#buflist#gather()
"   if len(bufs) < 1
"     return []
"   endif
"   let l:termlist = []
"   for bufnr in bufs
"     let l:bufinfo = getbufinfo(bufnr)[0]
"     let l:name = bufinfo['name']
"     let l:title = getbufvar(bufnr, 'term_title')
"     let l:line = string(bufnr) . '  ' . name . '  ' . title
"     call add(termlist, line)
"   endfor
"   return termlist
" endfunction

" function! s:open_floaterm(line) abort
" python3 << EOF
" selected_term = vim.eval("a:line")
" term_buffnr = selected_term.split(" ")[0]
" vim.command("let l:term_buffnr = '%s'" % term_buffnr)
" EOF
"   call floaterm#terminal#open_existing(str2nr(l:term_buffnr))
" endfunction

" " switch floaterm
" command! FloatermList call fzf#run(fzf#wrap({
" \ 'source':  s:floaterm_list(),
" \ 'sink': { line -> s:open_floaterm(line) },
" \ 'options': '--no-sort --no-multi --prompt="Floaterm> "',
" \ }))

" " delete buffer
" command! BD call fzf#run(fzf#wrap({
"   \ 'source': s:list_buffers(),
"   \ 'sink*': { lines -> s:delete_buffers(lines) },
"   \ 'options': [ '--multi', '--prompt=BD> ', '--reverse', '--bind', 'ctrl-a:select-all+accept', '--preview', 'echo {} | awk -F "\"" "{gsub(/^[ \t]+line/,\":\", \$3); \$1=\"\"; gsub(/[ ]:[ ]/, \":\", \$0); print \$0}" | xargs -I __ "$XDG_DATA_HOME/nvim/plugged/fzf.vim/bin/preview.sh" __' ]
" \ }))
