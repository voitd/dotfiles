-- npm install -g vscode-html-languageserver-bin
local lspconfig = require "lspconfig"

local on_attach = function(client, server)
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  print("'" .. client.name .. "' server attached")
end

lspconfig.html.setup {
  cmd = {"html-languageserver", "--stdio"},
  filetypes = {"html", "jsx", "javascriptreact", "php"},
  init_options = {
    configurationSection = {"html", "css", "javascript", "php"},
    embeddedLanguages = {
      css = true,
      javascript = true,
      php = true
    }
  },
  settings = {},
  on_attach = on_attach
}
