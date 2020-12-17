local map = require "utils".map
local o = vim.o
local g = vim.g
vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

o.completeopt = "menuone,noinsert,noselect"
o.shortmess = vim.o.shortmess .. "c"
g.completion_trigger_character = {'.', '::'}
g.completion_auto_change_source = 1
g.completion_enable_auto_paren = 1
g.completion_enable_auto_signature = 1
g.completion_enable_snippet = 'vim-vsnip'
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'} 
g.completion_sorting = 'alphabet'
g.completion_trigger_keyword_length = 2
-- vim.g.completion_chain_complete_list = {
--   default = {
--     {complete_items = {'ts', 'lsp', 'snippet'}}, 
--     {complete_items = {'buffers'}}, -- with fuzzy, tabnine is garbage - or vice versa
--     {mode = '<C-j>'}, {mode = '<C-k>'},
--   },
--   string = {
--     {complete_items = {"path"}, 
--      triggered_only = {"/"}}
--   },
-- }
--
map("i", "<Tab>", [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], {expr = true})

