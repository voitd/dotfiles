local M = {}

function M.setup()
    local packer = require "packer"
    local cmd = vim.cmd

    cmd "packadd packer.nvim"
    cmd "au BufWritePost packages.lua PackerCompile"   

    local function plugins(use)
      -- Packer can manage itself as an optional plugin
      use { "wbthomason/packer.nvim", opt = true }

      -- LSP
      use { "williamboman/nvim-lsp-installer" }
      use { "jose-elias-alvarez/null-ls.nvim" }
      use {
        "neovim/nvim-lspconfig",
        config = function()
          require("config.lsp").setup()
          require("config.dap").setup()
        end,
      }
  
      -- cmp
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-nvim-lsp-document-symbol",
        },
        config = function()
          require("config.cmp").setup()
        end,
      }
      use {
        'hrsh7th/vim-vsnip',
        requires = {
            'rafamadriz/friendly-snippets',
            'xabikos/vscode-javascript',   
        }
    }

-- treesitter
use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter").setup()
    end,
    requires = {
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "p00f/nvim-ts-rainbow" },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      { "RRethy/nvim-treesitter-textsubjects" },
      {
        "windwp/nvim-autopairs",
        run = "make",
        config = function()
          require("nvim-autopairs").setup {}
        end,
      },
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup { enable = true }
        end,
      },
      {
        "romgrk/nvim-treesitter-context",
        config = function()
          require("treesitter-context.config").setup { enable = true }
        end,
      },
      {
        "mfussenegger/nvim-ts-hint-textobject",
        config = function()
          vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
          vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
        end,
      },
    },
  }
      -- git
      use { "tpope/vim-fugitive" }
      use { "tpope/vim-rhubarb" }
      use { "rhysd/conflict-marker.vim" }
      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("gitsigns").setup()
        end,
      }
      use {
        "sindrets/diffview.nvim",
        cmd = {
          "DiffviewOpen",
          "DiffviewClose",
          "DiffviewToggleFiles",
          "DiffviewFocusFiles",
        },
      }
      use {
        "ruifm/gitlinker.nvim",
        event = "VimEnter",
        config = function()
          require("gitlinker").setup()
        end,
      }

      -- perfomace
      use { "lewis6991/impatient.nvim" }

      -- misc
      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup {
            mappings = { extra = true },
          }
        end,
      }
      use {
        "folke/which-key.nvim",
        config = function()
          require("config.which-key").setup()
        end,
      }
      use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeClose" },
        config = function()
          require("nvim-tree").setup {}
        end,
      }
      use {'airblade/vim-rooter'}
      use { "andymass/vim-matchup", event = "CursorMoved" }
      use {
        "folke/trouble.nvim",
        event = "VimEnter",
        cmd = { "TroubleToggle", "Trouble" },
        config = function()
          require("trouble").setup { auto_open = false }
        end,
      }
      use {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        -- event = "BufReadPost",
        config = function()
          require("todo-comments").setup {}
        end,
      }
      use { "antoinemadec/FixCursorHold.nvim" }
      
      use {
        "vuki656/package-info.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = function()
          require("package-info").setup()
        end,
      }
      use {
        "rcarriga/nvim-notify",
        config = function()
          vim.notify = require "notify"
        end,
      }
      use {
        "max397574/better-escape.nvim",
        config = function()
          require("better_escape").setup()
        end,
      }
      use {"stevearc/dressing.nvim" }
      use {"AndrewRadev/splitjoin.vim"}
      use {"mbbill/undotree"}
      use {"machakann/vim-sandwich"}
      use {"metakirby5/codi.vim"}
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}

      -- theme
      use {
        "kyazdani42/nvim-web-devicons",
        config = function()
          require("nvim-web-devicons").setup { default = true }
        end,
      }
      use { "sainnhe/gruvbox-material" }
      use {"windwp/wind-colors"}

      -- UI
      use {
          "noib3/cokeline.nvim",
          config = function()
            require("config.cokeline").setup()
          end,
        }
      use {
          "windwp/windline.nvim",
           config = function()
             require("config.windline").setup()
           end,
      }
      use {
        "glepnir/dashboard-nvim",
        config = function()
          require("config.dashboard").setup()
        end,
      }
      use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
          require("zen-mode").setup {}
        end,
      }
      use {
        "folke/twilight.nvim",
        config = function()
          require("twilight").setup {}
        end,
      }
  
      -- tests
      use {
        "rcarriga/vim-ultest",
        config = "require('config.test').setup()",
        run = ":UpdateRemotePlugins",
        requires = { "vim-test/vim-test" },
      }
  
      -- telescope
      use { "nvim-lua/plenary.nvim" }
      use { "nvim-lua/popup.nvim" }
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-telescope/telescope-project.nvim",
          "nvim-telescope/telescope-symbols.nvim",
          "nvim-telescope/telescope-media-files.nvim",
          "nvim-telescope/telescope-github.nvim",
          "cljoly/telescope-repo.nvim",
          "dhruvmanila/telescope-bookmarks.nvim",
          { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
          require("config.telescope").setup()
        end,
      }
    end

    packer.init({
        compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
        git = {
          clone_timeout = 350
        },
        display = {
          title = "Packer",
          done_sym = "",
          error_syn = "×",
          keybindings = {
            toggle_info = "o"
          }
        }
      })
    
    packer.startup(plugins)
      -- config = {
      --  display = {
      --    open_fn = require "packer.util".float
      --  }
      -- })
  end
  
  return M
