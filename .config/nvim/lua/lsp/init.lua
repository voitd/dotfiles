-- bash        npm install -g bash-language-server
-- dockerfile  npm install -g dockerfile-language-server-nodejs
-- python      npm install -g pyright
-- js, ts      npm install -g typescript typescript-language-server
-- vue         npm install -g typescript vls

local map = require "settings.utils".map

require "lsp.compe"
require "lsp.ts"
require "lsp.html"
require "lsp.css"
require "lsp.emmet"
require "lsp.json"
require "lsp.lua"
require "lsp.elixir"
require "lsp.bash"
require "lsp.efm"
require "lsp.vue"
-- require "lsp.saga"
-- require "lsp.angular"
require "lsp.diagnostics"
-- require "lsp.js"
-- require "lsp.dap"
-- require "lsp.nlua"

-- LSP
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
map(
  "n",
  "<space>d",
  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>',
  {noremap = true, silent = true}
)
map("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", {})
-- map("n", "<leader>f",  ":LSPFormat<CR>", {})
-- map("n", "<leader>ff", ":Format<CR>", {})

-- Handle formatting in a smarter way
-- If the buffer has been edited before formatting has completed, do not try to
-- apply the changes
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  -- If the buffer hasn't been modified before the formatting has finished,
  -- update the buffer
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.api.nvim_command("noautocmd :update")
    -- Trigger post-formatting autocommand which can be used to refresh gitgutter
    -- vim.api.nvim_command("silent doautocmd <nomodeline> User FormatterPost")
    end
  end
end

-- Custom_capabilities = function()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   return capabilities
-- end

-- vim.cmd([[
-- command! -range FormatRange  execute 'lua FormatRange()'
-- ]])

-- vim.cmd([[
-- command! LSPFormat  execute 'lua vim.lsp.buf.formatting()'
-- ]])

--[[ FormatRange = function()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  vim.lsp.buf.range_formatting({}, start_pos, end_pos)
end ]]
