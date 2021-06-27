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
  "hrsh7th/nvim-compe",
  "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  -- "nvim-telescope/telescope-fzy-native.nvim"
  -- "JoosepAlviste/nvim-ts-context-commentstring",
}

local git = {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "rhysd/conflict-marker.vim", -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
  "lewis6991/gitsigns.nvim",
  "f-person/git-blame.nvim"
  -- "TimUntersberger/neogit"
  -- "stsewd/fzf-checkout.vim",
}

local misk = {
  "andweeb/presence.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-commentary",
  "unblevable/quick-scope",
  "windwp/nvim-spectre",
  "Pocco81/AbbrevMan.nvim", -- dictionaries
  "tweekmonster/startuptime.vim", -- benchmark startup
  "oberblastmeister/rooter.nvim", -- root dir switcher
  "AndrewRadev/splitjoin.vim", -- allows to split one liner to multi lines
  "mbbill/undotree", -- undo tree
  "machakann/vim-sandwich", -- Change surrounding arks
  "metakirby5/codi.vim", --Repl
  "voldikss/vim-floaterm",
  "whatyouhide/vim-lengthmatters",
  "andymass/vim-matchup",
  {"rrethy/vim-hexokinase", run = "make hexokinase"},
  "windwp/nvim-ts-autotag" -- Auto change html tags
  -- "rrethy/vim-illuminate", -- highlight matching words when cursor on it
  -- "windwp/nvim-spectre" -- search panel
  -- "glepnir/indent-guides.nvim"
  -- "p00f/nvim-ts-rainbow"
  -- "mattn/emmet-vim",
  -- "justinmk/vim-sneak",
  -- "mhartington/formatter.nvim",
}

local fzf = {
  {"junegunn/fzf", run = "./install --all"}, -- Fuzzy Searcher
  "junegunn/fzf.vim"
  -- "gfanto/fzf-lsp.nvim"
}

-- local test = {
--   "janko/vim-test",
--   "rcarriga/vim-ultest" -- pretty test output
-- }

local langs = {"vieira/vim-javascript"}

local snippets = {
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "hollowtree/vscode-vue-snippets",
  "dsznajder/vscode-es7-javascript-react-snippets",
  "rafamadriz/friendly-snippets"
  -- "sdras/vue-vscode-snippets",
}

local themes = {
  "sainnhe/gruvbox-material",
  "eddyekofo94/gruvbox-flat.nvim"
  -- "equt/paper.vim",
  -- "windwp/wind-colors",
  -- "rafamadriz/neon"
  -- "wojciechkepka/vim-github-dark"
}

local ui = {
  "mhinz/vim-startify", -- start screen
  "kyazdani42/nvim-web-devicons",
  "akinsho/nvim-bufferline.lua",
  "glepnir/galaxyline.nvim",
  "kyazdani42/nvim-tree.lua"
  -- "folke/lsp-trouble.nvim",
}

local packer = require("packer")
packer.startup {
  {
    init,
    lsp,
    git,
    misk,
    fzf,
    langs,
    snippets,
    themes,
    ui
    -- test,
  },
  config = {
    display = {
      open_fn = require "packer.util".float
    }
  }
}
