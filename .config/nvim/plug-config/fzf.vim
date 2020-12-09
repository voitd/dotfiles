" -- Fzf -----------------------------------------------------------------------
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-l': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_branch_actions = {
      \ 'checkout': {
      \   'execute': 'echo system("{git} checkout " . (empty("{branch}") ? "-b {input}" : "{branch}"))',
      \   'required': [],
      \ },
      \}
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1


" let g:fzf_commits_log_options = '--graph --color=always
"   \ --format="%C(yellow)%h%C(red)%d%C(reset)
"   \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

let g:fzf_commits_log_options = '--graph --color=always --pretty=format:"%C(yellow)%h%Creset %s %C(bold green)%ar%Creset %C(bold blue)%an%Creset%C(bold red)%d%Creset"'

" let g:fzf_preview_window='right:65%'
let g:fzf_tags_command = 'ctags -R'
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.6, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5} }
" let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.3, 'yoffset': 1.0, 'border': 'top' } }
let g:fzf_layout = { 'down': '~30%' }

let $FZF_DEFAULT_OPTS = '--border --layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let $FZF_PREVIEW_COMMAND = 'COLORTERM=truecolor bat --color=always --style=plain --theme=ansi-dark -n -- {} || cat {}  --style=numbers {-1}'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ "bg+":     ["bg", "ColorColumn", "CursorLine", "CursorColumn", "Normal"],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Eception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


function! FzfOmniFiles()
  if fugitive#head() != ''
    :GitFiles --cached --others --exclude-standard
  else
    :Files
  endif
endfunction

function! s:fzf_statusline() abort
  setlocal statusline=%4*\ %6*V:\ ctrl-v\ H:\ ctrl-h\ Tab:\ ctrl-t\ QuickFix:\ ctrl-l
endfunction

" Disable status line for fzf buffers."
augroup MyFZF
	autocmd!
	autocmd! User FzfStatusLine call <SID>fzf_statusline()
augroup END


function! SearchVisual()
  execute 'Rg' expand('<cword>')
endfunction

function! SearchWord() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

function! SearchRG()
  execute ':CocCommand fzf-preview.ProjectGrep' expand('<cword>')
endfunction

function! FuzzyJest(trimmed_values) abort
  call fzf#run({
        \ 'source': a:trimmed_values,
        \ 'sink':   function('JestTest'),
        \ 'options': '-m',
        \ 'down': '40%'
        \ })
    call feedkeys('i')
endfunction

function! ListTests() abort
  let g:Jest_list_callback = funcref('FuzzyJest')
  call JestList()
  unlet g:Jest_list_callback
endfunction

command! -nargs=* -bang FT call FuzzyJest

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)


