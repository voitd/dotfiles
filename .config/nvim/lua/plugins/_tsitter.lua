require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    },
    refactor = {
        highlight_definitions = {
            enable = false
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
        -- lsp_interop = {
        --     enable = false,
        --     peek_definition_code = {
        --         ["df"] = "@function.outer",
        --         ["dF"] = "@class.outer"
        --     }
        -- }
    }
}

require("_lsp")

-- function _G.dump(...)
--     local objects = vim.tbl_map(vim.inspect, {...})
--     print(unpack(objects))
-- end
