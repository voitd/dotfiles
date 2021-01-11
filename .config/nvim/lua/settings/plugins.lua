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

      -- LSP
      use "nvim-lua/plenary.nvim"
      use "neovim/nvim-lspconfig"
      -- use {
      --   "neovim/nvim-lspconfig",
      --   {
      --     "nvim-lua/completion-nvim",
      --     event = "InsertEnter *",
      --     config = function()
      --       local completion = require("completion")

      --       cmd [[ augroup lsp_aucmds 
      --        au BufEnter * lua require('completion').on_attach() 
      --        augroup END ]]

      --       completion.on_attach()
      --       cmd [[ doautoall FileType ]]
      --     end,
      --     requires = {
      --       {"hrsh7th/vim-vsnip", event = "InsertEnter *"},
      --       {"hrsh7th/vim-vsnip-integ", event = "InsertEnter *"}
      --     }
      --   },
      --   {"nvim-treesitter/completion-treesitter", opt = true},
      --   {"steelsojka/completion-buffers", opt = true},
      --   {"aca/completion-tabnine", run = "./install.sh", opt = true},
      --   {"nvim-treesitter/nvim-treesitter", config = "require('plugins._tsitter')"}
      -- }

      -- use 'nvim-lua/completion-nvim'

      -- use "tsuyoshicho/vim-efm-langserver-settings"

      -- Git
      use "tpope/vim-fugitive"
      use "stsewd/fzf-checkout.vim"
      use "tpope/vim-rhubarb"
      use "rhysd/conflict-marker.vim" -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
      use "lewis6991/gitsigns.nvim"
      use "f-person/git-blame.nvim"

      -- Misk
      use "tweekmonster/startuptime.vim" -- benchmark startup
      use "oberblastmeister/rooter.nvim" -- root dir switcher
      use "romgrk/searchReplace.vim" -- search for a pattern across multiple files
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
      use "mattn/emmet-vim"
      use "skamsie/vim-lineletters"
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}
      use 'knubie/vim-kitty-navigator'

      --Coc
      use {"neoclide/coc.nvim", branch = "release"}
      use "antoinemadec/coc-fzf" -- coc and fzf together

      -- Fzf
      use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      use "junegunn/fzf.vim"
      use "gfanto/fzf-lsp.nvim"

      --Test
      use "janko/vim-test"
      use "rcarriga/vim-ultest" -- pretty test output

      -- JavaScript
      use "Galooshi/vim-import-js"
      use "dominikduda/vim_es7_javascript_react_snippets"

      -- Themes
      use "ntk148v/vim-horizon"
      use "arcticicestudio/nord-vim"
      use "kyazdani42/nvim-web-devicons"
      use "sheerun/vim-polyglot"
      use "equt/paper.vim"
      use "MisanthropicBit/vim-warlock"
      -- use "romgrk/github-light.vim"

      -- UI
      use "romgrk/barbar.nvim"
      use "glepnir/galaxyline.nvim"
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
