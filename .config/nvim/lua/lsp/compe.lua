vim.cmd [[packadd nvim-compe]]
vim.cmd [[packadd vim-vsnip]]
vim.cmd [[packadd vim-vsnip-integ]]
local map = require "settings.utils".map

vim.cmd "au BufEnter *.jsx set filetype=javascript"

require "compe".setup {
  enabled = true,
  debug = false,
  min_length = 2,
  preselect = "always",
  source_timeout = 200,
  -- incomplete_delay = 400,
  allow_prefix_unmatch = false,
  source = {
    path = true,
    buffer = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true
  }
}

map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})

--
local rt = function(codes)
  return vim.api.nvim_replace_termcodes(codes, true, true, true)
end

local call = vim.api.nvim_call_function

function _G.tab_complete()
  if vim.fn.pumvisible() == 1 then
    return rt("<C-N>")
  elseif call("vsnip#available", {1}) == 1 then
    return rt("<Plug>(vsnip-expand-or-jump)")
  else
    return rt("<Tab>")
  end
end

function _G.s_tab_complete()
    if vim.fn.pumvisible() == 1 then
        return rt('<C-P>')
    elseif call('vsnip#jumpable', {-1}) == 1 then
        return rt('<Plug>(vsnip-jump-prev)')
    else
        return rt('<S-Tab>')
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

map("i", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
map("s", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

