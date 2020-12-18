
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'agarrharr/consolation-vim' "Yank something that you want to console.log into your register and then run
Plug 'justinmk/vim-sneak'
Plug 'ChristianChiarulli/codi.vim'

" Add some color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs' " auto close brackets and quotes
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'liuchengxu/vista.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'chaoren/vim-wordmotion'

" status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sainnhe/lightline_foobar.vim'



Plug 'dominikduda/vim_es7_javascript_react_snippets'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'dsummersl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'pechorin/any-jump.vim'
Plug 'andymass/vim-matchup'

Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()
