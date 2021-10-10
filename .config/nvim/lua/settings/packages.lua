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
  "glepnir/lspsaga.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  "nvim-telescope/telescope-media-files.nvim"
}

local cmp = {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip"
}

local git = {
  "cljoly/telescope-repo.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "rhysd/conflict-marker.vim", -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
  "lewis6991/gitsigns.nvim",
  "f-person/git-blame.nvim"
}

local misk = {
  "editorconfig/editorconfig-vim",
  "winston0410/commented.nvim",
  "winston0410/mark-radar.nvim", -- highlight marks by `
  "unblevable/quick-scope",
  "oberblastmeister/rooter.nvim", -- root dir switcher
  "AndrewRadev/splitjoin.vim", -- allows to split one liner to multi lines
  "mbbill/undotree", -- undo tree
  "machakann/vim-sandwich", -- Change surrounding arks
  "metakirby5/codi.vim", --Repl
  "voldikss/vim-floaterm",
  "windwp/nvim-ts-autotag", -- Auto change html tags
  {"rrethy/vim-hexokinase", run = "make hexokinase"},
  "rmagatti/alternate-toggler", --toggling alternate "boolean" values.
  "andymass/vim-matchup"
  -- "rrethy/vim-illuminate", -- highlight matching words when cursor on it
  -- "windwp/nvim-spectre" -- search panel
  -- "glepnir/indent-guides.nvim"
  -- "p00f/nvim-ts-rainbow"
  -- "mattn/emmet-vim",
  -- "justinmk/vim-sneak",
  -- "andweeb/presence.nvim" -- discord
  -- "Pocco81/AbbrevMan.nvim", -- dictionaries
  -- "whatyouhide/vim-lengthmatters",
}

local fzf = {
  {"junegunn/fzf", run = "./install --all"}, -- Fuzzy Searcher
  "junegunn/fzf.vim"
  -- "gfanto/fzf-lsp.nvim"
}

local test = {
  "janko/vim-test",
  "rcarriga/vim-ultest" -- pretty test output
}

--  local langs = {"vieira/vim-javascript", "mxw/vim-jsx"}

local snippets = {
  "hollowtree/vscode-vue-snippets",
  "dsznajder/vscode-es7-javascript-react-snippets",
  "rafamadriz/friendly-snippets"
}

local themes = {
  "projekt0n/github-nvim-theme",
  "windwp/wind-colors"
}

local ui = {
  "beauwilliams/focus.nvim",
  "mhinz/vim-startify", -- start screen
  "kyazdani42/nvim-web-devicons",
  "akinsho/nvim-bufferline.lua",
  "kyazdani42/nvim-tree.lua",
  "folke/lsp-trouble.nvim",
  "https://gitlab.com/yorickpeterse/nvim-window.git",
  {"famiu/feline.nvim", branch = "develop"}
  --  "folke/which-key.nvim",
  -- "gelguy/wilder.nvim"
}

local packer = require("packer")
packer.startup {
  {
    init,
    lsp,
    cmp,
    git,
    misk,
    fzf,
    snippets,
    themes,
    ui,
    --  langs
    test
  },
  config = {
    display = {
      open_fn = require "packer.util".float
    }
  }
}
