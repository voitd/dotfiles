local lspconfig = require 'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

lspconfig.bashls.setup {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash", "conf" },
  settings = {
  },
  on_attach = on_attach
}
