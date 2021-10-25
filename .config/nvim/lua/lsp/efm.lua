local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true
}

local prettier_d = {
  formatCommand = "prettier_d_slim --stdin --stdin-filepath ${INPUT}",
  -- formatCommand = "prettier_d --stdin --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintSource = "eslint_d",
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true
}
local luaFormat = {
  formatCommand = "npx luafmt --indent-count 2 --stdin",
  formatStdin = true
}

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
  end,
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  -- flags = {debounce_text_changes = 150},
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "vue",
    "lua",
    "elixir",
    "css",
    "scss",
    "html",
    "json"
  },
  settings = {
    rootMarkers = {"package.json", ".git", ".git/"},
    lintDebounce = 200,
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d, prettier_d},
      typescriptreact = {eslint_d, prettier_d},
      javascriptreact = {eslint_d, prettier_d},
      vue = {eslint_d, prettier},
      lua = {luaFormat},
      html = {prettier},
      css = {prettier},
      scss = {eslint_d, prettier_d},
      json = {prettier},
      conf = {prettier_d}
    }
  }
}
