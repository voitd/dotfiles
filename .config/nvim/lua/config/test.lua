vim.g.ultest_use_pty = 1

local M = {}

function M.setup()

    vim.api.nvim_exec([[
        "let test#strategy = "neovim"
        let test#strategy = "dispatch"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
        let test#python#runner = 'pyunit'
    ]], false)

    require("ultest").setup()
end

return M