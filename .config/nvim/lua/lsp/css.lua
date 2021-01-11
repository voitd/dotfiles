local lspconfig = require 'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

lspconfig.cssls.setup {
  cmd = { "css-languageserver", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_dir = lspconfig.util.root_pattern("package.json"),
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  on_attach = on_attach
}

