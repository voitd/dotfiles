local lspconfig = require "lspconfig"

local on_attach = function(client)
  require "completion".on_attach(client)
end

lspconfig.elixirls.setup {
  cmd = {"/usr/local/bin/elixir-ls/language_server.sh"},
  on_attach = on_attach,
  settings = {
    filetypes = {"elixir", "eelixir"},
    root_dir = root_pattern("mix.exs", ".git") or vim.loop.os_homedir()
  }
}
