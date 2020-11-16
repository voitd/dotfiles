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

let g:fzf_preview_window='up:65%'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.6, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5} }


let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
" let $FZF_PREVIEW_COMMAND = 'COLORTERM=truecolor bat --color=always --style=plain --theme=TwoDark -n -- {} || cat {}'

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
    :GitFiles
  else
    :Files
  endif
endfunction

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

