local lsp_config = require'lspconfig'
local lsp_status = require'lsp-status'
local lsp_completion = require'completion'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- setup basic lsp servers
local servers = {
  bashls = {},
  vimls = {},
  jsonls = {},
  jdtls = {},
  html = {
    filetypes = {"html", "jinja"}
  },
  vuels = {},
  cssls = {},
  tsserver = {
    capabilities = capabilities,
  },
}

for server, config in pairs(servers) do
  lsp_config[server].setup(
    vim.tbl_deep_extend("force", {on_attach = on_attach}, config)
  )
end

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',     opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',  '<Cmd>lua vim.lsp.buf.definition()<CR>',      opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt',  '<Cmd>lua vim.lsp.buf.hover()<CR>',           opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',  '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs',  '<cmd>lua vim.lsp.buf.signature_help()<CR>',  opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gtd',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rn',  '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',  '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ca',  '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)

end

