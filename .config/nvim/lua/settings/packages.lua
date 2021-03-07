local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

cmd "packadd packer.nvim"

cmd "au BufWritePost packages.lua PackerCompile"

local init = {
  -- Packer can manage itself as an optional plugin
  "wbthomason/packer.nvim",
  opt = true
}

local lsp = {
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-compe",
  "glepnir/lspsaga.nvim",
  "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
}

local git = {
  "tpope/vim-fugitive",
  "stsewd/fzf-checkout.vim",
  "tpope/vim-rhubarb",
  "rhysd/conflict-marker.vim", -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
  "lewis6991/gitsigns.nvim",
  "f-person/git-blame.nvim"
}

local misk = {
  -- "b3nj5m1n/kommentary", -- comments like gcc
  "tpope/vim-commentary",
  "tweekmonster/startuptime.vim", -- benchmark startup
  "oberblastmeister/rooter.nvim", -- root dir switcher
  "AndrewRadev/tagalong.vim", -- Auto change html tags
  "AndrewRadev/splitjoin.vim", -- allows to split one liner to multi lines
  "mbbill/undotree", -- undo tree
  "justinmk/vim-sneak",
  "machakann/vim-sandwich", -- Change surrounding arks
  "alvan/vim-closetag",
  "rrethy/vim-illuminate", -- highlight matching words when cursor on it
  "mhartington/formatter.nvim",
  "metakirby5/codi.vim", --Repl
  "voldikss/vim-floaterm",
  "whatyouhide/vim-lengthmatters",
  "mattn/emmet-vim",
  "andymass/vim-matchup",
  {"rrethy/vim-hexokinase", run = "make hexokinase"}
  -- "leafOfTree/vim-matchtag" --highlight matching tags html, xml, js, jsx, vue, svelte.
  -- "windwp/nvim-autopairs"
}

local fzf = {
  {"junegunn/fzf", run = "./install --all"}, -- Fuzzy Searcher
  "junegunn/fzf.vim",
  "gfanto/fzf-lsp.nvim"
}

local test = {
  "janko/vim-test",
  "rcarriga/vim-ultest" -- pretty test output
}

local langs = {
  "Galooshi/vim-import-js",
  "pangloss/vim-javascript",
  "maxmellon/vim-jsx-pretty" -- because treesitter breaks jsx indentation
  -- "leafOfTree/vim-vue-plugin"
  -- use "styled-components/vim-styled-components"
}

local snippets = {
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "dsznajder/vscode-es7-javascript-react-snippets",
  "sdras/vue-vscode-snippets"
  -- use "hollowtree/vscode-vue-snippets"
}

local themes = {
  "equt/paper.vim",
  "embark-theme/vim",
  "romgrk/github-light.vim",
  "rktjmp/lush.nvim",
  "npxbr/gruvbox.nvim",
  "Rigellute/rigel",
  "arcticicestudio/nord-vim"
}

local ui = {
  "mhinz/vim-startify", -- start screen
  "kyazdani42/nvim-web-devicons",
  "akinsho/nvim-bufferline.lua",
  "glepnir/galaxyline.nvim"
  -- "romgrk/barbar.nvim",
}

local packer = require("packer")
packer.startup {
  {
    init,
    lsp,
    git,
    misk,
    fzf,
    -- test,
    langs,
    snippets,
    themes,
    ui
  },
  config = {
    display = {
      open_fn = require "packer.util".float
    }
  }
}
