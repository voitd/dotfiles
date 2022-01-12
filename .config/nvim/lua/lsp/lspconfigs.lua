local M = {}
-- wrapper for common configurations
local function config(_config)
  local on_attach = function(client, server)
    --  if server == "efm" then
    --  if server == "tsserver" then
      --  client.resolved_capabilities.document_formatting = true
    --  else
      client.resolved_capabilities.document_formatting = false
    --  end

    print("'" .. client.name .. "' server attached")
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  return vim.tbl_deep_extend(
    "force",
    {
      capabilities = capabilities,
      on_attach = on_attach
    },
    _config or {}
  )
end

local prettier_d = {
  formatCommand = "prettier_d_slim --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintSource = "eslint_d",
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true
}

local stylelint = {
  lintCommand = "stylelint --stdin --stdin-filename ${INPUT} --formatter compact",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    "%f: line %l, col %c, %tarning - %m",
    "%f: line %l, col %c, %trror - %m"
  },
  formatCommand = "stylelint --fix --stdin --stdin-filename ${INPUT}",
  formatStdin = true
}

local luaFormat = {
  formatCommand = "npx luafmt --indent-count 2 --stdin",
  formatStdin = true
}

M.efm =
  config(
  {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = true
      vim.api.nvim_exec(
        [[
            augroup LspEfmCleanup
                autocmd!
                autocmd VimLeavePre * silent! :!prettier_d_slim stop
                autocmd VimLeavePre * silent! :!eslint_d stop
            augroup END
        ]],
        true
      )
    end,
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      codeAction = true
    },
    filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "javascript.jsx",
      "javascript.vue",
      "vue",
      "lua",
      "css",
      "scss",
      "html",
      "json"
    },
    settings = {
      rootMarkers = {"package.json", ".git", ".git/"},
      lintDebounce = 300,
      languages = {
        typescript = {eslint_d},
        javascript = {eslint_d, prettier_d},
        typescriptreact = {eslint_d, prettier_d},
        javascriptreact = {eslint_d, prettier_d, stylelint},
        ["javascript.jsx"] = {eslint_d, prettier_d},
        ["javascript.vue"] = {eslint_d, prettier_d},
        vue = {eslint_d, prettier_d},
        lua = {luaFormat},
        html = {prettier_d},
        css = {prettier_d, stylelint},
        scss = {prettier_d, stylelint},
        json = {prettier_d},
        conf = {prettier_d}
      }
    }
  }
)

M.tsserver = config()

M.vuels = config()

M.html = config()

M.cssls = config()

M.emmet_ls = config()

M.sumneko_lua = config()

--  M.volar = config()

--  M.eslint =
--  config(
--  {
--  settings = {
--  codeActionOnSave = {
--  enable = true,
--  mode = "all"
--  },
--  format = true
--  }
--  }
--  )
return M
