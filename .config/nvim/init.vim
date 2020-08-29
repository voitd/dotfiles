                                                
                                                
"        ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"        ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"        ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"        ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"        ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"        ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                

source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/hooks.vim
source ~/.config/nvim/plug-config/themer.vim
source ~/.config/nvim/plug-config/conflict-marker.vim
source ~/.config/nvim/plug-config/statusline/rigel-line.vim

"*****************************************************************************
"" Plugins
"*****************************************************************************

call plug#begin()

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}  
source ~/.config/nvim/plug-config/coc.vim
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
source ~/.config/nvim/plug-config/fzf.vim


" Pretty start screen
Plug 'mhinz/vim-startify'
source ~/.config/nvim/plug-config/startify.vim

" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } 
source ~/.config/nvim/plug-config/which-key.vim

" Terminal
Plug 'voldikss/vim-floaterm'
source ~/.config/nvim/plug-config/floaterm.vim

" Zen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
source ~/.config/nvim/plug-config/goyo.vim

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Highlight conflict markers.[x and ]x
" command ct for themselves, co for ourselves, cn for none and cb for both
Plug 'rhysd/conflict-marker.vim'

"Yank something that you want to console.log into your register and then run :Consolate
Plug 'agarrharr/consolation-vim' 

" Git commit browser.
Plug 'junegunn/gv.vim' 

" Emmet snippets
Plug 'mattn/emmet-vim'

" Undo time travel
Plug 'mbbill/undotree'

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
"Plug 'dstein64/vim-startuptime'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

Plug 'Galooshi/vim-import-js'

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

call plug#end()

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

" colorscheme my

" colorscheme gruvbox-material   

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_sign_column = "bg0"
" let g:gruvbox_invert_selection='0'
" set background=light

colorscheme rigel
let g:rigel_italic=1
let g:rigel_bold=1
let g:javascript_plugin_flow = 1

" Colors and styling
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

" let g:time = strftime("%H")  
" if  g:time > 08 && g:time < 18
"   set background=light
"   source ~/.config/nvim/plug-config/statusline/gruvbox-light.vim
" else
"   set background=dark
"   source ~/.config/nvim/plug-config/statusline/gruvbox-dark-line.vim
" endif
 
" Color Settings as transparent
" set background=dark cursorline termguicolors
" hi! Normal ctermbg=NONE guibg=#001a24 
" hi! NonText ctermbg=NONE guibg=#001a24 guifg=NONE ctermfg=NONE 

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set noswapfile
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use system clipboard
set clipboard+=unnamedplus " use system clipboard

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
  set fileencoding=utf-8
catch
endtry

" set 256 color
set t_Co=256
" set terminal gui colors
if (has("termguicolors"))
 set termguicolors
endif
" Highlight cursor line
set cursorline
" syntax highlighting
if !exists('g:syntax_on')
    syntax enable
endif


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
set shortmess+=c
set shortmess-=S
set cmdheight=2

" By default timeoutlen is 1000 ms
set timeoutlen=400
set ttimeoutlen=0
set matchtime=1

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" Remove tildas on end of buffer
let &fcs='eob: ' 
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 
set fillchars+=fold:\ 
set fillchars+=diff: "alternatives: ⣿ ░



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
"---------Map key--------------------------------------------------------------


"*****************************************************************************
"" Abbreviations
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

"*****************************************************************************
"" Mappings
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
" nnoremap <silent><leader>bo :w <bar> %bd <bar> e# <bar> bd# <CR> " Only one buffer  
" list buffers
set wildcharm=<C-s>
nnoremap <leader>bl :buffer <C-s><S-Tab>
nnoremap <leader>bL :sbuffer <C-s><S-Tab>

" fzf.vim mappings
nnoremap <silent><C-p> :Files<CR>

" Smooth Scrolling
nnoremap <silent> <C-d> :call comfortable_motion#flick(125)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-125)<CR>
" ScrollWheel smooth scroll
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

nmap <silent><F2> <Plug>(coc-rename)
nmap <F1> :SwitchColors <C-s><S-Tab>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap B ^
noremap E $
noremap <C-a> ^
noremap <C-e> $

"Move to beginning of a line in insert mode
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" nmap s <Nop>
" xmap s <Nop>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Normal mode indent with only one keypress
nmap > >>
nmap < <<

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Move visual block 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" paste over a selection, keep the unnamed register untouched and jump to the end of the pasted text
xnoremap <expr> p 'pgv"' . v:register . 'y`]'

" Repeat command for each line in selection
vnoremap . :normal .<CR>

" auto close
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` `` <left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" nnoremap n nzzzv
" nnoremap N Nzzzv

nnoremap n :<BS>nzzzv
nnoremap N :<BS>Nzzzv

nmap uu u
imap jj <Esc>

map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
vnoremap <A-/> :Commentary<CR>
nnoremap <A-/> :Commentary<CR>
  

tnoremap <leader>tt  <C-\><C-n>:FloatermToggle<CR>
tnoremap <Esc><Esc>  <C-\><C-n>:FloatermHide<CR>

nnoremap <leader>cl :Consolate<cr>
nnoremap <leader>ap :TurboConsoleLog<cr>


xmap <silent> <leader>aa :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>aa :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@


" Multiple cursor
" xmap <silent> <C-c> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
" nmap <expr> <silent> <C-c> <SID>select_current_word()

" Run code
nnoremap <silent> <F5> :call <SID>run_this_script(0)<cr>
nnoremap <silent> <F6> :call <SID>run_this_script(1)<cr>

" Visual star
" vnoremap * "sy/<c-r>s<CR>

" Quick fold and unfold
nnoremap <silent>zz :normal!za<cr>
