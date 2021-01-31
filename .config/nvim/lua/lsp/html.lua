local lspconfig = require "lspconfig"

-- function to attach completion when setting up lsp
local on_attach = function(client)
  -- require'completion'.on_attach(client)
  print("'" .. client.name .. "' server attached")
end

lspconfig.html.setup {
  cmd = {"html-languageserver", "--stdio"},
  filetypes = {"html", "javascriptreact"},
  -- filetypes = {"html"},
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
