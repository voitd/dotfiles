local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
local on_attach = function(client)
    -- require'completion'.on_attach(client)
    print("'" .. client.name .. "' server attached")
end

lspconfig.denols.setup {
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    enable = true,
    lint = false,
    unstable = false,
  },
  settings = {
  },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  on_attach = on_attach,
  capabilities = capabilities
}

