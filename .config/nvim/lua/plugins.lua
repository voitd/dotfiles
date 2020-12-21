local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require("packer").startup(
  {
    function()
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}

      use "nvim-lua/plenary.nvim" -- float window

      use {"neoclide/coc.nvim", branch = "release"}
      use "antoinemadec/coc-fzf"

      use "tweekmonster/startuptime.vim" -- benchmark startup
      use "oberblastmeister/rooter.nvim"

      -- Git
      use "stsewd/fzf-checkout.vim"
      use "tpope/vim-rhubarb"
      use "rhysd/conflict-marker.vim" -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
      use "lewis6991/gitsigns.nvim"
      use "f-person/git-blame.nvim"

      -- Misk
      use "AndrewRadev/splitjoin.vim" -- allows to split one liner to multi lines
      use "mhinz/vim-startify" -- start screen
      use "mbbill/undotree" -- undo tree
      use "justinmk/vim-sneak"
      use {"tpope/vim-commentary", keys = {"gcc"}} -- comments like gcc
      use "machakann/vim-sandwich" -- Change surrounding arks
      use "cohama/lexima.vim" -- Auto close parentheses and repeat by dot dot dot...
      use "alvan/vim-closetag"
      use "AndrewRadev/tagalong.vim" -- Auto change html tags
      use "mhartington/formatter.nvim"
      use "metakirby5/codi.vim"
      use "voldikss/vim-floaterm"
      use "whatyouhide/vim-lengthmatters"
      use "norcalli/nvim-colorizer.lua"
      use "mattn/emmet-vim"
      -- use "rrethy/vim-illuminate" -- highlight matching words when cursor on it

      -- Fzf
      -- use { 'nvim-telescope/telescope.nvim', opt = true, requires = { {'nvim-lua/popup.nvim', opt = true}, {'nvim-lua/plenary.nvim', opt = true} } }
      use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      use "junegunn/fzf.vim"
      use "gfanto/fzf-lsp.nvim"

      use "vim-test/vim-test" -- test
      use "rcarriga/vim-ultest" -- pretty test output

      use "Galooshi/vim-import-js"

      use "joaohkfaria/vim-jest-snippets"
      use "dominikduda/vim_es7_javascript_react_snippets"

      -- Theme
      use "christianchiarulli/nvcode-color-schemes.vim"
      use "Rigellute/rigel"
      use "equt/paper.vim"
      use "romgrk/github-light.vim"
      -- use "arcticicestudio/nord-vim"
      -- use 'sainnhe/gruvbox-material'
      -- use 'adrian5/oceanic-next-vim'
      use "kyazdani42/nvim-web-devicons"
      use "ryanoasis/vim-devicons"
      use "sheerun/vim-polyglot"

      use "romgrk/barbar.nvim"

      use {"glepnir/galaxyline.nvim", branch = "main"}
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
