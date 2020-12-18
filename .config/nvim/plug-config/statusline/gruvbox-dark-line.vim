" Palette
let g:dark = {}
let g:dark.black    =  [0,  '#32302f']
let g:dark.red      =  [1,  '#cc241d']
let g:dark.green    =  [2,  '#98971a']
let g:dark.yellow   =  [3,  '#d79921']
let g:dark.blue     =  [4,  '#458588']
let g:dark.magenta  =  [5,  '#b16286']
let g:dark.cyan     =  [6,  '#689d6a']
let g:dark.white    =  [7,  '#a89984']
let g:dark.brown    =  [16, '#504d4c']


let g:light = {}
let g:light.black   =  [8,  '#928374']
let g:light.red     =  [9,  '#fb4934']
let g:light.green   =  [10, '#b8bb26']
let g:light.yellow  =  [11, '#fabd2f']
let g:light.blue    =  [12, '#83a598']
let g:light.magenta =  [13, '#d3869b']
let g:light.cyan    =  [14, '#8ec07c']
let g:light.white   =  [15, '#ebdbb2']
let g:light.brown   =  [18, '#504d4c']

let g:none          = ["none", "none"]


function! g:C(scope, bg, fg, attr)
  let bg = &background 
  exec "hi ".a:scope "ctermbg=".a:bg[0] "ctermfg=".a:fg[0] "cterm=".a:attr "guibg=".a:bg[1] "guifg=".a:fg[1] "gui=".a:attr
endfunction

" Statusline Colors
call g:C("Reset",            g:none,         g:dark.black,     "none")
call g:C("Separator",        g:none,         g:dark.black,     "none")
call g:C("SeparatorLight",   g:none,         g:dark.brown,     "none")
call g:C("Body",             g:none,         g:dark.black,     "none")
call g:C("BodyLight",        g:dark.brown,   g:dark.black,     "none")
call g:C("Git",              g:dark.black,   g:dark.white,     "none")
call g:C("GitLight",         g:dark.brown,   g:light.red,      "none")
call g:C("NotModified",      g:dark.black,   g:dark.green,     "none")
call g:C("Modified",         g:dark.black,   g:light.red,      "none")
call g:C("LineCol",          g:dark.black,   g:dark.yellow,    "none")
call g:C("LinePerc",         g:dark.black,   g:dark.green,     "none")
call g:C("Filetype",         g:dark.black,   g:dark.magenta,   "italic")

" Tabline Colors
call g:C("TabLine",     g:none,   g:dark.magenta,  "none")
call g:C("TabLineSel",  g:none,   g:dark.blue,     "none")
call g:C("TabLineFill", g:none,   g:dark.yellow,     "none")

" Comment line italic
highlight Comment cterm=italic gui=italic

" Color depending on mode
function! RedrawColors(mode)
    " normal mode
    if a:mode ==# 'n'
        call g:C("Mode", g:dark.black,    g:dark.blue,      "none")
    " insert mode
    elseif a:mode ==# 'i'
        call g:C("Mode", g:dark.black,    g:dark.yellow,    "none")
    " replace mode
    elseif a:mode ==# 'R'
        call g:C("Mode", g:dark.black,    g:dark.red,       "none")
    " visual mode
    elseif a:mode ==# 'v' || a:mode ==# 'V' || a:mode ==# ''
        call g:C("Mode", g:dark.black,    g:dark.magenta,   "none")
    " command mode
    elseif a:mode ==# 'c'
        call g:C("Mode", g:dark.black,    g:dark.green,     "none")
    " terminal mode
    elseif a:mode ==# 't'
        call g:C("Mode", g:dark.black,    g:dark.red,       "none")
    endif
    " Return empty string so as not to display anything in the statusline
    return ''
endfunction

" Nice mode name
function! ModeName(mode)
 if a:mode ==# 'n'
   return 'NORMAL'
   " Insert mode
 elseif a:mode ==# 'i'
   return 'INSERT'
   " Replace mode
 elseif a:mode ==# 'R'
    return 'REPLACE'
  " Visual mode
  elseif a:mode ==# 'v'
    return 'VISUAL'
  elseif a:mode ==# 'V'
    return 'V-LINE'
  elseif a:mode ==# ''
    return 'V-BLOCK'
  " Command mode
  elseif a:mode ==# 'c'
    return 'COMMAND'
  " Terminal mode
  elseif a:mode ==# 't'
    return 'TERMINAL'
  endif
endfunction

" Git
function! GitBranch() abort
  if fugitive#head() !=# ''
    return fugitive#head()
  else
    return "\uf468"
  endif
endfunction

" Modification mark
function! SetModifiedSymbol(modified)
    if a:modified == 1
        hi Modified ctermbg=NONE cterm=NONE ctermfg=7
    else
        hi NotModified ctermbg=NONE cterm=bold ctermfg=7
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
" Statusbar
"=================
" Statusbar items
"=================
" this will not be displayed, but the function RedrawColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawColors(mode())}

"=================
" Left side items
"=================

" Git branch
set statusline+=%#SeparatorLight# 
set statusline+=%#GitLight#\\ 
set statusline+=%#Git#\ \%{GitBranch()}
set statusline+=%#Separator#

" Modified status
set statusline+=\ 

set statusline+=%#SeparatorLight# 
set statusline+=%#BodyLight#%{WebDevIconsGetFileTypeSymbol()}\  
set statusline+=%#Mode#\ \%t
set statusline+=%#Modified#\ \%{SetModifiedSymbol(&modified)}
set statusline+=%#Separator#


"==================
" Right side items
"==================
set statusline+=%=

" Padding
set statusline+=\ 

set statusline+=%#SeparatorLight#
set statusline+=%#BodyLight#%{LineNoIndicator()}\ 
set statusline+=%#LineCol#\ \%{LineInfo()}
set statusline+=%#Separator#

" Padding
set statusline+=\ 
" CoC Diagnostics
set statusline+=%#Separator#
set statusline+=%#LinePerc#%{CocDiagnostic()}
set statusline+=%#Separator#
