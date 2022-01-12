local lsp_installer = require("nvim-lsp-installer")

-- List of servers to auto install.
local servers = {
  --  "efm",
  "emmet_ls",
  "bashls",
  "vuels",
  "yamlls",
  "jsonls",
  "sumneko_lua",
  "tsserver"
  --  "eslint",
}

-- Install from list of servers.
for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  -- Check that the server is supported in nvim-lsp-installer
  if ok then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.settings(
  {
    ui = {
      icons = {
        server_installed = " ",
        server_pending = " ",
        server_uninstalled = " "
      }
    }
  }
)

lsp_installer.on_server_ready(
  function(server)
    local configs = require("lsp/lspconfigs")
    local opts = configs[server.name]

    if opts == nil then
      print('No lsp configuration found for "' .. server.name .. '".')
      opts = {}
    else
      print('Found lsp configuration for "' .. server.name .. ".")
    end

    server:setup(opts)
  end
)
