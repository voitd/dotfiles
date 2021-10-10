local map = require "settings.utils".map
local saga = require "lspsaga"

local opts = {
  border_style = "round",
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "x",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>" -- quit can be a table
  },
  code_action_prompt = {
    enable = true,
    sign = false,
    virtual_text = true
  }
  -- max_hover_width = 80,
}
saga.init_lsp_saga(opts)

map("n", "gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})
map("n", "gh", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", {noremap = true, silent = true})
--  map("n", "gp", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {noremap = true, silent = true})
map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})

map("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})

map("n", "<leader>rn", "<cmd>lua require'lspsaga.rename'.rename()<CR>", {noremap = true, silent = true})
-- map("n", "'d", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", {noremap = true, silent = true})
map("n", ";d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
map("n", "d;", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})

map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)", {noremap = true, silent = true})
map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)", {noremap = true, silent = true})

-- map("n", "<leader>sr", "<cmd>lua ", {noremap = true, silent = true})
