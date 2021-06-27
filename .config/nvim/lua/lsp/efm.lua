local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true
}

local prettier_d = {
  formatCommand = "prettier_d --stdin --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true
}

local eslint_d = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintSource = "eslint_d",
  lintFormats = {"%f:%l:%c: %m"},
  -- lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
  lintIgnoreExitCode = true,
  -- formatCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --fix-to-stdout",
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin = true
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
  flags = {debounce_text_changes = 150},
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
    lintDebounce = 500,
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d, prettier},
      typescriptreact = {eslint_d, prettier},
      javascriptreact = {eslint_d, prettier},
      vue = {prettier},
      lua = {luaFormat},
      html = {prettier},
      css = {prettier},
      scss = {eslint_d, prettier},
      json = {prettier},
      conf = {prettier_d}
    }
  }
}
