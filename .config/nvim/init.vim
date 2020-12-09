

"        ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"        ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"        ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"        ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"        ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"        ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝


" Main
" source ~/.config/nvim/st2.vim
" source ~/.config/nvim/s3.vim
source ~/.config/nvim/statusline.vim
" source ~/.config/nvim/plug-config/themer.vim

" Plagins
source ~/.config/nvim/plug-config/hooks.vim
source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/codi.vim
source ~/.config/nvim/plug-config/startify.vim
source ~/.config/nvim/plug-config/which-key.vim
source ~/.config/nvim/plug-config/floaterm.vim
source ~/.config/nvim/plug-config/goyo.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/conflict-marker.vim
source ~/.config/nvim/plug-config/rainbow.vim
source ~/.config/nvim/plug-config/indentline.vim
" source ~/.config/nvim/plug-config/test.vim
" source ~/.config/nvim/plug-config/notes.vim
" source ~/.config/nvim/plug-config/fzf-preview.vim
" source ~/.config/nvim/plug-config/vista.vim
" source ~/.config/nvim/plug-config/tmux.vim

"*****************************************************************************
""{{{  Plugin                                                                 
"*****************************************************************************

call plug#begin()

" Themes {{{
Plug 'Rigellute/rigel'
" Plug 'liuchengxu/space-vim-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'equt/paper.vim'
Plug 'romgrk/github-light.vim'

" }}}

" JavaScript {{{
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
    " autocmd BufWritePre *.md,*.mdx,*.ts,*.tsx,*.js,*.jsx execute ':Prettier'
    " endif
    " Plug 'pangloss/vim-javascript', { 'for':  'javascript' }
    " Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
    " Plug 'jparise/vim-graphql'
    " Plug 'gko/yats.vim', { 'for': 'typescript' }
    " Plug 'peitalin/vim-jsx-typescript'
    " Plug 'posva/vim-vue'
    " Plug 'jxnblk/vim-mdx-js'
" }}}

" JSX {{{
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascriptreact', 'typescriptreact'] }
" }}}

" Coc {{{
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'

"}}}

" FZF {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
" Plug 'benwainwright/fzf-switch-project'
"}}}

" Git {{{ 
if executable('git')
  " Plug 'airblade/vim-gitgutter'
  Plug 'stsewd/fzf-checkout.vim'
  " https://gist.github.com/voitd/60f606b02724dbb863ed09e7f5679b43
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  " A git blame plugin for (neo)vim inspired by VS Code's GitLens plugin.
  " Plug 'APZelos/blamer.nvim'
  " Git commit browser.
  Plug 'junegunn/gv.vim'
  " Merginal aims to provide a nice interface for dealing with Git branches. It offers interactive TUI :MerginalToggle
  " Plug 'idanarye/vim-merginal'
endif
" }}} 

" Zen mode {{{
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" }}} 

" UI {{{

" Pretty start screen
Plug 'mhinz/vim-startify'
" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Cool Icons
Plug 'ryanoasis/vim-devicons'
" Rainbow Parentheses Improved
Plug 'frazrepo/vim-rainbow'
" displaying thin vertical lines at each indentation level for code indented with spaces
Plug 'Yggdroot/indentLine'
" }}}

" Tmux {{{
" plugin for vim-tmux interactions
" Plug 'christoomey/vim-tmux-navigator'
" resizing windows
" Plug 'talek/obvious-resize'
" send lines to tmux pane repl
" Plug 'esamattis/slimux'

" }}}

" Tests {{{
" Plug 'kubejm/jest.nvim'
Plug 'vim-test/vim-test'
"Plug 'rcarriga/vim-ultest'
" }}}

" take screenshot from visual selection code
" Plug 'kristijanhusak/vim-carbon-now-sh'

" Terminal
Plug 'voldikss/vim-floaterm'

" Closetags
Plug 'alvan/vim-closetag'

"Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" Surround
Plug 'machakann/vim-sandwich'

" Auto commentary [gcc]
Plug 'tpope/vim-commentary'

" match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. It extends vim's % 
" Plug 'andymass/vim-matchup'

" Auto change html tags
Plug 'AndrewRadev/tagalong.vim'

" View and search LSP symbols, tags
" Plug 'liuchengxu/vista.vim'
" Live server
" Plug 'turbio/bracey.vim

" Highlight conflict markers.[x and ]x
" command ct for themselves, co for ourselves, cn for none and cb for both
Plug 'rhysd/conflict-marker.vim'

"Yank something that you want to console.log into your register and then run :Consolate
" Plug 'agarrharr/consolation-vim'

" Emmet snippets
Plug 'mattn/emmet-vim'

" Undo time travel
Plug 'mbbill/undotree'

" Rooter changes the working directory to the project root when you open a file or directory.
Plug 'airblade/vim-rooter'

" Interactive code (repl)
" Plug 'ChristianChiarulli/codi.vim'
Plug 'metakirby5/codi.vim'

" Motion | replaced by coc-smartf
Plug 'justinmk/vim-sneak'

" Smooth scroll
Plug 'yuttie/comfortable-motion.vim'

" Snippets
Plug 'dominikduda/vim_es7_javascript_react_snippets'
Plug 'joaohkfaria/vim-jest-snippets'

" ImportJS helps you import JavaScript dependencies. Hit a keyboard shortcut to automatically
" add import x from 'y' statements at the top of the file.
Plug 'Galooshi/vim-import-js'

" How long vim starts
Plug 'dstein64/vim-startuptime'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Highlight colors in buffer
Plug 'norcalli/nvim-colorizer.lua'



call plug#end()
"}}}
"*****************************************************************************

"*****************************************************************************
""{{{  Visual Settings                                                        
"*****************************************************************************

set termguicolors
" colorscheme github-light
colorscheme paper
" set background=light    
" source ~/.config/nvim/plug-config/st2.vim

" let g:time = strftime("%H")
" if  g:time > 08 && g:time < 17
"     set background=light    
" else
"     set background=dark
" endif

" colorscheme nord
" let g:nord_cursor_line_number_background = 1
" let g:nord_bold = 1
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1

 " colorscheme space_vim_theme
 " set background=light    
 " let g:space_vim_italic = 1
 " let g:space_vim_italicize_strings = 1
 " let g:space_vim_plugin_hi_groups = 1
 " let g:space_vim_filetype_hi_groups = 1
 " let g:space_vim_dark_background = 233
 " set statusline=%!ActiveLine() 


colorscheme rigel
let g:rigel_italic=1
let g:rigel_bold=1
source ~/.config/nvim/plug-config/statusline/rigel-line.vim

    " set termguicolors
    " colorscheme paper
    " set background=light    
    " set nocursorline
    " set statusline=%!ActiveLine() 

" Colors and styling
" hi! Comment gui=italic
" hi link SignColumn LineNr
hi! VertSplit guibg=NONE guifg=#001a24
" hi! MatchParen cterm=italic gui=italic 
" hi StatusLine guibg=NONE

" let g:time = strftime("%H")
" if  g:time > 08 && g:time < 17
"     set termguicolors
"     colorscheme paper
"     set background=light    
"     set statusline=%!ActiveLine() 
" else
"     " set background=dark
"     colorscheme rigel
"     let g:rigel_italic=1
"     let g:rigel_bold=1
"     source ~/.config/nvim/plug-config/statusline/rigel-line.vim
"   " hi Comment guifg=#5C6370
" endif

" Color Settings as transparent
" set background=dark cursorline termguicolors
" hi! Normal ctermbg=NONE guibg=#001a24
" hi! NonText ctermbg=NONE guibg=#001a24 guifg=NONE ctermfg=NONE


" if $TERMINAL == 'kitty'
"   let g:normal_fg = synIDattr(hlID('Normal'), 'fg')
"   let g:normal_bg = synIDattr(hlID('Normal'), 'bg')

"   silent call system('kitty @ set-colors  background=' . g:normal_bg . ' foreground=' . g:normal_fg . ' &')
" endif  

" let javaScript_fold=1 "activate folding by JS syntax
" vim-matchup
" if s:plug.is_installed('vim-matchup')
"   let g:loaded_matchit = 1
"   hi MatchParenCur cterm=underline gui=underline
"   hi MatchWordCur cterm=underline gui=underline
" endif
"}}}
"*****************************************************************************

"*****************************************************************************
""{{{  Basic Setup                                                            
"*****************************************************************************"
" This is recommended by coc
set hidden        
set noswapfile
set nobackup
set nowritebackup
            
" set spell spelllang=ru

" set autowrite

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

if executable('fish')
    " use fish for embedded terminals
    set shell=fish
    " use bash for else
    let $SHELL = 'bash'
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" syntax highlighting
" if !exists('g:syntax_on')
"   syntax enable
" endif


set nowrap                     " disable wrap and wrap when typing
set whichwrap+=<,>,[,],h,l
set scrolloff=5                " Display 5 lines above/below the cursor when scrolling with a mouse.
set matchpairs+=<:>
set history=9000               " increase the history limit of
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
set formatoptions=tcqronj

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

" Removes pipes | that act as seperators on splits
" set fillchars+=vert:|
set fillchars+=vert:\ 
set fillchars+=fold:\ 
" set fillchars+=diff:░ "alternatives: ⣿ ░
set fillchars+=diff:\ 

" show hidden charactors
" set list
set listchars=tab:∘\ ,nbsp:·,extends:❯,precedes:❮
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
"show hidden charactors
" setlocal foldmethod=marker
" set nofoldenable
" set foldmarker={{{,}}}
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Wild menu
" Wildmenu completion {{{
set wildmenu
set wildmode=longest:full,full "zsh-like autocomplete
" set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set wildoptions=pum
" set pumblend=30
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

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=' '

" let g:loaded_matchit = 1
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
let g:python3_host_prog = expand('/usr/local/bin/python3')
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
let g:undotree_DiffpanelHeight = 30
let g:undotree_SetFocusWhenToggle = 1

let g:importjs_disable_default_mappings = 1

" Vim fugitive settings
set diffopt+=vertical

" Find root
let g:rooter_patterns = ['.git/', 'package.json', 'composer.json']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir  = 1
let g:rooter_change_directory_for_non_project_files= 'current'

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"}}}
"*****************************************************************************

"*****************************************************************************
""{{{ Abbreviations                                                          
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev wq wq!
cnoreabbrev Wq wq!
cnoreabbrev Wa wa!
cnoreabbrev wQ wq!
cnoreabbrev WQ wq!
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
nnoremap <silent><A-Tab> :b#<CR>
nnoremap <silent><leader>bo :w<BAR>%bd<BAR>e#<BAR>bd#<CR>
nnoremap <silent><leader>bd :b#<BAR>bd#<CR>   
"
" Error moving
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
" navigate chunks of current buffer
nmap <silent> [g <Plug>(coc-git-prevchunk)
nmap <silent> ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap <silent> [c <Plug>(coc-git-prevconflict)
nmap <silent> ]c <Plug>(coc-git-nextconflict)
" Buffer moving
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR>
" Tabs moving
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
" Window moving
nnoremap <silent> [w <C-w>w
nnoremap <silent> ]w <C-w>W

" list buffers
set wildcharm=<C-s>
nnoremap <Tab><Tab> :buffer <C-s><S-Tab>

nnoremap <silent><leader><leader> :CocCommand explorer --position floating --floating-position right-center --floating-width 50<CR>
" fzf.vim mappings
" nnoremap <silent><C-f> :Files<CR>
nnoremap <silent><C-p> :call FzfOmniFiles()<CR>

" Smooth Scrolling
" nnoremap <silent> <C-d> :call comfortable_motion#flick(125)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-125)<CR>
" ScrollWheel smooth scroll
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

nmap <silent><F2> <Plug>(coc-rename)
nmap <silent><BS> <C-^>

" Better window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <C-s> :noa w<CR>

" Remap arrows to resize
nnoremap <A-Up>    :resize +2<CR>
nnoremap <A-Down>  :resize -2<CR>
nnoremap <A-Left>  :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Normal mode indent with only one keypress
nmap > >>
nmap < <<

" j/k will move virtual lines (lines that wrap)
" nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
" xnoremap <expr> j (v:count == 0 && mode() !=# 'V') ? 'gj' : 'j'
" nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
" xnoremap <expr> k (v:count == 0 && mode() !=# 'V') ? 'gk' : 'k'


" Stops regression to arrow keys, encourages learning of advanced motion keys
nnoremap <Left> :echo "Use [h] for left"<CR>
nnoremap <Right> :echo "Use [l] for right"<CR>
nnoremap <Up> :echo "Use [k] for up"<CR>
nnoremap <Down> :echo "Use [j] for down"<CR>

inoremap <Left> <C-o>:echo "Use [h] for left in NORMAL mode"<CR>
inoremap <Right> <C-o>:echo "Use [l] for right in NORMAL mode"<CR>
inoremap <Up> <C-o>:echo "Use [k] for up in NORMAL mode"<CR>
inoremap <Down> <C-o>:echo "Use [j] for down in NORMAL mode"<CR>

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

" Better nav for omnicomplete TODO figure out why this is being overridden
 " Autocomplete navigation
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep the cursor in place while joining lines
nnoremap J mZJ`ZmZ
" split lines: inverse of J
nnoremap <silent> K ylpr<Enter>

" Clear search highlighting with Escape key
" nnoremap <silent><Esc> :noh<CR>:redraw!<CR><Esc>

" paste over a selection, keep the unnamed register untouched and jump to the end of the pasted text
xnoremap <expr> p 'pgv"' . v:register . 'y`]'

" Don't copy single letter deletes
nnoremap x "_x

" non-saving delete
noremap X "_d

" Repeat command for each line in selection
vnoremap . :normal .<CR>
" @: repeats macro on every line
xnoremap @ :normal@

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
nnoremap * *zz
nnoremap # #zz

nnoremap <silent><expr> <Esc> (
            \   exists('b:esc') ? b:esc
            \ : ':nohl<CR>' )

imap jj <Esc>`^
imap kk <Esc>`^
imap jk <Esc>`^
imap kj <Esc>`^
" imap <Esc><Esc> <Esc>`^

" ¯\_(ツ)_/¯
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>

map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

tnoremap <Esc><Esc>  <C-\><C-n>:FloatermHide<CR>

nnoremap <leader>cl :Consolate<cr>
nnoremap <leader>ap :TurboConsoleLog<cr>


" Quick fold and unfold
map _ zM
map + zR
" nnoremap <silent>zz :normal!za<cr>
" Fold code open/close with click
nmap <expr> <2-LeftMouse> 'za'

" nmap <F1> :SwitchColors <C-s><S-Tab>
" nnoremap <F3> :SyntaxInfo
" nnoremap <silent><F4> :SourceThis<CR>

" Surround line with { and }
nnoremap  g{   m`o}<esc><lt><lt>kkA<Space>{<esc>``

nnoremap <leader>ar :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Open file in a tab
noremap <Leader>ot :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Open file cur path
noremap <leader>of :e <C-R>=expand("%:p:h") . "/" <CR>

nmap <silent> <C-j> :FloatermNew --height=0.3 --wintype=normal --position=bottom <CR>
nmap <silent> <C-l> :FloatermNew --width=0.4 --wintype=normal --position=right <CR>


nm <silent> <Leader>js :call CocAction('jumpDefinition','vsplit')<CR>
nm <silent> <Leader>jsh :call CocAction('jumpDefinition','split')<CR>


"}}}
"*****************************************************************************

" vim: fdm=marker

