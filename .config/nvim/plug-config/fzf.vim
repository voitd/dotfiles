" -- Fzf -----------------------------------------------------------------------

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" custom function to display all floating terminal
function! s:floaterm_list() abort
  let l:bufs = floaterm#buflist#gather()
  if len(bufs) < 1
    return []
  endif
  let l:termlist = []
  for bufnr in bufs
    let l:bufinfo = getbufinfo(bufnr)[0]
    let l:name = bufinfo['name']
    let l:title = getbufvar(bufnr, 'term_title')
    let l:line = string(bufnr) . '  ' . name . '  ' . title
    call add(termlist, line)
  endfor
  return termlist
endfunction

" Open terminal with FZF FloatermList
function! s:open_floaterm(line) abort
python3 << EOF
selected_term = vim.eval("a:line")
term_buffnr = selected_term.split(" ")[0]
vim.command("let l:term_buffnr = '%s'" % term_buffnr)
EOF
  call floaterm#terminal#open_existing(str2nr(l:term_buffnr))
endfunction

" switch floaterm
command! FloatermList call fzf#run(fzf#wrap({
\ 'source':  s:floaterm_list(),
\ 'sink': { line -> s:open_floaterm(line) },
\ 'options': '--no-sort --no-multi --prompt="Floaterm> "',
\ }))

" list buffers for BD
function! s:list_buffers() abort
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

" delete selected buffers for BD
function! s:delete_buffers(lines) abort
  execute 'bwipeout!' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" delete buffer
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': [ '--multi', '--prompt=BD> ', '--reverse', '--bind', 'ctrl-a:select-all+accept', '--preview', 'echo {} | awk -F "\"" "{gsub(/^[ \t]+line/,\":\", \$3); \$1=\"\"; gsub(/[ ]:[ ]/, \":\", \$0); print \$0}" | xargs -I __ "$XDG_DATA_HOME/nvim/plugged/fzf.vim/bin/preview.sh" __' ]
\ }))

