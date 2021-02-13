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

lspconfig.html.setup {
  cmd = {"html-languageserver", "--stdio"},
  filetypes = {"html", "tsx", "jsx", "javascriptreact", "vue", "hbs", "handlebars", "html.handlebars"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  settings = {},
  on_attach = on_attach
}
