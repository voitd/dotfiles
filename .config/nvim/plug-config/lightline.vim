if !PluginLoaded('lightline.nvim')
  finish
endif
" -- Lightline -----------------------------------------------------------------

" lightline components
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitbranch', 'filename', 'readonly'],
  \   ],
  \   'right':[
  \     ['lineinfo'],
  \     ['cocdiagnostic', 'filetype'],
  \     ['gitstatus']
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     ['gitbranch', 'filename'],
  \   ],
  \   'right':[
  \     ['lineinfo'],
  \     ['filetype']
  \   ],
  \ },
  \ 'tabline': {
  \   'left': [
  \     ['vimcons'],
  \     ['buffers'],
  \   ],
  \ 'right': [
  \     [ 'close' ],
  \     [ 'vimcons' ],
  \   ],
  \ },
  \ 'component': {
  \   'vimcons': '',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'LightlineCocStatus',
  \   'cocdiagnostic': 'LightlineCocDiagnostic',
  \   'gitstatus': 'LightlineGitStatus',
  \   'gitbranch': 'LightlineGitBranch',
  \   'lineinfo': 'LightlineLineInfo',
  \   'filename': 'LightlineFilename',
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \   'readonly': 'LightLineReadonly',
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \   'readonly': 'warning',
  \ },
  \ 'mode_map': {'c': 'NORMAL'},
  \ }

" coc status information
function! LightlineCocStatus() abort
  if (winwidth(0) < 40)
    return ''
  endif
  let msg = get(g:, 'coc_status', '')
  return trim(msg)
endfunction

" coc lint information
function! LightlineCocDiagnostic() abort
  if (winwidth(0) < 40)
    return ''
  endif
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return ' ' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ' ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ' ' . info['warning'])
  endif
  return join(msgs, ' ') == '' ? ' ' : join(msgs, ' ')
endfunction

" display lock symbol for readonly file
function! LightLineReadonly()
  if (winwidth(0) > 40)
    return &readonly ? '' : ''
  endif
  return ''
endfunction

" display branch detail
function! LightlineGitBranch()
  if (winwidth(0) > 40)
    let branch = get(g:, 'coc_git_status', '')
    return branch
  endif
  return ''
endfunction

" display file name with edit check
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

" display coc git modify detail +1 ~1 -1 etc
function! LightlineGitStatus() abort
  let status = get(b:, 'coc_git_status', '')
  return winwidth(0) > 120 ? status : ''
endfunction

" line no indicator symbols
let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽']

" display lineNoIndicator (from drzel/vim-line-no-indicator)
function! LineNoIndicator() abort
  let l:current_line = line('.') - 1
  let l:total_lines = line('$') - 1
  if l:current_line == 0
    let l:index = 0
  elseif l:current_line == l:total_lines
    let l:index = -1
  else
    let l:line_no_fraction = floor(l:current_line) / floor(l:total_lines)
    let l:index = float2nr(l:line_no_fraction * len(g:line_no_indicator_chars))
  endif
  return g:line_no_indicator_chars[l:index]
endfunction

" change the display of line info
function! LightlineLineInfo() abort
  return winwidth(0) > 40 ? LineNoIndicator() . ' ' . line('.') . '/' . line('$') : ''
endfunction

" use powerline symbols
" let g:lightline.separator = {
"       \   'left': ' ' , 'right': ' '
"   \}
" let g:lightline.subseparator = {
" 	\   'left': '//', 'right': '\\'
"   \}
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}

let g:lightline.component = { 'close':  'ﮊ ' }
let g:lightline.separator = { 'right': '', 'left': '' }
let g:lightline.subseparator = { 'right': '\uE0B7', 'left': '\uE0B5' }
" let g:lightline.subseparator = {'left': '❯', 'right': '❮'}
let g:lightline.tabline_separator = { 'right': '', 'left': '' }
let g:lightline.tabline_subseparator = { 'right': '\uE0B7', 'left': '\uE0B5' }
" let g:lightline.tabline_separator = { 'left': " ", 'right': "" }
" let g:lightline.tabline_subseparator = { 'left': "/", 'right': "/" }

" lightline bufferline config
let g:lightline#bufferline#filename_modifier = ':t'
" let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1 "" or 2
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline#bufferline#composed_number_map = {
\ 1:  '① ', 2:  '② ', 3:  '③ ', 4:  '④ ', 5:  '⑤ ',
\ 6:  '⑥ ', 7:  '⑦ ', 8:  '⑧ ', 9:  '⑨ ', 10: '⑩ ',
\ 11: '⑪ ', 12: '⑫ ', 13: '⑬ ', 14: '⑭ ', 15: '⑮ ',
\ 16: '⑯ ', 17: '⑰ ', 18: '⑱ ', 19: '⑲ ', 20: '⑳ '}

" let g:lightline#bufferline#number_map = {
" \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
" \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}

" let g:lightline#bufferline#unicode_symbols = 1


" overwrite the lightline onedark theme
" let s:palette = g:lightline#colorscheme#onedark#palette
" let s:palette.inactive.middle = [ [ '#282c34', '#282c34', 235, 113, 'NONE' ] ]
" unlet s:palette
let g:lightline.colorscheme = 'palenight_alter'

