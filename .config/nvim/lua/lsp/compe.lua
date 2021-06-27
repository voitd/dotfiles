-- vim.cmd [[packadd nvim-compe]]
-- vim.cmd [[packadd vim-vsnip]]
-- vim.cmd [[packadd vim-vsnip-integ]]
local map = require "settings.utils".map
local protocol = require "vim.lsp.protocol"
vim.o.completeopt = "menuone,noselect"
-- require'compe'.register_source('words', require'compe_words')
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always",
  source_timeout = 200,
  incomplete_delay = 400,
  -- throttle_time = 80,
  allow_prefix_unmatch = false,
  documentation = true,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  source = {
    path = {menu = " ", priority = 500},
    buffer = {menu = " ", priority = 500},
    vsnip = {menu = " ", priority = 1000},
    nvim_lsp = {menu = " ", priority = 500}
    -- treesitter = {menu = " ",priority = 500;},
    -- tags = true
    -- omni = true
    -- calc = {menu = "  ", priority = 500},
    -- nvim_lsp = {menu = " ", priority = 10, sort = false},
    -- nvim_lua = {menu = "  ", priority = 500},
    -- spell = {menu = "  ", priority = 500},
    -- tags = true
    -- emoji = {menu = " ﲃ ", filetype = {"gitcommit", "markdown"}}
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})

map("i", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

map("i", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
map("s", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

map("i", "<C-u>", "compe#scroll({ 'delta': +4 })", {noremap = false, expr = true})
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = false, expr = true})

protocol.CompletionItemKind = {
  "ﮜ [text]",
  " [method]",
  " [function]",
  " [constructor]",
  "ﰠ [field]",
  " [variable]",
  " [class]",
  " [interface]",
  " [module]",
  " [property]",
  " [unit]",
  " [value]",
  " [enum]",
  " [key]",
  " [snippet]",
  " [color]",
  " [file]",
  " [reference]",
  " [folder]",
  " [enum member]",
  " [constant]",
  " [struct]",
  "⌘ [event]",
  " [operator]",
  "⌂ [type]"
}

-- thanks to folke: https://github.com/hrsh7th/nvim-compe/issues/302#issuecomment-821100317
local helper = require "compe.helper"
helper.convert_lsp_orig = helper.convert_lsp
helper.convert_lsp = function(args)
  local response = args.response or {}
  local items = response.items or response
  for _, item in ipairs(items) do
    if item.insertText == nil and (item.kind == 2 or item.kind == 3 or item.kind == 4) then
      item.insertText = item.label .. "(${1})"
      item.insertTextFormat = 2
    end
  end
  return helper.convert_lsp_orig(args)
end

vim.cmd [[autocmd User CompeConfirmDone :Lspsaga signature_help]]
