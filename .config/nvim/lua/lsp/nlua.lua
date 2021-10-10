local lspconfig = require("lspconfig")
local nlua = require("nlua.lsp.nvim")
local util = require("lspconfig/util")

local on_attach = function(client)
  print("'" .. client.name .. "' server attached")
end

nlua.setup(
  lspconfig,
  {
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", vim.fn.getcwd()),
    on_attach = on_attach,
    globals = {"use"}
  }
)
