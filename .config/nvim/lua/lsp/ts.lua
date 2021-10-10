local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  -- require'completion'.on_attach(client)
  -- if client.config.flags then
  -- client.config.flags.allow_incremental_sync = true
  -- end
  -- let efm server handles linting and formatting stuff
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  -- Null-ls for Prettier and ESLint
  -- require("null-ls").setup {}

  -- local ts_utils = require("nvim-lsp-ts-utils")

  -- -- defaults
  -- ts_utils.setup {
  -- debug = false,
  -- disable_commands = false,
  -- enable_import_on_completion = false,
  -- import_all_timeout = 5000, -- ms
  -- -- eslint
  -- eslint_enable_code_actions = true,
  -- eslint_enable_disable_comments = true,
  -- eslint_bin = "eslint_d",
  -- eslint_config_fallback = nil,
  -- eslint_enable_diagnostics = true,
  -- -- formatting
  -- enable_formatting = true,
  -- formatter = "prettier",
  -- formatter_config_fallback = nil,
  -- -- parentheses completion
  -- complete_parens = false,
  -- signature_help_in_parens = true,
  -- -- update imports on file move
  -- update_imports_on_move = true,
  -- require_confirmation_on_move = true,
  -- watch_dir = nil
  -- }

  -- -- required to fix code action ranges
  -- ts_utils.setup_client(client)

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
