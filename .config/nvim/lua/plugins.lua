-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup({
    function()
        -- Packer can manage itself as an optional plugin
        use { 'wbthomason/packer.nvim', opt = true }

        use 'nvim-lua/plenary.nvim'
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/lsp-status.nvim'
        use 'nvim-lua/completion-nvim'
        use 'kyazdani42/nvim-tree.lua'
        use 'norcalli/nvim-colorizer.lua'
        -- use 'tjdevries/lsp_extensions.nvim'
        -- use {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd [[TSUpdate]] end }



        use 'tweekmonster/startuptime.vim' -- benchmark startup

        use 'tpope/vim-fugitive'         -- git
        use 'airblade/vim-rooter'
        use 'stsewd/fzf-checkout.vim'
        use 'tpope/vim-rhubarb'
        use 'f-person/git-blame.nvim'
        use 'rhysd/conflict-marker.vim'  -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
        use 'lewis6991/gitsigns.nvim'

        use 'mhinz/vim-startify'         -- start screen
        use 'mbbill/undotree'            -- undo tree
        use 'justinmk/vim-sneak'
        use 'tpope/vim-commentary'       -- comments like gcc
        use 'machakann/vim-sandwich'     -- Change surrounding arks
        use 'cohama/lexima.vim'          -- Auto close parentheses and repeat by dot dot dot...
        use 'alvan/vim-closetag'
        use 'rrethy/vim-illuminate'      -- highlight matching words when cursor on it
        use 'AndrewRadev/tagalong.vim'   -- Auto change html tags
        use {'moll/vim-bbye', cmd = 'Bdelete' }


        use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
        use 'junegunn/fzf.vim'
        use 'gfanto/fzf-lsp.nvim'

        use 'mhartington/formatter.nvim'
        use 'metakirby5/codi.vim'
        use 'mattn/emmet-vim'
        use 'voldikss/vim-floaterm'      -- terminal

        use 'vim-test/vim-test'          -- test
        use 'kubejm/jest.nvim'
        use 'rcarriga/vim-ultest'        -- pretty test output


        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        use 'dsznajder/vscode-es7-javascript-react-snippets'
        use 'coco-platform/vscode-jest-snippets'

        use 'christianchiarulli/nvcode-color-schemes.vim'
        use 'kyazdani42/nvim-web-devicons'
        use 'ryanoasis/vim-devicons'
        use 'sheerun/vim-polyglot'
        use 'Rigellute/rigel'
        use 'equt/paper.vim'
        use 'romgrk/github-light.vim'

        use {'romgrk/barbar.nvim',
              config = function()
              vim.g.bufferline = vim.tbl_extend('force', vim.g.bufferline or {}, {
              closable = false})
            end
        }
        use {'glepnir/galaxyline.nvim',
             branch = 'main',
             config = function() require'plugins/_st' end,
             requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

    end,
    config = {
        display = {
            open_fn = require'packer.util'.float
        }
    }
})
