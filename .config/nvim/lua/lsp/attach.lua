local completion = require"completion"
local map = require"settings.utils".map

return function(client, bufnr)

  completion.on_attach(client, bufnr)

  local opts = {noremap = true, silent = true}
  map('n', 'K',              '<cmd>lua require"settings.utils".show_doc()<CR>', opts)
  map('n', '<leader>k',      '<cmd>lua require"settings.utils".hover()<CR>', opts)
  map( "n", "gD",            "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map( "n", "gd",            "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map( "n", "gh",            "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map( "n", "gi",            "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map( "n", "gs",            "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map( "n", "gdt",           "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  map( "n", "rn",            "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map( "n", "gr",            "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map( "n", "ca",            "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map( "n", "<leader>bf",    "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  map('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})
  map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true})
end
