local map = require"opts.utils".map

require "lsp.js"
require "lsp.html"
require "lsp.css"
require "lsp.json"
require "lsp.lua"
require "lsp.elixir"
require "lsp.bash"

-- LSP
map('n', 'K',              '<cmd>lua require"opts.utils".show_doc()<CR>')
map('n', '<leader>k',      '<cmd>lua require"opts.utils".hover()<CR>')
map( "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {})
map( "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
map( "n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
map( "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
map( "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
map( "n", "gdt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {})
map( "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
map( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {})
map( "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})
map( "n", "<leader>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})

map('i', '<Tab>',   'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })
map('i', '<CR>',    'pumvisible() ? complete_info()["selected"] != "-1" ? "<Plug>(completion_confirm_completion)" : "<C-e><CR>" : "<CR>"',{expr = true})

