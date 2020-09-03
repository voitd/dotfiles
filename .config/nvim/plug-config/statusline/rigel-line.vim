set noshowmode

set laststatus=2

function! RenderColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi StatuslineFilename guifg=#8897F4 guibg=#00384d ctermfg=4 cterm=none ctermbg=17
  " Insert mode
  elseif a:mode == 'i'
    hi StatuslineFilename ctermfg=1 cterm=none ctermbg=17 guifg=#03fc5a guibg=#00384d
  " Replace mode
  elseif a:mode == 'R'
    hi StatuslineFilename ctermfg=3 cterm=none ctermbg=17 guifg=#F2A272 guibg=#00384d
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi StatuslineFilename ctermfg=5 cterm=none ctermbg=17 guifg=#0380fc guibg=#00384d
  " Command mode
  elseif a:mode == 'c'
    hi StatuslineFilename ctermfg=6 cterm=none ctermbg=17 guifg=#79E6F3 guibg=#00384d
  " Terminal mode
  elseif a:mode == 't'
    hi StatuslineFilename ctermfg=1 cterm=none ctermbg=17 guifg=#F37F97 guibg=#00384d
  endif
    hi StatuslineMainAccent guifg=#00384d guibg=NONE ctermfg=17 cterm=NONE ctermbg=NONE
    hi StatuslineLightAccent guifg=#00484d guibg=NONE ctermfg=17 cterm=NONE ctermbg=NONE
    hi StatuslineSlaveAccent guifg=#F37F97 guibg=#00484d ctermfg=17 cterm=NONE ctermbg=1
    hi StatuslineAccentBody guifg=#8897F4 guibg=#00384d ctermbg=17 cterm=NONE ctermfg=4
    hi StatuslineGitBody ctermbg=17 cterm=bold ctermfg=1 guifg=#F37F97 guibg=#00384d
    hi StatuslineInfo ctermfg=3 cterm=none ctermbg=17 guifg=#F2A272 guibg=#00384d
    hi StatuslineLightInfo ctermfg=3 cterm=none ctermbg=17 guifg=#F2A272 guibg=#00484d
    hi StatuslineFiletype guifg=#03fcf0 guibg=#00484d ctermfg=5 cterm=italic ctermbg=17
    hi StatuslineDiagnostic guifg=#ff5500 guibg=#00384d ctermfg=5 cterm=italic ctermbg=17
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" #00384d
function! SetModifiedSymbol(modified) 
    if a:modified == 1
        hi StatuslineModifiedBody ctermbg=17 cterm=bold ctermfg=1 guifg=#F37F97 guibg=#00384d
    else
        hi StatuslineModifiedBody ctermbg=17 cterm=bold ctermfg=2 guifg=#5ADECD guibg=#00384d
    endif
    return ''
endfunction

" coc lint information
function! CocDiagnostic() abort
  if (winwidth(0) < 40)
    return ''
  endif
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif 
  " if empty(info) | return '' | endif 
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ' ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ' ' . info['warning'])
  endif
  return join(msgs, ' ') == '' ? '' : join(msgs, ' ')
endfunction

function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

" line no indicator symbols
let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽']

"display lineNoIndicator (from drzel/vim-line-no-indicator)
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
function! LineInfo() abort
  return winwidth(0) > 40 ? line('.') . '/' . line('$') : ''
  " return winwidth(0) > 40 ? LineNoIndicator() . ' ' . line('.') . '/' . line('$') : ''
endfunction

let g:currentmode={
      \ 'n'  : 'NORMAL',
      \ 'no' : 'Normal·Operator Pending',
      \ 'v'  : 'VISUAL',
      \ 'V'  : 'V·Line',
      \ '^V' : 'V·Block',
      \ 's'  : 'S',
      \ 'S'  : 'S·Line',
      \ '^S' : 'S·Block',
      \ 'i'  : 'INSERT',
      \ 'R'  : 'R',
      \ 'Rv' : 'V·Replace',
      \ 'c'  : 'C',
      \ 'cv' : 'Vim Ex',
      \ 'ce' : 'Ex',
      \ 'r'  : 'Prompt',
      \ 'rm' : 'More',
      \ 'r?' : 'Confirm',
      \ '!'  : '!',
      \ 't'  : 'T'
      \}

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! TestingStatus() abort
  if g:TESTING_STATUS == 'passing'
    return ""
  elseif g:TESTING_STATUS == 'running'
    return ""
  elseif g:TESTING_STATUS == 'failing'
    return ""
  endif
endfunction


function! GitBranch() abort
  if fugitive#head() !=# ''
    " return " " . fugitive#head()
    return  " " . fugitive#head()
  else
    return "\uf468"
  endif
endfunction


" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RenderColors(mode())}
" Left side items
" =======================
" Mode

" set statusline+=%#StatuslineAccent#\ 
" set statusline+=%#StatuslineFilename#%{ModeCurrent()}
" set statusline+=%#StatuslineAccent# 

" GitBranch
set statusline+=%#StatuslineLightAccent# 
set statusline+=%#StatuslineSlaveAccent#\\ 
set statusline+=%#StatuslineGitBody#\ \%{fugitive#head()}
set statusline+=%#StatuslineMainAccent#

set statusline+=\ 

set statusline+=%#StatuslineLightAccent# 
set statusline+=%#StatuslineFiletype#%{WebDevIconsGetFileTypeSymbol()}\  
set statusline+=%#StatuslineFilename#\ \%t
set statusline+=%#StatuslineModifiedBody#\ \%{SetModifiedSymbol(&modified)}
set statusline+=%#StatuslineMainAccent#

" Right side items
" =======================
set statusline+=%=


" Padding
set statusline+=\ 

set statusline+=%#StatuslineLightAccent#
set statusline+=%#StatuslineLightInfo#%{LineNoIndicator()}\ 
set statusline+=%#StatuslineInfo#\ \%{LineInfo()}
set statusline+=%#StatuslineMainAccent#


" " Padding
set statusline+=\ 
" CoC Diagnostics
set statusline+=%#StatuslineMainAccent#
set statusline+=%#StatuslineDiagnostic#%{CocDiagnostic()}
set statusline+=%#StatuslineMainAccent#
" " Padding
" set statusline+=\ 
" " Filetype
" set statusline+=%#StatuslineAccent#
" set statusline+=%#StatuslineFiletype#%{WebDevIconsGetFileTypeSymbol()}
" set statusline+=%#StatuslineAccent#

" " Padding
set statusline+=\ 

" GitBranch
" set statusline+=%#StatuslineAccent#
" set statusline+=%#StatuslineGitBody#%{GitBranch()}
" set statusline+=%#StatuslineAccent#


"" TestingStatus
" set statusline+=%#StatuslineAccent#
" set statusline+=%#StatuslineGitBody#%{TestingStatus()}
" set statusline+=%#StatuslineAccent#
