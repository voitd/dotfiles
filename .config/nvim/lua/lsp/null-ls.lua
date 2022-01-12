local null = require('null-ls')

on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

--  local node_local = { prefer_local = 'node_modules/.bin' }

null.setup(
  {
    debug = true,
    on_attach = on_attach,
    diagnostics_format = '[#{c}] #{m} (#{s})',
    sources = {
      null.builtins.formatting.trim_whitespace,
      null.builtins.formatting.trim_newlines,
      null.builtins.formatting.stylua,
      --  null.builtins.formatting.prettierd.with(node_local),
      --  null.builtins.formatting.prettier_d_slim,
      --  require("null-ls").builtins.diagnostics.eslint.with {
         --  command = "eslint_d",
      --  },
      null.builtins.formatting.eslint_d,
      null.builtins.diagnostics.eslint_d,
      null.builtins.completion.spell,
      null.builtins.code_actions.gitsigns,
      null.builtins.code_actions.refactoring,
    }
  }
)
