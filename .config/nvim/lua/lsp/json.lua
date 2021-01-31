local lspconfig = require 'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    -- require'completion'.on_attach(client)
    
    print("'" .. client.name .. "' server attached")
end

lspconfig.jsonls.setup {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json" },
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
  settings = {
  },
  on_attach = on_attach
}
