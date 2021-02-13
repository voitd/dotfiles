local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require("packer").startup(
  {
    function(use)
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}

      -- LSP
      use "nvim-telescope/telescope.nvim"
      use "nvim-telescope/telescope-fzy-native.nvim"
      use "nvim-lua/popup.nvim"
      use "nvim-lua/plenary.nvim"
      use "neovim/nvim-lspconfig"
      use "hrsh7th/nvim-compe"
      use "glepnir/lspsaga.nvim"
      use "tsuyoshicho/vim-efm-langserver-settings" -- auto config efm lsp
      -- use "onsails/lspkind-nvim"

      -- Git
      use "tpope/vim-fugitive"
      use "stsewd/fzf-checkout.vim"
      use "tpope/vim-rhubarb"
      use "rhysd/conflict-marker.vim" -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
      use "lewis6991/gitsigns.nvim"
      use "f-person/git-blame.nvim"
      -- use "drzel/vim-repo-edit"

      -- Misk
      -- use "windwp/nvim-autopairs"
      use "b3nj5m1n/kommentary" -- comments like gcc
      use "tweekmonster/startuptime.vim" -- benchmark startup
      use "oberblastmeister/rooter.nvim" -- root dir switcher
      use "AndrewRadev/tagalong.vim" -- Auto change html tags
      use "AndrewRadev/splitjoin.vim" -- allows to split one liner to multi lines
      use "mbbill/undotree" -- undo tree
      use "justinmk/vim-sneak"
      use "machakann/vim-sandwich" -- Change surrounding arks
      use "alvan/vim-closetag"
      use "leafOfTree/vim-matchtag" --highlight matching tags html, xml, js, jsx, vue, svelte.
      use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
      use "mhartington/formatter.nvim"
      use "metakirby5/codi.vim" --Repl
      use "voldikss/vim-floaterm"
      use "whatyouhide/vim-lengthmatters"
      use "mattn/emmet-vim"
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}

      -- Fzf
      use {"junegunn/fzf", run = "./install --all"} -- Fuzzy Searcher
      use "junegunn/fzf.vim"

      --Test
      use "janko/vim-test"
      use "rcarriga/vim-ultest" -- pretty test output

      -- JavaScript
      use "Galooshi/vim-import-js"
      -- use "styled-components/vim-styled-components"

      -- Snippets
      use "hrsh7th/vim-vsnip"
      use "hrsh7th/vim-vsnip-integ"
      use "dsznajder/vscode-es7-javascript-react-snippets"
      -- use "hollowtree/vscode-vue-snippets"
      use "sdras/vue-vscode-snippets"

      -- Themes
      use "sheerun/vim-polyglot"
      use "arcticicestudio/nord-vim"
      use "equt/paper.vim"
      use "romgrk/github-light.vim"

      -- UI
      use "mhinz/vim-startify" -- start screen
      use "kyazdani42/nvim-web-devicons"
      use "romgrk/barbar.nvim"
      use "glepnir/galaxyline.nvim"
      use {
        "hardcoreplayers/dashboard-nvim",
        setup = function()
          vim.g.dashboard_default_executive = "fzf"
          vim.g.dashboard_preview_command = "cat"
          vim.g.dashboard_preview_pipeline = "lolcat"
          vim.g.dashboard_preview_file = vim.fn["getenv"]("HOME") .. "/.config/neovim.txt"
          vim.g.dashboard_preview_file_height = 8
          vim.g.dashboard_preview_file_width = 50
          vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")
          vim.api.nvim_set_keymap("n", "<C-f>s", ":<C-u>SessionSave<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>l", ":<C-u>SessionLoad<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>h", ":DashboardFindHistory<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>f", ":DashboardFindFile<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>c", ":DashboardChangeColorscheme<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>w", ":DashboardFindWord<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>b", ":DashboardJumpMark<CR>", {noremap = true, silent = true})
          vim.api.nvim_set_keymap("n", "<C-f>n", ":DashboardNewFile<CR>", {noremap = true, silent = true})
          vim.g.dashboard_custom_shortcut = {
            last_session = "<Ctrl-f>l",
            find_history = "<Ctrl-f>h",
            find_file = "<Ctrl-f>f",
            new_file = "<Ctrl-f>n",
            change_colorscheme = "<Ctrl-f>c",
            find_word = "<Ctrl-f>w",
            book_marks = "<Ctrl-f>b"
          }
        end
      }

      -- use "TimUntersberger/neofs"
      -- use "tamago324/lir.nvim"
      -- use 'kyazdani42/nvim-tree.lua'

      -- Tree-sitter
      -- use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
      -- use 'christianchiarulli/nvcode-color-schemes.vim'

      --Coc
      -- use {"neoclide/coc.nvim", branch = "release"}
      -- use "antoinemadec/coc-fzf" -- coc and fzf together

      -- Debugging
      -- use {
      --   "mfussenegger/nvim-dap",
      --   requires = {
      --     {"theHamsta/nvim-dap-virtual-text"},
      --     {"nvim-telescope/telescope-dap.nvim"}
      --   },
      -- config = function()
      --   require("lsp.dap")
      -- end
      -- }
    end,
    config = {
      display = {
        open_fn = require "packer.util".float
      }
    }
  }
)
