local lspconfig = require "lspconfig"

-- function to attach completion when setting up lsp
local on_attach = function(client, server)
  -- require'completion'.on_attach(client)
  -- let efm server handles linting and formatting stuff
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  print("'" .. client.name .. "' server attached")
end

lspconfig.intelephense.setup {
  on_attach = on_attach,
  cmd = {"intelephense", "--stdio"},
  filetypes = {"php"},
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
  init_options = {}
}
