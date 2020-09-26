

"        ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"        ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"        ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"        ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"        ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"        ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝


" Main
" source ~/.config/nvim/s3.vim
" source ~/.config/nvim/st2.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/plug-config/hooks.vim
source ~/.config/nvim/plug-config/themer.vim

" Plagins
source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/startify.vim
source ~/.config/nvim/plug-config/which-key.vim
source ~/.config/nvim/plug-config/floaterm.vim
source ~/.config/nvim/plug-config/goyo.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/conflict-marker.vim

"*****************************************************************************
""{{{  Plugin
"*****************************************************************************

call plug#begin()

" JavaScript {{{
    " Plug 'pangloss/vim-javascript', { 'for':  'javascript' }
    " if executable('npm')
    "     Plug 'prettier/vim-prettier', {
    "                 \ 'do': 'npm install',
    "                 \ 'for': [
    "                 \ 'javascript',
    "                 \ 'html',
    "                 \ 'typescript',
    "                 \ 'css',
    "                 \ 'less',
    "                 \ 'scss',
    "                 \ 'json',
    "                 \ 'graphql',
    "                 \ 'markdown',
    "                 \ 'vue',
    "                 \ 'yaml'
    "                 \ ] }
    " endif
    " Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
    " Plug 'jparise/vim-graphql'
" }}}

" JSX {{{
    Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'typescript', 'typescriptreact'] }
" }}}

" Intellisense {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
"}}}

" FZF {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
" Plug 'benwainwright/fzf-switch-project'
"}}}

" Pretty start screen
Plug 'mhinz/vim-startify'

" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Terminal
Plug 'voldikss/vim-floaterm'

" Zen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Closetags
Plug 'alvan/vim-closetag'

"Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" Surround
Plug 'machakann/vim-sandwich'

" Auto commentary [gcc]
Plug 'tpope/vim-commentary'

" Auto change html tags
Plug 'AndrewRadev/tagalong.vim'

" Git
" Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'
" https://gist.github.com/voitd/60f606b02724dbb863ed09e7f5679b43
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Git commit browser.
Plug 'junegunn/gv.vim'

" Highlight conflict markers.[x and ]x
" command ct for themselves, co for ourselves, cn for none and cb for both
Plug 'rhysd/conflict-marker.vim'

"Yank something that you want to console.log into your register and then run :Consolate
Plug 'agarrharr/consolation-vim'


" Emmet snippets
Plug 'mattn/emmet-vim'

" Undo time travel
Plug 'mbbill/undotree'

" Rooter changes the working directory to the project root when you open a file or directory.
Plug 'airblade/vim-rooter'

" Interactive code (repl)
Plug 'ChristianChiarulli/codi.vim'

" Motion | replaced by coc-smartf
Plug 'justinmk/vim-sneak'

" Smooth scroll
Plug 'yuttie/comfortable-motion.vim'

" Snippets
Plug 'dominikduda/vim_es7_javascript_react_snippets'
" Plug 'mlaursen/vim-react-snippet'
" Plug 'jsit/vim-vscode-react-snippets'

" ImportJS helps you import JavaScript dependencies. Hit a keyboard shortcut to automatically
" add import x from 'y' statements at the top of the file.
Plug 'Galooshi/vim-import-js'

" How long vim starts
Plug 'dstein64/vim-startuptime'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Cool Icons
Plug 'ryanoasis/vim-devicons'

" Highlight colors in buffer
Plug 'norcalli/nvim-colorizer.lua'

" Themes
Plug 'Rigellute/rigel'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'cormacrelf/vim-colors-github'
Plug 'vincowl/doom-theme'
call plug#end()

"}}}
"*****************************************************************************

"*****************************************************************************
""{{{  Visual Settings
"*****************************************************************************

" colorscheme github
" set background=light    

" colorscheme low-contrast

" colorscheme gruvbox-material

syntax on
set termguicolors
" colorscheme gruvbox
" let g:gruvbox_sign_column = "bg0"
" let g:gruvbox_invert_selection='0'
" let g:xcodelight_emph_funcs = 1
" let g:xcodedark_emph_funcs = 1
" let g:github_colors_soft = 1
" let g:github_colors_extra_functions = 0

colorscheme rigel
let g:rigel_italic=1
let g:rigel_bold=1
source ~/.config/nvim/plug-config/statusline/rigel-line.vim

" Colors and styling
hi! Comment gui=italic
hi! link SignColumn LineNr
hi VertSplit guibg=NONE guifg=NONE


let g:time = strftime("%H")
if  g:time > 08 && g:time < 18
  colorscheme space_vim_theme
  " colorscheme xcodelight
  set background=light    
  " let g:gruvbox_contrast_light = "hard"
  " source ~/.config/nvim/plug-config/statusline/gruvbox-light.vim
else
  " colorscheme doom-one
  " colorscheme xcodedark
  " set background=dark
  " colorscheme palenight
  " let g:palenight_terminal_italics=1
  " let g:gruvbox_contrast_dark = "hard"
  " source ~/.config/nvim/plug-config/statusline/gruvbox-dark-line.vim
endif

" Color Settings as transparent
" set background=dark cursorline termguicolors
" hi! Normal ctermbg=NONE guibg=#001a24
" hi! NonText ctermbg=NONE guibg=#001a24 guifg=NONE ctermfg=NONE


if $TERMINAL == 'kitty'
  let g:normal_fg = synIDattr(hlID('Normal'), 'fg')
  let g:normal_bg = synIDattr(hlID('Normal'), 'bg')

  silent call system('kitty @ set-colors  background=' . g:normal_bg . ' foreground=' . g:normal_fg . ' &')
endif  


"}}}
"*****************************************************************************

"*****************************************************************************
""{{{  Basic Setup
"*****************************************************************************"
set noswapfile
set nobackup
set nowritebackup
" set spell spelllang=ru

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use system clipboard
set clipboard+=unnamed " use system clipboard

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/.undodir

set lazyredraw ttyfast
" Enable mouse use in all modes
set mouse=a
set mousemodel=popup

set encoding=UTF-8
" hack to work around vim-plug auto install harmless error
" due to `source $MYVIMRC | q` in SetupPlug()
" 'Cannot make changes, 'modifiable' is off: fileencoding=utf-8'
try
  set fileencoding=utf-8 scriptencoding utf-8
catch
endtry

" Allow use of `gf` for relative imports in JS.
set suffixesadd+=.js

" set 256 color
set t_Co=256

" set terminal gui colors
if (has("termguicolors"))
 set termguicolors
endif

" Highlight cursor line
set cursorline

" syntax highlighting
" if !exists('g:syntax_on')
"   syntax enable
" endif


set hidden                     " allow hidden window
set nowrap                     " disable wrap and wrap when typing
set scrolloff=5                " Display 5 lines above/below the cursor when scrolling with a mouse.
set matchpairs+=<:>
set history=1000               " increase the history limit of
" set showtabline=2            " show buffer line
set noshowmode                 " disable mode display since lightline display
set noshowcmd

set backspace=indent,eol,start " Fixes common backspace problems
set number                     " line numbers
set relativenumber
set autoindent                 " indentation
set nostartofline
set noerrorbells               " No annoying sound on errors
set novisualbell
set laststatus=2


" searching
set hlsearch            " highlight all text matching current search pattern
set incsearch           " show search matches as you type
set ignorecase          " ignore case on search
set smartcase           " case sensitive when search includes uppercase
set noshowmatch           " highlight matching [{()}]
set splitbelow          " open new splits on the bottom
set splitright          " open new splits on the right"
set inccommand=nosplit  " show search and replace in real time
set autoread            " reread a file if it's changed outside of vim
set wrapscan            " begin search from top of the file when nothng is found
set cpoptions+=x        " stay at seach item when <esc>

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set textwidth=0
set formatoptions-=t

" Better display for messages
set shortmess+=A        " ignore annoying swapfile messages"
set shortmess+=I        " no splash screen"
set shortmess+=O        " file-read message overwrites previous"
set shortmess+=T        " truncate non-file messages in middle"
set shortmess+=W        " don't echo "[w]"/"[written]" when writing"
set shortmess+=a        " use abbreviations in messages eg. `[RO]` instead of `[readonly]`"
set shortmess+=o        " overwrite file-written messages"
set shortmess+=t        " truncate file messages at start"
set shortmess+=c
set shortmess+=F
set shortmess-=S
set cmdheight=1

" By default timeoutlen is 1000 ms
set timeoutlen=400
set ttimeoutlen=0
set matchtime=1

" Wild menu
" setlocal foldmethod=marker
" set nofoldenable

" Wildmenu completion {{{
set wildmenu
set wildmode=longest:full,full "zsh-like autocomplete
set wildoptions=pum
set pumblend=30
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
set wildignore+=*/node_modules/*,*/vendor/*

 "}}}

"}}}
"*****************************************************************************

"*****************************************************************************
""{{{ Custom configs
"*****************************************************************************

" Remove tildas on end of buffer
let &fcs='eob: '
let &t_ut=''
" Removes pipes | that act as seperators on splits
" set fillchars+=vert:|
set fillchars+=vert:\ 
set fillchars+=fold:\ 
set fillchars+=diff:░ "alternatives: ⣿ ░

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

let g:python_host_prog  = expand('/usr/bin/python' )
let g:python3_host_prog = expand('/usr/local/bin/python3.8')
let g:loaded_python3_provider = 1

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
let g:undotree_TreeNodeShape = '◉'
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1

let g:importjs_disable_default_mappings = 1

" Vim fugitive settings
set diffopt+=vertical

" Find root
let g:rooter_patterns = ['.git/', 'package.json', 'composer.json']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir  = 1

"}}}
"*****************************************************************************

"*****************************************************************************
""{{{ Abbreviations
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" remap cyrrilic symbols {{{
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]

map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '

map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }

map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "

map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
"}}}

cabbrev qa qa!
cabbrev q q!

cabbrev E e

cabbrev ц w
cabbrev й q!
cabbrev й!! q!
cabbrev цй wq

cabbrev Ц w
cabbrev Й q!

"}}}
"*****************************************************************************

"*****************************************************************************
"" {{{ Mappings
"*****************************************************************************
" let mapleader = ","
" let localleader=" "

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nnoremap <Space> <Nop>
nnoremap <silent><leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent><leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" switch buffer
nnoremap <silent><S-right> :bn<CR>
nnoremap <silent><S-left> :bp<CR>
nnoremap <silent><S-Tab> :b#<CR>
nnoremap <silent><leader>bo :w <bar> %bd <bar> e# <bar> bd# <CR> "Only one buffer

" list buffers
set wildcharm=<C-s>
nnoremap <Tab><Tab> :buffer <C-s><S-Tab>

" fzf.vim mappings
nnoremap <silent><C-p> :Files<CR>
" nnoremap <C-f> :FzfChooseProjectFile<CR>
" nnoremap <leader><Tab> :FzfSwitchProject<CR>

" Smooth Scrolling
nnoremap <silent> <C-d> :call comfortable_motion#flick(125)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-125)<CR>
" ScrollWheel smooth scroll
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

nmap <silent><F2> <Plug>(coc-rename)

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Normal mode indent with only one keypress
nmap > >>
nmap < <<

" Fixed I/A for visual
xnoremap <expr> I mode() ==# 'v' ? "\<c-v>I" : mode() ==# 'V' ? "\<c-v>^o^I" : "I"
xnoremap <expr> A mode() ==# 'v' ? "\<c-v>A" : mode() ==# 'V' ? "\<c-v>Oo$A" : "A

" make movement and operations behave “as you would expect”, or just generally more useful.
noremap <expr> G &wrap ? "G$g0" : "G"
noremap <expr> 0 &wrap ? 'g0' : '0'
noremap <expr> $ &wrap ? "g$" : "$"

" j/k will move virtual lines (lines that wrap)
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j (v:count == 0 && mode() !=# 'V') ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k (v:count == 0 && mode() !=# 'V') ? 'gk' : 'k'

" Stops regression to arrow keys, encourages learning of advanced motion keys
nnoremap <Left> :echo "Use [h] for left"<CR>
nnoremap <Right> :echo "Use [l] for right"<CR>
nnoremap <Up> :echo "Use [k] for up"<CR>
nnoremap <Down> :echo "Use [j] for down"<CR>

inoremap <Left> <C-o>:echo "Use [h] for left in NORMAL mode"<CR>
inoremap <Right> <C-o>:echo "Use [l] for right in NORMAL mode"<CR>
inoremap <Up> <C-o>:echo "Use [k] for up in NORMAL mode"<CR>
inoremap <Down> <C-o>:echo "Use [j] for down in NORMAL mode"<CR>
inoremap <Esc> <Nop>
inoremap <esc> <nop>

vnoremap <Left> <Esc>:echo "Use [h] for left"<CR>
vnoremap <Right> <Esc>:echo "Use [l] for right"<CR>
vnoremap <Up> <Esc>:echo "Use [k] for up"<CR>
vnoremap <Down> <Esc>:echo "Use [j] for down"<CR>

" " Navigate the complete menu items like CTRL+n / CTRL+p would.
" inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
" inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" " Select the complete menu item like CTRL+y would.
" inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
" inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" " Cancel the complete menu item like CTRL+e would.
" inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlighting with Escape key
nnoremap <silent><Esc> :noh<CR>:redraw!<CR><Esc>

" paste over a selection, keep the unnamed register untouched and jump to the end of the pasted text
xnoremap <expr> p 'pgv"' . v:register . 'y`]'

" Don't copy single letter deletes
nnoremap x "_x

" non-saving delete
noremap X "_d

" Repeat command for each line in selection
vnoremap . :normal .<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n :<BS>nzzzv
nnoremap N :<BS>Nzzzv

" Center screen after common jumps.
" Warning: This might make you mad, but makes my happy. I'm so selfish.
nnoremap } }zz
nnoremap { {zz
nnoremap zj zjzz
nnoremap zk zkzz


nmap uu u
imap jj <Esc>`^
imap jk <Esc>`^
imap kj <Esc>`^
" inoremap <Esc> <Esc>`^

" an empty split relative to current
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>


" ¯\_(ツ)_/¯
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>

map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
vnoremap <A-/> :Commentary<CR>
nnoremap <A-/> :Commentary<CR>


" tnoremap <leader>tt  <C-\><C-n>:FloatermToggle<CR>
tnoremap <Esc><Esc>  <C-\><C-n>:FloatermHide<CR>

nnoremap <leader>cl :Consolate<cr>
nnoremap <leader>ap :TurboConsoleLog<cr>


xmap <silent> <RightMouse> :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
xmap <silent> <leader>aa :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>

" Quick fold and unfold
nnoremap <silent>zz :normal!za<cr>
" Fold code open/close with click
nmap <expr> <2-LeftMouse> 'zz'

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nmap <F1> :SwitchColors <C-s><S-Tab>
nnoremap <F3> :SyntaxInfo
nnoremap <silent><F4> :SourceThis<CR>

"}}}
"*****************************************************************************

" vim: fdm=marker


