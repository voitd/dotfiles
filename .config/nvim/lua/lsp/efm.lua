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

local credo = {
  lintCommand = "mix credo suggest --strict --format=flycheck --read-from-stdin ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  rootMarkers = {"mix.exs", "mix.lock"}
}

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
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
    lintDebounce = 300,
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d, prettier_d},
      typescriptreact = {eslint_d, prettier_d},
      javascriptreact = {eslint_d, prettier_d, stylelint},
      ["javascript.jsx"] = {eslint_d, prettier_d},
      vue = {eslint_d, prettier_d, stylelint},
      lua = {luaFormat},
      html = {prettier},
      css = {prettier_d, stylelint},
      scss = {prettier_d, stylelint},
      json = {prettier},
      conf = {prettier_d},
      elixir = {credo}
    }
  }
}
