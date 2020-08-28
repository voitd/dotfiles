
" -- General -------------------------------------------------------------------
set noswapfile


" Colors and styling
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

syntax sync fromstart
set redrawtime=10000

set wildmenu

" Use system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endi

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

set ttyfast
" Enable mouse use in all modes
:set mouse=a


set encoding=UTF-8
" set 256 color
set t_Co=256
" set terminal gui colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Highlight cursor line
set cursorline
" syntax highlighting
syntax on
" allow hidden window
set hidden
" disable wrap and wrap when typing
set nowrap
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Highlight matching pairs of brackets. Use the '%' character to jump between pairs
set matchpairs+=<:>
" Set to auto read when a file is changed from the outside
set autoread
" increase the history limit of
set history=1000
" show buffer line
set showtabline=2
" disable mode display since lightline display
set noshowmode
" Fixes common backspace problems
set backspace=indent,eol,start

" line numbers
set number
set relativenumber
" indentation
set autoindent
set nostartofline
" No annoying sound on errors
set noerrorbells
set novisualbell

" Mode Settings for different cursor in different modes
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" search config
set ignorecase
set smartcase
set incsearch
set hlsearch

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set textwidth=0
set formatoptions-=t


" auto commands
augroup FormatFile
  autocmd!
  " disable vim stupid format issue with comment
  autocmd!
  " disable vim stupid format issue with comment
  " disable vim stupid format issue with comment
  autocmd BufEnter * set fo-=c fo-=r fo-=o
augroup end



let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

" coc diagnostic highlight
hi CocErrorHighlight gui=bold guifg=#e06c75
hi CocWarningHighlight gui=NONE guifg=#e5c07b
" overwrite default vim diff highlight
hi DiffChange gui=NONE guifg=#2b2c34 guibg=#e5c07b
hi DiffText gui=NONE guifg=#2b2c34 guibg=#de9712

" vim autoclose tag config
" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript': 'jsxRegion,tsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
