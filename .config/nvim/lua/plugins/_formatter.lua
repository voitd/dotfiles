local map = require("utils").map
local api = vim.api

local prettier = {
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", api.nvim_buf_get_name(0), "--single-quote"},
      stdin = true
    }
  end
}

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      json = prettier,
      css = prettier,
      html = prettier,
      svelte = prettier,
      vue = prettier,
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- vim.api.nvim_command('autocmd BufWrite * :Format')
map("n", "<leader>cf", ":Format<CR>", {silent = true})
