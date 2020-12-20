local map = require("utils").map
local lsp_config = require("lspconfig")
local lsp_completion = require("completion")
local lsp_status = require("lsp-status")

local my_capabilities = vim.lsp.protocol.make_client_capabilities()
my_capabilities.textDocument.completion.completionItem.snippetSupport = false

FormatToggle = function(value)
  vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
end
vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
vim.cmd [[command! FormatEndable lua FormatToggle(false)]]

local general_on_attach = function(client, bufnr)
  lsp_completion.on_attach(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
    vim.cmd [[augroup END]]
  end
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "'d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

  -- vim.api.nvim_command("setlocal omnifunc=lua.vim.lsp.omnifunc")
  -- vim.api.nvim_command("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
  -- vim.api.nvim_command('autocmd BufWritePre * FormatWrite')
  print("'" .. client.name .. "' server attached")
end

lsp_status.register_progress()

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd [[noautocmd :update]]
    end
  end
end

_G.formatting = function()
  if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
  end
end

-- setup basic lsp servers
for _, server in pairs({"vimls", "jsonls", "bashls"}) do
  lsp_config[server].setup {
    capabilities = lsp_status.capabilities,
    on_attach = general_on_attach
  }
end

-- tsserver, stop messing with prettier da fuck!
lsp_config.tsserver.setup {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = false
        }
      }
    }
  },
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  -- rootPattern = {"package.json", "tsconfig.json", ".git"},
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
}

lsp_config.sumneko_lua.setup {
  on_attach = general_on_attach,
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  settings = {
    Lua = {
      runtime = {version = "LuaJIT"},
      diagnostics = {globals = {"vim", "use"}},
      workspace = {
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
      }
    }
  }
}

-- setup errors ui
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = true,
--     virtual_text = true,
--     signs = true,
--     update_in_insert = false
--   }
-- )

-- local prettierFormatter = function()
--   return {
--     exe = "npx prettier",
--     args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
--     stdin = true
--   }
-- end
-- require "formatter".setup(
--   {
--     logging = true,
--     filetype = {
--       typescript = {prettierFormatter},
--       javascript = {prettierFormatter},
--       lua = {
--         function()
--           return {
--             exe = "npx luafmt",
--             args = {"--indent-count", 2, "--stdin"},
--             stdin = true
--           }
--         end
--       }
--     }
--   }
-- )

-- setup diagnostic linters and formatters
lsp_config.diagnosticls.setup(
  {
    capabilities = lsp_status.capabilities,
    on_attach = general_on_attach,
    filetypes = {
      "markdown",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "javascript.jsx",
      "typescript.tsx",
      "css",
      "scss",
      "sass"
    },
    init_options = {
      -- filetypes = {
      --   javascriptreact = "eslint",
      --   typescriptreact = "eslint",
      --   javascript = "eslint",
      --   typescript = "eslint"
      -- },
      linters = {
        eslint = {
          command = "./node_modules/.bin/eslint",
          rootPatterns = {".git"},
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
        ["lua-format"] = {
          command = "lua-format",
          args = {"-i"}
        },
        prettier = {
          command = "prettier",
          args = {
            "--stdin-filepath",
            "%filepath",
            "--single-quote",
            "--print-width 120"
          },
          rootPatterns = {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.toml",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            "prettier.config.js",
            "prettier.config.cjs"
          }
        },
        prettier_standard = {
          command = "prettier-standard", -- installed globally, or "./node_modules/.bin/prettier-standard" for local install
          args = {"--stdin"}
        }
      },
      formatFiletypes = {
        fish = "fish_indent",
        lua = "lua-format",
        javascript = "prettier",
        javascriptreact = "prettier",
        typescript = "prettier",
        typescriptreact = "prettier"
      }
    }
  }
)
