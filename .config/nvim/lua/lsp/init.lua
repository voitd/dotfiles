local map = require "settings.utils".map

local sign_define = vim.fn.sign_define
local lsp = vim.lsp

require "lsp.lspinstaller"
require "lsp.lspconfigs"
require "lsp.cmp"
require "lsp.null-ls"

map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
--  map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      space = 2,
      prefix = "❮"
    },
    signs = true,
    update_in_insert = false
  }
)

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
