
local lspconfig = require("lspconfig")

lspconfig.diagnosticls.setup(
  {
    -- filetypes = {
    --   "markdown",
    --   "javascript",
    --   "typescript",
    --   "javascriptreact",
    --   "typescriptreact",
    --   "javascript.jsx",
    --   "typescript.tsx",
    --   "css",
    --   "scss",
    --   "sass",
    --   "lua"
    -- },
    init_options = {
      linters = {
        eslint = {
          command = "./node_modules/.bin/eslint",
          rootPatterns = {".git", "package.json"},
          debounce = 100,
          args = {
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json"
          },
          sourceName = "eslint",
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          }
        },
        stylelint = {
          command = "./node_modules/.bin/stylelint",
          rootPatterns = {".git"},
          debounce = 100,
          args = {
            "--formatter",
            "json",
            "--stdin-filename",
            "%filepath"
          },
          sourceName = "stylelint",
          parseJson = {
            errorsRoot = "[0].warnings",
            line = "line",
            column = "column",
            message = "${text}",
            security = "severity"
          },
          securities = {
            error = "error",
            warning = "warning"
          }
        },
        fish = {
          command = "fish",
          args = {"-n", "%file"},
          isStdout = false,
          isStderr = true,
          sourceName = "fish",
          formatLines = 1,
          formatPattern = {
            "^.*\\(line (\\d+)\\): (.*)$",
            {
              line = 1,
              message = 2
            }
          }
        }
      },
      filetypes = {
        markdown = "markdownlint",
        javascript = "eslint",
        typescript = "eslint",
        javascriptreact = "eslint",
        typescriptreact = "eslint",
        css = "stylelint",
        scss = "stylelint",
        sass = "stylelint",
        fish = "fish"
      },
      formatters = {
        eslint = {
          command = "./node_modules/.bin/eslint",
          args = {"--fix-to-stduot", "--stdin", "%filepath"},
          rootPatterns = {
            "package.json"
          }
        },
        luafmt = {
          command = "npx luafmt",
          args = {"--indent-count", 2, "--stdin"}
        },
        prettier = {
          -- args = {"--stdin-filepath", "%filepath", "--single-quote", "--print-width 120"},
          -- command = "npx prettier",
          -- args = {
          --   "--stdin-filepath",
          --   "%filepath",
          --   "--single-quote",
          --   "--print-width 120"
          -- },
          args = {
            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
            "--single-quote",
            "--arrow-parens 'avoid'",
            "--trailing-comma all"
          },
          rootPatterns = {
            "package.json"
          }
        }
      },
      formatFiletypes = {
        fish = "fish_indent",
        lua = "luafmt",
        javascript = "prettier",
        javascriptreact = "prettier",
        typescript = "prettier",
        typescriptreact = "prettier"
      }
    }
  }
)
