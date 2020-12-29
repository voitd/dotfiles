local execute = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require("packer").startup(
  {
    function()
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}

      use "nvim-lua/plenary.nvim"

      use {
        "neovim/nvim-lspconfig",
        -- config = function()
        --   require "plugins/_lsp"
        -- end
      }

      -- -- completion engine
      -- use {
      --   "nvim-lua/completion-nvim",
      --   config = function()
      --     require "plugin/_completions"
      --   end,
      --   requires = {
      --     "steelsojka/completion-buffers",
      --     {
      --       "SirVer/ultisnips",
      --       config = function()
      --         require "config/ultisnips"
      --       end
      --     },
      --     "honza/vim-snippets",
      --     "hrsh7th/vim-vsnip",
      --     "hrsh7th/vim-vsnip-integ"
      --   }
      -- }

      -- use {
      --   "nvim-treesitter/nvim-treesitter",
      --   run = function()
      --     vim.cmd [[TSInstall all]]
      --   end,
      --   config = function()
      --     require "plugins/_tsitter"
      --   end
      -- }
      -- lsp status wrapper
      -- use {"nvim-lua/lsp-status.nvim", disable = true}

      -- use "p00f/nvim-ts-rainbow"

      use "tweekmonster/startuptime.vim" -- benchmark startup
      use "oberblastmeister/rooter.nvim"

      -- Git
      use "tpope/vim-fugitive"
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
      use "tpope/vim-commentary" -- comments like gcc
      use "machakann/vim-sandwich" -- Change surrounding arks
      use "cohama/lexima.vim" -- Auto close parentheses and repeat by dot dot dot...
      use "alvan/vim-closetag"
      use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
      use "AndrewRadev/tagalong.vim" -- Auto change html tags
      use "mhartington/formatter.nvim"
      use "metakirby5/codi.vim"
      use "voldikss/vim-floaterm"
      use "whatyouhide/vim-lengthmatters"
      use "norcalli/nvim-colorizer.lua"
      use "mattn/emmet-vim"

      use {"neoclide/coc.nvim", branch = "release"}
      use "antoinemadec/coc-fzf" -- coc and fzf together

      -- Fzf
      -- use { 'nvim-telescope/telescope.nvim', opt = true, requires = { {'nvim-lua/popup.nvim', opt = true}, {'nvim-lua/plenary.nvim', opt = true} } }
      use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      use "junegunn/fzf.vim"
      use "gfanto/fzf-lsp.nvim"

      use "janko/vim-test"

      -- use {
      --   "janko/vim-test",
      --   cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"},
      --   config = function()
      --     vim.cmd [[let test#strategy = "floaterm"]]
      --   end
      -- }
      use "rcarriga/vim-ultest" -- pretty test output

      use "Galooshi/vim-import-js"

      -- use "dsznajder/vscode-es7-javascript-react-snippets"
      -- use "coco-platform/vscode-jest-snippets"
      -- use "hrsh7th/vim-vsnip-integ"
      -- use "hrsh7th/vim-vsnip"
      -- use "SirVer/ultisnips"
      use "dominikduda/vim_es7_javascript_react_snippets"
      -- use "joaohkfaria/vim-jest-snippets"

      use 'relastle/vim-colorrange'
      -- use "christianchiarulli/nvcode-color-schemes.vim"
      use 'arcticicestudio/nord-vim'
      use "kyazdani42/nvim-web-devicons"
      use "ryanoasis/vim-devicons"
      use "sheerun/vim-polyglot"
      -- use "Rigellute/rigel"
      use "equt/paper.vim"
      use "romgrk/github-light.vim"

      use "romgrk/barbar.nvim"

      use {"glepnir/galaxyline.nvim", branch = "main"}
      -- use "kyazdani42/nvim-tree.lua"
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
