local cmd = vim.cmd
local api = vim.api

cmd("au FocusLost * silent! :wa!")
cmd("au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})")
cmd("au BufEnter * set fo-=c fo-=r fo-=o")
cmd("au TermOpen * setlocal signcolumn=no nonumber norelativenumber")

cmd("au BufNewFile,BufRead .prettierrc setf json")
cmd("au BufNewFile,BufRead .eslintrc setf json")
cmd("au BufNewFile,BufRead .eslintignore setf gitignore")

cmd("au BufNewFile,BufRead tsconfig.json setlocal filetype=json5")

-- cmd("au BufWritePost ~/.config/nvim/init.lua <cmd>lua require'plenary.reload'.reload_module'init'<cr>")

function help_tab()
    if vim.bo.buftype == 'help' then
        cmd('wincmd L')
        nr = api.nvim_get_current_buf()
        api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", { noremap = true, silent = true })
    end
end
cmd("au BufEnter *.txt lua help_tab()")


