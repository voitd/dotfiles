local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
-- lspconfig.tsserver.setup{on_attach = on_attach, capabilities = capabilities}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  flags = {debounce_text_changes = 500},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  commands = {
    OrganizeImports = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = {vim.api.nvim_buf_get_name(0)},
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end
    }
  }
}
