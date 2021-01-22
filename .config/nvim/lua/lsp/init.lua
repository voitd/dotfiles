vim.cmd [[packadd vim-vsnip]]
vim.cmd [[packadd vim-vsnip-integ]]
-- vim.cmd [[packadd completion-nvim]]
vim.cmd [[packadd nvim-lspconfig]]

local map = require "settings.utils".map

require "lsp.compe"
-- require "lsp.js"
require "lsp.ts"
require "lsp.html"
require "lsp.css"
require "lsp.json"
require "lsp.lua"
-- require "lsp.elixir"
require "lsp.bash"
require "lsp.diagnostics"

-- LSP
map("n", "gh", '<cmd>lua require"settings.utils".show_doc()<CR>', {noremap = true, silent = true})
map("n", "<leader>h", '<cmd>lua require"settings.utils".hover()<CR>', {noremap = true, silent = true})
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
map("n", "gdt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})

-- if client.resolved_capabilities.document_formatting then
  map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",{noremap = true, silent = true})
  map("n", "<leader>ff", ":Format<CR>", {})

-- end
-- if client.resolved_capabilities.document_range_formatting then
--   map("v", "ft", "<cmd>lua vim.lsp.buf.formatting()<CR>",{})
-- end

map("n", "gp", ':lua require"settings.utils".peek_definition()<CR>', {})


FormatRange = function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  vim.lsp.buf.range_formatting({}, start_pos, end_pos)
end

vim.cmd([[
  command! -range FormatRange  execute 'lua FormatRange()'
]])

vim.cmd([[
  command! LSPFormat  execute 'lua vim.lsp.buf.formatting()'
]])

map("n", "<F2>", ':lua require"settings.utils".rename()<CR>', {})
