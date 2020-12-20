require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    rainbow = {
        enable = true,
    },
    -- textobjects = {
    --   enable=true,
    --   select = {
    --     enable = true,
    --     keymaps = {
    --       -- You can use the capture groups defined in textobjects.scm
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --       ["ac"] = "@class.outer",
    --       ["ic"] = "@class.inner",
    --     },
    --   },
    -- },
}
-- disable hl for brackets to allow use of rainbow
require('nvim-treesitter.highlight')
vim.treesitter.highlighter.hl_map["punctuation.delimiter"] = "Delimiter"
vim.treesitter.highlighter.hl_map["punctuation.bracket"] = nil
